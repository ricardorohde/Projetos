using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Globalization;

namespace RemoverFuncionariosDuplicados
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
            label1.Text = "Número de Linhas";
            txtGestorID.Text = "358FA277-FF82-48C3-A9B3-58AECC8334BC";
        }

        private void btnVerificar_Click(object sender, EventArgs e)
        {
            //Guid GestorID = Guid.Parse("358FA277-FF82-48C3-A9B3-58AECC8334BC");
            Guid GestorID;
            Guid.TryParse(txtGestorID.Text, out GestorID);


            List<Pessoa> p = new List<Pessoa>();
            using (PontoEletronicoEntities db = new PontoEletronicoEntities())
            {
                var tempPessoa = from funcionario in db.Funcionario
                                 where funcionario.GestorID.Equals(GestorID)
                                 orderby funcionario.Nome
                                 select new Pessoa
                                            {
                                                Nome = funcionario.Nome,
                                                ID = funcionario.ID,
                                                DataAlteracaoCadastro = funcionario.DtAlteracaoCad
                                            };

                p = tempPessoa.ToList<Pessoa>();
            }

            int Precisao = Convert.ToInt32(txtPrecisao.Text);
            if (Precisao == null)
            {
                Precisao = 3;
                txtPrecisao.Text = "3";
            }
            StringBuilder strResultado = new StringBuilder();
            List<PessoaComparada> pc = new List<PessoaComparada>();

            DateTime tempInicial = DateTime.Now;


            //Parallel.ForEach<Pessoa>(p, es =>
            //{
            //    foreach (var pessoa1 in p)
            //    {
            //        if (!es.ID.Equals(pessoa1.ID))
            //        {
            //            int resultado = LD(es.Nome, pessoa1.Nome);
            //            //                        if ((((resultado /(double) pessoa.Nome.Length) * 100) < 15) && pessoa.DataAlteracaoCadastro > pessoa1.DataAlteracaoCadastro)
            //            if ((resultado < 5) && es.DataAlteracaoCadastro > pessoa1.DataAlteracaoCadastro)
            //            {
            //                PessoaComparada objPC = new PessoaComparada();
            //                objPC.ID = es.ID;
            //                objPC.Nome = es.Nome;
            //                objPC.DataAlteracaoCadastro = es.DataAlteracaoCadastro;
            //                objPC.ID2 = pessoa1.ID;
            //                objPC.Nome2 = pessoa1.Nome;
            //                objPC.DataAlteracaoCadastro2 = pessoa1.DataAlteracaoCadastro;
            //                pc.Add(objPC);


            //                strResultado.Append("------");
            //                strResultado.Append(string.Format("UPDATE Movimento SET FuncionarioID = '{0}' WHERE FuncionarioID = '{1}'",
            //                              es.ID, pessoa1.ID));
            //                strResultado.Append(Environment.NewLine);

            //                strResultado.Append(Environment.NewLine);
            //                strResultado.Append(string.Format("DELETE FROM Funcionario WHERE ID = '{0}'", pessoa1.ID));
            //                strResultado.Append(Environment.NewLine);
            //                strResultado.Append(Environment.NewLine);
            //                strResultado.Append(Environment.NewLine);

            //                //strResultado.Append("ID = " + pessoa.ID.ToString());
            //                //strResultado.Append(" Nome: "+ pessoa.Nome);
            //                //strResultado.Append(" DataAlteracao: " + pessoa.DataAlteracaoCadastro.Value.Date.ToString("d"));

            //                //strResultado.Append("------");
            //                //strResultado.Append("ID = " + pessoa1.ID.ToString());
            //                //strResultado.Append(" Nome: " + pessoa1.Nome);
            //                //strResultado.Append(" DataAlteracao: " + pessoa1.DataAlteracaoCadastro.Value.ToString("d"));
            //                //strResultado.Append(Environment.NewLine);
            //            }
            //        }

            //    }

            //}
            //    );


            //Parallel.ForEach<Pessoa>(p, es =>
            //                                {
            //                                    Parallel.ForEach<Pessoa>(p, ex =>
            //                                                                    {
            //                                                                        if (!es.ID.Equals(ex.ID))
            //                                                                        {
            //                                                                            int resultado = LD(es.Nome,
            //                                                                                               ex.Nome);
            //                                                                            //                        if ((((resultado /(double) pessoa.Nome.Length) * 100) < 15) && pessoa.DataAlteracaoCadastro > pessoa1.DataAlteracaoCadastro)
            //                                                                            if ((resultado < 5) &&
            //                                                                                es.DataAlteracaoCadastro >
            //                                                                                ex.DataAlteracaoCadastro)
            //                                                                            {
            //                                                                                PessoaComparada objPC =
            //                                                                                    new PessoaComparada();
            //                                                                                objPC.ID = es.ID;
            //                                                                                objPC.Nome = es.Nome;
            //                                                                                objPC.DataAlteracaoCadastro
            //                                                                                    =
            //                                                                                    es.DataAlteracaoCadastro;
            //                                                                                objPC.ID2 = ex.ID;
            //                                                                                objPC.Nome2 = ex.Nome;
            //                                                                                objPC.DataAlteracaoCadastro2
            //                                                                                    =
            //                                                                                    ex.DataAlteracaoCadastro;
            //                                                                                pc.Add(objPC);


            //                                                                                strResultado.Append("------");
            //                                                                                strResultado.Append(
            //                                                                                    string.Format(
            //                                                                                        "UPDATE Movimento SET FuncionarioID = '{0}' WHERE FuncionarioID = '{1}'",
            //                                                                                        es.ID, ex.ID));
            //                                                                                strResultado.Append(
            //                                                                                    Environment.NewLine);

            //                                                                                strResultado.Append(
            //                                                                                    Environment.NewLine);
            //                                                                                strResultado.Append(
            //                                                                                    string.Format(
            //                                                                                        "DELETE FROM Funcionario WHERE ID = '{0}'",
            //                                                                                        ex.ID));
            //                                                                                strResultado.Append(
            //                                                                                    Environment.NewLine);
            //                                                                                strResultado.Append(
            //                                                                                    Environment.NewLine);
            //                                                                                strResultado.Append(
            //                                                                                    Environment.NewLine);

            //                                                                                //strResultado.Append("ID = " + pessoa.ID.ToString());
            //                                                                                //strResultado.Append(" Nome: "+ pessoa.Nome);
            //                                                                                //strResultado.Append(" DataAlteracao: " + pessoa.DataAlteracaoCadastro.Value.Date.ToString("d"));

            //                                                                                //strResultado.Append("------");
            //                                                                                //strResultado.Append("ID = " + pessoa1.ID.ToString());
            //                                                                                //strResultado.Append(" Nome: " + pessoa1.Nome);
            //                                                                                //strResultado.Append(" DataAlteracao: " + pessoa1.DataAlteracaoCadastro.Value.ToString("d"));
            //                                                                                //strResultado.Append(Environment.NewLine);
            //                                                                            }
            //                                                                        }

            //                                                                    });

            //                                }
            //    );
            string lcStrLimpa1, lcStrLimpa2; 


            foreach (var pessoa in p)
            {
                foreach (var pessoa1 in p)
                {
                    if (!pessoa.ID.Equals(pessoa1.ID))
                    {
                        lcStrLimpa1 = RemoveCaracteresEspeciais(pessoa.Nome.ToUpper());
                        lcStrLimpa2 = RemoveCaracteresEspeciais(pessoa1.Nome.ToUpper());

                        if (lcStrLimpa1.Length > 13)
                        {
                            lcStrLimpa1 = lcStrLimpa1.Substring(1,13);
                        }

                        if (lcStrLimpa1.Length > 13)
                        {
                            lcStrLimpa2 = lcStrLimpa2.Substring(1, 13);
                        }

                        int resultado = LD(lcStrLimpa1, lcStrLimpa2);
                        if ((resultado <= Precisao) && pessoa.DataAlteracaoCadastro > pessoa1.DataAlteracaoCadastro)
                        {
                            PessoaComparada objPC = new PessoaComparada();
                            objPC.ID = pessoa.ID;
                            objPC.Nome = pessoa.Nome;
                            objPC.DataAlteracaoCadastro = pessoa.DataAlteracaoCadastro;
                            objPC.ID2 = pessoa1.ID;
                            objPC.Nome2 = pessoa1.Nome;
                            objPC.DataAlteracaoCadastro2 = pessoa1.DataAlteracaoCadastro;
                            objPC.TotaldeCaracteresTrocados = resultado;
                            pc.Add(objPC);

                            strResultado.Append("/*" + pessoa1.Nome + "------*/");
                            strResultado.Append(Environment.NewLine);
                            strResultado.Append(string.Format("UPDATE Movimento SET FuncionarioID = '{0}' WHERE FuncionarioID = '{1}'",
                                          pessoa.ID, pessoa1.ID));
                            strResultado.Append(Environment.NewLine);
                            strResultado.Append(string.Format("DELETE FROM Funcionario WHERE ID = '{0}'", pessoa1.ID));
                            strResultado.Append(Environment.NewLine);
                            strResultado.Append(string.Format("UPDATE Movimento SET Status = NULL WHERE FuncionarioID = '{0}'", pessoa.ID));
                            strResultado.Append(Environment.NewLine);
                            strResultado.Append(Environment.NewLine);

                        }
                    }

                }
            }


            label2.Text = (DateTime.Now - tempInicial).ToString();
            dataGridView1.DataSource = pc;
            txtResultado.Text = strResultado.ToString();
            label1.Text = dataGridView1.RowCount.ToString();
        }

        private string RemoveCaracteresEspeciais(string texto)
        {
          texto = texto.Normalize(NormalizationForm.FormD);
          StringBuilder sb = new StringBuilder();
          foreach (char c in texto.ToCharArray())
          if (CharUnicodeInfo.GetUnicodeCategory(c) != UnicodeCategory.NonSpacingMark)
            sb.Append(c);
          return sb.ToString();
        }


        public int LD(string s, string t)
        {

            int n = s.Length; //length of s

            int m = t.Length; //length of t

            int[,] d = new int[n + 1, m + 1]; // matrix

            int cost; // cost

            // Step 1

            if (n == 0) return m;

            if (m == 0) return n;

            // Step 2

            for (int i = 0; i <= n; d[i, 0] = i++) ;

            for (int j = 0; j <= m; d[0, j] = j++) ;

            // Step 3

            for (int i = 1; i <= n; i++)
            {

                //Step 4

                for (int j = 1; j <= m; j++)
                {

                    // Step 5

                    cost = (t.Substring(j - 1, 1) == s.Substring(i - 1, 1) ? 0 : 1);

                    // Step 6

                    d[i, j] = System.Math.Min(System.Math.Min(d[i - 1, j] + 1, d[i, j - 1] + 1),
                              d[i - 1, j - 1] + cost);

                }

            }


            // Step 7


            return d[n, m];

        }


    }

    public class Pessoa
    {
        public string Nome { get; set; }
        public Guid ID { get; set; }
        public DateTime? DataAlteracaoCadastro { get; set; }
    }

    public class PessoaComparada
    {
        public string Nome { get; set; }
        public Guid ID { get; set; }
        public DateTime? DataAlteracaoCadastro { get; set; }
        public string Nome2 { get; set; }
        public Guid ID2 { get; set; }
        public DateTime? DataAlteracaoCadastro2 { get; set; }
        public int TotaldeCaracteresTrocados { get; set; }
    }
    public class Gestores
    {
        public string Nome { get; set; }
        public Guid ID { get; set; }
        public DateTime? DataCadastro { get; set; }
        public bool Ativo { get; set; }
        public DateTime? DataAtivacao { get; set; }
    }
}
