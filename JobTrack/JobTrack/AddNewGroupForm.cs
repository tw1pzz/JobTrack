using MySql.Data.MySqlClient;
using System;
using System.Data;
using System.Windows.Forms;

namespace JobTrack
{
    public partial class AddNewGroupForm : Form
    {
        DataBase db = new DataBase();

        public AddNewGroupForm()
        {
            StartPosition = FormStartPosition.CenterScreen;
            InitializeComponent();
            FillComboBoxSpeciality();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            try
            {
                string newGroup = textBox1.Text;
                int specialityID = (int)comboBox1.SelectedValue;

                if (!string.IsNullOrEmpty(newGroup) && specialityID > 0)
                {
                    // Открываем подключение к базе данных
                    db.openConnection();

                    // Вставляем новую группу в базу данных
                    string query = "INSERT INTO groupspec (nuberGroup, specialityID) VALUES (@nuberGroup, @specialityID)";
                    MySqlCommand command = new MySqlCommand(query, db.GetConnection());
                    command.Parameters.AddWithValue("@nuberGroup", newGroup);
                    command.Parameters.AddWithValue("@specialityID", specialityID);
                    command.ExecuteNonQuery();

                    // Закрываем соединение с базой данных
                    db.closeConnection();

                    // Очищаем текстовое поле после добавления группы
                    textBox1.Clear();
                    MessageBox.Show("Группа успешно добавлена");
                }
                else
                {
                    MessageBox.Show("Введите название новой группы и выберите специальность");
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("Ошибка: " + ex.Message);
            }
        }

        private void FillComboBoxSpeciality()
        {
            try
            {
                string query = "SELECT idSpeciality, name FROM speciality";
                MySqlCommand command = new MySqlCommand(query, db.GetConnection());
                db.openConnection();
                MySqlDataReader reader = command.ExecuteReader();

                DataTable dt = new DataTable();
                dt.Load(reader);

                comboBox1.DataSource = dt;
                comboBox1.DisplayMember = "name";
                comboBox1.ValueMember = "idSpeciality";

                reader.Close();
            }
            catch (Exception ex)
            {
                MessageBox.Show("Ошибка загрузки специальностей: " + ex.Message);
            }
            finally
            {
                db.closeConnection();
            }
        }
    }
   
}
