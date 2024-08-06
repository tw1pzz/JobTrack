using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using MySql.Data.MySqlClient;

namespace JobTrack
{
    public partial class AuthForm : Form
    {
        DataBase db = new DataBase();
        public AuthForm()
        {
            InitializeComponent();
            StartPosition = FormStartPosition.CenterScreen;
            try
            {
                db.openConnection();
                MessageBox.Show("Подключение установлено" , "Подключение установлено" , MessageBoxButtons.OK , MessageBoxIcon.Information);
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }

        private void AuthForm_Load(object sender, EventArgs e)
        {
            textBox1.MaxLength = 50;
            textBox2.MaxLength = 50;
            textBox2.UseSystemPasswordChar = true;
        }

        private void pictureBox3_Click(object sender, EventArgs e)
        {
            textBox2.UseSystemPasswordChar = false;
            pictureBox3.Visible = false;
            pictureBox4.Visible = true;
        }

        private void pictureBox4_Click(object sender, EventArgs e)
        {
            textBox2.UseSystemPasswordChar = true;
            pictureBox3.Visible = true;
            pictureBox4.Visible = false;
        }

        private void button1_Click(object sender, EventArgs e)
        {
            string login = textBox1.Text;
            string password = textBox2.Text;
            string hashedPassword = md5.hashPassword(password);

            // Отладочная информация
            Console.WriteLine("Login: " + login);
            Console.WriteLine("Password: " + password);
            Console.WriteLine("Hashed Password: " + hashedPassword);

            try
            {
                db.openConnection();

                using (MySqlCommand command = new MySqlCommand("SELECT `id_user`, `root` FROM `user` WHERE `login` = @login AND `password` = @password", db.GetConnection()))
                {
                    command.Parameters.Add("@login", MySqlDbType.VarChar).Value = login;
                    command.Parameters.Add("@password", MySqlDbType.VarChar).Value = hashedPassword;

                    using (MySqlDataReader reader = command.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            int userId = reader.GetInt32("id_user");
                            bool isAdmin = reader.GetBoolean("root");

                            reader.Close();

                            // Записать последнюю активность
                            using (MySqlCommand activityCommand = new MySqlCommand("INSERT INTO `lastactivity` (`userID`, `LastActivity`) VALUES (@userID, @lastActivity) ON DUPLICATE KEY UPDATE `LastActivity` = @lastActivity", db.GetConnection()))
                            {
                                activityCommand.Parameters.Add("@userID", MySqlDbType.Int32).Value = userId;
                                activityCommand.Parameters.Add("@lastActivity", MySqlDbType.DateTime).Value = DateTime.Now;
                                activityCommand.ExecuteNonQuery();
                            }

                            db.closeConnection();

                            if (isAdmin)
                            {
                                AdminForm adminForm = new AdminForm();
                                adminForm.Show();
                                this.Visible = false;
                            }
                            else
                            {
                                UserForm userForm = new UserForm();
                                userForm.Show();
                                this.Visible = false;
                            }
                        }
                        else
                        {
                            MessageBox.Show("Неверный логин или пароль");
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("Ошибка подключения к базе данных: " + ex.Message);
            }
            finally
            {
                if (db.GetConnection() != null && db.GetConnection().State == System.Data.ConnectionState.Open)
                {
                    db.closeConnection();
                }
            }
        }
    }
}
