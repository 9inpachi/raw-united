<%@ Page Title="View Item - RAW United" Language="C#" MasterPageFile="~/InnerPage.Master" AutoEventWireup="true" CodeBehind="view-item.aspx.cs" Inherits="RAWunited.view_item" %>
<asp:Content ID="extraCssContent" ContentPlaceHolderID="extraCss" runat="server">
    <link rel="stylesheet" href="css/sequence.css" />
</asp:Content>
<asp:Content ID="ContentBodyC" ContentPlaceHolderID="ContentBody" runat="server">
    <asp:SqlDataSource ID="ItemDetails" runat="server" ConnectionString="<%$ ConnectionStrings:dbCon %>" SelectCommand="SELECT * FROM [Items] WHERE ([item_id] = @item_id)">
        <SelectParameters>
            <asp:QueryStringParameter Name="item_id" QueryStringField="item_id" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <!-- section intro -->
    <section id="intro" class="item-info">
        <div class="featured">
        <div class="wrapper">
            <div class="row-fluid">
            <!-- slider -->
            <div class="span12">
                <asp:Repeater ID="ItemDetailInfo" runat="server" DataSourceID="ItemDetails" OnItemDataBound="ItemDetailInfoBound">
                <ItemTemplate>
                    <asp:HiddenField ID="ItemPictures" Value='<%# Eval("pictures") %>' runat="server" />
                    <div id="sequence-theme">
                        <div id="sequence">
                            <img class="prev" src="images/bt-prev.png" alt="Previous Picture" />
                            <img class="next" src="images/bt-next.png" alt="Next Picture" />
                            <ul>
                            <asp:Repeater ID="ImagesRepeater" runat="server">
                                <ItemTemplate>
                                    <li class="animate-in">
                                        <div class="item-rating-wrap">
                                            <asp:SqlDataSource ID="ItemRating" runat="server" ConnectionString="<%$ ConnectionStrings:dbCon %>" SelectCommand='SELECT AVG(rating) AS rating FROM [ItemRating] WHERE item_id = @item_id'>
                                                <SelectParameters>
                                                    <asp:QueryStringParameter Name="item_id" QueryStringField="item_id" Type="Int32" />
                                                </SelectParameters>
                                            </asp:SqlDataSource>
                                            <asp:Repeater ID="ItemRatingRepeater" runat="server" DataSourceID="ItemRating">
                                                <ItemTemplate>
                                                    <span class="rating" style="display: none;"><%# Eval("rating") %></span>
                                                </ItemTemplate>
                                            </asp:Repeater>
                                        </div>
                                        <h2 class="title"><%# DataBinder.Eval(Container.Parent.Parent, "DataItem.title") %>
                                            <br />
                                            <small style="text-align:right;"><%# DataBinder.Eval(Container.Parent.Parent, "DataItem.category") %></small>
                                        </h2>
                                        <p class="subtitle"><%# DataBinder.Eval(Container.Parent.Parent, "DataItem.descr") %></p>
                                        <img class="model" src='uploads/items/<%# Eval("picName") %>' />
                                    </li>
                                </ItemTemplate>
                            </asp:Repeater>
                            </ul>
                        </div>
                        <ul class="nav">
                            <asp:Repeater ID="ImagesThumbRepeater" runat="server">
                                <ItemTemplate>
                                    <li><img width='50' src='uploads/items/<%#Eval("picName") %>' /></li>
                                </ItemTemplate>
                            </asp:Repeater>
                        </ul>
                    </div>
                </ItemTemplate>
            </asp:Repeater>

            </div>
            <!-- end slider -->
            </div>

        </div>
        </div>
    </section>
    <!-- end section intro -->
    <div class="jumbotron text-center">
        <h1>Add a Review</h1>
    </div>
    <div class="add-review-sec container-fluid">
        <div class="row">
            <div class="col-sm-5 col-xs-12" style="text-align: right;">
                <h3>Your personal rating</h3>
                <p id="personal-rating-res"></p>
            </div>
            <div class="col-sm-7 col-xs-12">
                <div class="personal-rating">
                    <asp:SqlDataSource ID="ItemRatingPersonal" runat="server" ConnectionString="<%$ ConnectionStrings:dbCon %>" SelectCommand='SELECT AVG(rating) AS rating FROM [ItemRating] WHERE item_id = @item_id AND user_id = @user_id'>
                        <SelectParameters>
                            <asp:QueryStringParameter Name="item_id" QueryStringField="item_id" Type="Int32" />
                            <asp:SessionParameter Name="user_id" SessionField="user_id" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:Repeater ID="ItemRatingPersonalRepeater" runat="server" DataSourceID="ItemRatingPersonal">
                        <ItemTemplate>
                            <span class="rating" style="display: none;"><%# Eval("rating") %></span>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
            </div>
        </div>
        <div class="row">
            <asp:ScriptManager ID="ReviewScriptManager" runat="server"></asp:ScriptManager>
            <asp:UpdatePanel ID="ReviewUpdatePanel" runat="server">
                <ContentTemplate>
                    <div class="col-sm-5 col-xs-12" style="text-align: right;">
                        <h3>Your personal review</h3>
                        <p id="PersonalReviewRes" runat="server">
                            <asp:RequiredFieldValidator ID="MyReviewRequired" runat="server" ErrorMessage="Review cannot be empty" ForeColor="Red" Display="Dynamic" ControlToValidate="MyReview"></asp:RequiredFieldValidator>
                        </p>
                    </div>
                    <div class="col-sm-6 col-xs-12">
                        <%--Can be done with ajax as well--%>
                        <div class="form-group">
                            <asp:TextBox ID="MyReview" runat="server" CssClass="form-control" TextMode="MultiLine" Height="150px"></asp:TextBox>
                        </div>
                        <asp:Button ID="MyReviewBtn" Text="Add Review" runat="server" CssClass="btn btn-primary" OnClick="MyReviewBtn_Click" />
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>
    <br /><br /><br />
    <div class="jumbotron text-center">
        <h1>All Reviews</h1>
    </div>
    <div class="all-reviews container-fluid">
        <asp:SqlDataSource ID="AllReviewsDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:dbCon %>" SelectCommand="SELECT * FROM (SELECT ISNULL(ItemReviews.item_id, ItemRating.item_id) AS item_id, ISNULL(review, 'No review by user.') AS review, ISNULL(rating, 0) AS rating, username, fullname FROM ItemReviews FULL OUTER JOIN ItemRating ON ItemReviews.item_id = ItemRating.item_id AND ItemReviews.user_id = ItemRating.user_id LEFT JOIN Users ON (ItemReviews.user_id = Users.user_id OR ItemRating.user_id = Users.user_id)) AS t WHERE item_id = @item_id">
            <SelectParameters>
                <asp:QueryStringParameter Name="item_id" QueryStringField="item_id" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:Repeater ID="AllReviewsRepeater" runat="server" DataSourceID="AllReviewsDataSource">
            <ItemTemplate>
                <%--Rating can also be added--%>
                <div class="row" style="margin-bottom: 20px;">
                    <div class="col-sm-4 col-xs-12" style="text-align: right;">
                       <div class="all-reviews-rating">
                           <span class="rating" style="display: none;"><%# Eval("rating") %></span>
                       </div>
                        <h3 style="margin-top: 5px;"><b><%# Eval("fullname") %></b></h3>
                        <h6><%# Eval("username") %></h6>
                    </div>
                    <div class="col-sm-6 col-xs-12">
                        <p><%# Eval("review") %></p>
                    </div>
                </div>
                <hr />
            </ItemTemplate>
        </asp:Repeater>
    </div>
