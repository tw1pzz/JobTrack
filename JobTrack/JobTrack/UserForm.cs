﻿using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using Excel = Microsoft.Office.Interop.Excel;

namespace JobTrack
{
    public partial class UserForm : Form
    {
        DataBase db = new DataBase();

        public UserForm()
        {
            StartPosition = FormStartPosition.CenterScreen;
            InitializeComponent();
            LoadSpecialities();
        }

        private void выйтиИзУчетнойЗаписиToolStripMenuItem_Click(object sender, EventArgs e)
        {
            AuthForm authForm = new AuthForm();
            authForm.Show();
            this.Visible = false;
        }

        private void UserForm_Load(object sender, EventArgs e)
        {
            comboBox1.SelectedIndexChanged += comboBox1_SelectedIndexChanged;
            try
            {
                db.openConnection();
                MessageBox.Show("Подключение установлено");
            }
            catch(Exception ex)
            {
                MessageBox.Show(ex.Message);    
            }
        }

        private void comboBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (comboBox1.SelectedValue != null)
            {
                int specialityID = Convert.ToInt32(comboBox1.SelectedValue);
                LoadStudents(specialityID);
            }
        }
        private void LoadSpecialities()
        {
            try
            {
                db.openConnection();

                string query = "SELECT idSpeciality, name FROM speciality";
                MySqlCommand command = new MySqlCommand(query, db.GetConnection());
                MySqlDataAdapter adapter = new MySqlDataAdapter(command);
                DataTable table = new DataTable();

                adapter.Fill(table);

                comboBox1.DisplayMember = "name";
                comboBox1.ValueMember = "idSpeciality";
                comboBox1.DataSource = table;

                db.closeConnection();
            }
            catch (Exception ex)
            {
                MessageBox.Show("Ошибка: " + ex.Message);
            }
        }

        private void LoadStudents(int specialityID)
        {
            try
            {
                db.openConnection();

                    string query = @"
                SELECT 
                    student.idStudent AS 'Student ID', 
                    student.name AS 'Имя', 
                    student.sname AS 'Фамилия', 
                    student.lname AS 'Отчество', 
                    student.phone AS 'Номер телефона', 
                    student.mail AS 'Почта', 
                    groupSpec.nuberGroup AS 'Группа'
                FROM 
                    student 
                JOIN 
                    groupSpec 
                ON 
                    student.groupID = groupSpec.idGroup 
                WHERE 
                    groupSpec.specialityID = @specialityID";

                MySqlCommand command = new MySqlCommand(query, db.GetConnection());
                command.Parameters.AddWithValue("@specialityID", specialityID);
                MySqlDataAdapter adapter = new MySqlDataAdapter(command);
                DataTable table = new DataTable();

                adapter.Fill(table);

                dataGridView1.DataSource = table;

                db.closeConnection();
            }
            catch (Exception ex)
            {
                MessageBox.Show("Ошибка: " + ex.Message);
            }
        }


        private void LoadStudent()
        {
            try
            {
                db.openConnection();

                string baseQuery = @"
            SELECT s.idStudent AS 'Student ID',
                   s.name AS 'Имя', 
                   s.sname AS 'Фамилия', 
                   s.lname AS 'Отчество', 
                   s.phone AS 'Номер телефона', 
                   s.mail AS 'Почта', 
                   g.nuberGroup AS 'Группа', 
                   e.name AS 'Статус выпускника' 
            FROM student s 
            JOIN employmentStudent es ON s.idStudent = es.studentID 
            JOIN employment e ON es.employmentID = e.idEmployment 
            JOIN groupspec g ON s.groupID = g.idGroup 
            JOIN speciality sp ON g.specialityID = sp.idSpeciality
            WHERE sp.idSpeciality = @specialityID ";

                List<string> conditions = new List<string>();
                if (checkBox1.Checked) conditions.Add("e.idEmployment = 2");
                if (checkBox2.Checked) conditions.Add("e.idEmployment = 3");
                if (checkBox3.Checked) conditions.Add("e.idEmployment = 4");
                if (checkBox4.Checked) conditions.Add("e.idEmployment = 5");
                if (checkBox5.Checked) conditions.Add("e.idEmployment = 6");
                if (checkBox6.Checked) conditions.Add("e.idEmployment = 7");
                if (checkBox7.Checked) conditions.Add("e.idEmployment = 8");

                string query = baseQuery;
                if (conditions.Count > 0)
                {
                    query += "AND (" + string.Join(" OR ", conditions) + ")";
                }

                MySqlCommand command = new MySqlCommand(query, db.GetConnection());
                command.Parameters.AddWithValue("@specialityID", comboBox1.SelectedValue);

                MySqlDataAdapter adapter = new MySqlDataAdapter(command);
                DataTable table = new DataTable();
                adapter.Fill(table);

                dataGridView1.DataSource = table;

                db.closeConnection();
            }
            catch (Exception ex)
            {
                MessageBox.Show("Ошибка: " + ex.Message);
            }
        }

