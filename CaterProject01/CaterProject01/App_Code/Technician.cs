using System;
using System.Collections.Generic;
using System.Web;

namespace CaterProject01
{
    public class Technician
    {
        private int id;
        private string name;
        private string phone;
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

        public string Phone
        {
            get => this.phone;
            set => this.phone = value;
        }

        public string Email
        {
            get => this.email;
            set => this.email = value;
        }
    }
}