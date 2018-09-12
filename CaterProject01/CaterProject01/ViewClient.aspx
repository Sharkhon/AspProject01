﻿<%@ Page AutoEventWireup="true" CodeBehind="ViewClient.aspx.cs" Inherits="CaterProject01.ViewClient" Language="C#" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>AthMan&copy; Client Viewer</title>
    <link rel="stylesheet" href="style/style.css"/>
</head>
<body>

    <header>
        <h1>AthMan</h1>
        <h2>"Helping to Manage the World's Athletes"</h2>
    </header>

    <form id="ClientViewForm" runat="server">
        <div>
            <asp:DropDownList ID="ddlClients" runat="server" DataSourceID="sdsAthManClientData" DataTextField="Name" DataValueField="ClientID"></asp:DropDownList>
            <asp:SqlDataSource ID="sdsAthManClientData" runat="server" ConnectionString="<%$ ConnectionStrings:AthManConnectionString %>" ProviderName="<%$ ConnectionStrings:AthManConnectionString.ProviderName %>" SelectCommand="SELECT * FROM [Clients]"></asp:SqlDataSource>
            
            <div class="left">
                <label>Name:</label>
                <asp:Label ID="lblClientName" runat="server"></asp:Label>
                <br />

                <label>Phone:</label>
                <asp:Label ID="lblPhone" runat="server"></asp:Label>
                
                <br />

                <label>Email:</label>
                <asp:Label ID="lblEmail" runat="server"></asp:Label>
            </div>
            
            <div class="right">
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
            </div>
        </div>
    </form>
</body>
</html>
