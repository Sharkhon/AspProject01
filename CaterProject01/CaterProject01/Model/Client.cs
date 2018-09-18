using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CaterProject01.Model
{
    /// <summary>
    /// Client Model
    /// <author>Daniel Cater</author>
    /// </summary>
    public class Client
    {

        private int id;
        private string name;
        private string address;
        private string city;
        private string state;
        private string zip;
        private string phoneNumber;
        private string email;

        /// <summary>
        /// Gets or sets the identifier.
        /// </summary>
        /// <value>
        /// The identifier.
        /// </value>
        public int ID
        {
            get => this.id;
            set => this.id = value;
        }

        /// <summary>
        /// Gets or sets the name.
        /// </summary>
        /// <value>
        /// The name.
        /// </value>
        public string Name
        {
            get => this.name;
            set => this.name = value;
        }

        /// <summary>
        /// Gets or sets the address.
        /// </summary>
        /// <value>
        /// The address.
        /// </value>
        public string Address
        {
            get => this.address;
            set => this.address = value;
        }

        /// <summary>
        /// Gets or sets the city.
        /// </summary>
        /// <value>
        /// The city.
        /// </value>
        public string City
        {
            get => this.city;
            set => this.city = value;
        }

        /// <summary>
        /// Gets or sets the state.
        /// </summary>
        /// <value>
        /// The state.
        /// </value>
        public string State
        {
            get => this.state;
            set => this.state = value;
        }

        /// <summary>
        /// Gets or sets the zip.
        /// </summary>
        /// <value>
        /// The zip.
        /// </value>
        public string Zip
        {
            get => this.zip;
            set => this.zip = value;
        }

        /// <summary>
        /// Gets or sets the phone number.
        /// </summary>
        /// <value>
        /// The phone number.
        /// </value>
        public string PhoneNumber
        {
            get => this.phoneNumber;
            set => this.phoneNumber = value;
        }

        /// <summary>
        /// Gets or sets the email.
        /// </summary>
        /// <value>
        /// The email.
        /// </value>
        public string Email
        {
            get => this.email;
            set => this.email = value;
        }

        /// <summary>
        /// Views the output.
        /// </summary>
        /// <returns>The output for the view list.</returns>
        public string ViewOutput()
        {
            return this.name + ": " + this.phoneNumber + "; " + this.email;
        }
    }
}