using System;
using System.Collections.Generic;
using System.EnterpriseServices.CompensatingResourceManager;
using System.Linq;
using System.Web;

namespace CaterProject01.Model
{
    public class ClientList
    {
        private List<Client> clientList;

        public List<Client> Clients
        {
            get => this.clientList;
            set => this.clientList = value;
        }

        public Client this[int index]
        {
            get => this.clientList[index];
            set => this.clientList[index] = value;
        }

        public Client this[string name]
        {
            get
            {
                if (name == null)
                {
                    throw new ArgumentNullException("Cannot search for client using 'null'");
                }
                else
                {
                    return clientList.Single(client => client.Name.Equals(name));
                }
            }
        }

        public ClientList()
        {
            this.clientList = new List<Client>();
        }

        public void AddItem(Client client)
        {
            this.clientList.Add(client);
        }

        public int Count()
        {
            return this.clientList.Count;
        }

        public void RemoveAt(int index)
        {
            this.clientList.RemoveAt(index);
        }

        public void Clear()
        {
            this.clientList.Clear();
        }

        public static ClientList GetClients()
        {
            if (HttpContext.Current.Session["ClientList"] == null)
            {
                HttpContext.Current.Session["ClientList"] = new ClientList();
            }

            return (ClientList)HttpContext.Current.Session["ClientList"];
        }
    }
}