</asp:Content>
<asp:Content ID="extraJsContent" ContentPlaceHolderID="extraJs" runat="server">
    <script src="js/sequence.jquery.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            
            setDefaultRating('.item-rating-wrap');
            setDefaultRating('.personal-rating');
            setDefaultRating('.all-reviews-rating');
            
            //Set rating
            $('.personal-rating .fa-star').click(function () {
                $(this).prevAll('.fa-star').removeClass('far');
                $(this).prevAll('.fa-star').addClass('fas');
                $(this).nextAll('.fa-star').addClass('far');
                $(this).nextAll('.fa-star').removeClass('fas');
                $(this).removeClass('far');
                $(this).addClass('fas');
                var ratingVal = $(this).attr('data-rating-val');
                var urlParams = new URLSearchParams(window.location.search);
                $.ajax({
                    url: 'view-item.aspx/addRating',
                    method: 'post',
                    dataType: 'json',
                    contentType: 'application/json; charset=utf-8',
                    data: "{ 'ratingVal': " + ratingVal + ", 'itemId': " + urlParams.get('item_id') + " }",
                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                        alert('Error adding a rating\n' + errorThrown);
                        $('#personal-rating-res').css('color', 'red');
                        $('#personal-rating-res').html(errorThrown);
                    },
                    success: function (res) {
                        if (res) {
                            console.log(res.d);
                        }
                        $('#personal-rating-res').css('color', 'green');
                        $('#personal-rating-res').html(res.d);
                    }
                })
            })
        });
    </script>
</asp:Content>
