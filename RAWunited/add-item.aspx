<%@ Page Title="Add Item - RAW United" Language="C#" MasterPageFile="~/InnerPage.Master" AutoEventWireup="true" CodeBehind="add-item.aspx.cs" Inherits="RAWunited.add_item" %>
<asp:Content ID="extraCssContent" ContentPlaceHolderID="extraCss" runat="server">
</asp:Content>
<asp:Content ID="ContentBodyC" ContentPlaceHolderID="ContentBody" runat="server">
    <div class="jumbotron text-center">
        <h1>Add Item</h1>
        <p>Add your own item to RAW United and get it reviewed by other users.</p>
    </div>
    <div class="form-horizontal small-form" id="addItemForm">
            <fieldset>
                <div class="form-group">
                    <label>Title</label>
                    <asp:TextBox ID="TitleItem" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label>Select Category</label>
                    <asp:DropDownList ID="Category" runat="server" CssClass="form-control">
                        <asp:ListItem>Electronics</asp:ListItem>
                        <asp:ListItem>Vehicles</asp:ListItem>
                        <asp:ListItem>Furniture</asp:ListItem>
                        <asp:ListItem>Fashion</asp:ListItem>
                        <asp:ListItem>Groceries</asp:ListItem>
                        <asp:ListItem Value="Institutes / Organizations">Institutes / Organizations</asp:ListItem>
                        <asp:ListItem>Other</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="form-group">
                    <label>Description</label>
                    <asp:TextBox ID="Desc" runat="server" CssClass="form-control" Height="200px" TextMode="MultiLine"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label>Pictures</label>
                    <asp:FileUpload ID="Pictures" runat="server" AllowMultiple="True" />
                </div>
                <div class="form-group">
                    <asp:Label ID="Result" runat="server" Text="" ForeColor="Red"></asp:Label>
                    <asp:RequiredFieldValidator ID="titleValidator" runat="server" ErrorMessage="Title is required" ControlToValidate="TitleItem" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:RequiredFieldValidator ID="descValidator" runat="server" ErrorMessage="Description is required" ControlToValidate="Desc" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:RequiredFieldValidator ID="categoryVal" runat="server" ErrorMessage="Category is required" ControlToValidate="Category" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:RequiredFieldValidator ID="picturesValidator" runat="server" ErrorMessage="Picture(s) are required" ControlToValidate="Pictures" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                    </div>
                <input type="reset" class="btn btn-default" value="Reset" />
                <asp:Button ID="AddItemBtn" runat="server" Text="Add Item" CssClass="btn btn-primary" OnClick="AddItemBtn_Click" />
            </fieldset>
        </div>
</asp:Content>
<asp:Content ID="extraJsContent" ContentPlaceHolderID="extraJs" runat="server">
</asp:Content>
