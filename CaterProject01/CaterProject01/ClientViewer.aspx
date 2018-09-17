<%@ Page Title="" Language="C#" MasterPageFile="~/Default.Master" AutoEventWireup="true" CodeBehind="ClientViewer.aspx.cs" Inherits="CaterProject01.ClientViewer" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <header>
        <h1>AthMan</h1>
        <h2>"Helping to Manage the World's Athletes"</h2>
    </header>

    <form id="ClientViewForm" runat="server">
        <asp:DropDownList ID="ddlClients" runat="server" DataSourceID="sdsAthManClientData" DataTextField="Name" DataValueField="ClientID" AutoPostBack="True" OnSelectedIndexChanged="ddlClients_SelectedIndexChanged"></asp:DropDownList>
        <asp:SqlDataSource ID="sdsAthManClientData" runat="server" ConnectionString="<%$ ConnectionStrings:AthManConnectionString %>" ProviderName="<%$ ConnectionStrings:AthManConnectionString.ProviderName %>" SelectCommand="SELECT * FROM [Clients]"></asp:SqlDataSource>
    
        <br/><br/>

        <label>Name:</label>
        <asp:Label ID="lblClientName" runat="server"></asp:Label>
        <br />

        <label>Phone:</label>
        <asp:Label ID="lblPhone" runat="server"></asp:Label>
    
        <br />

        <label>Email:</label>
        <asp:Label ID="lblEmail" runat="server"></asp:Label>
        
        <br/>

        <label>Address:</label>
        <asp:Label ID="lblAddress" runat="server"></asp:Label>
        <br />
    
        <label>City:</label>
        <asp:Label ID="lblCity" runat="server"></asp:Label>
        <br />

        <label>State:</label>
        <asp:Label ID="lblState" runat="server"></asp:Label>
        <br />

        <label>Zip:</label>
        <asp:Label ID="lblZip" runat="server"></asp:Label>
        <br />
        <br/>

        <asp:Button ID="btnAddToContactList" runat="server" Text="Add to Contact List" OnClick="btnAddToContactList_Click" />
        <asp:Button ID="btnViewContactList" runat="server" Text="Contact List" OnClick="btnViewContactList_Click" />
        
    </form>

</asp:Content>

