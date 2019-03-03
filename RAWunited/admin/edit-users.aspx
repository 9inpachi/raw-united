<%@ Page Title="Edit Users - RAW United" Language="C#" MasterPageFile="~/admin/Admin.Master" AutoEventWireup="true" CodeBehind="edit-users.aspx.cs" Inherits="RAWunited.admin.edit_users" %>
<asp:Content ID="extraCssContent" ContentPlaceHolderID="extraCss" runat="server">
    <style type="text/css">
        #ContentBodyBoxes_UsersGridView tr:last-child table td span, #ContentBodyBoxes_ItemsGridView tr:last-child table td a{
            padding: 5px 10px;
            border: 1px solid white;
        }
        #ContentBodyBoxes_UsersGridView tr:last-child table td a:hover{
            background: #8b1a1a;
        }
    </style>
</asp:Content>
<asp:Content ID="ContentBodyBoxesC" ContentPlaceHolderID="ContentBodyBoxes" runat="server">
    <asp:SqlDataSource ID="UsersDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:dbCon %>" DeleteCommand="DELETE FROM [Users] WHERE [user_id] = @original_user_id" InsertCommand="INSERT INTO [Users] ([username], [fullname], [email], [dob], [password]) VALUES (@username, @fullname, @email, @dob, @password)" SelectCommand="SELECT * FROM [Users] ORDER BY [user_id] DESC" UpdateCommand="UPDATE [Users] SET [username] = @username, [fullname] = @fullname, [email] = @email, [dob] = @dob, [password] = @password WHERE [user_id] = @original_user_id" ConflictDetection="CompareAllValues" OldValuesParameterFormatString="original_{0}">
        <DeleteParameters>
            <asp:Parameter Name="original_user_id" Type="Int32" />
            <asp:Parameter Name="original_username" Type="String" />
            <asp:Parameter Name="original_fullname" Type="String" />
            <asp:Parameter Name="original_email" Type="String" />
            <asp:Parameter DbType="Date" Name="original_dob" />
            <asp:Parameter Name="original_password" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="username" Type="String" />
            <asp:Parameter Name="fullname" Type="String" />
            <asp:Parameter Name="email" Type="String" />
            <asp:Parameter DbType="Date" Name="dob" />
            <asp:Parameter Name="password" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="username" Type="String" />
            <asp:Parameter Name="fullname" Type="String" />
            <asp:Parameter Name="email" Type="String" />
            <asp:Parameter DbType="Date" Name="dob" />
            <asp:Parameter Name="password" Type="String" />
            <asp:Parameter Name="original_user_id" Type="Int32" />
            <asp:Parameter Name="original_username" Type="String" />
            <asp:Parameter Name="original_fullname" Type="String" />
            <asp:Parameter Name="original_email" Type="String" />
            <asp:Parameter DbType="Date" Name="original_dob" />
            <asp:Parameter Name="original_password" Type="String" />
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
            <asp:GridView ID="UsersGridView" runat="server" AllowPaging="True" AllowSorting="True" CellPadding="4" DataSourceID="UsersDataSource" ForeColor="#333333" GridLines="None" CssClass="table table-responsive table-striped" AutoGenerateColumns="False" DataKeyNames="user_id">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                    <asp:CommandField HeaderText="Options" ShowDeleteButton="True" ShowEditButton="True" />
                    <asp:BoundField DataField="user_id" HeaderText="User ID" InsertVisible="False" ReadOnly="True" SortExpression="user_id" />
                    <asp:BoundField DataField="username" HeaderText="Username" SortExpression="username" />
                    <asp:BoundField DataField="fullname" HeaderText="Full Name" SortExpression="fullname" />
                    <asp:BoundField DataField="email" HeaderText="Email" SortExpression="email" />
                    <asp:BoundField DataField="dob" HeaderText="Date of Birth" SortExpression="dob" />
                </Columns>
                <EditRowStyle BackColor="#999999" />
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
