<%@ Page Title="" Language="C#" MasterPageFile="~/Default.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="CaterProject01.Default1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
        <h1>Welcome</h1>
        <asp:Button ID="btnGotoClientViewer" runat="server" Text="Client View" PostBackUrl="~/ClientViewer.aspx" />
        <asp:Button ID="btnGotoClientFeedback" runat="server" Text="Client Feedback" PostBackUrl="~/ClientFeedback.aspx" />
        <br/>
    </form>
</asp:Content>
