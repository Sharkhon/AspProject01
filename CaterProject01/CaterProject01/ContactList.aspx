<%@ Page Title="" Language="C#" MasterPageFile="~/Default.Master" AutoEventWireup="true" CodeBehind="ContactList.aspx.cs" Inherits="CaterProject01.ContactList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <form runat="server">
        <asp:ListBox ID="lbxContactList" runat="server" Width="494px"></asp:ListBox>
        
        <br/>
        <br/>
        
        <asp:Button ID="btnGoToClientView" runat="server" Text="Select Additional Clients" PostBackUrl="~/ClientViewer.aspx" />
        <asp:Button ID="btnRemoveClient" runat="server" Text="Remove Client" OnClick="btnRemoveClient_Click" />
        <asp:Button ID="btnClearList" runat="server" Text="Clear List" OnClick="btnClearList_Click" />
    </form>

</asp:Content>
