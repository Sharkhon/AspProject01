<%@ Page Title="" Language="C#" MasterPageFile="~/Default.Master" AutoEventWireup="true" CodeBehind="IncidentDisplay.aspx.cs" Inherits="CaterProject01.IncidentDisplay" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <asp:DropDownList ID="ddlClient" OnDataBound="ddlClient_OnDataBound" runat="server" AutoPostBack="True" DataSourceID="sdsClient" DataTextField="Name" OnSelectedIndexChanged="ddlClient_OnSelectedIndexChanged" DataValueField="ClientID"></asp:DropDownList>
    <asp:SqlDataSource ID="sdsClient" runat="server" ConnectionString='<%$ ConnectionStrings:ClientConnection %>' ProviderName='<%$ ConnectionStrings:ClientConnection.ProviderName %>' SelectCommand="SELECT [ClientID], [Name] FROM [Clients]"></asp:SqlDataSource>
    
    <br/>
    <br/>

    <asp:DataList CssClass="incidentsTable" ID="dlIncident" runat="server">
        <ItemStyle BackColor="white"></ItemStyle>
        <AlternatingItemStyle BackColor="#649DE8"></AlternatingItemStyle>

        <HeaderTemplate>
            <table>
                <tr>
                    <th>Product / Incident</th>
                    <th>Technician Name</th>
                    <th>Date Opened</th>
                    <th>Date Closed</th>
                </tr>
            </table>
        </HeaderTemplate>
        <ItemTemplate>
            <table style="width: 100%;">
                <tbody>
                    <tr>
                        <td><%# Eval("ProductName") %></td>
                        <td><%# Eval("TechnicianName") %></td>
                        <td><%# Eval("DateOpened") %></td>
                        <td><%# Eval("DateClosed") %></td>
                    </tr>
                
                    <tr>
                        <td colspan="4"><%# Eval("Description") %></td>
                    </tr>
                </tbody>
            </table>
        </ItemTemplate>
        <AlternatingItemTemplate>
            <table>
                <tbody>
                <tr>
                    <td><%# Eval("ProductName") %></td>
                    <td><%# Eval("TechnicianName") %></td>
                    <td><%# Eval("DateOpened") %></td>
                    <td><%# Eval("DateClosed") %></td>
                </tr>
                
                <tr>
                    <td colspan="4"><%# Eval("Description") %></td>
                </tr>
                </tbody>
            </table>
        </AlternatingItemTemplate>
    </asp:DataList>
</asp:Content>
