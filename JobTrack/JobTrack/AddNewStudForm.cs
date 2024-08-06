using System;
using System.Data;
using System.Windows.Forms;
using MySql.Data.MySqlClient;

namespace JobTrack
{
    public partial class AddNewStudForm : Form
    {
        DataBase db = new DataBase();

        public AddNewStudForm()
        {
            InitializeComponent();
            StartPosition = FormStartPosition.CenterScreen;
            LoadComboBoxData();
        }

        private void checkBox2_CheckedChanged(object sender, EventArgs e)
        {
            comboBox3.Visible = checkBox2.Checked;
        }

        private void checkBox3_CheckedChanged(object sender, EventArgs e)
        {
            comboBox4.Visible = checkBox3.Checked;
        }

        private void checkBox1_CheckedChanged(object sender, EventArgs e)
        {
            comboBox2.Visible = checkBox1.Checked;
        }

        private void checkBox4_CheckedChanged(object sender, EventArgs e)
        {
            comboBox5.Visible = checkBox4.Checked;
        }

        private void button1_Click(object sender, EventArgs e)
        {
            AddStudent();
        }

        private void LoadComboBoxData()
        {
            LoadDataIntoComboBox(comboBox1, "SELECT idGroup, nuberGroup FROM groupspec");
            LoadDataIntoComboBox(comboBox2, "SELECT idEmployment, name FROM employment");
            LoadDataIntoComboBox(comboBox3, "SELECT idRiskZone, name FROM riskzone");
            LoadDataIntoComboBox(comboBox4, "SELECT idCategory, name FROM healthcategory");
            LoadDataIntoComboBox(comboBox5, "SELECT idIntentions, name FROM graduatesprofessionalintentions");
        }

        private void LoadDataIntoComboBox(ComboBox comboBox, string query)
        {
            try
            {
                db.openConnection();
                MySqlCommand command = new MySqlCommand(query, db.GetConnection());
                MySqlDataAdapter adapter = new MySqlDataAdapter(command);
                DataTable table = new DataTable();
                adapter.Fill(table);

                comboBox.DataSource = table;
                comboBox.DisplayMember = table.Columns[1].ColumnName; // Display text
                comboBox.ValueMember = table.Columns[0].ColumnName; // Value to store

                db.closeConnection();
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Error: {ex.Message}");
            }
        }

        private void AddStudent()
        {
            try
            {
                db.openConnection();

                // Add new student
                string studentQuery = "INSERT INTO student (name, sname, lname, phone, mail, groupID) VALUES (@name, @sname, @lname, @phone, @mail, @groupID)";
                MySqlCommand studentCommand = new MySqlCommand(studentQuery, db.GetConnection());

                // Replace these values with the actual input from your form
                studentCommand.Parameters.AddWithValue("@name", textBox1.Text);
                studentCommand.Parameters.AddWithValue("@sname", textBox2.Text);
                studentCommand.Parameters.AddWithValue("@lname", textBox3.Text);
                studentCommand.Parameters.AddWithValue("@phone", textBox4.Text);
                studentCommand.Parameters.AddWithValue("@mail", textBox5.Text);
                studentCommand.Parameters.AddWithValue("@groupID", Convert.ToInt32(comboBox1.SelectedValue));

                studentCommand.ExecuteNonQuery();
                int studentId = (int)studentCommand.LastInsertedId;

                // Add to related table based on selected ComboBox
                if (comboBox2.Visible)
                {
                    AddToEmploymentStudent(studentId);
                }
                if (comboBox3.Visible)
                {
                    AddToRiskZoneStudent(studentId);
                }
                if (comboBox4.Visible)
                {
                    AddToHealthCategoryStudent(studentId);
                }
                if (comboBox5.Visible)
                {
                    AddToIntentionsGraduates(studentId);
                }

                db.closeConnection();

                MessageBox.Show("Выпускник успешно добавлен!");
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Error: {ex.Message}");
            }
        }

        private void AddToEmploymentStudent(int studentId)
        {
            if (!IsStudentInCategory("employmentstudent", "employmentID", Convert.ToInt32(comboBox2.SelectedValue), studentId))
            {
                string query = "INSERT INTO employmentstudent (employmentID, studentID) VALUES (@employmentID, @studentID)";
                MySqlCommand command = new MySqlCommand(query, db.GetConnection());
                command.Parameters.AddWithValue("@employmentID", Convert.ToInt32(comboBox2.SelectedValue));
                command.Parameters.AddWithValue("@studentID", studentId);
                command.ExecuteNonQuery();
            }
        }

        private void AddToRiskZoneStudent(int studentId)
        {
            if (!IsStudentInCategory("riskzonestudent", "riskZoneID", Convert.ToInt32(comboBox3.SelectedValue), studentId))
            {
                string query = "INSERT INTO riskzonestudent (riskZoneID, studentID) VALUES (@riskZoneID, @studentID)";
                MySqlCommand command = new MySqlCommand(query, db.GetConnection());
                command.Parameters.AddWithValue("@riskZoneID", Convert.ToInt32(comboBox3.SelectedValue));
                command.Parameters.AddWithValue("@studentID", studentId);
                command.ExecuteNonQuery();
            }
        }

        private void AddToHealthCategoryStudent(int studentId)
        {
            if (!IsStudentInCategory("healthcategorystudent", "categoryID", Convert.ToInt32(comboBox4.SelectedValue), studentId))
            {
                string query = "INSERT INTO healthcategorystudent (categoryID, studentID) VALUES (@categoryID, @studentID)";
                MySqlCommand command = new MySqlCommand(query, db.GetConnection());
                command.Parameters.AddWithValue("@categoryID", Convert.ToInt32(comboBox4.SelectedValue));
                command.Parameters.AddWithValue("@studentID", studentId);
                command.ExecuteNonQuery();
            }
        }

        private void AddToIntentionsGraduates(int studentId)
        {
            if (!IsStudentInCategory("intentionsgraduates", "intentionsID", Convert.ToInt32(comboBox5.SelectedValue), studentId))
            {
                string query = "INSERT INTO intentionsgraduates (intentionsID, studentID) VALUES (@intentionsID, @studentID)";
                MySqlCommand command = new MySqlCommand(query, db.GetConnection());
                command.Parameters.AddWithValue("@intentionsID", Convert.ToInt32(comboBox5.SelectedValue));
                command.Parameters.AddWithValue("@studentID", studentId);
                command.ExecuteNonQuery();
            }
        }

        private bool IsStudentInCategory(string tableName, string columnName, int categoryId, int studentId)
        {
            string query = $"SELECT COUNT(*) FROM {tableName} WHERE {columnName} = @categoryId AND studentID = @studentId";
            MySqlCommand command = new MySqlCommand(query, db.GetConnection());
            command.Parameters.AddWithValue("@categoryId", categoryId);
            command.Parameters.AddWithValue("@studentId", studentId);
            int count = Convert.ToInt32(command.ExecuteScalar());
            return count > 0;
        }
    }
}
