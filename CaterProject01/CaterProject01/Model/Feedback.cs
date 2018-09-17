using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CaterProject01.Model
{
    public class Feedback
    {
        private int clientID;
        private int incidentID;
        private int serviceTime;
        private int efficiency;
        private int resolution;
        private string comments;
        private bool contact;
        private string contactMethod;

        public int ClientID
        {
            get => this.clientID;
            set => this.clientID = value;
        }

        public int IncidentID
        {
            get => this.incidentID;
            set => this.incidentID = value;
        }

        public int ServiceTime
        {
            get => this.serviceTime;
            set => this.serviceTime = value;
        }

        public int Efficiency
        {
            get => this.efficiency;
            set => this.efficiency = value;
        }

        public int Resolution
        {
            get => this.resolution;
            set => this.resolution = value;
        }

        public string Comments
        {
            get => this.comments;
            set => this.comments = value;
        }

        public bool Contact
        {
            get => this.contact;
            set => this.contact = value;
        }

        public string ContactMethod
        {
            get => this.contactMethod;
            set => this.contactMethod = value;
        }
    }
}