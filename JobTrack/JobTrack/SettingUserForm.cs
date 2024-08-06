using MySql.Data.MySqlClient;
using System;
using System.Data;
using System.Windows.Forms;

namespace JobTrack
{
    public partial class SettingUserForm : Form
    {
        DataBase db = new DataBase();

        public SettingUserForm()
        {
            InitializeComponent();
            StartPosition = FormStartPosition.CenterScreen;  
            LoadUsers();
            LoadActions();
        }
        private void SettingUserForm_Load(object sender, EventArgs e)
        {
            dataGridView1.AutoGenerateColumns = true;
        }

        public class ComboBoxItem
        {
            public string Text { get; set; }
            public int Value { get; set; }

            public ComboBoxItem(string text, int value)
            {
                Text = text;
                Value = value;
            }

            public override string ToString()
            {
                return Text;
            }
        }

        private void LoadActions()
        {
            comboBox2.Items.Add("Назначить администратором");
            comboBox2.Items.Add("Отозвать права администратора");
            comboBox2.Items.Add("Удалить пользователя");
        }

        private void DeleteUser(int userId)
        {
            try
            {
                db.openConnection();

                MySqlCommand deleteActivityCommand = new MySqlCommand("DELETE FROM `lastactivity` WHERE `userID` = @userId", db.GetConnection());
                deleteActivityCommand.Parameters.Add("@userId", MySqlDbType.Int32).Value = userId;
                deleteActivityCommand.ExecuteNonQuery();

                MySqlCommand deleteUserCommand = new MySqlCommand("DELETE FROM `user` WHERE `id_user` = @userId", db.GetConnection());
                deleteUserCommand.Parameters.Add("@userId", MySqlDbType.Int32).Value = userId;
                deleteUserCommand.ExecuteNonQuery();

                MessageBox.Show("Пользователь успешно удален.");
            }
            catch (Exception ex)
            {
                MessageBox.Show("Ошибка при удалении пользователя: " + ex.Message);
            }
            finally
            {
                db.closeConnection();
            }
        }

        private void AssignAdmin(int userId)
        {
            ExecuteNonQuery("UPDATE `user` SET `root` = 1 WHERE `id_user` = @id", userId, "Пользователь назначен администратором.", "Ошибка при назначении пользователя администратором.");
        }

        private void RevokeAdmin(int userId)
        {
            ExecuteNonQuery("UPDATE `user` SET `root` = 0 WHERE `id_user` = @id", userId, "Права администратора успешно отозваны.", "Ошибка при изменении пользователя.");
        }

