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
    public partial class ClientFeedback : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.disableControls();
            this.txtClientID.Focus();
        }

        protected void btnSearch_click(object sender, EventArgs e)
        {
            DataView data = (DataView)this.sdsClientData.Select(DataSourceSelectArguments.Empty);

            data.RowFilter = $"ClientID = {this.txtClientID.Text} AND DateClosed IS NOT NULL";

            List<Incident> incidents = new List<Incident>();

            foreach (DataRow row in data.ToTable().Rows)
            {
                Incident currentIncident = new Incident()
                {
                    ClientID = Convert.ToInt32(row["ClientID"]),
                    IncidentID = Convert.ToInt32(row["IncidentID"]),
                    ProductID = Convert.ToString(row["ProductID"]),
                    TechID = Convert.ToInt32(row["TechID"]),
                    Title = Convert.ToString(row["Title"]),
                    Description = Convert.ToString(row["Description"]),
                    DateOpen = Convert.ToDateTime(row["DateOpened"]),
                    DateClosed = Convert.ToDateTime(row["DateClosed"])
                };

                incidents.Add(currentIncident);
            }

            incidents = incidents.OrderBy(incident => incident.DateClosed).ToList();

            List<ListItem> incidentListItems = new List<ListItem>();

            foreach (Incident incident in incidents)
            {
                incidentListItems.Add(new ListItem(incident.FormatIncident(), Convert.ToString(incident.IncidentID)));
            }

            this.lbxIncidents.Items.Clear();
            this.lbxIncidents.Items.AddRange(incidentListItems.ToArray());

            this.disableControls();
            this.clearForm();

            Session["CurrentClientIncidents"] = this.txtClientID.Text;
        }

        protected void btnSubmit_OnClick(object sender, EventArgs e)
        {
            Feedback feedback = new Feedback()
            {
                ClientID = Convert.ToInt32(this.txtClientID.Text),
                Comments = this.txtComments.Text,
                IncidentID = Convert.ToInt32(this.lbxIncidents.SelectedValue),
                Contact = this.cbxContact.Checked,
                ContactMethod = this.rblContact.SelectedValue,
                Efficiency = Convert.ToInt32(this.rblTechnicalEfficiency.SelectedValue),
                Resolution = Convert.ToInt32(this.rblProblemResolution.SelectedValue),
                ServiceTime = Convert.ToInt32(this.rblServiceTime.SelectedValue)
            };

            Session["FeedbackComplete"] = true;
        }

        private void disableControls()
        {
            this.rblContact.Enabled = false;
            this.rblProblemResolution.Enabled = false;
            this.rblServiceTime.Enabled = false;
            this.rblTechnicalEfficiency.Enabled = false;

            this.txtComments.Enabled = false;
            this.cbxContact.Enabled = false;
            this.btnSubmit.Enabled = false;
        }

        private void enableControls()
        {
            this.rblProblemResolution.Enabled = true;
            this.rblServiceTime.Enabled = true;
            this.rblTechnicalEfficiency.Enabled = true;

            this.txtComments.Enabled = true;
            this.cbxContact.Enabled = true;
            this.btnSubmit.Enabled = true;
        }

        private void clearForm()
        {
            this.rblTechnicalEfficiency.ClearSelection();
            this.rblContact.ClearSelection();
            this.rblProblemResolution.ClearSelection();
            this.rblServiceTime.ClearSelection();

            this.txtComments.Text = "";
            this.cbxContact.Checked = false;
        }

        protected void lbxIncidents_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            this.clearForm();
            this.enableControls();
        }
    }
}