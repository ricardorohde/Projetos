namespace RomaniaProblem
{
    partial class MainForm
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
            this.SearchGroupBox = new System.Windows.Forms.GroupBox();
            this.InformedGroupBox = new System.Windows.Forms.GroupBox();
            this.AStarRadioButton = new System.Windows.Forms.RadioButton();
            this.GreedyBestFirstRadioButton = new System.Windows.Forms.RadioButton();
            this.UninformedGroupBox = new System.Windows.Forms.GroupBox();
            this.LimitTextBox = new System.Windows.Forms.TextBox();
            this.LimitLabel = new System.Windows.Forms.Label();
            this.IterativeDeepeningRadioButton = new System.Windows.Forms.RadioButton();
            this.DepthLimitedRadioButton = new System.Windows.Forms.RadioButton();
            this.DepthFirstRadioButton = new System.Windows.Forms.RadioButton();
            this.BreadthFirstRadioButton = new System.Windows.Forms.RadioButton();
            this.ResultGroupBox = new System.Windows.Forms.GroupBox();
            this.FringeSizeValueLabel = new System.Windows.Forms.Label();
            this.FringeSizeLabel = new System.Windows.Forms.Label();
            this.ExpandedNodesValueLabel = new System.Windows.Forms.Label();
            this.MaxFringeSizeValueLabel = new System.Windows.Forms.Label();
            this.ExpandedNodesLabel = new System.Windows.Forms.Label();
            this.MaxFringeSizeLabel = new System.Windows.Forms.Label();
            this.SolutionValueLabel = new System.Windows.Forms.Label();
            this.SolutionLabel = new System.Windows.Forms.Label();
            this.InitialStateGroupBox = new System.Windows.Forms.GroupBox();
            this.InitialCityComboBox = new System.Windows.Forms.ComboBox();
            this.InitialCityLabel = new System.Windows.Forms.Label();
            this.FinalStateGroupBox = new System.Windows.Forms.GroupBox();
            this.FinalCityComboBox = new System.Windows.Forms.ComboBox();
            this.FinalCityLabel = new System.Windows.Forms.Label();
            this.ExecuteButton = new System.Windows.Forms.Button();
            this.ExitButton = new System.Windows.Forms.Button();
            this.SearchGroupBox.SuspendLayout();
            this.InformedGroupBox.SuspendLayout();
            this.UninformedGroupBox.SuspendLayout();
            this.ResultGroupBox.SuspendLayout();
            this.InitialStateGroupBox.SuspendLayout();
            this.FinalStateGroupBox.SuspendLayout();
            this.SuspendLayout();
            // 
            // SearchGroupBox
            // 
            this.SearchGroupBox.Controls.Add(this.InformedGroupBox);
            this.SearchGroupBox.Controls.Add(this.UninformedGroupBox);
            this.SearchGroupBox.Location = new System.Drawing.Point(5, 58);
            this.SearchGroupBox.Name = "SearchGroupBox";
            this.SearchGroupBox.Size = new System.Drawing.Size(396, 138);
            this.SearchGroupBox.TabIndex = 2;
            this.SearchGroupBox.TabStop = false;
            this.SearchGroupBox.Text = "Estratégia de Busca";
            // 
            // InformedGroupBox
            // 
            this.InformedGroupBox.Controls.Add(this.AStarRadioButton);
            this.InformedGroupBox.Controls.Add(this.GreedyBestFirstRadioButton);
            this.InformedGroupBox.Location = new System.Drawing.Point(201, 19);
            this.InformedGroupBox.Name = "InformedGroupBox";
            this.InformedGroupBox.Size = new System.Drawing.Size(189, 113);
            this.InformedGroupBox.TabIndex = 1;
            this.InformedGroupBox.TabStop = false;
            this.InformedGroupBox.Text = "Informada";
            // 
            // AStarRadioButton
            // 
            this.AStarRadioButton.AutoSize = true;
            this.AStarRadioButton.Location = new System.Drawing.Point(9, 42);
            this.AStarRadioButton.Name = "AStarRadioButton";
            this.AStarRadioButton.Size = new System.Drawing.Size(36, 17);
            this.AStarRadioButton.TabIndex = 1;
            this.AStarRadioButton.TabStop = true;
            this.AStarRadioButton.Text = "A*";
            this.AStarRadioButton.UseVisualStyleBackColor = true;
            this.AStarRadioButton.Click += new System.EventHandler(this.AStarRadioButton_Click);
            // 
            // GreedyBestFirstRadioButton
            // 
            this.GreedyBestFirstRadioButton.AutoSize = true;
            this.GreedyBestFirstRadioButton.Location = new System.Drawing.Point(9, 19);
            this.GreedyBestFirstRadioButton.Name = "GreedyBestFirstRadioButton";
            this.GreedyBestFirstRadioButton.Size = new System.Drawing.Size(128, 17);
            this.GreedyBestFirstRadioButton.TabIndex = 0;
            this.GreedyBestFirstRadioButton.TabStop = true;
            this.GreedyBestFirstRadioButton.Text = "Gulosa por Heurística";
            this.GreedyBestFirstRadioButton.UseVisualStyleBackColor = true;
            this.GreedyBestFirstRadioButton.Click += new System.EventHandler(this.GreedyBestFirstRadioButton_Click);
            // 
            // UninformedGroupBox
            // 
            this.UninformedGroupBox.Controls.Add(this.LimitTextBox);
            this.UninformedGroupBox.Controls.Add(this.LimitLabel);
            this.UninformedGroupBox.Controls.Add(this.IterativeDeepeningRadioButton);
            this.UninformedGroupBox.Controls.Add(this.DepthLimitedRadioButton);
            this.UninformedGroupBox.Controls.Add(this.DepthFirstRadioButton);
            this.UninformedGroupBox.Controls.Add(this.BreadthFirstRadioButton);
            this.UninformedGroupBox.Location = new System.Drawing.Point(6, 19);
            this.UninformedGroupBox.Name = "UninformedGroupBox";
            this.UninformedGroupBox.Size = new System.Drawing.Size(189, 113);
            this.UninformedGroupBox.TabIndex = 0;
            this.UninformedGroupBox.TabStop = false;
            this.UninformedGroupBox.Text = "Não Informada";
            // 
            // LimitTextBox
            // 
            this.LimitTextBox.Location = new System.Drawing.Point(158, 62);
            this.LimitTextBox.MaxLength = 2;
            this.LimitTextBox.Name = "LimitTextBox";
            this.LimitTextBox.Size = new System.Drawing.Size(20, 20);
            this.LimitTextBox.TabIndex = 5;
            // 
            // LimitLabel
            // 
            this.LimitLabel.AutoSize = true;
            this.LimitLabel.Location = new System.Drawing.Point(136, 67);
            this.LimitLabel.Name = "LimitLabel";
            this.LimitLabel.Size = new System.Drawing.Size(49, 13);
            this.LimitLabel.TabIndex = 4;
            this.LimitLabel.Text = "(lim:       )";
            // 
            // IterativeDeepeningRadioButton
            // 
            this.IterativeDeepeningRadioButton.AutoSize = true;
            this.IterativeDeepeningRadioButton.Location = new System.Drawing.Point(8, 88);
            this.IterativeDeepeningRadioButton.Name = "IterativeDeepeningRadioButton";
            this.IterativeDeepeningRadioButton.Size = new System.Drawing.Size(171, 17);
            this.IterativeDeepeningRadioButton.TabIndex = 3;
            this.IterativeDeepeningRadioButton.TabStop = true;
            this.IterativeDeepeningRadioButton.Text = "Profundidade Limitada Iterativa";
            this.IterativeDeepeningRadioButton.UseVisualStyleBackColor = true;
            this.IterativeDeepeningRadioButton.Click += new System.EventHandler(this.IterativeDeepeningRadioButton_Click);
            // 
            // DepthLimitedRadioButton
            // 
            this.DepthLimitedRadioButton.AutoSize = true;
            this.DepthLimitedRadioButton.Location = new System.Drawing.Point(8, 65);
            this.DepthLimitedRadioButton.Name = "DepthLimitedRadioButton";
            this.DepthLimitedRadioButton.Size = new System.Drawing.Size(130, 17);
            this.DepthLimitedRadioButton.TabIndex = 2;
            this.DepthLimitedRadioButton.TabStop = true;
            this.DepthLimitedRadioButton.Text = "Profundidade Limitada";
            this.DepthLimitedRadioButton.UseVisualStyleBackColor = true;
            this.DepthLimitedRadioButton.Click += new System.EventHandler(this.DepthLimitedRadioButton_Click);
            // 
            // DepthFirstRadioButton
            // 
            this.DepthFirstRadioButton.AutoSize = true;
            this.DepthFirstRadioButton.Location = new System.Drawing.Point(8, 42);
            this.DepthFirstRadioButton.Name = "DepthFirstRadioButton";
            this.DepthFirstRadioButton.Size = new System.Drawing.Size(88, 17);
            this.DepthFirstRadioButton.TabIndex = 1;
            this.DepthFirstRadioButton.TabStop = true;
            this.DepthFirstRadioButton.Text = "Profundidade";
            this.DepthFirstRadioButton.UseVisualStyleBackColor = true;
            this.DepthFirstRadioButton.Click += new System.EventHandler(this.DepthFirstRadioButton_Click);
            // 
            // BreadthFirstRadioButton
            // 
            this.BreadthFirstRadioButton.AutoSize = true;
            this.BreadthFirstRadioButton.Checked = true;
            this.BreadthFirstRadioButton.Location = new System.Drawing.Point(8, 19);
            this.BreadthFirstRadioButton.Name = "BreadthFirstRadioButton";
            this.BreadthFirstRadioButton.Size = new System.Drawing.Size(61, 17);
            this.BreadthFirstRadioButton.TabIndex = 0;
            this.BreadthFirstRadioButton.TabStop = true;
            this.BreadthFirstRadioButton.Text = "Largura";
            this.BreadthFirstRadioButton.UseVisualStyleBackColor = true;
            this.BreadthFirstRadioButton.Click += new System.EventHandler(this.BreadthFirstRadioButton_Click);
            // 
            // ResultGroupBox
            // 
            this.ResultGroupBox.Controls.Add(this.FringeSizeValueLabel);
            this.ResultGroupBox.Controls.Add(this.FringeSizeLabel);
            this.ResultGroupBox.Controls.Add(this.ExpandedNodesValueLabel);
            this.ResultGroupBox.Controls.Add(this.MaxFringeSizeValueLabel);
            this.ResultGroupBox.Controls.Add(this.ExpandedNodesLabel);
            this.ResultGroupBox.Controls.Add(this.MaxFringeSizeLabel);
            this.ResultGroupBox.Controls.Add(this.SolutionValueLabel);
            this.ResultGroupBox.Controls.Add(this.SolutionLabel);
            this.ResultGroupBox.Location = new System.Drawing.Point(5, 202);
            this.ResultGroupBox.Name = "ResultGroupBox";
            this.ResultGroupBox.Size = new System.Drawing.Size(396, 87);
            this.ResultGroupBox.TabIndex = 3;
            this.ResultGroupBox.TabStop = false;
            this.ResultGroupBox.Text = "Resultado";
            // 
            // FringeSizeValueLabel
            // 
            this.FringeSizeValueLabel.AutoSize = true;
            this.FringeSizeValueLabel.Location = new System.Drawing.Point(167, 68);
            this.FringeSizeValueLabel.Name = "FringeSizeValueLabel";
            this.FringeSizeValueLabel.Size = new System.Drawing.Size(60, 13);
            this.FringeSizeValueLabel.TabIndex = 7;
            this.FringeSizeValueLabel.Text = "<tamanho>";
            // 
            // FringeSizeLabel
            // 
            this.FringeSizeLabel.AutoSize = true;
            this.FringeSizeLabel.Location = new System.Drawing.Point(6, 68);
            this.FringeSizeLabel.Name = "FringeSizeLabel";
            this.FringeSizeLabel.Size = new System.Drawing.Size(101, 13);
            this.FringeSizeLabel.TabIndex = 6;
            this.FringeSizeLabel.Text = "Tamanho da Borda:";
            // 
            // ExpandedNodesValueLabel
            // 
            this.ExpandedNodesValueLabel.AutoSize = true;
            this.ExpandedNodesValueLabel.Location = new System.Drawing.Point(167, 50);
            this.ExpandedNodesValueLabel.Name = "ExpandedNodesValueLabel";
            this.ExpandedNodesValueLabel.Size = new System.Drawing.Size(72, 13);
            this.ExpandedNodesValueLabel.TabIndex = 5;
            this.ExpandedNodesValueLabel.Text = "<quantidade>";
            // 
            // MaxFringeSizeValueLabel
            // 
            this.MaxFringeSizeValueLabel.AutoSize = true;
            this.MaxFringeSizeValueLabel.Location = new System.Drawing.Point(167, 32);
            this.MaxFringeSizeValueLabel.Name = "MaxFringeSizeValueLabel";
            this.MaxFringeSizeValueLabel.Size = new System.Drawing.Size(60, 13);
            this.MaxFringeSizeValueLabel.TabIndex = 4;
            this.MaxFringeSizeValueLabel.Text = "<tamanho>";
            // 
            // ExpandedNodesLabel
            // 
            this.ExpandedNodesLabel.AutoSize = true;
            this.ExpandedNodesLabel.Location = new System.Drawing.Point(6, 50);
            this.ExpandedNodesLabel.Name = "ExpandedNodesLabel";
            this.ExpandedNodesLabel.Size = new System.Drawing.Size(160, 13);
            this.ExpandedNodesLabel.TabIndex = 2;
            this.ExpandedNodesLabel.Text = "Quantidade de Nós Expandidos:";
            // 
            // MaxFringeSizeLabel
            // 
            this.MaxFringeSizeLabel.AutoSize = true;
            this.MaxFringeSizeLabel.Location = new System.Drawing.Point(6, 32);
            this.MaxFringeSizeLabel.Name = "MaxFringeSizeLabel";
            this.MaxFringeSizeLabel.Size = new System.Drawing.Size(140, 13);
            this.MaxFringeSizeLabel.TabIndex = 1;
            this.MaxFringeSizeLabel.Text = "Tamanho Máximo da Borda:";
            // 
            // SolutionValueLabel
            // 
            this.SolutionValueLabel.AutoSize = true;
            this.SolutionValueLabel.Location = new System.Drawing.Point(61, 16);
            this.SolutionValueLabel.Name = "SolutionValueLabel";
            this.SolutionValueLabel.Size = new System.Drawing.Size(56, 13);
            this.SolutionValueLabel.TabIndex = 3;
            this.SolutionValueLabel.Text = "<solução>";
            // 
            // SolutionLabel
            // 
            this.SolutionLabel.AutoSize = true;
            this.SolutionLabel.Location = new System.Drawing.Point(6, 16);
            this.SolutionLabel.Name = "SolutionLabel";
            this.SolutionLabel.Size = new System.Drawing.Size(49, 13);
            this.SolutionLabel.TabIndex = 0;
            this.SolutionLabel.Text = "Solução:";
            // 
            // InitialStateGroupBox
            // 
            this.InitialStateGroupBox.Controls.Add(this.InitialCityComboBox);
            this.InitialStateGroupBox.Controls.Add(this.InitialCityLabel);
            this.InitialStateGroupBox.Location = new System.Drawing.Point(5, 5);
            this.InitialStateGroupBox.Name = "InitialStateGroupBox";
            this.InitialStateGroupBox.Size = new System.Drawing.Size(195, 49);
            this.InitialStateGroupBox.TabIndex = 0;
            this.InitialStateGroupBox.TabStop = false;
            this.InitialStateGroupBox.Text = "Estado Inicial";
            // 
            // InitialCityComboBox
            // 
            this.InitialCityComboBox.FormattingEnabled = true;
            this.InitialCityComboBox.Location = new System.Drawing.Point(55, 18);
            this.InitialCityComboBox.Name = "InitialCityComboBox";
            this.InitialCityComboBox.Size = new System.Drawing.Size(127, 21);
            this.InitialCityComboBox.TabIndex = 1;
            // 
            // InitialCityLabel
            // 
            this.InitialCityLabel.AutoSize = true;
            this.InitialCityLabel.Location = new System.Drawing.Point(6, 21);
            this.InitialCityLabel.Name = "InitialCityLabel";
            this.InitialCityLabel.Size = new System.Drawing.Size(43, 13);
            this.InitialCityLabel.TabIndex = 0;
            this.InitialCityLabel.Text = "Cidade:";
            // 
            // FinalStateGroupBox
            // 
            this.FinalStateGroupBox.Controls.Add(this.FinalCityComboBox);
            this.FinalStateGroupBox.Controls.Add(this.FinalCityLabel);
            this.FinalStateGroupBox.Location = new System.Drawing.Point(206, 5);
            this.FinalStateGroupBox.Name = "FinalStateGroupBox";
            this.FinalStateGroupBox.Size = new System.Drawing.Size(195, 49);
            this.FinalStateGroupBox.TabIndex = 1;
            this.FinalStateGroupBox.TabStop = false;
            this.FinalStateGroupBox.Text = "Estado Final";
            // 
            // FinalCityComboBox
            // 
            this.FinalCityComboBox.FormattingEnabled = true;
            this.FinalCityComboBox.Location = new System.Drawing.Point(55, 18);
            this.FinalCityComboBox.Name = "FinalCityComboBox";
            this.FinalCityComboBox.Size = new System.Drawing.Size(127, 21);
            this.FinalCityComboBox.TabIndex = 2;
            // 
            // FinalCityLabel
            // 
            this.FinalCityLabel.AutoSize = true;
            this.FinalCityLabel.Location = new System.Drawing.Point(6, 21);
            this.FinalCityLabel.Name = "FinalCityLabel";
            this.FinalCityLabel.Size = new System.Drawing.Size(43, 13);
            this.FinalCityLabel.TabIndex = 0;
            this.FinalCityLabel.Text = "Cidade:";
            // 
            // ExecuteButton
            // 
            this.ExecuteButton.Location = new System.Drawing.Point(5, 295);
            this.ExecuteButton.Name = "ExecuteButton";
            this.ExecuteButton.Size = new System.Drawing.Size(75, 23);
            this.ExecuteButton.TabIndex = 4;
            this.ExecuteButton.Text = "&Executar";
            this.ExecuteButton.UseVisualStyleBackColor = true;
            this.ExecuteButton.Click += new System.EventHandler(this.ExecuteButton_Click);
            // 
            // ExitButton
            // 
            this.ExitButton.Location = new System.Drawing.Point(86, 295);
            this.ExitButton.Name = "ExitButton";
            this.ExitButton.Size = new System.Drawing.Size(75, 23);
            this.ExitButton.TabIndex = 5;
            this.ExitButton.Text = "&Sair";
            this.ExitButton.UseVisualStyleBackColor = true;
            this.ExitButton.Click += new System.EventHandler(this.ExitButton_Click);
            // 
            // MainForm
            // 
            this.AcceptButton = this.ExecuteButton;
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(416, 323);
            this.Controls.Add(this.ExitButton);
            this.Controls.Add(this.ExecuteButton);
            this.Controls.Add(this.FinalStateGroupBox);
            this.Controls.Add(this.InitialStateGroupBox);
            this.Controls.Add(this.ResultGroupBox);
            this.Controls.Add(this.SearchGroupBox);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedDialog;
            this.MaximizeBox = false;
            this.MinimizeBox = false;
            this.Name = "MainForm";
            this.Text = "Mapa da Romênia";
            this.Load += new System.EventHandler(this.MainForm_Load);
            this.SearchGroupBox.ResumeLayout(false);
            this.InformedGroupBox.ResumeLayout(false);
            this.InformedGroupBox.PerformLayout();
            this.UninformedGroupBox.ResumeLayout(false);
            this.UninformedGroupBox.PerformLayout();
            this.ResultGroupBox.ResumeLayout(false);
            this.ResultGroupBox.PerformLayout();
            this.InitialStateGroupBox.ResumeLayout(false);
            this.InitialStateGroupBox.PerformLayout();
            this.FinalStateGroupBox.ResumeLayout(false);
            this.FinalStateGroupBox.PerformLayout();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.GroupBox SearchGroupBox;
        private System.Windows.Forms.GroupBox ResultGroupBox;
        private System.Windows.Forms.Label SolutionLabel;
        private System.Windows.Forms.Label ExpandedNodesLabel;
        private System.Windows.Forms.Label MaxFringeSizeLabel;
        private System.Windows.Forms.Label SolutionValueLabel;
        private System.Windows.Forms.Label ExpandedNodesValueLabel;
        private System.Windows.Forms.Label MaxFringeSizeValueLabel;
        private System.Windows.Forms.GroupBox InformedGroupBox;
        private System.Windows.Forms.GroupBox UninformedGroupBox;
        private System.Windows.Forms.RadioButton IterativeDeepeningRadioButton;
        private System.Windows.Forms.RadioButton DepthLimitedRadioButton;
        private System.Windows.Forms.RadioButton DepthFirstRadioButton;
        private System.Windows.Forms.RadioButton BreadthFirstRadioButton;
        private System.Windows.Forms.RadioButton GreedyBestFirstRadioButton;
        private System.Windows.Forms.GroupBox InitialStateGroupBox;
        private System.Windows.Forms.ComboBox InitialCityComboBox;
        private System.Windows.Forms.Label InitialCityLabel;
        private System.Windows.Forms.GroupBox FinalStateGroupBox;
        private System.Windows.Forms.Label FinalCityLabel;
        private System.Windows.Forms.Button ExecuteButton;
        private System.Windows.Forms.Button ExitButton;
        private System.Windows.Forms.RadioButton AStarRadioButton;
        private System.Windows.Forms.ComboBox FinalCityComboBox;
        private System.Windows.Forms.Label LimitLabel;
        private System.Windows.Forms.TextBox LimitTextBox;
        private System.Windows.Forms.Label FringeSizeLabel;
        private System.Windows.Forms.Label FringeSizeValueLabel;
    }
}

