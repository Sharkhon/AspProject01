using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CaterProject01
{
    public partial class FeedbackComplete : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["FeedbackComplete"] == null)
            {
                this.lblContact.Visible = false;
                return;
            }

            this.lblContact.Visible = (bool) Session["FeedbackComplete"];
        }
    }
}