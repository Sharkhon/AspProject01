using CaterProject01.Model;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CaterProject01.App_Code;

namespace CaterProject01
{
    public partial class IncidentDisplay : System.Web.UI.Page
    {


        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                return;
            }
        }



        protected void ddlClient_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            this.updateIncidentList(Convert.ToInt32(this.ddlClient.SelectedValue));
        }

        private void updateIncidentList(int clientId)
        {
            DataTable data = IncidentDisplayDb.GetIncidents(clientId);

            this.dlIncident.DataSource = data;
            this.dlIncident.DataBind();
        }

        protected void ddlClient_OnDataBound(object sender, EventArgs e)
        {
            this.updateIncidentList(Convert.ToInt32(this.ddlClient.SelectedValue));
        }
    }
}