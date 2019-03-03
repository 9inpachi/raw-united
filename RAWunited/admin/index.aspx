<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Admin.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="RAWunited.admin.index" %>
<asp:Content ID="extraCssContent" ContentPlaceHolderID="extraCss" runat="server">
</asp:Content>
<asp:Content ID="ContentBodyBoxesC" ContentPlaceHolderID="ContentBodyBoxes" runat="server">
    <div class="box">
        <div class="box-header with-border">
            <h3 class="box-title">Manage RAW United</h3>

            <div class="box-tools pull-right">
                <button type="button" class="btn btn-box-tool" data-widget="collapse" data-toggle="tooltip" title="Collapse">
                <i class="fa fa-minus"></i></button>
            </div>
        </div>
        <div class="box-body">
            Manage RAW United from here. Navigate through the menu. See and edit users and items.
        </div>
    </div>
</asp:Content>
<asp:Content ID="extraJsContent" ContentPlaceHolderID="extraJs" runat="server">
</asp:Content>
