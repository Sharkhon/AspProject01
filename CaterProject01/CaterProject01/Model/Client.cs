using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CaterProject01.Model
{
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

        public int ID
        {
            get => this.id;
            set => this.id = value;
        }

        public string Name
        {
            get => this.name;
            set => this.name = value;
        }

        public string Address
        {
            get => this.address;
            set => this.address = value;
        }

        public string City
        {
            get => this.city;
            set => this.city = value;
        }

        public string State
        {
            get => this.state;
            set => this.state = value;
        }

        public string Zip
        {
            get => this.zip;
            set => this.zip = value;
        }

        public string PhoneNumber
        {
            get => this.phoneNumber;
            set => this.phoneNumber = value;
        }

        public string Email
        {
            get => this.email;
            set => this.email = value;
        }

        public string ViewOutput()
        {
            return this.name + ": " + this.phoneNumber + "; " + this.email;
        }
    }
}