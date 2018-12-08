<%@ Page Title="" Language="C#" MasterPageFile="~/Default.Master" AutoEventWireup="true" CodeBehind="MaintainTechnicians.aspx.cs" Inherits="CaterProject01.MaintainTechnicians" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <div class="create-block">
        <h1>Technician Maintenance</h1>
        <hr/>

        <asp:dropdownlist runat="server" ID="ddlTechnicians" AutoPostBack="True" DataSourceID="sdsTechniciansSelector" DataTextField="Name" DataValueField="TechID"></asp:dropdownlist>
        
        <asp:sqldatasource ID="sdsTechniciansSelector" runat="server" ConnectionString="<%$ ConnectionStrings:AthManConnectionString %>" ProviderName="<%$ ConnectionStrings:AthManConnectionString.ProviderName %>" SelectCommand="SELECT [TechID], [Name] FROM [Technicians] ORDER BY [TechID]"></asp:sqldatasource>
        
        <br/>
        <br/>
        <br/>
    
        <asp:detailsview ID="dvTechnicians" OnItemInserted="dvTechnicians_OnItemInserted" OnItemUpdated="dvTechnicians_OnItemUpdated" OnItemDeleted="dvTechnicians_OnItemDeleted" runat="server" height="50px" width="125px" DataSourceID="sdsTechniciansViewer" DefaultMode="ReadOnly" AutoGenerateRows="False" DataKeyNames="TechID">
            <Fields>
                <asp:TemplateField HeaderText="TechID" InsertVisible="False" SortExpression="TechID">
                    <EditItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("TechID") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("TechID") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Name" SortExpression="Name">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtEditName" CausesValidation="True" runat="server" Text='<%# Bind("Name") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvEditName" runat="server" ErrorMessage="Name is required" CssClass="error" Text="*" ControlToValidate="txtEditName"></asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="txtInsertName" CausesValidation="True" runat="server" Text='<%# Bind("Name") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvInsertName" runat="server" ErrorMessage="Name is required" CssClass="error" Text="*" ControlToValidate="txtInsertName"></asp:RequiredFieldValidator>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("Name") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Email" SortExpression="Email">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtEditEmail" CausesValidation="True" runat="server" Text='<%# Bind("Email") %>'></asp:TextBox>
                        <asp:RegularExpressionValidator ID="revEditEmail" runat="server" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ErrorMessage="Must be a valid email" ControlToValidate="txtEditEmail" CssClass="error" Text="Invalid email"></asp:RegularExpressionValidator>
                        <asp:RequiredFieldValidator ID="rfvEditEmail" runat="server" ErrorMessage="Email is required" CssClass="error" Text="*" ControlToValidate="txtEditEmail"></asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="txtInsertEmail" CausesValidation="True" runat="server" Text='<%# Bind("Email") %>'></asp:TextBox>
                        <asp:RegularExpressionValidator ID="revInsertEmail" runat="server" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ErrorMessage="Must be a valid email" ControlToValidate="txtInsertEmail" CssClass="error" Text="Invalid email"></asp:RegularExpressionValidator>
                        <asp:RequiredFieldValidator ID="rfvInsertEmail" runat="server" ErrorMessage="Email is required" CssClass="error" Text="*" ControlToValidate="txtInsertEmail"></asp:RequiredFieldValidator>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("Email") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Phone" SortExpression="Phone">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtEditPhone" CausesValidation="True" runat="server" Text='<%# Bind("Phone") %>'></asp:TextBox>
                        <asp:RegularExpressionValidator ID="revEditPhone" runat="server" ValidationExpression="[0-9]{3}-[0-9]{3}-[0-9]{4}" ErrorMessage="Phone number format: 111-111-1234" CssClass="error" ControlToValidate="txtEditPhone" Text="111-111-1234"></asp:RegularExpressionValidator>
                        <asp:RequiredFieldValidator ID="rfvEditPhone" runat="server" ErrorMessage="Phone number is required" CssClass="error" Text="*" ControlToValidate="txtEditPhone"></asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="txtInsertPhone" CausesValidation="True" runat="server" Text='<%# Bind("Phone") %>'></asp:TextBox>
                        <asp:RegularExpressionValidator ID="revInsertPhone" runat="server" ValidationExpression="[0-9]{3}-[0-9]{3}-[0-9]{4}" ErrorMessage="Phone number format: 111-111-1234" CssClass="error" ControlToValidate="txtInsertPhone" Text="111-111-1234"></asp:RegularExpressionValidator>
                        <asp:RequiredFieldValidator ID="rfvInsertPhone" runat="server" ErrorMessage="Phone number is required" CssClass="error" Text="*" ControlToValidate="txtInsertPhone"></asp:RequiredFieldValidator>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("Phone") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowInsertButton="True" />
            </Fields>
        </asp:detailsview>
    </div>
    <asp:sqldatasource runat="server" ID="sdsTechniciansViewer" ConnectionString="<%$ ConnectionStrings:AthManConnectionString %>" ProviderName="<%$ ConnectionStrings:AthManConnectionString.ProviderName %>" 
                       SelectCommand="SELECT * FROM [Technicians] WHERE ([TechID] = ?)" 
                       DeleteCommand="DELETE FROM [Technicians] WHERE [TechID] = ?" 
                       InsertCommand="INSERT INTO [Technicians] ([Name], [Email], [Phone]) VALUES (?, ?, ?)" 
                       UpdateCommand="UPDATE [Technicians] SET [Name] = ?, [Email] = ?, [Phone] = ? WHERE [TechID] = ?">
        <DeleteParameters>
            <asp:Parameter Name="TechID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="Email" Type="String" />
            <asp:Parameter Name="Phone" Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="ddlTechnicians" Name="TechID" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="Email" Type="String" />
            <asp:Parameter Name="Phone" Type="String" />
            <asp:Parameter Name="TechID" Type="Int32" />
        </UpdateParameters>
    </asp:sqldatasource>

</asp:Content>
