<%@ Page Title="Items List - RAW United" Language="C#" MasterPageFile="~/InnerPage.Master" AutoEventWireup="true" CodeBehind="items-list.aspx.cs" Inherits="RAWunited.items_list" %>
<asp:Content ID="extraCssContent" ContentPlaceHolderID="extraCss" runat="server">
</asp:Content>
<asp:Content ID="ContentBodyC" ContentPlaceHolderID="ContentBody" runat="server">
    <asp:SqlDataSource ID="ItemsList" runat="server" ConnectionString="<%$ ConnectionStrings:dbCon %>" SelectCommand="SELECT * FROM [Items] ORDER BY item_id DESC"></asp:SqlDataSource>
    <div class="jumbotron text-center">
        <h1>Items List</h1>
        <p>This page lists all the items added to RAW United.</p>
    </div>
    <hr />
    <div class="container-fluid">
        <div class="row item-list-row">
            <asp:Repeater ID="ItemsListRepeater" runat="server" DataSourceID="ItemsList">
                <ItemTemplate>
                    <div class="col-sm-4 col-xs-12">
                        <div class="card text-white bg-primary">
                          <div class="card-header">
                            <asp:HiddenField ID="ItemRatingHidden" Value='<%# Eval("item_id") %>' runat="server" />
                            <asp:SqlDataSource ID="ItemRating" runat="server" ConnectionString="<%$ ConnectionStrings:dbCon %>" SelectCommand='SELECT AVG(rating) AS rating FROM [ItemRating] WHERE item_id = @itemid'>
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="ItemRatingHidden" Type="Int32" Name="itemid" PropertyName="Value" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                            <asp:Repeater ID="ItemRatingRepeater" runat="server" DataSourceID="ItemRating">
                                <ItemTemplate>
                                    <span class="rating" style="display: none;"><%# Eval("rating") %></span>
                                </ItemTemplate>
                            </asp:Repeater>
                          </div>
                          <div class="card-body">
                            <h4 class="card-title"><a href="view-item.aspx?item_id=<%# Eval("item_id")  %>"><%# Eval("title") %></a></h4>
                            <p class="card-text"><%# Eval("descr").ToString().PadRight(140).Substring(0,140).TrimEnd() %></p>
                          </div>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </div>
</asp:Content>
<asp:Content ID="extraJsContent" ContentPlaceHolderID="extraJs" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            setDefaultRating('.card-header');
        });
    </script>
</asp:Content>
