namespace RemoverFuncionariosDuplicados
{
    partial class Form1
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
            this.txtResultado = new System.Windows.Forms.TextBox();
            this.btnVerificar = new System.Windows.Forms.Button();
            this.label1 = new System.Windows.Forms.Label();
            this.dataGridView1 = new System.Windows.Forms.DataGridView();
            this.label2 = new System.Windows.Forms.Label();
            this.txtGestorID = new System.Windows.Forms.TextBox();
            this.lblGestorID = new System.Windows.Forms.Label();
            this.txtPrecisao = new System.Windows.Forms.TextBox();
            this.lblPrecisaoProcuraFuncionario = new System.Windows.Forms.Label();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView1)).BeginInit();
            this.SuspendLayout();
            // 
            // txtResultado
            // 
            this.txtResultado.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left)
                        | System.Windows.Forms.AnchorStyles.Right)));
            this.txtResultado.Location = new System.Drawing.Point(12, 63);
            this.txtResultado.Multiline = true;
            this.txtResultado.Name = "txtResultado";
            this.txtResultado.ScrollBars = System.Windows.Forms.ScrollBars.Both;
            this.txtResultado.Size = new System.Drawing.Size(1136, 136);
            this.txtResultado.TabIndex = 0;
            // 
            // btnVerificar
            // 
            this.btnVerificar.Location = new System.Drawing.Point(443, 16);
            this.btnVerificar.Name = "btnVerificar";
            this.btnVerificar.Size = new System.Drawing.Size(122, 29);
            this.btnVerificar.TabIndex = 1;
            this.btnVerificar.Text = "Verificar duplicados";
            this.btnVerificar.UseVisualStyleBackColor = true;
            this.btnVerificar.Click += new System.EventHandler(this.btnVerificar_Click);
            // 
            // label1
            // 
            this.label1.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)));
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(42, 447);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(0, 13);
            this.label1.TabIndex = 2;
            // 
            // dataGridView1
            // 
            this.dataGridView1.AllowUserToAddRows = false;
            this.dataGridView1.AllowUserToDeleteRows = false;
            this.dataGridView1.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom)
                        | System.Windows.Forms.AnchorStyles.Left)
                        | System.Windows.Forms.AnchorStyles.Right)));
            this.dataGridView1.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dataGridView1.Location = new System.Drawing.Point(12, 235);
            this.dataGridView1.Name = "dataGridView1";
            this.dataGridView1.ReadOnly = true;
            this.dataGridView1.Size = new System.Drawing.Size(1136, 201);
            this.dataGridView1.TabIndex = 3;
            // 
            // label2
            // 
            this.label2.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)));
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(246, 447);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(0, 13);
            this.label2.TabIndex = 4;
            // 
            // txtGestorID
            // 
            this.txtGestorID.Location = new System.Drawing.Point(16, 27);
            this.txtGestorID.Name = "txtGestorID";
            this.txtGestorID.Size = new System.Drawing.Size(384, 20);
            this.txtGestorID.TabIndex = 5;
            // 
            // lblGestorID
            // 
            this.lblGestorID.AutoSize = true;
            this.lblGestorID.Location = new System.Drawing.Point(13, 9);
            this.lblGestorID.Name = "lblGestorID";
            this.lblGestorID.Size = new System.Drawing.Size(87, 13);
            this.lblGestorID.TabIndex = 6;
            this.lblGestorID.Text = "Código do gestor";
            // 
            // txtPrecisao
            // 
            this.txtPrecisao.Location = new System.Drawing.Point(592, 27);
            this.txtPrecisao.Name = "txtPrecisao";
            this.txtPrecisao.Size = new System.Drawing.Size(43, 20);
            this.txtPrecisao.TabIndex = 7;
            this.txtPrecisao.Text = "3";
            // 
            // lblPrecisaoProcuraFuncionario
            // 
            this.lblPrecisaoProcuraFuncionario.AutoSize = true;
            this.lblPrecisaoProcuraFuncionario.Location = new System.Drawing.Point(586, 9);
            this.lblPrecisaoProcuraFuncionario.Name = "lblPrecisaoProcuraFuncionario";
            this.lblPrecisaoProcuraFuncionario.Size = new System.Drawing.Size(566, 13);
            this.lblPrecisaoProcuraFuncionario.TabIndex = 8;
            this.lblPrecisaoProcuraFuncionario.Text = "Informe a precisão na busca de caracteres. 0 é para procurar nomes identicos. Qua" +
                "nto maior o valor menor a precisão.";
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1160, 474);
            this.Controls.Add(this.lblPrecisaoProcuraFuncionario);
            this.Controls.Add(this.txtPrecisao);
            this.Controls.Add(this.lblGestorID);
            this.Controls.Add(this.txtGestorID);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.dataGridView1);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.btnVerificar);
            this.Controls.Add(this.txtResultado);
            this.Name = "Form1";
            this.Text = "Form1";
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView1)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.TextBox txtResultado;
        private System.Windows.Forms.Button btnVerificar;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.DataGridView dataGridView1;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.TextBox txtGestorID;
        private System.Windows.Forms.Label lblGestorID;
        private System.Windows.Forms.TextBox txtPrecisao;
        private System.Windows.Forms.Label lblPrecisaoProcuraFuncionario;
    }
}

