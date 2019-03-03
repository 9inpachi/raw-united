<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="header.ascx.cs" Inherits="RAWunited.partials.header" %>
<div class="header">
    <nav class="navbar navbar-default">
        <div class="container-fluid">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#mainNav">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span> 
                  </button>
                <a class="navbar-brand" href="#">RAW United</a>
            </div>
            <div class="collapse navbar-collapse" id="mainNav">
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="/">Home</a></li>
                    <li><a href="add-item.aspx">Add Item</a></li>
                    <li><a href="items-list.aspx">All Items</a></li>
                    <li><a href="my-items.aspx">My Items</a></li>
                    <li><a href="edit-profile.aspx">Edit Profile</a></li>
                    <li class="xs-hidden"><a href="#" id="nav-search"><i class="fa fa-search"></i></a></li>
                    <li><a title="Sign Out" href="logout.aspx"><i class="fas fa-sign-out-alt"></i></a></li>
                </ul>
                <form class="navbar-form navbar-right" id="headerSearchForm" method="get" action="/search-results.aspx">
                  <div class="form-group">
                    <input type="text" class="form-control" name="s" placeholder="Search">
                  </div>
                    <button type="submit" class="btn btn-primary"><i class="fa fa-search"></i></button>
                </form>
            </div>
        </div>
    </nav>
</div>