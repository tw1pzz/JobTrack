using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Net.Mail;
using System.Net;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using static System.Windows.Forms.VisualStyles.VisualStyleElement;
using JobTrack;

namespace JobTrack
{
    public partial class MailingForm : Form
    {

        DataBase db = new DataBase();
        public MailingForm()
        {
            StartPosition = FormStartPosition.CenterScreen;
            InitializeComponent();
            LoadGroups();
            LoadSpecialities();
        }

        private void LoadGroups()
        {
            try
            {
                string query = "SELECT nuberGroup FROM groupSpec";
                MySqlCommand command = new MySqlCommand(query, db.GetConnection());
                db.openConnection();
                MySqlDataReader reader = command.ExecuteReader();

                while (reader.Read())
                {
                    comboBox1.Items.Add(reader.GetString("nuberGroup"));
                }

                reader.Close();
            }
            catch (Exception ex)
            {
                MessageBox.Show("Ошибка загрузки групп: " + ex.Message);
            }
            finally
            {
                db.closeConnection();
            }
        }

        private void LoadSpecialities()
        {
            try
            {
                string query = "SELECT name FROM speciality";
                MySqlCommand command = new MySqlCommand(query, db.GetConnection());
                db.openConnection();
                MySqlDataReader reader = command.ExecuteReader();

                while (reader.Read())
                {
                    comboBox2.Items.Add(reader.GetString("name"));
                }

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

        private void button1_Click(object sender, EventArgs e)
        {
            int studentId;
            if (!int.TryParse(textBox1.Text, out studentId))
            {
                MessageBox.Show("Некорректный ID студента.");
                return;
            }

            string subject = textBox2.Text;
            string messageBody = textBox3.Text;

            try
            {
                db.openConnection();

                string query = "SELECT mail FROM student WHERE idStudent = @id";
                MySqlCommand command = new MySqlCommand(query, db.GetConnection());
                command.Parameters.AddWithValue("@id", studentId);

                using (MySqlDataReader reader = command.ExecuteReader())
                {
                    if (reader.Read())
                    {
                        string studentMail = reader.GetString("mail");

                        SendEmail(studentMail, subject, messageBody);
                    }
                    else
                    {
                        MessageBox.Show("Студент с указанным ID не найден.");
                    }
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
        private void SendEmail(string to, string subject, string body)
        {
            try
            {
                MailMessage mail = new MailMessage();
                SmtpClient SmtpServer = new SmtpClient("smtp.mail.ru");

                mail.From = new MailAddress("mail"); // Укажите вашу электронную почту
                mail.To.Add(to);
                mail.Subject = subject;
                mail.Body = body;

                SmtpServer.Port = 587;
                SmtpServer.Credentials = new System.Net.NetworkCredential("mail", "password"); // Укажите вашу электронную почту и пароль
                SmtpServer.EnableSsl = true;

                SmtpServer.Send(mail);
                MessageBox.Show("Сообщение успешно отправлено.");
            }
            catch (Exception ex)
            {
                MessageBox.Show("Ошибка при отправке сообщения: " + ex.Message);
            }
        }




        /*
        private void SendEmail(string to, string subject, string body)
        {
            // Настройка SMTP-сервера для отправки почты
            SmtpClient client = new SmtpClient("smtp.mail.ru")
            {
                Port = 587,
                Credentials = new NetworkCredential("mail", "password"),
                EnableSsl = true,
            };

            // Создание сообщения
            MailMessage mailMessage = new MailMessage("your_username@example.com", to, subject, body);

            try
            {
                // Отправка сообщения
                client.Send(mailMessage);
                MessageBox.Show("Сообщение успешно отправлено на адрес: " + to);
            }
            catch (Exception ex)
            {
                MessageBox.Show("Ошибка при отправке сообщения: " + ex.Message);
            }
        */
    }
}

