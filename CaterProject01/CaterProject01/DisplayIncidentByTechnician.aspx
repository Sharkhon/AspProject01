<%@ Page Title="" Language="C#" MasterPageFile="~/Default.Master" AutoEventWireup="true" CodeBehind="DisplayIncidentByTechnician.aspx.cs" Inherits="CaterProject01.DisplayIncidentByTechnician" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <asp:DropDownList ID="ddlTechnician" runat="server" AutoPostBack="True" ItemType="CaterProject01.Technician" DataTextField="Name" DataValueField="ID" DataSourceID="obsTechnicians"></asp:DropDownList>

    <asp:ObjectDataSource ID="obsTechnicians" runat="server" SelectMethod="GetTechnicians" TypeName="CaterProject01.TechnicianDatabase"></asp:ObjectDataSource>

    <asp:GridView ID="gvIncident" runat="server" DataSourceID="odsIncident">
        <Columns>
            <asp:CommandField ShowSelectButton="True"></asp:CommandField>
        </Columns>
    </asp:GridView>

    <asp:ObjectDataSource ID="odsIncident" runat="server" SelectMethod="GetOpenTechnicianIncidents" TypeName="CaterProject01.IncidentDatabase">
        <SelectParameters>
            <asp:ControlParameter ControlID="ddlTechnician" PropertyName="SelectedValue" Name="technicianID" Type="Int32"></asp:ControlParameter>
        </SelectParameters>
    </asp:ObjectDataSource>

</asp:Content>
