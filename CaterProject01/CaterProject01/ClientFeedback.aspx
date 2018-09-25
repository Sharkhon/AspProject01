<%@ Page Title="" Language="C#" MasterPageFile="~/Default.Master" AutoEventWireup="true" CodeBehind="ClientFeedback.aspx.cs" Inherits="CaterProject01.ClientFeedback" ClientTarget="uplevel"%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Ath Man : Client Feedback</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <form runat="server">
        <div class="interior">
            <label id="lblClientID">Client ID:</label>
            <asp:TextBox ID="txtClientID" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator CssClass="validation" ID="rfvClientRequired" runat="server" ControlToValidate="txtClientID" Text="*" ValidationGroup="rfvSearchGroup"></asp:RequiredFieldValidator>
            <asp:Button CssClass="button" ValidationGroup="rfvSearchGroup" ID="btnSearchButton" runat="server" Text="Search" OnClick="btnSearch_click" /><asp:SqlDataSource ID="sdsClientData" runat="server" ConnectionString="<%$ ConnectionStrings:ClientConnection %>" ProviderName="<%$ ConnectionStrings:ClientConnection.ProviderName %>" SelectCommand="SELECT * FROM [Incidents]"></asp:SqlDataSource>
            <asp:CompareValidator CssClass="validation" ID="cmpClientID" runat="server" ControlToValidate="txtClientID" ValidationGroup="rfvSearchGroup" Type="Integer" Operator="DataTypeCheck">Invalid Client ID</asp:CompareValidator>
            <br/>
            <br />
            <asp:ListBox ID="lbxIncidents" OnSelectedIndexChanged="lbxIncidents_OnSelectedIndexChanged" runat="server" AutoPostBack="True" Width="455px"></asp:ListBox>
            <br />
            <br/>

            <label>Service Time</label>
            <asp:RequiredFieldValidator CssClass="validation" ID="rfvServiceTime" runat="server" ControlToValidate="rblServiceTime">Pick a selection</asp:RequiredFieldValidator>
            <br/>
            <asp:RadioButtonList ID="rblServiceTime" runat="server">
                <asp:ListItem Value="1">Satisfied</asp:ListItem>
                <asp:ListItem Value="2">Neither Satisfied nor Dissatisfied</asp:ListItem>
                <asp:ListItem Value="3">Dissatisfied</asp:ListItem>
            </asp:RadioButtonList> <br/>
            <label>Technical Efficiency</label> <asp:RequiredFieldValidator CssClass="validation" ID="rfvTechnicalEfficiency" runat="server" ControlToValidate="rblTechnicalEfficiency">Pick a selection</asp:RequiredFieldValidator><br/>
            <asp:RadioButtonList Enabled="False" ID="rblTechnicalEfficiency" runat="server">
                <asp:ListItem Value="1">Satisfied</asp:ListItem>
                <asp:ListItem Value="2">Neither Satisfied nor Dissatisfied</asp:ListItem>
                <asp:ListItem Value="3">Dissatisfied</asp:ListItem>
            </asp:RadioButtonList><br/>
            
            <label>Problem Resolution</label> <asp:RequiredFieldValidator CssClass="validation" ID="rfvProblemResolution" runat="server" ControlToValidate="rblProblemResolution">Pick a selection</asp:RequiredFieldValidator> <br/>
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
            <asp:CheckBox OnCheckedChanged="cbxContact_OnCheckedChanged" ID="cbxContact" Text="Be contacted?" runat="server" AutoPostBack="True"/>   
            <br />
            <br />
            <label>Form of Contact</label><asp:RequiredFieldValidator Enabled="False" CssClass="validation" ID="rfvContact" runat="server" ControlToValidate="rblContact">Pick a selection</asp:RequiredFieldValidator>
            <br />
            <br />
            <asp:RadioButtonList Enabled="False" ID="rblContact" runat="server">
                
                <asp:ListItem Value="Phone">Phone</asp:ListItem>
                <asp:ListItem Value="Email">Email</asp:ListItem>
            </asp:RadioButtonList>
            <br />
            <asp:Button CssClass="button" ID="btnSubmit" runat="server" OnClick="btnSubmit_OnClick" Text="Submit" PostBackUrl="~/FeedbackComplete.aspx" />
        </div>
    </form>

</asp:Content>
