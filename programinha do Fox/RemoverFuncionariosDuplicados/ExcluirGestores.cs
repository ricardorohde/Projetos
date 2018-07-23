using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace RemoverFuncionariosDuplicados
{
    public partial class ExcluirGestores : Form
    {
        List<Gestores> FAddGestor = new List<Gestores>();                        
        public ExcluirGestores()
        {
            InitializeComponent();
        }

        private void btnAdicionar_Click(object sender, EventArgs e)
        {            
            grdGestor.DataSource = FAddGestor; 
        }

        private void button1_Click(object sender, EventArgs e)
        {
            List<Gestores> lGestor = new List<Gestores>();
            using (PontoEletronicoEntities db = new PontoEletronicoEntities())
            {
                var tempGestor = from tblGestor in db.Gestor
                                 where tblGestor.Nome.Contains(edtNomeGestor.Text) //funcionario.GestorID.Equals(GestorID)
                                 orderby tblGestor.Nome
                                 select new Gestores
                                 {
                                     Nome = tblGestor.Nome,
                                     ID = tblGestor.ID,
                                     Ativo = tblGestor.Ativo,
                                     DataAtivacao = tblGestor.Ativacao,
                                     DataCadastro = tblGestor.Cadastro
                                 };

                lGestor = tempGestor.ToList<Gestores>();             
                //lGestor.Add(tempGestor.ToList<Gestores>().First());
                FAddGestor.Add(lGestor.ToList<Gestores>().First());
            }
            grdBusca.DataSource = lGestor;            
        }
    }
}
