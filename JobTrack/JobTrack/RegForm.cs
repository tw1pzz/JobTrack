using MySql.Data.MySqlClient;
using System;
using System.Security.Cryptography;
using System.Text;
using System.Windows.Forms;

namespace JobTrack
{
    public partial class RegForm : Form
    {
        DataBase db = new DataBase();

        public RegForm()
        {
            StartPosition = FormStartPosition.CenterScreen;
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            string name = textBox1.Text;
            string sname = textBox2.Text;
            string lname = textBox3.Text;
            string login = textBox4.Text;
            string password = textBox5.Text;
            string confirmPassword = textBox6.Text;

            if (password != confirmPassword)
            {
                MessageBox.Show("Пароли не совпадают");
                return;
            }

            if (IsLoginExists(login))
            {
                MessageBox.Show("Пользователь с таким логином уже существует");
                return;
            }

            string hashedPassword = md5.hashPassword(password);

            MySqlCommand command = new MySqlCommand("INSERT INTO `user` (`name`, `sname`, `lname`, `login`, `password`, `root`) VALUES (@name, @sname, @lname, @login, @password, 0)", db.GetConnection());
            command.Parameters.Add("@name", MySqlDbType.VarChar).Value = name;
            command.Parameters.Add("@sname", MySqlDbType.VarChar).Value = sname;
            command.Parameters.Add("@lname", MySqlDbType.VarChar).Value = lname;
            command.Parameters.Add("@login", MySqlDbType.VarChar).Value = login;
            command.Parameters.Add("@password", MySqlDbType.VarChar).Value = hashedPassword;

            db.openConnection();

            if (command.ExecuteNonQuery() == 1)
            {
                MessageBox.Show("Аккаунт был создан");
                ClearFields();
            }
            else
            {
                MessageBox.Show("Аккаунт не был создан");
            }

            db.closeConnection();
        }

        private bool IsLoginExists(string login)
        {
            MySqlCommand checkLoginCommand = new MySqlCommand("SELECT COUNT(*) FROM `user` WHERE `login` = @login", db.GetConnection());
            checkLoginCommand.Parameters.Add("@login", MySqlDbType.VarChar).Value = login;

            db.openConnection();

            int userCount = Convert.ToInt32(checkLoginCommand.ExecuteScalar());

            db.closeConnection();

            return userCount > 0;
        }

        private void ClearFields()
        {
            textBox1.Clear();
            textBox2.Clear();
            textBox3.Clear();
            textBox4.Clear();
            textBox5.Clear();
            textBox6.Clear();
        }
    }
}