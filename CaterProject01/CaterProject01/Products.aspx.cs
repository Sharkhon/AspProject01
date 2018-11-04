using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CaterProject01
{
    public partial class Products : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnCreateProduct_OnClick(object sender, EventArgs e)
        {
            throw new NotImplementedException();
        }

        protected void dvInsertProduct_OnItemInserted(object sender, DetailsViewInsertedEventArgs e)
        {
            if (e.Exception != null)
            {
                this.lblError.Text = "Could not create item";
            }
            else
            {
                this.lblError.Text = "";
            }
        }
    }
}