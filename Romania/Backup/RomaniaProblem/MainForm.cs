using System;
using System.Collections;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;
using Framework;
using UninformedSearch;
using InformedSearch;

namespace RomaniaProblem
{
    public partial class MainForm : Form
    {
        private readonly string[] CITIES = { "1,3,3", "0,2,2", "0,3,1", "1,3,2", "0,3,0",
            "0,3,1", "0,1,1", "1,2,2", "0,0,2", "1,0,3", "0,0,1", "1,1,1", "1,0,2","0,0,0"};

        private const int FIRST_CITY = 0;
        private const int SECOND_CITY = 1;

        public MainForm()
        {
            InitializeComponent();
        }

        private void MainForm_Load(object sender, EventArgs e)
        {
            
            InitialCityComboBox.Items.AddRange(CITIES);
            FinalCityComboBox.Items.AddRange(CITIES);
            InitialCityComboBox.SelectedItem = CITIES[FIRST_CITY];
            FinalCityComboBox.SelectedItem = CITIES[SECOND_CITY];
        }

        private void ExecuteButton_Click(object sender, EventArgs e)
        {
            try
            {
                //initial state
                Q4State initialState = new Q4State(InitialCityComboBox.SelectedItem.ToString());
                //final state
                Q4State finalState = new Q4State(FinalCityComboBox.SelectedItem.ToString());
                
                Q4SuccessorFunction successorFunction = new Q4SuccessorFunction();
                Q4GoalTest goalTest = new Q4GoalTest(finalState);
                Q4StepCostFunction stepCostFunction = new Q4StepCostFunction();
                Q4HeuristicFunction heuristicFunction = new Q4HeuristicFunction();
                
                Problem problem = new Problem(initialState,
                    successorFunction,
                    goalTest,
                    stepCostFunction,
                    heuristicFunction);

                Search search = null;

                if (BreadthFirstRadioButton.Checked == true)
                {
                    search = new BreadthFirstSearch(new GraphSearch());
                }
                else if (DepthFirstRadioButton.Checked == true)
                {
                    search = new DepthFirstSearch(new GraphSearch());
                }
                else if (DepthLimitedRadioButton.Checked == true)
                {
                    search = new DepthLimitedSearch(Convert.ToInt32(LimitTextBox.Text));
                }
                else if (IterativeDeepeningRadioButton.Checked == true)
                {
                    search = new IterativeDeepeningSearch();
                }
                else if (GreedyBestFirstRadioButton.Checked == true)
                {
                    search = new GreedyBestFirstSearch(new GraphSearch());
                }
                else if (AStarRadioButton.Checked == true)
                {
                    search = new AStarSearch(new GraphSearch());
                }

                ArrayList solution = search.search(problem);

                SolutionValueLabel.Text = String.Empty;
                
                if (solution.Count == 0)
                { //empty list means failure
                    SolutionValueLabel.Text += "No Solution";
                }

                SolutionValueLabel.Text = InitialCityComboBox.Text;
                for (int i = 0; i < solution.Count; i++)
                {
                    SolutionValueLabel.Text += " - " + solution[i].ToString();
                }

                //Printing metrics
                Metrics searchMetrics = search.getMetrics();
                IEnumerator iter = searchMetrics.keySet().GetEnumerator();

                String key = null;
                String value = null;

                //maximum fringe size
                iter.MoveNext();
                key = (String)iter.Current;
                value = searchMetrics.get(key);
                MaxFringeSizeValueLabel.Text = value;

                //expanded nodes
                iter.MoveNext();
                key = (String)iter.Current;
                value = searchMetrics.get(key);
                ExpandedNodesValueLabel.Text = value;

                //fringe size
                iter.MoveNext();
                key = (String)iter.Current;
                value = searchMetrics.get(key);
                FringeSizeValueLabel.Text = value;
            }
            catch (Exception ex)
            {
                MessageBox.Show("Erro na execução da busca." + ex.Message, "Mapa da Romênia",
                    MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void BreadthFirstRadioButton_Click(object sender, EventArgs e)
        {
            if (BreadthFirstRadioButton.Checked == true)
            {
                GreedyBestFirstRadioButton.Checked = false;
                AStarRadioButton.Checked = false;

                FinalCityComboBox.Enabled = true;
            }
        }

        private void DepthFirstRadioButton_Click(object sender, EventArgs e)
        {
            if (DepthFirstRadioButton.Checked == true)
            {
                GreedyBestFirstRadioButton.Checked = false;
                AStarRadioButton.Checked = false;

                FinalCityComboBox.Enabled = true;
            }
        }

        private void DepthLimitedRadioButton_Click(object sender, EventArgs e)
        {
            if (DepthLimitedRadioButton.Checked == true)
            {
                GreedyBestFirstRadioButton.Checked = false;
                AStarRadioButton.Checked = false;

                FinalCityComboBox.Enabled = true;
            }
        }

        private void IterativeDeepeningRadioButton_Click(object sender, EventArgs e)
        {
            if (IterativeDeepeningRadioButton.Checked == true)
            {
                GreedyBestFirstRadioButton.Checked = false;
                AStarRadioButton.Checked = false;

                FinalCityComboBox.Enabled = true;
            }
        }

        private void GreedyBestFirstRadioButton_Click(object sender, EventArgs e)
        {
            if (GreedyBestFirstRadioButton.Checked == true)
            {
                BreadthFirstRadioButton.Checked = false;
                DepthFirstRadioButton.Checked = false;
                DepthLimitedRadioButton.Checked = false;
                IterativeDeepeningRadioButton.Checked = false;

                FinalCityComboBox.SelectedItem = CITIES[SECOND_CITY];
                FinalCityComboBox.Enabled = false;
            }
        }

        private void AStarRadioButton_Click(object sender, EventArgs e)
        {
            if (AStarRadioButton.Checked == true)
            {
                BreadthFirstRadioButton.Checked = false;
                DepthFirstRadioButton.Checked = false;
                DepthLimitedRadioButton.Checked = false;
                IterativeDeepeningRadioButton.Checked = false;

                FinalCityComboBox.SelectedItem = CITIES[SECOND_CITY];
                FinalCityComboBox.Enabled = false;
            }
        }

        private void ExitButton_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }
    }
}