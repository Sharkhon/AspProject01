using System;
using System.Configuration;
using System.Data;
using System.Data.OleDb;
using System.IO;

namespace CaterProject01.App_Code
{
    public class IncidentDisplayDb
    {

        private static string GetConnectionString()
        {
            return ConfigurationManager.ConnectionStrings["AthManConnectionString"].ConnectionString;
        }

        public static DataTable GetIncidents(int clientID)
        {
            DataTable data = new DataTable();

            data.Columns.Add("ProductName", typeof(string));
            data.Columns.Add("TechnicianName", typeof(string));
            data.Columns.Add("DateOpened", typeof(string));
            data.Columns.Add("DateClosed", typeof(string));
            data.Columns.Add("Description", typeof(string));

            OleDbConnection connection = new OleDbConnection(GetConnectionString());
            string statement = @"SELECT Incidents.DateOpened, Incidents.DateClosed, Incidents.Description, Technicians.Name, Products.Name
                                FROM Products 
                                    INNER JOIN (Incidents INNER JOIN Technicians ON Incidents.TechID = Technicians.TechID) 
                                    ON Products.ProductID = Incidents.ProductID
                                WHERE Incidents.ClientID = @clientID";

            OleDbCommand command = new OleDbCommand(statement, connection);

            command.Parameters.AddWithValue("clientID", clientID);

            connection.Open();

            OleDbDataReader dataReader = command.ExecuteReader(CommandBehavior.CloseConnection);

            if (dataReader == null)
            {
                throw new InvalidDataException("Could not get items");
            } 

            while (dataReader.Read())
            {
                string productName = dataReader["Products.Name"].ToString();
                string techName = dataReader["Technicians.Name"].ToString();
                string dateOpen = Convert.ToDateTime(dataReader["DateOpened"]).ToShortDateString();
                string dateClosed = Convert.ToDateTime(dataReader["DateClosed"]).ToShortDateString();
                string description = dataReader["Description"].ToString();
                data.Rows.Add(productName, techName, dateOpen, dateClosed, description);
            }

            return data;
        }
    }
}