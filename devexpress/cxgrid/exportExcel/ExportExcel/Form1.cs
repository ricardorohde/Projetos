using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;
using DevExpress.Utils.Menu;
using DevExpress.XtraGrid.Views.Grid;
using DevExpress.XtraGrid.Menu;
using DevExpress.XtraEditors;
using DevExpress.XtraGrid.Columns;
using DevExpress.XtraEditors.Repository;

namespace ExportExcel
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();

            DataSet ds = new DataSet();

            DataTable dt1 = new DataTable("Master");
            dt1.Columns.Add("ID");
            dt1.Columns.Add("Name");
            dt1.Columns.Add("Description");

            ds.Tables.Add(dt1);

            DataTable dt2 = new DataTable("Detail");
            dt2.Columns.Add("ID");
            dt2.Columns.Add("Name");
            dt2.Columns.Add("Description");
            dt2.Columns.Add("ParentId");

            ds.Tables.Add(dt2);
            ds.Relations.Add(dt1.Columns[0], dt2.Columns[3]);

            DataRow dr = dt1.NewRow();
            dr[0] = "1";
            dr[1] = "A veeery loooong name.";
            dr[2] = "This is a veerrry long description";
            dt1.Rows.Add(dr);

            dr = dt1.NewRow();
            dr[0] = "2";
            dr[1] = "A veeery loooong name.";
            dr[2] = "This is a veerrry long description";
            dt1.Rows.Add(dr);

            DataRow dr2 = dt2.NewRow();
            dr2[0] = "1";
            dr2[1] = "A veeery loooong name.";
            dr2[2] = "This is a veerrry long description";
            dr2[3] = "1";
            dt2.Rows.Add(dr2);

            dr2 = dt2.NewRow();
            dr2[0] = "2";
            dr2[1] = "A veeery loooong name.";
            dr2[2] = "This is a veerrry long description";
            dr2[3] = "1";
            dt2.Rows.Add(dr2);

            dr2 = dt2.NewRow();
            dr2[0] = "3";
            dr2[1] = "A veeery loooong name.";
            dr2[2] = "This is a veerrry long description";
            dr2[3] = "2";
            dt2.Rows.Add(dr2);

            dr2 = dt2.NewRow();
            dr2[0] = "4";
            dr2[1] = "A veeery loooong name.";
            dr2[2] = "This is a veerrry long description";
            dr2[3] = "2";
            dt2.Rows.Add(dr2);

            gridControl1.DataSource = ds;
            gridControl1.DataMember = "Master";
            //gridView1.PopulateColumns();
            gridView1.ShowGridMenu += new DevExpress.XtraGrid.Views.Grid.GridMenuEventHandler(gridView1_ShowGridMenu);
            gridView1.MasterRowExpanded +=new CustomMasterRowEventHandler(gridView1_MasterRowExpanded);
        }

        void gridView1_ShowGridMenu(object sender, DevExpress.XtraGrid.Views.Grid.GridMenuEventArgs e)
        {
            GridView gridView = sender as GridView;
            GridViewMenu rowMenu = null;
            if (e.Menu == null)
                e.Menu = new GridViewMenu(gridView);
            rowMenu = (GridViewMenu)e.Menu;
            DXMenuItem exportToExcelMenu = new DXMenuItem("Export to Excel", new EventHandler(ExportToExcelGridMenu_Click));
            rowMenu.Items.Add(exportToExcelMenu);
        }

        private void ExportToExcelGridMenu_Click(object sender, EventArgs e)
        {
            try
            {
                DXMenuItem menuItem = (DXMenuItem)sender;
                string fileName = ShowSaveFileDialog("Microsoft Excel Document", "Microsoft Excel|*.xls");
                if (!string.IsNullOrEmpty(fileName))
                {
                    bool printDetails = gridView1.OptionsPrint.PrintDetails;
                    bool expandAllDetails = gridView1.OptionsPrint.ExpandAllDetails;
                    bool expandAllGroups = gridView1.OptionsPrint.ExpandAllGroups;

                    
                    gridView1.OptionsPrint.ExpandAllDetails = true;
                    gridView1.OptionsPrint.ExpandAllGroups = true;
                    gridView1.OptionsPrint.PrintDetails = true;

                    foreach (GridView gv in gridControl1.Views)
                    {
                        gv.OptionsPrint.AutoWidth = false;
                        gv.OptionsView.RowAutoHeight = true;
                        foreach (GridColumn gc in gv.Columns)
                            gc.ColumnEdit = new RepositoryItemMemoEdit();
                    }

                    gridView1.ExportToXls(fileName);
                                     
                    gridView1.OptionsPrint.PrintDetails = printDetails;
                    gridView1.OptionsPrint.ExpandAllDetails = expandAllDetails;
                    gridView1.OptionsPrint.ExpandAllGroups = expandAllGroups;
                    OpenFile(fileName);
                }
            }
            catch (Exception)
            {
               
            }
        }

        private string ShowSaveFileDialog(string title, string filter)
        {
            SaveFileDialog dlg = new SaveFileDialog();
            string name = Application.ProductName;
            int n = name.LastIndexOf(".") + 1;
            if (n > 0) name = name.Substring(n, name.Length - n);
            dlg.Title = "Export To " + title;
            dlg.FileName = name;
            dlg.Filter = filter;
            if (dlg.ShowDialog() == DialogResult.OK) return dlg.FileName;
            return "";
        }

        internal static void OpenFile(string fileName)
        {
            if (XtraMessageBox.Show("Do you want to open this file?", "Export To...", MessageBoxButtons.YesNo, MessageBoxIcon.Question) == DialogResult.Yes)
            {
                try
                {
                    System.Diagnostics.Process process = new System.Diagnostics.Process();
                    process.StartInfo.FileName = fileName;
                    process.StartInfo.Verb = "Open";
                    process.StartInfo.WindowStyle = System.Diagnostics.ProcessWindowStyle.Normal;
                    process.Start();
                }
                catch
                {
                    DevExpress.XtraEditors.XtraMessageBox.Show("Cannot find an application on your system suitable for openning the file with exported data.", Application.ProductName, MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
            }
        }

        private void gridView1_MasterRowExpanded(object sender, DevExpress.XtraGrid.Views.Grid.CustomMasterRowEventArgs e)
        {
            GridView masterView = sender as GridView;
            GridView detailView = masterView.GetDetailView(e.RowHandle, 0) as GridView;
            masterView.BeginUpdate();
            for (int i = 0; i < detailView.DataRowCount; i++)
                detailView.SetMasterRowExpanded(i, true);
            masterView.EndUpdate();
        }
    }
}