        private void LoadRiskZoneStudents()
        {
            try
            {
                db.openConnection();

                string baseQuery = @"
            SELECT 
                s.idStudent AS 'Student ID', 
                s.name AS 'Имя', 
                s.sname AS 'Фамилия', 
                s.lname AS 'Отчество', 
                s.phone AS 'Номер телефона', 
                s.mail AS 'Электронная почта', 
                g.nuberGroup AS 'Группа', 
                rz.name AS 'Категория риска' 
            FROM 
                student s 
            JOIN 
                riskzonestudent rzs ON s.idStudent = rzs.studentID 
            JOIN 
                riskzone rz ON rzs.riskZoneID = rz.idRiskZone 
            JOIN 
                groupspec g ON s.groupID = g.idGroup 
            WHERE 
                g.specialityID = @specialityID";

                List<string> conditions = new List<string>();
                if (checkBox11.Checked) conditions.Add("rz.idRiskZone = 2");
                if (checkBox12.Checked) conditions.Add("rz.idRiskZone = 3");
                if (checkBox13.Checked) conditions.Add("rz.idRiskZone = 4");
                if (checkBox14.Checked) conditions.Add("rz.idRiskZone = 5");

                if (conditions.Count > 0)
                {
                    baseQuery += " AND (" + string.Join(" OR ", conditions) + ")";
                }

                MySqlCommand command = new MySqlCommand(baseQuery, db.GetConnection());
                command.Parameters.AddWithValue("@specialityID", comboBox1.SelectedValue);

                MySqlDataAdapter adapter = new MySqlDataAdapter(command);
                DataTable table = new DataTable();
                adapter.Fill(table);

                dataGridView1.DataSource = table;

                db.closeConnection();
            }
            catch (Exception ex)
            {
                MessageBox.Show("Ошибка: " + ex.Message);
            }
        }

        private void LoadHealthCategoryStudents()
        {
            try
            {
                db.openConnection();

                string baseQuery = @"
            SELECT 
                s.idStudent AS 'Student ID', 
                s.name AS 'Имя', 
                s.sname AS 'Фамилия', 
                s.lname AS 'Отчество', 
                s.phone AS 'Номер телефона', 
                s.mail AS 'Электронная почта', 
                g.nuberGroup AS 'Группа', 
                hc.name AS 'Категория здоровья' 
            FROM 
                student s 
            JOIN 
                groupspec g ON s.groupID = g.idGroup 
            JOIN 
                healthcategorystudent hcs ON s.idStudent = hcs.studentID 
            JOIN 
                healthcategory hc ON hcs.categoryID = hc.idCategory 
            WHERE 
                g.specialityID = @specialityID";

                List<string> conditions = new List<string>();
                if (checkBox10.Checked) conditions.Add("hc.idCategory = 2");
                if (checkBox15.Checked) conditions.Add("hc.idCategory = 3");
                if (checkBox16.Checked) conditions.Add("hc.idCategory = 4");
                if (checkBox17.Checked) conditions.Add("hc.idCategory = 5");
                if (checkBox18.Checked) conditions.Add("hc.idCategory = 6");
                if (checkBox19.Checked) conditions.Add("hc.idCategory = 7");

                if (conditions.Count > 0)
                {
                    baseQuery += " AND (" + string.Join(" OR ", conditions) + ")";
                }

                MySqlCommand command = new MySqlCommand(baseQuery, db.GetConnection());
                command.Parameters.AddWithValue("@specialityID", comboBox1.SelectedValue);

                MySqlDataAdapter adapter = new MySqlDataAdapter(command);
                DataTable table = new DataTable();
                adapter.Fill(table);

                dataGridView1.DataSource = table;

                db.closeConnection();
            }
            catch (Exception ex)
            {
                MessageBox.Show("Ошибка: " + ex.Message);
            }
        }

