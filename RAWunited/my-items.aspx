<%@ Page Title="My Items - RAW United" Language="C#" MasterPageFile="~/InnerPage.Master" AutoEventWireup="true" CodeBehind="my-items.aspx.cs" Inherits="RAWunited.my_items" %>
<asp:Content ID="extraCssContent" ContentPlaceHolderID="extraCss" runat="server">
</asp:Content>
<asp:Content ID="ContentBodyC" ContentPlaceHolderID="ContentBody" runat="server">
    <asp:SqlDataSource ID="MyItemsDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:dbCon %>" SelectCommand="SELECT * FROM [Items] WHERE ([user_id] = @user_id) ORDER BY [item_id] DESC" ConflictDetection="CompareAllValues" DeleteCommand="DELETE FROM [Items] WHERE [item_id] = @original_item_id" InsertCommand="INSERT INTO [Items] ([title], [category], [descr], [pictures], [user_id]) VALUES (@title, @category, @descr, @pictures, @user_id)" OldValuesParameterFormatString="original_{0}" UpdateCommand="UPDATE [Items] SET [title] = @title, [category] = @category, [descr] = @descr WHERE [item_id] = @original_item_id">
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
        <SelectParameters>
            <asp:SessionParameter Name="user_id" SessionField="user_id" Type="Int32" />
        </SelectParameters>
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
    <div class="jumbotron text-center">
        <h1>My Items</h1>
        <p>Lists all the items added by you. You can edit and delete each item.</p>
    </div>
    <div class="my-items-list container-fluid">
        <asp:GridView ID="MyItemsList" runat="server" AllowPaging="True" AllowSorting="True" DataSourceID="MyItemsDataSource" AutoGenerateColumns="False" CssClass="table table-hover table-responsive table-striped" CellPadding="4" DataKeyNames="item_id" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:CommandField HeaderText="Edit Options" ShowDeleteButton="True" ShowEditButton="True" />
                <asp:BoundField DataField="item_id" HeaderText="View Item" HtmlEncode="false" DataFormatString="<a target='_blank' href='view-item.aspx?item_id={0}'>View</a>" ReadOnly="True" SortExpression="item_id" />
                <asp:BoundField DataField="item_id" HeaderText="Item ID" InsertVisible="False" ReadOnly="True" SortExpression="item_id" />
                <asp:BoundField DataField="title" HeaderText="Title" SortExpression="title" />
                <asp:BoundField DataField="category" HeaderText="Category" SortExpression="category" />
                <asp:BoundField DataField="descr" HeaderText="Description" SortExpression="descr" />
            </Columns>
            <EditRowStyle BackColor="#999999" />
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#E9E7E2" />
            <SortedAscendingHeaderStyle BackColor="#506C8C" />
            <SortedDescendingCellStyle BackColor="#FFFDF8" />
            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
        </asp:GridView>
    </div>
</asp:Content>
<asp:Content ID="extraJsContent" ContentPlaceHolderID="extraJs" runat="server">
</asp:Content>