        private void ExecuteNonQuery(string query, int userId, string successMessage, string errorMessage)
        {
            try
            {
                db.openConnection();
                MySqlCommand command = new MySqlCommand(query, db.GetConnection());
                command.Parameters.Add("@id", MySqlDbType.Int32).Value = userId;
                if (command.ExecuteNonQuery() != 0)
                {
                    MessageBox.Show(successMessage);
                }
                else
                {
                    MessageBox.Show(errorMessage);
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("Ошибка: " + ex.Message);
            }
            finally
            {
                db.closeConnection();
            }
        }

        private void LoadUsers()
        {
            try
            {
                db.openConnection();
                MySqlCommand command = new MySqlCommand("SELECT `id_user`, `name`, `sname`, `lname` FROM `user`", db.GetConnection());
                MySqlDataReader reader = command.ExecuteReader();
                while (reader.Read())
                {
                    string fullName = $"{reader["sname"]} {reader["name"]} {reader["lname"]}";
                    comboBox1.Items.Add(new ComboBoxItem(fullName, Convert.ToInt32(reader["id_user"])));
                }
                reader.Close();
            }
            catch (Exception ex)
            {
                MessageBox.Show("Ошибка при загрузке пользователей: " + ex.Message);
            }
            finally
            {
                db.closeConnection();
            }
        }

        private void LoadUserInfo(int userId)
        {
            try
            {
                db.openConnection();
                MySqlCommand command = new MySqlCommand("SELECT `name`, `sname`, `lname`, `login` FROM `user` WHERE `id_user` = @id", db.GetConnection());
                command.Parameters.Add("@id", MySqlDbType.Int32).Value = userId;
                MySqlDataReader reader = command.ExecuteReader();
                if (reader.Read())
                {
                    textBox1.Text = reader["name"].ToString();
                    textBox2.Text = reader["sname"].ToString();
                    textBox3.Text = reader["lname"].ToString();
                    textBox4.Text = reader["login"].ToString();
                }
                reader.Close();
            }
            catch (Exception ex)
            {
                MessageBox.Show("Ошибка при загрузке информации о пользователе: " + ex.Message);
            }
            finally
            {
                db.closeConnection();
            }
        }

        private void button1_Click(object sender, EventArgs e)
        {
            ComboBoxItem selectedItem = comboBox1.SelectedItem as ComboBoxItem;
            if (selectedItem == null)
            {
                MessageBox.Show("Выберите пользователя для обновления.");
                return;
            }

            int userId = selectedItem.Value;
            string name = textBox1.Text;
            string sname = textBox2.Text;
            string lname = textBox3.Text;
            string login = textBox4.Text;

            try
            {
                db.openConnection();
                MySqlCommand command = new MySqlCommand("UPDATE `user` SET `name` = @name, `sname` = @sname, `lname` = @lname, `login` = @login WHERE `id_user` = @id", db.GetConnection());
                command.Parameters.Add("@name", MySqlDbType.VarChar).Value = name;
                command.Parameters.Add("@sname", MySqlDbType.VarChar).Value = sname;
                command.Parameters.Add("@lname", MySqlDbType.VarChar).Value = lname;
                command.Parameters.Add("@login", MySqlDbType.VarChar).Value = login;
                command.Parameters.Add("@id", MySqlDbType.Int32).Value = userId;

                if (command.ExecuteNonQuery() == 1)
                {
                    MessageBox.Show("Данные пользователя успешно обновлены.");
                }
                else
                {
                    MessageBox.Show("Ошибка при обновлении данных пользователя.");
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("Ошибка: " + ex.Message);
            }
            finally
            {
                db.closeConnection();
            }
        }

        private void button2_Click(object sender, EventArgs e)
        {
            ComboBoxItem selectedUser = comboBox1.SelectedItem as ComboBoxItem;
            if (selectedUser == null)
            {
                MessageBox.Show("Выберите пользователя для выполнения действия.");
                return;
            }

            string selectedAction = comboBox2.SelectedItem as string;
            if (selectedAction == null)
            {
                MessageBox.Show("Выберите действие.");
                return;
            }

            int userId = selectedUser.Value;

            switch (selectedAction)
            {
                case "Назначить администратором":
                    if (MessageBox.Show("Вы уверены, что хотите назначить этого пользователя администратором?", "Подтверждение действия", MessageBoxButtons.YesNo) == DialogResult.Yes)
                    {
                        AssignAdmin(userId);
                    }
                    break;

                case "Отозвать права администратора":
                    if (MessageBox.Show("Вы уверены, что хотите отозвать права администратора у этого пользователя?", "Подтверждение действия", MessageBoxButtons.YesNo) == DialogResult.Yes)
                    {
                        RevokeAdmin(userId);
                    }
                    break;

                case "Удалить пользователя":
                    if (MessageBox.Show("Вы уверены, что хотите удалить этого пользователя?", "Подтверждение действия", MessageBoxButtons.YesNo) == DialogResult.Yes)
                    {
                        DeleteUser(userId);
                    }
                    break;
            }
        }

        private void comboBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
            ComboBoxItem selectedItem = comboBox1.SelectedItem as ComboBoxItem;
            if (selectedItem != null)
            {
                int userId = selectedItem.Value;
                LoadUserInfo(userId);
            }
        }

        private void label1_Click(object sender, EventArgs e)
        {
            comboBox1.Items.Clear();
            LoadUsers();
        }

        private void button3_Click(object sender, EventArgs e)
        {
            // Открытие соединения
            db.openConnection();

            // Выполнение запроса для получения последней активности
            string query = @"
        SELECT la.idLastactivity, u.name, u.sname, u.lname, la.LastActivity
        FROM lastactivity la
        JOIN user u ON la.userID = u.id_user
        ORDER BY la.LastActivity DESC";

            MySqlDataAdapter dataAdapter = new MySqlDataAdapter(query, db.GetConnection());
            DataTable dataTable = new DataTable();
            dataAdapter.Fill(dataTable);

            // Закрытие соединения
            db.closeConnection();

            // Привязка данных к DataGridView
            dataGridView1.DataSource = dataTable;

            // Установка русских заголовков столбцов
            dataGridView1.Columns["idLastactivity"].HeaderText = "ID Последней Активности";
            dataGridView1.Columns["name"].HeaderText = "Имя";
            dataGridView1.Columns["sname"].HeaderText = "Фамилия";
            dataGridView1.Columns["lname"].HeaderText = "Отчество";
            dataGridView1.Columns["LastActivity"].HeaderText = "Последняя Активность";
        }
    }
}

