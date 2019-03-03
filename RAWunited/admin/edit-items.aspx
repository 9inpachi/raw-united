<%@ Page Title="Edit Items - RAW United" Language="C#" MasterPageFile="~/admin/Admin.Master" AutoEventWireup="true" CodeBehind="edit-items.aspx.cs" Inherits="RAWunited.admin.edit_items" %>
<asp:Content ID="extraCssContent" ContentPlaceHolderID="extraCss" runat="server">
    <style type="text/css">
        #ContentBodyBoxes_ItemsGridView tr:last-child table td span, #ContentBodyBoxes_ItemsGridView tr:last-child table td a{
            padding: 5px 10px;
            border: 1px solid white;
        }
        #ContentBodyBoxes_ItemsGridView tr:last-child table td a:hover{
            background: #8b1a1a;
        }
    </style>
</asp:Content>
<asp:Content ID="ContentBodyBoxesC" ContentPlaceHolderID="ContentBodyBoxes" runat="server">
    <asp:SqlDataSource ID="ItemsDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:dbCon %>" DeleteCommand="DELETE FROM [Items] WHERE [item_id] = @original_item_id" InsertCommand="INSERT INTO [Items] ([title], [category], [descr], [pictures], [user_id]) VALUES (@title, @category, @descr, @pictures, @user_id)" SelectCommand="SELECT * FROM [Items] ORDER BY [item_id] DESC" UpdateCommand="UPDATE [Items] SET [title] = @title, [category] = @category, [descr] = @descr WHERE [item_id] = @original_item_id" ConflictDetection="CompareAllValues" OldValuesParameterFormatString="original_{0}">
        <DeleteParameters>
            <asp:Parameter Name="original_item_id" Type="Int32" />
            <asp:Parameter Name="original_title" Type="String" />
            <asp:Parameter Name="original_category" Type="String" />
            <asp:Parameter Name="original_descr" Type="String" />
            <asp:Parameter Name="original_pictures" Type="String" />
            <asp:Parameter Name="original_user_id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="title" Type="String" />
            <asp:Parameter Name="category" Type="String" />
            <asp:Parameter Name="descr" Type="String" />
            <asp:Parameter Name="pictures" Type="String" />
            <asp:Parameter Name="user_id" Type="Int32" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="title" Type="String" />
            <asp:Parameter Name="category" Type="String" />
            <asp:Parameter Name="descr" Type="String" />
            <asp:Parameter Name="pictures" Type="String" />
            <asp:Parameter Name="user_id" Type="Int32" />
            <asp:Parameter Name="original_item_id" Type="Int32" />
            <asp:Parameter Name="original_title" Type="String" />
            <asp:Parameter Name="original_category" Type="String" />
            <asp:Parameter Name="original_descr" Type="String" />
            <asp:Parameter Name="original_pictures" Type="String" />
            <asp:Parameter Name="original_user_id" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <div class="box">
        <div class="box-header with-border">
            <h3 class="box-title">Edit Users</h3>
            <div class="box-tools pull-right">
                <button type="button" class="btn btn-box-tool" data-widget="collapse" data-toggle="tooltip" title="Collapse">
                <i class="fa fa-minus"></i></button>
            </div>
        </div>
        <div class="box-body">
            <asp:GridView ID="ItemsGridView" runat="server" AllowPaging="True" DataKeyNames="item_id" AllowSorting="True" CellPadding="4" DataSourceID="ItemsDataSource" ForeColor="#333333" GridLines="None" CssClass="table table-responsive table-striped" AutoGenerateColumns="False">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" HeaderText="Options" />
                    <asp:BoundField DataField="item_id" HeaderText="Item ID" InsertVisible="False" ReadOnly="True" SortExpression="item_id" />
                    <asp:BoundField DataField="title" HeaderText="Title" SortExpression="title" />
                    <asp:BoundField DataField="category" HeaderText="Category" SortExpression="category" />
                    <asp:BoundField DataField="descr" HeaderText="Description" SortExpression="descr" />
                    <asp:BoundField DataField="user_id" HeaderText="User ID" ReadOnly="True" SortExpression="user_id" />
                </Columns>
                <EditRowStyle BackColor="#999999" />
                <EmptyDataTemplate>
                    There are no items.
                </EmptyDataTemplate>
                <FooterStyle BackColor="#ff7676" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#ff7676" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#ff7676" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#E9E7E2" />
                <SortedAscendingHeaderStyle BackColor="#506C8C" />
                <SortedDescendingCellStyle BackColor="#FFFDF8" />
                <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
            </asp:GridView>
        </div>
    </div>
</asp:Content>
<asp:Content ID="extraJsContent" ContentPlaceHolderID="extraJs" runat="server">
</asp:Content>
