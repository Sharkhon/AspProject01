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
    public partial class ClientViewer : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ddlClients_SelectedIndexChanged(object sender, EventArgs e)
        {
            DataView data = (DataView) this.sdsAthManClientData.Select(DataSourceSelectArguments.Empty);

            data.RowFilter = $"ClientID = '{this.ddlClients.SelectedValue}'";

            if (data.Count == 0)
            {
                return;
            }

            DataRowView row = data[0];

            this.updateClientView(new Client()
            {
                ID = Convert.ToInt32(row["ClientID"]),
                Address = row["Address"].ToString(),
                City = row["City"].ToString(),
                State = row["State"].ToString(),
                Zip = row["ZipCode"].ToString(),
                PhoneNumber = row["Phone"].ToString(),
                Email = row["Email"].ToString(),
                Name = row["Name"].ToString()
            });

        }

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
    }
}