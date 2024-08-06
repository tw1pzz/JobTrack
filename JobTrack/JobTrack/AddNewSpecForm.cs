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
using static System.Windows.Forms.VisualStyles.VisualStyleElement;

namespace JobTrack
{
    public partial class AddNewSpecForm : Form
    {
        DataBase db = new DataBase();
        public AddNewSpecForm()
        {
            StartPosition = FormStartPosition.CenterScreen;
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            string codeSpeciality = textBox1.Text;
            string nameSpeciality = textBox2.Text;

            if (string.IsNullOrWhiteSpace(codeSpeciality) || string.IsNullOrWhiteSpace(nameSpeciality))
            {
                MessageBox.Show("Пожалуйста, заполните все поля");
                return;
            }

            try
            {
                db.openConnection();

                string query = "INSERT INTO speciality (codeSpeciality, name) VALUES (@codeSpeciality, @nameSpeciality)";
                MySqlCommand command = new MySqlCommand(query, db.GetConnection());
                command.Parameters.AddWithValue("@codeSpeciality", codeSpeciality);
                command.Parameters.AddWithValue("@nameSpeciality", nameSpeciality);

                if (command.ExecuteNonQuery() == 1)
                {
                    MessageBox.Show("Специальность успешно добавлена!");
                }
                else
                {
                    MessageBox.Show("Ошибка при добавлении специальности");
                }

                db.closeConnection();
            }
            catch (Exception ex)
            {
                MessageBox.Show("Ошибка: " + ex.Message);
            }
        }
    }
}
