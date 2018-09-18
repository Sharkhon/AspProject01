using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CaterProject01.Model;

namespace CaterProject01
{
    /// <summary>
    /// Code behind
    /// <author>Daniel Cater</author>
    /// </summary>
    public partial class ContactList : System.Web.UI.Page
    {
        /// <summary>
        /// Handles the Load event of the Page control.
        /// </summary>
        /// <param name="sender">The source of the event.</param>
        /// <param name="e">The <see cref="EventArgs"/> instance containing the event data.</param>
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                return;
            }

            this.populateListView();
        }

        /// <summary>
        /// Populates the ListView.
        /// </summary>
        private void populateListView()
        {
            ClientList clientList = ClientList.GetClients();
            List<ListItem> clientListBoxItems = new List<ListItem>();

            foreach (Client currentClient in clientList.Clients)
            {
                clientListBoxItems.Add(new ListItem(currentClient.ViewOutput(), Convert.ToString(currentClient.ID)));
            }

            this.lbxContactList.Items.AddRange(clientListBoxItems.ToArray());
            Session["ClientListBoxItems"] = clientListBoxItems;
        }

        /// <summary>
        /// Handles the Click event of the btnRemoveClient control.
        /// </summary>
        /// <param name="sender">The source of the event.</param>
        /// <param name="e">The <see cref="EventArgs"/> instance containing the event data.</param>
        protected void btnRemoveClient_Click(object sender, EventArgs e)
        {
            ClientList clients = (ClientList) Session["ClientList"];
            Client selectedClient = clients.Clients.Find(client => client.ID == Convert.ToInt32(this.lbxContactList.SelectedValue));

            clients.Clients.Remove(selectedClient);

            List<ListItem> clientListBoxItems = (List<ListItem>) Session["ClientListBoxItems"];

            clientListBoxItems.Remove(this.lbxContactList.SelectedItem);
            
            this.lbxContactList.Items.Clear();
            this.lbxContactList.Items.AddRange(clientListBoxItems.ToArray());
        }

        /// <summary>
        /// Handles the Click event of the btnClearList control.
        /// </summary>
        /// <param name="sender">The source of the event.</param>
        /// <param name="e">The <see cref="EventArgs"/> instance containing the event data.</param>
        protected void btnClearList_Click(object sender, EventArgs e)
        {
            ((List<ListItem>)Session["ClientListBoxItems"]).Clear();
            this.lbxContactList.Items.Clear();
        }
    }
}