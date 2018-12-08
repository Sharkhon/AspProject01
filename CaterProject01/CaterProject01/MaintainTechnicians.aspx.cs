using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CaterProject01
{
    public partial class MaintainTechnicians : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void dvTechnicians_OnItemInserted(object sender, DetailsViewInsertedEventArgs e)
        {
            this.ddlTechnicians.DataBind();
        }

        protected void dvTechnicians_OnItemUpdated(object sender, DetailsViewUpdatedEventArgs e)
        {
            this.ddlTechnicians.DataBind();
        }

        protected void dvTechnicians_OnItemDeleted(object sender, DetailsViewDeletedEventArgs e)
        {
            this.ddlTechnicians.DataBind();
        }
    }
}