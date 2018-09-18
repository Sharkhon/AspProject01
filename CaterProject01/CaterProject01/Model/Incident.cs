using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CaterProject01.Model
{
    public class Incident
    {
        private int incidentID;
        private int clientID;
        private string productID;
        private int techID;
        private DateTime dateOpen;
        private DateTime dateClosed;
        private string title;
        private string description;

        public int IncidentID
        {
            get => this.incidentID;
            set => this.incidentID = value;
        }

        public int ClientID
        {
            get => this.clientID;
            set => this.clientID = value;
        }

        public string ProductID
        {
            get => this.productID;
            set => this.productID = value;
        }

        public int TechID
        {
            get => this.techID;
            set => this.techID = value;
        }

        public DateTime DateOpen
        {
            get => this.dateOpen; 
            set => this.dateOpen = value;
        }

        public DateTime DateClosed
        {
            get => this.dateClosed;
            set => this.dateClosed = value;
        }

        public string Title
        {
            get => this.title;
            set => this.title = value;
        }

        public string Description
        {
            get => this.description;
            set => this.description = value;
        }

        public string FormatIncident()
        {
            return "Incident for product " + this.productID + " closed " + this.dateClosed + " (" + this.title + ")";
        }
    }
}