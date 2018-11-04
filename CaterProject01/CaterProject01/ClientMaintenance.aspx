<%@ Page Title="" Language="C#" MasterPageFile="~/Default.Master" AutoEventWireup="true" CodeBehind="ClientMaintenance.aspx.cs" Inherits="CaterProject01.ClientMaintenance" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:GridView CssClass="clientMaintenanceView" ID="gvClients" runat="server" AutoGenerateColumns="False" DataKeyNames="ClientID" DataSourceID="sdsClients" AllowPaging="True" AllowSorting="True" OnSelectedIndexChanged="gvClients_SelectedIndexChanged">
        <Columns>
            <asp:TemplateField HeaderText="Name" SortExpression="Name">
                <EditItemTemplate>
                    <asp:TextBox runat="server" Text='<%# Bind("Name") %>' ID="TextBox1"></asp:TextBox>


                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label runat="server" Text='<%# Bind("Name") %>' ID="Label2"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="City" SortExpression="City">
                <EditItemTemplate>
                    <asp:TextBox runat="server" Text='<%# Bind("City") %>' ID="TextBox3"></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label runat="server" Text='<%# Bind("City") %>' ID="Label4"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="State" SortExpression="State">
                <EditItemTemplate>
                    <asp:TextBox runat="server" Text='<%# Bind("State") %>' ID="TextBox4"></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label runat="server" Text='<%# Bind("State") %>' ID="Label5"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>

            <asp:CommandField ShowDeleteButton="True" ShowSelectButton="True"></asp:CommandField>

        </Columns>
        <PagerStyle CssClass="pager"></PagerStyle>
    </asp:GridView>
    
    <br/>
    <br/>
    <br/>

    <asp:SqlDataSource ID="sdsClients" runat="server" 
                       ConnectionString='<%$ ConnectionStrings:AthManConnectionString %>' 
                       DeleteCommand="DELETE FROM [Clients] WHERE [ClientID] = ?" 
                       InsertCommand="INSERT INTO [Clients] ([ClientID], [Name], [Address], [City], [State], [ZipCode], [Phone], [Email]) VALUES (?, ?, ?, ?, ?, ?, ?, ?)" 
                       ProviderName='<%$ ConnectionStrings:AthManConnectionString.ProviderName %>' SelectCommand="SELECT * FROM [Clients] ORDER BY [Name], [City], [State]" 
                       UpdateCommand="UPDATE [Clients] SET [Name] = ?, [Address] = ?, [City] = ?, [State] = ?, [ZipCode] = ?, [Phone] = ?, [Email] = ? WHERE [ClientID] = ?">
        <DeleteParameters>
            <asp:Parameter Name="ClientID" Type="Int32"></asp:Parameter>
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="ClientID" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="Name" Type="String"></asp:Parameter>
            <asp:Parameter Name="Address" Type="String"></asp:Parameter>
            <asp:Parameter Name="City" Type="String"></asp:Parameter>
            <asp:Parameter Name="State" Type="String"></asp:Parameter>
            <asp:Parameter Name="ZipCode" Type="String"></asp:Parameter>
            <asp:Parameter Name="Phone" Type="String"></asp:Parameter>
            <asp:Parameter Name="Email" Type="String"></asp:Parameter>
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Name" Type="String"></asp:Parameter>
            <asp:Parameter Name="Address" Type="String"></asp:Parameter>
            <asp:Parameter Name="City" Type="String"></asp:Parameter>
            <asp:Parameter Name="State" Type="String"></asp:Parameter>
            <asp:Parameter Name="ZipCode" Type="String"></asp:Parameter>
            <asp:Parameter Name="Phone" Type="String"></asp:Parameter>
            <asp:Parameter Name="Email" Type="String"></asp:Parameter>
            <asp:Parameter Name="ClientID" Type="Int32"></asp:Parameter>
        </UpdateParameters>
    </asp:SqlDataSource>
    <div class="create-block">
    <asp:DetailsView ID="dvClientSelection" runat="server" Height="50px" Width="125px" AutoGenerateRows="False" DataKeyNames="ClientID" DataSourceID="sdsClientDetails" DefaultMode="Insert" OnItemInserted="dvClientSelection_ItemInserted">
        <Fields>
            <asp:BoundField DataField="ClientID" HeaderText="ClientID" ReadOnly="True" InsertVisible="False" SortExpression="ClientID"></asp:BoundField>
            <asp:TemplateField HeaderText="Name" SortExpression="Name">
                <EditItemTemplate>
                    <asp:TextBox runat="server" CausesValidation="True" Text='<%# Bind("Name") %>' ID="txtEditName"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvEditName" runat="server" ErrorMessage="Name is required" CssClass="error" Text="*" ControlToValidate="txtEditName"></asp:RequiredFieldValidator>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox runat="server" CausesValidation="True" Text='<%# Bind("Name") %>' ID="txtInsertName"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvInsertName" runat="server" ErrorMessage="Name is required" CssClass="error" Text="*" ControlToValidate="txtInsertName"></asp:RequiredFieldValidator>
                </InsertItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Address" SortExpression="Address">
                <EditItemTemplate>
                    <asp:TextBox runat="server" CausesValidation="True" Text='<%# Bind("Address") %>' ID="txtEditAddress"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvEditAddress" runat="server" ErrorMessage="Address is required" CssClass="error" Text="*" ControlToValidate="txtEditAddress"></asp:RequiredFieldValidator>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox runat="server" CausesValidation="True" Text='<%# Bind("Address") %>' ID="txtInsertAddress"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvInsertAddress" runat="server" ErrorMessage="Address is required" CssClass="error" Text="*" ControlToValidate="txtInsertAddress"></asp:RequiredFieldValidator>
                </InsertItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="City" SortExpression="City">
                <EditItemTemplate>
                    <asp:TextBox runat="server" CausesValidation="True" Text='<%# Bind("City") %>' ID="txtEditCity"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvEditCity" runat="server" ErrorMessage="City is required" CssClass="error" Text="*" ControlToValidate="txtEditCity"></asp:RequiredFieldValidator>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox runat="server" CausesValidation="True" Text='<%# Bind("City") %>' ID="txtInsertCity"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvInsertCity" runat="server" ErrorMessage="City is required" CssClass="error" Text="*" ControlToValidate="txtInsertCity"></asp:RequiredFieldValidator>
                </InsertItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="State" SortExpression="State">
                <EditItemTemplate>
                    <asp:TextBox runat="server" CausesValidation="True" Text='<%# Bind("State") %>' MaxLength="2" ID="txtEditState"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvEditState" runat="server" ErrorMessage="State is required" CssClass="error" Text="*" ControlToValidate="txtEditState"></asp:RequiredFieldValidator>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox runat="server" CausesValidation="True" Text='<%# Bind("State") %>' MaxLength="2" ID="txtInsertState"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvInsertState" runat="server" ErrorMessage="State is required" CssClass="error" Text="*" ControlToValidate="txtInsertState"></asp:RequiredFieldValidator>
                </InsertItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="ZipCode" SortExpression="ZipCode">
                <EditItemTemplate>
                    <asp:TextBox runat="server" CausesValidation="True" Text='<%# Bind("ZipCode") %>' MaxLength="6" ID="txtEditZip"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvEditZip" runat="server" ErrorMessage="Zip is required" CssClass="error" Text="*" ControlToValidate="txtEditZip"></asp:RequiredFieldValidator>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox runat="server" CausesValidation="True" Text='<%# Bind("ZipCode") %>' MaxLength="6" ID="txtInsertZip"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvInsertZip" runat="server" ErrorMessage="Zip is required" CssClass="error" Text="*" ControlToValidate="txtInsertZip"></asp:RequiredFieldValidator>
                </InsertItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Phone" SortExpression="Phone">
                <EditItemTemplate>
                    <asp:TextBox runat="server" CausesValidation="True" Text='<%# Bind("Phone") %>' ID="txtEditPhone"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="revEditPhone" runat="server" ValidationExpression="[0-9]{3}-[0-9]{3}-[0-9]{4}" ErrorMessage="Phone number format: 111-111-1234" CssClass="error" ControlToValidate="txtEditPhone" Text="111-111-1234"></asp:RegularExpressionValidator>
                    <asp:RequiredFieldValidator ID="rfvEditPhone" runat="server" ErrorMessage="Phone number is required" CssClass="error" Text="*" ControlToValidate="txtEditPhone"></asp:RequiredFieldValidator>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox runat="server" CausesValidation="True" Text='<%# Bind("Phone") %>' ID="txtInsertPhone"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="revInsertPhone" runat="server" ValidationExpression="[0-9]{3}-[0-9]{3}-[0-9]{4}" ErrorMessage="Phone number format: 111-111-1234" CssClass="error" ControlToValidate="txtInsertPhone" Text="111-111-1234"></asp:RegularExpressionValidator>
                    <asp:RequiredFieldValidator ID="rfvInsertPhone" runat="server" ErrorMessage="Phone number is required" CssClass="error" Text="*" ControlToValidate="txtInsertPhone"></asp:RequiredFieldValidator>
                </InsertItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Email" SortExpression="Email">
                <EditItemTemplate>
                    <asp:TextBox runat="server" CausesValidation="True" Text='<%# Bind("Email") %>' ID="txtEditEmail"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="revEditEmail" runat="server" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ErrorMessage="Must be a valid email" ControlToValidate="txtEditEmail" CssClass="error" Text="Invalid email"></asp:RegularExpressionValidator>
                    <asp:RequiredFieldValidator ID="rfvEditEmail" runat="server" ErrorMessage="Email is required" CssClass="error" Text="*" ControlToValidate="txtEditEmail"></asp:RequiredFieldValidator>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox runat="server" CausesValidation="True" Text='<%# Bind("Email") %>' ID="txtInsertEmail"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="revEditPhone" runat="server" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ErrorMessage="Must be a valid email" ControlToValidate="txtInsertEmail" CssClass="error" Text="Invalid email"></asp:RegularExpressionValidator>
                    <asp:RequiredFieldValidator ID="rfvInsertEmail" runat="server" ErrorMessage="Email is required" CssClass="error" Text="*" ControlToValidate="txtInsertEmail"></asp:RequiredFieldValidator>
                </InsertItemTemplate>
            </asp:TemplateField>

            <asp:CommandField ShowInsertButton="True" ShowEditButton="True"></asp:CommandField>
        </Fields>
    </asp:DetailsView>
    </div>
    <asp:SqlDataSource ID="sdsClientDetails" runat="server" 
                    ConnectionString='<%$ ConnectionStrings:AthManConnectionString %>' 
                       ProviderName='<%$ ConnectionStrings:AthManConnectionString.ProviderName %>' 
                       SelectCommand="SELECT * FROM [Clients] WHERE ([ClientID] = ?)" 
                       DeleteCommand="DELETE FROM [Clients] WHERE [ClientID] = ?" 
                       InsertCommand="INSERT INTO [Clients] ([Name], [Address], [City], [State], [ZipCode], [Phone], [Email]) VALUES (?, ?, ?, ?, ?, ?, ?)" UpdateCommand="UPDATE [Clients] SET [Name] = ?, [Address] = ?, [City] = ?, [State] = ?, [ZipCode] = ?, [Phone] = ?, [Email] = ? WHERE [ClientID] = ?">
        <DeleteParameters>
            <asp:Parameter Name="ClientID" Type="Int32"></asp:Parameter>
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Name" Type="String"></asp:Parameter>
            <asp:Parameter Name="Address" Type="String"></asp:Parameter>
            <asp:Parameter Name="City" Type="String"></asp:Parameter>
            <asp:Parameter Name="State" Type="String"></asp:Parameter>
            <asp:Parameter Name="ZipCode" Type="String"></asp:Parameter>
            <asp:Parameter Name="Phone" Type="String"></asp:Parameter>
            <asp:Parameter Name="Email" Type="String"></asp:Parameter>
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="gvClients" PropertyName="SelectedValue" Name="ClientID" Type="Int32"></asp:ControlParameter>
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="Name" Type="String"></asp:Parameter>
            <asp:Parameter Name="Address" Type="String"></asp:Parameter>
            <asp:Parameter Name="City" Type="String"></asp:Parameter>
            <asp:Parameter Name="State" Type="String"></asp:Parameter>
            <asp:Parameter Name="ZipCode" Type="String"></asp:Parameter>
            <asp:Parameter Name="Phone" Type="String"></asp:Parameter>
            <asp:Parameter Name="Email" Type="String"></asp:Parameter>
            <asp:Parameter Name="ClientID" Type="Int32"></asp:Parameter>
        </UpdateParameters>
    </asp:SqlDataSource>
    
    <br/>
    <br/>
    <br/>

    <asp:SqlDataSource ID="sdsStates" runat="server" ConnectionString='<%$ ConnectionStrings:AthManConnectionString %>' ProviderName='<%$ ConnectionStrings:AthManConnectionString.ProviderName %>' SelectCommand="SELECT [StateCode], [StateName] FROM [States]"></asp:SqlDataSource>

</asp:Content>
