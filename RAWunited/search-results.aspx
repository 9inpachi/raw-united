<%@ Page Title="Search Results - RAW United" Language="C#" MasterPageFile="~/InnerPage.Master" AutoEventWireup="true" CodeBehind="search-results.aspx.cs" Inherits="RAWunited.search_results" %>
<asp:Content ID="extraCssContent" ContentPlaceHolderID="extraCss" runat="server">
</asp:Content>
<asp:Content ID="ContentBodyC" ContentPlaceHolderID="ContentBody" runat="server">
    <asp:SqlDataSource ID="ItemsSearch" runat="server" ConnectionString="<%$ ConnectionStrings:dbCon %>" SelectCommand="SELECT * FROM [Items] WHERE ([title] LIKE '%' + @title + '%')">
        <SelectParameters>
            <asp:QueryStringParameter Name="title" QueryStringField="s" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    <div class="jumbotron text-center">
        <h1>Search Results</h1>
        <p>This page lists the search results for specified queries made by users.</p>
    </div>
    <hr />
    <div class="container-fluid">
        <div class="row">
            <div class="col-sm-6 col-sm-offset-2 col-xs-8">
                <div class="form-group-lg">
                    <input id="search" placeholder="Search" name="s" class="form-control" />
                </div>
            </div>
            <div class="col-sm-2 col-xs-4">
                <button class="btn btn-primary btn-lg" id="searchBtn" style="font-size: 25px;"><i class="fas fa-search"></i></button>
            </div>
        </div>
        <br /><br /><br />
        <div class="row item-list-row">
            <asp:Repeater ID="ItemsListRepeater" runat="server" DataSourceID="ItemsSearch">
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
            $('#searchBtn').click(function () {
                window.open(document.location.origin + "/search-results.aspx?s=" + $('#search').val());
            })
        });
    </script>
</asp:Content>
