<%@ Page Title="Edit Profile - RAW United" Language="C#" MasterPageFile="~/InnerPage.Master" AutoEventWireup="true" CodeBehind="edit-profile.aspx.cs" Inherits="RAWunited.edit_profile" %>
<asp:Content ID="extraCssContent" ContentPlaceHolderID="extraCss" runat="server">
</asp:Content>
<asp:Content ID="ContentBodyC" ContentPlaceHolderID="ContentBody" runat="server">
    <asp:ScriptManager ID="EditProfileScriptManager" runat="server"></asp:ScriptManager>
    <div class="jumbotron text-center">
        <h1>Edit Profile</h1>
        <p>Edit your profile. Change username, email, password and all other information.</p>
    </div>
    <div class="edit-profile-form small-form">
        <asp:UpdatePanel ID="EditProfileUpdate" runat="server">
            <ContentTemplate>
                <div class="form-group">
                    <label>Full Name</label>
                    <asp:TextBox ID="FullName" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label>Username</label>
                    <asp:TextBox ID="Username" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label>Date of Birth</label>
                    <asp:TextBox ID="DOB" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label>Email</label>
                    <asp:TextBox ID="Email" runat="server" CssClass="form-control" TextMode="Email"></asp:TextBox>
                </div>
                <div class="form-group">
                    <asp:Label ID="Result" runat="server" Text="" ForeColor="Red"></asp:Label>
                    <asp:RequiredFieldValidator ID="FullNameValidator" runat="server" ErrorMessage="Full Name is required" ForeColor="Red" Display="Dynamic" ControlToValidate="FullName"></asp:RequiredFieldValidator>
                    <asp:RequiredFieldValidator ID="UsernameValidator" runat="server" ErrorMessage="Username is required" ForeColor="Red" Display="Dynamic" ControlToValidate="Username"></asp:RequiredFieldValidator>
                    <asp:RequiredFieldValidator ID="EmailValidator" runat="server" ErrorMessage="Email is required" ForeColor="Red" Display="Dynamic" ControlToValidate="Email"></asp:RequiredFieldValidator>
                    <asp:RequiredFieldValidator ID="DOBValidator" runat="server" ErrorMessage="Date of birth is required" ForeColor="Red" Display="Dynamic" ControlToValidate="DOB"></asp:RequiredFieldValidator>
                </div>
                <asp:Button ID="UpdateUserInfo" runat="server" Text="Update Information" CssClass="btn btn-primary" OnClick="UpdateUserInfo_Click" />
            </ContentTemplate>
        </asp:UpdatePanel>
        <hr />
        <h2 class="text-center">Update Password</h2>
        <hr />
        <asp:UpdatePanel ID="UpdatePasswordUpdateP" runat="server">
            <ContentTemplate>
                <div class="form-group">
                    <label>Current Password</label>
                    <asp:TextBox ID="CurrentPassword" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label>New Password</label>
                    <asp:TextBox ID="NewPassword" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label>Confirm New Password</label>
                    <asp:TextBox ID="ConfirmNewPassword" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="form-group">
                    <asp:Label ID="ResultUpdatePassword" runat="server" Text="" ForeColor="Red"></asp:Label>
                </div>
                <asp:Button ID="UpdatePasswordBtn" runat="server" Text="Update Password" CssClass="btn btn-primary" CausesValidation="false" OnClick="UpdatePasswordBtn_Click" />
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</asp:Content>
<asp:Content ID="extraJsContent" ContentPlaceHolderID="extraJs" runat="server">
</asp:Content>
