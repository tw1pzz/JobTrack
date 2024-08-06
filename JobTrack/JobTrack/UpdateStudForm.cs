using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace JobTrack
{
    public partial class UpdateStudForm : Form
    {
        DataBase db = new DataBase();
        public UpdateStudForm()
        {
            InitializeComponent();
            StartPosition = FormStartPosition.CenterScreen;
            
        }

        private void button1_Click(object sender, EventArgs e)
        {
            // Получение ID студента из textBox1
            if (int.TryParse(textBox1.Text, out int studentId))
            {
                // Подтверждение удаления
                var confirmationResult = MessageBox.Show("Вы уверены, что хотите удалить этого студента?", "Подтвердите удаление", MessageBoxButtons.YesNo, MessageBoxIcon.Warning);
                if (confirmationResult == DialogResult.Yes)
                {
                    DeleteStudentById(studentId);
                }
            }
            else
            {
                MessageBox.Show("Некорректное student ID.");
            }
        }

        private void DeleteStudentById(int studentId)
        {
            try
            {
                db.openConnection();

                // Удаление записи студента из всех зависимых таблиц сначала
                string[] deleteQueries = {
                    "DELETE FROM employmentstudent WHERE studentID = @studentID",
                    "DELETE FROM riskzonestudent WHERE studentID = @studentID",
                    "DELETE FROM healthcategorystudent WHERE studentID = @studentID",
                    "DELETE FROM intentionsgraduates WHERE studentID = @studentID",
                    "DELETE FROM student WHERE idStudent = @studentID"
                };

                foreach (string query in deleteQueries)
                {
                    MySqlCommand command = new MySqlCommand(query, db.GetConnection());
                    command.Parameters.AddWithValue("@studentID", studentId);
                    command.ExecuteNonQuery();
                }

                db.closeConnection();

                MessageBox.Show("Студент успешно удален.");
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Error: {ex.Message}");
            }
        }
    }
}

