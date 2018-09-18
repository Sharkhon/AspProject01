<%@ Page Title="" Language="C#" MasterPageFile="~/Default.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="CaterProject01.Default1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Ath Man : Home</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
        <div class="interior">
            <h1>Welcome</h1>
            <h2>Please select one of the options below to navigate through the site.</h2>
            <asp:Button CssClass="MainButton" ID="btnGotoClientViewer" runat="server" Text="Client View" PostBackUrl="~/ClientViewer.aspx" />
            <asp:Button CssClass="MainButton" ID="btnGotoClientFeedback" runat="server" Text="Client Feedback" PostBackUrl="~/ClientFeedback.aspx" />
            <br/>
        </div>
    </form>
</asp:Content>
