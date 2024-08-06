using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MySql.Data.MySqlClient;

namespace JobTrack
{
    internal class DataBase
    {
        MySqlConnection mySqlConnection = new MySqlConnection("server=; port=; user=; database=; password=; charset=");

        public void openConnection()
        {
            if (mySqlConnection.State == System.Data.ConnectionState.Closed)
            {
                mySqlConnection.Open();
            }
        }
        public void closeConnection()
        {
            if (mySqlConnection.State == System.Data.ConnectionState.Open)
            {
                mySqlConnection.Close();
            }
        }

        public MySqlConnection GetConnection()
        { 
            return mySqlConnection;
        }
    }
}
