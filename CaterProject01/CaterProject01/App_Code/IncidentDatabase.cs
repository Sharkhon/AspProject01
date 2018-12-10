using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.OleDb;
using System.IO;
using System.Linq;
using System.Web;

namespace CaterProject01
{
    public class IncidentDatabase
    {
        private static string GetConnectionString()
        {
            return ConfigurationManager.ConnectionStrings["AthManConnectionString"].ConnectionString;
        }

        public static IEnumerable GetOpenTechnicianIncidents(int technicianID)
        {
            List<Incident> incidents = new List<Incident>();

            OleDbConnection connection = new OleDbConnection(GetConnectionString());
            string statement = @"SELECT * FROM Incidents 
                                WHERE TechID = @techID 
                                AND DateClosed = NULL";

            OleDbCommand command = new OleDbCommand(statement, connection);
            command.Parameters.AddWithValue("techID", technicianID);

            connection.Open();

            OleDbDataReader dataReader = command.ExecuteReader(CommandBehavior.CloseConnection);

            if (dataReader == null)
            {
                throw new InvalidDataException("Could not get items");
            }

            while (dataReader.Read())
            {
                incidents.Add(new Incident()
                {
                    ClientID = Convert.ToInt32(dataReader["ClientID"]),
                    DateOpen = Convert.ToDateTime(dataReader["DateOpened"]),
                    Description = dataReader["Description"].ToString(),
                    IncidentID = Convert.ToInt32(dataReader["IncidentID"]),
                    ProductID = dataReader["ProductID"].ToString(),
                    TechID = technicianID,
                    Title = dataReader["Title"].ToString()
                });
            }

            return incidents;
        }
    }
}