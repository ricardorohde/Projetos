namespace RemoverFuncionariosDuplicados
{
    partial class ExcluirGestores
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.btnAdicionar = new System.Windows.Forms.Button();
            this.edtNomeGestor = new System.Windows.Forms.TextBox();
            this.label1 = new System.Windows.Forms.Label();
            this.grdGestor = new System.Windows.Forms.DataGridView();
            this.btnBusca = new System.Windows.Forms.Button();
            this.grdBusca = new System.Windows.Forms.DataGridView();
            ((System.ComponentModel.ISupportInitialize)(this.grdGestor)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.grdBusca)).BeginInit();
            this.SuspendLayout();
            // 
            // btnAdicionar
            // 
            this.btnAdicionar.Location = new System.Drawing.Point(6, 116);
            this.btnAdicionar.Name = "btnAdicionar";
            this.btnAdicionar.Size = new System.Drawing.Size(75, 23);
            this.btnAdicionar.TabIndex = 0;
            this.btnAdicionar.Text = "Adicionar";
            this.btnAdicionar.UseVisualStyleBackColor = true;
            this.btnAdicionar.Click += new System.EventHandler(this.btnAdicionar_Click);
            // 
            // edtNomeGestor
            // 
            this.edtNomeGestor.Location = new System.Drawing.Point(6, 23);
            this.edtNomeGestor.Name = "edtNomeGestor";
            this.edtNomeGestor.Size = new System.Drawing.Size(328, 20);
            this.edtNomeGestor.TabIndex = 1;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(3, 7);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(84, 13);
            this.label1.TabIndex = 2;
            this.label1.Text = "Nome do Gestor";
            // 
            // grdGestor
            // 
            this.grdGestor.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.grdGestor.Location = new System.Drawing.Point(6, 145);
            this.grdGestor.Name = "grdGestor";
            this.grdGestor.Size = new System.Drawing.Size(724, 216);
            this.grdGestor.TabIndex = 3;
            // 
            // btnBusca
            // 
            this.btnBusca.Location = new System.Drawing.Point(340, 20);
            this.btnBusca.Name = "btnBusca";
            this.btnBusca.Size = new System.Drawing.Size(75, 23);
            this.btnBusca.TabIndex = 4;
            this.btnBusca.Text = "Buscar";
            this.btnBusca.UseVisualStyleBackColor = true;
            this.btnBusca.Click += new System.EventHandler(this.button1_Click);
            // 
            // grdBusca
            // 
            this.grdBusca.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.grdBusca.Location = new System.Drawing.Point(6, 49);
            this.grdBusca.Name = "grdBusca";
            this.grdBusca.Size = new System.Drawing.Size(724, 50);
            this.grdBusca.TabIndex = 5;
            // 
            // ExcluirGestores
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(742, 438);
            this.Controls.Add(this.grdBusca);
            this.Controls.Add(this.btnBusca);
            this.Controls.Add(this.grdGestor);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.edtNomeGestor);
            this.Controls.Add(this.btnAdicionar);
            this.Name = "ExcluirGestores";
            this.Text = "ExcluirGestores";
            ((System.ComponentModel.ISupportInitialize)(this.grdGestor)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.grdBusca)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Button btnAdicionar;
        private System.Windows.Forms.TextBox edtNomeGestor;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.DataGridView grdGestor;
        private System.Windows.Forms.Button btnBusca;
        private System.Windows.Forms.DataGridView grdBusca;
    }
}