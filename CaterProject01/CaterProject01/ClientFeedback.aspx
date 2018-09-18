<%@ Page Title="" Language="C#" MasterPageFile="~/Default.Master" AutoEventWireup="true" CodeBehind="ClientFeedback.aspx.cs" Inherits="CaterProject01.ClientFeedback" ClientTarget="uplevel"%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <form runat="server">
        <label id="lblClientID">Client ID:</label>
        <asp:TextBox ID="txtClientID" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfvClientRequired" runat="server" ControlToValidate="txtClientID" Text="*" ValidationGroup="rfvSearchGroup"></asp:RequiredFieldValidator>
        <asp:Button ValidationGroup="rfvSearchGroup" ID="btnSearchButton" runat="server" Text="Search" OnClick="btnSearch_click" /><asp:SqlDataSource ID="sdsClientData" runat="server" ConnectionString="<%$ ConnectionStrings:ClientConnection %>" ProviderName="<%$ ConnectionStrings:ClientConnection.ProviderName %>" SelectCommand="SELECT * FROM [Incidents]"></asp:SqlDataSource>
        <asp:CompareValidator ID="cmpClientID" runat="server" ControlToValidate="txtClientID" ValidationGroup="rfvSearchGroup" Type="Integer" Operator="DataTypeCheck">Invalid Client ID</asp:CompareValidator>
        <br/>
        <asp:ListBox ID="lbxIncidents" OnSelectedIndexChanged="lbxIncidents_OnSelectedIndexChanged" runat="server" AutoPostBack="True"></asp:ListBox>
        <br/>

        <label>Service Time</label>
        <asp:RequiredFieldValidator ID="rfvServiceTime" runat="server" ControlToValidate="rblServiceTime">Pick a selection</asp:RequiredFieldValidator>
        <br/>
        <asp:RadioButtonList ID="rblServiceTime" runat="server">
            <asp:ListItem Value="1">Satisfied</asp:ListItem>
            <asp:ListItem Value="2">Neither Satisfied nor Dissatisfied</asp:ListItem>
            <asp:ListItem Value="3">Dissatisfied</asp:ListItem>
        </asp:RadioButtonList> <br/>
        <label>Technical Efficiency</label> <asp:RequiredFieldValidator ID="rfvTechnicalEfficiency" runat="server" ControlToValidate="rblTechnicalEfficiency">Pick a selection</asp:RequiredFieldValidator><br/>
        <asp:RadioButtonList Enabled="False" ID="rblTechnicalEfficiency" runat="server">
            <asp:ListItem Value="1">Satisfied</asp:ListItem>
            <asp:ListItem Value="2">Neither Satisfied nor Dissatisfied</asp:ListItem>
            <asp:ListItem Value="3">Dissatisfied</asp:ListItem>
        </asp:RadioButtonList><br/>
        
        <label>Problem Resolution</label> <asp:RequiredFieldValidator ID="rfvProblemResolution" runat="server" ControlToValidate="rblProblemResolution">Pick a selection</asp:RequiredFieldValidator> <br/>
        <asp:RadioButtonList ID="rblProblemResolution" runat="server">
            <asp:ListItem Value="1">Satisfied</asp:ListItem>
            <asp:ListItem Value="2">Neither Satisfied nor Dissatisfied</asp:ListItem>
            <asp:ListItem Value="3">Dissatisfied</asp:ListItem>
        </asp:RadioButtonList>
        <br />
        <br />
        <br/>
        <label>Additional Comments</label>
        <br/>
        <asp:TextBox ID="txtComments" Rows="3" runat="server"></asp:TextBox>
        

        <br />
        <br />
        <asp:CheckBox ID="cbxContact" Text="Be contacted?" runat="server"/>   
        <br />
        <br />
        <label>Form of Contact</label><asp:RequiredFieldValidator ID="rfvContact" runat="server" ControlToValidate="rblContact">Pick a selection</asp:RequiredFieldValidator>
        <br />
        <br />
        <asp:RadioButtonList Enabled="False" ID="rblContact" runat="server">
            <asp:ListItem Value="Phone">Phone</asp:ListItem>
            <asp:ListItem Value="Email">Email</asp:ListItem>
        </asp:RadioButtonList>
        <br />
        <asp:Button ID="btnSubmit" runat="server" OnClick="btnSubmit_OnClick" Text="Submit" />
    </form>

</asp:Content>
