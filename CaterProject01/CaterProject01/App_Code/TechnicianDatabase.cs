using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.OleDb;
using System.IO;
using System.Web;

namespace CaterProject01
{
    public class TechnicianDatabase
    {
        private static string GetConnectionString()
        {
            return ConfigurationManager.ConnectionStrings["AthManConnectionString"].ConnectionString;
        }

        public IEnumerable GetTechnicians()
        {
            List<Technician> technicians = new List<Technician>();

            OleDbConnection connection = new OleDbConnection(GetConnectionString());
            string statement = @"SELECT * FROM Technicians";

            OleDbCommand command = new OleDbCommand(statement, connection);

            connection.Open();

            OleDbDataReader dataReader = command.ExecuteReader(CommandBehavior.CloseConnection);

            if (dataReader == null)
            {
                throw new InvalidDataException("Could not get items");
            }

            while (dataReader.Read())
            {
                technicians.Add(new Technician()
                {
                    ID = Convert.ToInt32(dataReader["TechID"]),
                    Name = Convert.ToString(dataReader["Name"]),
                    Phone = Convert.ToString(dataReader["Phone"]),
                    Email = Convert.ToString(dataReader["Email"])

                });
            }

            return technicians;
        }
    }
}