        private void LoadStudentsBySpecialityAndProfessionalIntentions()
        {
            try
            {
                db.openConnection();

                string baseQuery = @"
            SELECT 
                s.idStudent AS 'Student ID', 
                s.name AS 'Имя', 
                s.sname AS 'Фамилия', 
                s.lname AS 'Отчество', 
                s.phone AS 'Номер телефона', 
                s.mail AS 'Электронная почта', 
                g.nuberGroup AS 'Группа', 
                gpi.name AS 'Профессиональные намерения' 
            FROM 
                student s 
            JOIN 
                groupspec g ON s.groupID = g.idGroup 
            JOIN 
                intentionsgraduates ig ON s.idStudent = ig.studentID 
            JOIN 
                graduatesprofessionalintentions gpi ON ig.intentionsID = gpi.idIntentions 
            WHERE 
                g.specialityID = @specialityID";

                List<string> conditions = new List<string>();
                if (checkBox20.Checked) conditions.Add("gpi.idIntentions = 2");
                if (checkBox21.Checked) conditions.Add("gpi.idIntentions = 3");
                if (checkBox22.Checked) conditions.Add("gpi.idIntentions = 4");
                if (checkBox23.Checked) conditions.Add("gpi.idIntentions = 5");
                if (checkBox24.Checked) conditions.Add("gpi.idIntentions = 6");
                if (checkBox25.Checked) conditions.Add("gpi.idIntentions = 7");

                if (conditions.Count > 0)
                {
                    baseQuery += " AND (" + string.Join(" OR ", conditions) + ")";
                }

                MySqlCommand command = new MySqlCommand(baseQuery, db.GetConnection());
                command.Parameters.AddWithValue("@specialityID", comboBox1.SelectedValue);

                MySqlDataAdapter adapter = new MySqlDataAdapter(command);
                DataTable table = new DataTable();
                adapter.Fill(table);

                dataGridView1.DataSource = table;

                db.closeConnection();
            }
            catch (Exception ex)
            {
                MessageBox.Show("Ошибка: " + ex.Message);
            }
        }

        private void checkBox2_CheckedChanged(object sender, EventArgs e)
        {
            LoadStudent();
        }

        private void checkBox11_CheckedChanged(object sender, EventArgs e)
        {
            LoadRiskZoneStudents();
        }

        private void checkBox10_CheckedChanged(object sender, EventArgs e)
        {
            LoadHealthCategoryStudents();
        }

        private void checkBox20_CheckedChanged(object sender, EventArgs e)
        {
            LoadStudentsBySpecialityAndProfessionalIntentions();
        }

        private void выгрузитьToolStripMenuItem_Click(object sender, EventArgs e)
        {
            ExportToExcel(dataGridView1);
        }

        private void ExportToExcel(DataGridView dataGridView)
        {
            try
            {
                if (dataGridView.Rows.Count > 0)
                {
                    Excel.Application excelApp = new Excel.Application();
                    Excel.Workbook excelWorkBook = excelApp.Workbooks.Add();
                    Excel.Worksheet excelWorkSheet = excelWorkBook.Sheets[1];

                    for (int i = 0; i < dataGridView.Columns.Count; i++)
                    {
                        excelWorkSheet.Cells[1, i + 1] = dataGridView.Columns[i].HeaderText;
                    }

                    for (int i = 0; i < dataGridView.Rows.Count; i++)
                    {
                        for (int j = 0; j < dataGridView.Columns.Count; j++)
                        {
                            if (dataGridView.Rows[i].Cells[j].Value != null)
                            {
                                excelWorkSheet.Cells[i + 2, j + 1] = dataGridView.Rows[i].Cells[j].Value.ToString();
                            }
                            else
                            {
                                excelWorkSheet.Cells[i + 2, j + 1] = string.Empty; 
                            }
                        }
                    }

                    SaveFileDialog saveFileDialog = new SaveFileDialog();
                    saveFileDialog.Filter = "Excel Files|*.xlsx;*.xls";
                    saveFileDialog.ShowDialog();

                    if (saveFileDialog.FileName != "")
                    {
                        excelWorkBook.SaveAs(saveFileDialog.FileName);
                        excelWorkBook.Close();
                        excelApp.Quit();
                        MessageBox.Show("Данные успешно выгружены в Excel.", "Успех", MessageBoxButtons.OK, MessageBoxIcon.Information);
                    }
                }
                else
                {
                    MessageBox.Show("Нет данных для выгрузки.", "Ошибка", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Ошибка при экспорте данных в Excel: {ex.Message}", "Ошибка", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void рассылкаToolStripMenuItem_Click(object sender, EventArgs e)
        {
            MailingForm form = new MailingForm();  
            form.Show();
        }

    }
}