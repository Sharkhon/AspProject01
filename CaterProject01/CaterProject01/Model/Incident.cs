using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CaterProject01.Model
{
    /// <summary>
    /// Incident Model
    /// <author>Daniel Cater</author>
    /// </summary>
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
        /// Gets or sets the product identifier.
        /// </summary>
        /// <value>
        /// The product identifier.
        /// </value>
        public string ProductID
        {
            get => this.productID;
            set => this.productID = value;
        }

        /// <summary>
        /// Gets or sets the tech identifier.
        /// </summary>
        /// <value>
        /// The tech identifier.
        /// </value>
        public int TechID
        {
            get => this.techID;
            set => this.techID = value;
        }

        /// <summary>
        /// Gets or sets the date open.
        /// </summary>
        /// <value>
        /// The date open.
        /// </value>
        public DateTime DateOpen
        {
            get => this.dateOpen; 
            set => this.dateOpen = value;
        }

        /// <summary>
        /// Gets or sets the date closed.
        /// </summary>
        /// <value>
        /// The date closed.
        /// </value>
        public DateTime DateClosed
        {
            get => this.dateClosed;
            set => this.dateClosed = value;
        }

        /// <summary>
        /// Gets or sets the title.
        /// </summary>
        /// <value>
        /// The title.
        /// </value>
        public string Title
        {
            get => this.title;
            set => this.title = value;
        }

        /// <summary>
        /// Gets or sets the description.
        /// </summary>
        /// <value>
        /// The description.
        /// </value>
        public string Description
        {
            get => this.description;
            set => this.description = value;
        }

        /// <summary>
        /// Formats the incident to the string representation.
        /// </summary>
        /// <returns></returns>
        public string FormatIncident()
        {
            return "Incident for product " + this.productID + " closed " + this.dateClosed + " (" + this.title + ")";
        }
    }
}