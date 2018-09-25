<%@ Page Title="" Language="C#" MasterPageFile="~/Default.Master" AutoEventWireup="true" CodeBehind="ContactUs.aspx.cs" Inherits="CaterProject01.ContactUs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="interior">
        <h2>Contact Us</h2>
        <h3>Hours of operation are 9‐5 Monday through Friday</h3>
        
        <label>Call us here: 8-The-AthMan</label><br/>
        <label>Email us here: <asp:HyperLink  runat="server" Text="info@athman.com" NavigateUrl="mailto:info@athman.com" /></label><br/>
        <label>Mail us here: 1601 Maple St, Carrollton, GA 30118</label>
    </div>
</asp:Content>
