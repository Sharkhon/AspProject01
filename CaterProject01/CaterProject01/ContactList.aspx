<%@ Page Title="" Language="C#" MasterPageFile="~/Default.Master" AutoEventWireup="true" CodeBehind="ContactList.aspx.cs" Inherits="CaterProject01.ContactList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Ath Man : Contact List</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <div class="interior">
        <asp:ListBox ID="lbxContactList" runat="server" Width="494px"></asp:ListBox>
        
        <br/>
        <br/>
        
        <asp:Button CssClass="button" ID="btnGoToClientView" runat="server" Text="Select Additional Clients" PostBackUrl="~/ClientViewer.aspx" />
        <asp:Button CssClass="button" ID="btnRemoveClient" runat="server" Text="Remove Client" OnClick="btnRemoveClient_Click" />
        <asp:Button CssClass="button" ID="btnClearList" runat="server" Text="Clear List" OnClick="btnClearList_Click" />
        <br/>
        <br/>
        <asp:Label runat="server" ID="lblError" CssClass="error"></asp:Label>
    </div>

</asp:Content>
