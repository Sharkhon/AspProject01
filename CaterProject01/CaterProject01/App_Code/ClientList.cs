using System;
using System.Collections.Generic;
using System.EnterpriseServices.CompensatingResourceManager;
using System.Linq;
using System.Web;

namespace CaterProject01.Model
{
    /// <summary>
    /// ClientList Model
    /// <author>Daniel Cater</author>
    /// </summary>
    public class ClientList
    {
        private List<Client> clientList;

        /// <summary>
        /// Gets or sets the clients.
        /// </summary>
        /// <value>
        /// The clients.
        /// </value>
        public List<Client> Clients
        {
            get => this.clientList;
            set => this.clientList = value;
        }

        /// <summary>
        /// Gets or sets the <see cref="Client"/> at the specified index.
        /// </summary>
        /// <value>
        /// The <see cref="Client"/>.
        /// </value>
        /// <param name="index">The index.</param>
        /// <returns></returns>
        public Client this[int index]
        {
            get => this.clientList[index];
            set => this.clientList[index] = value;
        }

        /// <summary>
        /// Gets the <see cref="Client"/> with the specified name.
        /// </summary>
        /// <value>
        /// The <see cref="Client"/>.
        /// </value>
        /// <param name="name">The name.</param>
        /// <returns></returns>
        /// <exception cref="ArgumentNullException">Cannot search for client using 'null'</exception>
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

        /// <summary>
        /// Initializes a new instance of the <see cref="ClientList"/> class.
        /// </summary>
        public ClientList()
        {
            this.clientList = new List<Client>();
        }

        /// <summary>
        /// Adds the item.
        /// </summary>
        /// <param name="client">The client.</param>
        public void AddItem(Client client)
        {
            this.clientList.Add(client);
        }

        /// <summary>
        /// Counts this instance.
        /// </summary>
        /// <returns></returns>
        public int Count()
        {
            return this.clientList.Count;
        }

        /// <summary>
        /// Removes at.
        /// </summary>
        /// <param name="index">The index.</param>
        public void RemoveAt(int index)
        {
            this.clientList.RemoveAt(index);
        }

        /// <summary>
        /// Clears this instance.
        /// </summary>
        public void Clear()
        {
            this.clientList.Clear();
        }

        /// <summary>
        /// Gets the clients.
        /// </summary>
        /// <returns>The ClientList from the session object</returns>
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