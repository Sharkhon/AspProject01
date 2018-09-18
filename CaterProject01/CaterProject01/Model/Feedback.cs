using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CaterProject01.Model
{
    /// <summary>
    /// Feedback Model
    /// <author>Daniel Cater</author>
    /// </summary>
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

        /// <summary>
        /// Gets or sets the client identifier.
        /// </summary>
        /// <value>
        /// The client identifier.
        /// </value>
        public int ClientID
        {
            get => this.clientID;
            set => this.clientID = value;
        }

        /// <summary>
        /// Gets or sets the incident identifier.
        /// </summary>
        /// <value>
        /// The incident identifier.
        /// </value>
        public int IncidentID
        {
            get => this.incidentID;
            set => this.incidentID = value;
        }

        /// <summary>
        /// Gets or sets the service time.
        /// </summary>
        /// <value>
        /// The service time.
        /// </value>
        public int ServiceTime
        {
            get => this.serviceTime;
            set => this.serviceTime = value;
        }

        /// <summary>
        /// Gets or sets the efficiency.
        /// </summary>
        /// <value>
        /// The efficiency.
        /// </value>
        public int Efficiency
        {
            get => this.efficiency;
            set => this.efficiency = value;
        }

        /// <summary>
        /// Gets or sets the resolution.
        /// </summary>
        /// <value>
        /// The resolution.
        /// </value>
        public int Resolution
        {
            get => this.resolution;
            set => this.resolution = value;
        }

        /// <summary>
        /// Gets or sets the comments.
        /// </summary>
        /// <value>
        /// The comments.
        /// </value>
        public string Comments
        {
            get => this.comments;
            set => this.comments = value;
        }

        /// <summary>
        /// Gets or sets a value indicating whether they want to be contacted.
        /// </summary>
        /// <value>
        ///   <c>true</c> if contact; otherwise, <c>false</c>.
        /// </value>
        public bool Contact
        {
            get => this.contact;
            set => this.contact = value;
        }

        /// <summary>
        /// Gets or sets the contact method.
        /// </summary>
        /// <value>
        /// The contact method.
        /// </value>
        public string ContactMethod
        {
            get => this.contactMethod;
            set => this.contactMethod = value;
        }
    }
}