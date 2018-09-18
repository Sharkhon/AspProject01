using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CaterProject01.Model;

namespace CaterProject01
{
    /// <summary>
    /// Client Viewer Code behind
    /// <author>Daniel Cater</author>
    /// </summary>
    public partial class ClientViewer : System.Web.UI.Page
    {
        /// <summary>
        /// Handles the Load event of the Page control.
        /// </summary>
        /// <param name="sender">The source of the event.</param>
        /// <param name="e">The <see cref="EventArgs"/> instance containing the event data.</param>
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        /// <summary>
        /// Handles the SelectedIndexChanged event of the ddlClients control.
        /// </summary>
        /// <param name="sender">The source of the event.</param>
        /// <param name="e">The <see cref="EventArgs"/> instance containing the event data.</param>
        protected void ddlClients_SelectedIndexChanged(object sender, EventArgs e)
        {
            DataView data = (DataView) this.sdsAthManClientData.Select(DataSourceSelectArguments.Empty);

            data.RowFilter = $"ClientID = '{this.ddlClients.SelectedValue}'";

            if (data.Count == 0)
            {
                return;
            }

            DataRowView row = data[0];

            Client currentClient = new Client()
            {
                ID = Convert.ToInt32(row["ClientID"] as string),
                Address = row["Address"].ToString(),
                City = row["City"].ToString(),
                State = row["State"].ToString(),
                Zip = row["ZipCode"].ToString(),
                PhoneNumber = row["Phone"].ToString(),
                Email = row["Email"].ToString(),
                Name = row["Name"].ToString()
            };

            Session["CurrentClient"] = currentClient;

            this.updateClientView(currentClient);

        }

        /// <summary>
        /// Updates the client view.
        /// </summary>
        /// <param name="client">The client.</param>
        private void updateClientView(Client client)
        {
            this.lblClientName.Text = client.Name;
            this.lblAddress.Text = client.Address;
            this.lblCity.Text = client.City;
            this.lblEmail.Text = client.Email;
            this.lblPhone.Text = client.PhoneNumber;
            this.lblState.Text = client.State;
            this.lblZip.Text = client.Zip;
        }

        /// <summary>
        /// Handles the Click event of the btnAddToContactList control.
        /// </summary>
        /// <param name="sender">The source of the event.</param>
        /// <param name="e">The <see cref="EventArgs"/> instance containing the event data.</param>
        protected void btnAddToContactList_Click(object sender, EventArgs e)
        {
            ClientList.GetClients().AddItem((Client)Session["CurrentClient"]);
        }
    }
}