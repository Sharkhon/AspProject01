<%@ Page Title="" Language="C#" MasterPageFile="~/Default.Master" AutoEventWireup="true" CodeBehind="Products.aspx.cs" Inherits="CaterProject01.Products" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="ProductID" DataSourceID="sdsProducts" AllowSorting="True">
        <Columns>
            <asp:TemplateField HeaderText="ProductID" SortExpression="ProductID">
                <EditItemTemplate>
                    <asp:Label runat="server" Text='<%# Eval("ProductID") %>' ID="Label1"></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label runat="server" Text='<%# Bind("ProductID") %>' ID="Label1"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Name" SortExpression="Name">
                <EditItemTemplate>
                    <asp:TextBox runat="server" Text='<%# Bind("Name") %>' ID="txtName"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvName" runat="server" ErrorMessage="Name is required." ControlToValidate="txtName" Text="*" CssClass="error" ValidationGroup="gridView"></asp:RequiredFieldValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label runat="server" Text='<%# Bind("Name") %>' ID="Label2"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Version" SortExpression="Version">
                <EditItemTemplate>
                    <asp:TextBox runat="server" Text='<%# Bind("Version") %>' ID="txtVersion"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvVersion" runat="server" ErrorMessage="Version is required." ControlToValidate="txtVersion" Text="*" CssClass="error" ValidationGroup="gridView"></asp:RequiredFieldValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label runat="server" Text='<%# Bind("Version") %>' ID="Label3"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="ReleaseDate" SortExpression="ReleaseDate">
                <EditItemTemplate>
                    <asp:TextBox runat="server" Text='<%# Bind("ReleaseDate") %>' ID="txtReleaseDate"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvReleaseDate" runat="server" ErrorMessage="Release Date is required." ControlToValidate="txtReleaseDate" Text="*" CssClass="error" ValidationGroup="gridView"></asp:RequiredFieldValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label runat="server" Text='<%# Bind("ReleaseDate") %>' ID="Label4"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>

            <asp:CommandField ShowEditButton="True" ShowDeleteButton="True"></asp:CommandField>
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="sdsProducts" runat="server" 
                       ConnectionString='<%$ ConnectionStrings:AthManConnectionString %>' 
                       ProviderName='<%$ ConnectionStrings:AthManConnectionString.ProviderName %>' 
                       SelectCommand="SELECT * FROM [Products] ORDER BY [ProductID]" 
                       DeleteCommand="DELETE FROM [Products] WHERE [ProductID] = ?" 
                       InsertCommand="INSERT INTO [Products] ([ProductID], [Name], [Version], [ReleaseDate]) VALUES (?, ?, ?, ?)" 
                       UpdateCommand="UPDATE [Products] SET [Name] = ?, [Version] = ?, [ReleaseDate] = ? WHERE [ProductID] = ?">
        <DeleteParameters>
            <asp:Parameter Name="ProductID" Type="String"></asp:Parameter>
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="ProductID" Type="String"/>
            <asp:Parameter Name="Name" Type="String"></asp:Parameter>
            <asp:Parameter Name="Version" Type="Decimal"></asp:Parameter>
            <asp:Parameter Name="ReleaseDate" Type="DateTime"></asp:Parameter>
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Name" Type="String"></asp:Parameter>
            <asp:Parameter Name="Version" Type="Decimal"></asp:Parameter>
            <asp:Parameter Name="ReleaseDate" Type="DateTime"></asp:Parameter>
            <asp:Parameter Name="ProductID" Type="String"></asp:Parameter>
        </UpdateParameters>
    </asp:SqlDataSource>
    
    <asp:ValidationSummary ID="vsGridViewSummary" ValidationGroup="gridView" CssClass="error" runat="server" />
    
    <br/>
    <br/>
    <div class="create-block">
        <asp:DetailsView ID="dvInsertProduct" OnItemInserted="dvInsertProduct_OnItemInserted" runat="server" Height="50px" Width="125px" DefaultMode="Insert" AutoGenerateRows="False" DataKeyNames="ProductID" DataSourceID="sdsProducts">
            <Fields>
                <asp:TemplateField HeaderText="ProductID" SortExpression="ProductID">
                    <InsertItemTemplate>
                        <asp:TextBox runat="server" Text='<%# Bind("ProductID") %>' ID="txtInsertProduct"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvInsertProductID" runat="server" ErrorMessage="ProductID is required." ControlToValidate="txtInsertProduct" Text="*" Display="Dynamic" CssClass="error" ValidationGroup="insert"></asp:RequiredFieldValidator>
                    </InsertItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Name" SortExpression="Name">
                    <InsertItemTemplate>
                        <asp:TextBox runat="server" CausesValidation="True" Text='<%# Bind("Name") %>' ID="txtInsertName"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvInsertName" runat="server" ErrorMessage="Name is required." ControlToValidate="txtInsertName" Text="*" Display="Dynamic" CssClass="error" ValidationGroup="insert"></asp:RequiredFieldValidator>
                    </InsertItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Version" SortExpression="Version">
                   <InsertItemTemplate>
                       <asp:TextBox runat="server" CausesValidation="True" Text='<%# Bind("Version") %>' ID="txtInsertVersion"></asp:TextBox>
                       <asp:RequiredFieldValidator ID="rfvInsertVersion" runat="server" ErrorMessage="Version is required." ControlToValidate="txtInsertVersion" Display="Dynamic" Text="*" CssClass="error" ValidationGroup="insert"></asp:RequiredFieldValidator>
                       <asp:CompareValidator ID="cvInsertVersion" runat="server" ErrorMessage="Can only have number values as versions." Text="Must be numeric." CssClass="error" ControlToValidate="txtInsertVersion" ValidationGroup="insert" Type="Double" Operator="DataTypeCheck"></asp:CompareValidator>
                    </InsertItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="ReleaseDate" SortExpression="ReleaseDate">
                    <InsertItemTemplate>
                        <asp:TextBox runat="server" CausesValidation="True" Text='<%# Bind("ReleaseDate") %>' ID="txtInsertReleaseDate"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvInsertReleaseDate" runat="server" ErrorMessage="Release Date is required." Display="Dynamic" ControlToValidate="txtInsertReleaseDate" Text="*" CssClass="error" ValidationGroup="insert"></asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="cvInsertReleaseDate" runat="server" ErrorMessage="Release Date must be a date format" ControlToValidate="txtInsertReleaseDate" Type="Date" CssClass="error" Text="(mm/dd/yyyy)" Operator="DataTypeCheck"></asp:CompareValidator>
                    </InsertItemTemplate>
                </asp:TemplateField>

                <asp:CommandField ShowInsertButton="True" NewText="Insert" CausesValidation="True"></asp:CommandField>
            </Fields>
        </asp:DetailsView>
        
        <asp:Label runat="server" CssClass="error" ID="lblError"></asp:Label>
        <asp:ValidationSummary ID="vsInsert" ValidationGroup="insert" CssClass="error" runat="server"/>
    </div>
    <br />
    <br />
</asp:Content>
