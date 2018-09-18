using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CaterProject01
{
    /// <summary>
    /// FeedbackComplete Code behind
    /// <author>Daniel Cater</author>
    /// </summary>
    public partial class FeedbackComplete : System.Web.UI.Page
    {
        /// <summary>
        /// Handles the Load event of the Page control.
        /// </summary>
        /// <param name="sender">The source of the event.</param>
        /// <param name="e">The <see cref="EventArgs"/> instance containing the event data.</param>
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