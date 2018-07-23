using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using System.Threading.Tasks;
using System.Globalization;


namespace conectarbase
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void btnOk_Click(object sender, EventArgs e)
        {

            List<pessoa> lPessoa = new List<pessoa>();
            using (wponto_integraEntities lbase = new wponto_integraEntities())
            {
                var tempFuncionario = from tblFuncionario in lbase.F000001
                                      orderby tblFuncionario.IdFuncionario
                                      select new pessoa
                                      {
                                          Nome = tblFuncionario.NmFuncionario,
                                          IdFuncionario = tblFuncionario.IdFuncionario,
                                          DtDemissao = tblFuncionario.DtDemissao

                                      };

                lPessoa = tempFuncionario.ToList<pessoa>(); 
            }

        }
    }

    public class pessoa 
    {
        public string Nome { get; set; }
        public DateTime? DataAlteracaoCadastro { get; set; }
        public string IdFuncionario { get; set; }
        public DateTime? DtDemissao { get; set; }
    }

}
