using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CaterProject01.Model;

namespace CaterProject01
{
    public partial class ContactList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                return;
            }

            this.populateListView();
        }

        private void populateListView()
        {
            ClientList clientList = ClientList.GetClients();
            List<ListItem> clientListItems = new List<ListItem>();

            foreach (Client currentClient in clientList.Clients)
            {
                clientListItems.Add(new ListItem(currentClient.ViewOutput(), Convert.ToString(currentClient.ID)));
            }

            this.lbxContactList.Items.AddRange(clientListItems.ToArray());
        }


    }
}