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
    /// Client Feedback Code behind
    /// <author>Daniel Cater</author>
    /// </summary>
    public partial class ClientFeedback : System.Web.UI.Page
    {
        /// <summary>
        /// Handles the Load event of the Page control.
        /// </summary>
        /// <param name="sender">The source of the event.</param>
        /// <param name="e">The <see cref="EventArgs"/> instance containing the event data.</param>
        protected void Page_Load(object sender, EventArgs e)
        {
            this.disableControls();
            this.txtClientID.Focus();
        }

        /// <summary>
        /// Handles the click event of the btnSearch control.
        /// </summary>
        /// <param name="sender">The source of the event.</param>
        /// <param name="e">The <see cref="EventArgs"/> instance containing the event data.</param>
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

        /// <summary>
        /// Handles the OnClick event of the btnSubmit control.
        /// </summary>
        /// <param name="sender">The source of the event.</param>
        /// <param name="e">The <see cref="EventArgs"/> instance containing the event data.</param>
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

        /// <summary>
        /// Disables the controls.
        /// </summary>
        private void disableControls()
        {
            this.rblContact.Enabled = false;
            this.rblProblemResolution.Enabled = false;
            this.rblServiceTime.Enabled = false;
            this.rblTechnicalEfficiency.Enabled = false;
            this.rblContact.Enabled = false;

            this.txtComments.Enabled = false;
            this.cbxContact.Enabled = false;
            this.btnSubmit.Enabled = false;
        }

        /// <summary>
        /// Enables the controls.
        /// </summary>
        private void enableControls()
        {
            this.rblProblemResolution.Enabled = true;
            this.rblServiceTime.Enabled = true;
            this.rblTechnicalEfficiency.Enabled = true;
            this.rblContact.Enabled = true;

            this.txtComments.Enabled = true;
            this.cbxContact.Enabled = true;
            this.btnSubmit.Enabled = true;
        }

        /// <summary>
        /// Clears the form.
        /// </summary>
        private void clearForm()
        {
            this.rblTechnicalEfficiency.ClearSelection();
            this.rblContact.ClearSelection();
            this.rblProblemResolution.ClearSelection();
            this.rblServiceTime.ClearSelection();

            this.txtComments.Text = "";
            this.cbxContact.Checked = false;
        }

        /// <summary>
        /// Handles the OnSelectedIndexChanged event of the lbxIncidents control.
        /// </summary>
        /// <param name="sender">The source of the event.</param>
        /// <param name="e">The <see cref="EventArgs"/> instance containing the event data.</param>
        protected void lbxIncidents_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            this.clearForm();
            this.enableControls();
        }
    }
}