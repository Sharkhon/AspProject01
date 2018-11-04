using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CaterProject01
{
    public partial class ClientMaintenance : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void gvClients_SelectedIndexChanged(object sender, EventArgs e)
        {
            this.dvClientSelection.ChangeMode(DetailsViewMode.Edit);
        }

        protected void dvClientSelection_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
        {
            this.gvClients.DataBind();
        }
    }
}