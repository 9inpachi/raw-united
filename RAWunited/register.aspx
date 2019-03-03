<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="register.aspx.cs" Inherits="RAWunited.register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Register - RAW United</title>
    <link rel="shortcut icon" href="favicon.png" type="image/png" />
     <link rel="icon" href="favicon.png" type="image/png" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
    <link rel="stylesheet" href="css/style.css" />
</head>
<body>
    <div class="logo">
        <h1>RAW United</h1>
    </div>
    <div class="l-r-box">
        <form id="register_form" runat="server">
            <h2>Register</h2>
            <div class="form-group">
                <asp:Label ID="Result" runat="server" Text="" ForeColor="Green"></asp:Label>
            </div>
            <hr />
            <div class="form-group">
                <label>Full Name</label>
                <asp:TextBox ID="FullName" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="form-group">
                <label>Email</label>
                <asp:TextBox ID="Email" runat="server" CssClass="form-control" TextMode="Email"></asp:TextBox>
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
                <label>Password</label>
                <asp:TextBox ID="Password" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
            </div>
            <div class="form-group">
                <label>Confirm Password</label>
                <asp:TextBox ID="ConfirmPassword" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
            </div>
            <div class="err form-group">
                <asp:RequiredFieldValidator ID="UsernameRequired" runat="server" ErrorMessage="Username is required" ControlToValidate="Username" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:RequiredFieldValidator ID="FullNameRequired" runat="server" ErrorMessage="Full name is required" ControlToValidate="FullName" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:RequiredFieldValidator ID="EmailRequired" runat="server" ErrorMessage="Email is required" ControlToValidate="Email" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:RequiredFieldValidator ID="DOBRequired" runat="server" ErrorMessage="Date of birth is required" ControlToValidate="DOB" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ErrorMessage="Password is required" ControlToValidate="Password" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:RequiredFieldValidator ID="CPasswordRequired" runat="server" ErrorMessage="Confirm Password is required" ControlToValidate="ConfirmPassword" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:CompareValidator ID="ComparePassword" runat="server" ErrorMessage="Password and Confirm Password are different" ControlToCompare="password" ControlToValidate="confirmPassword" ForeColor="Red" Display="Dynamic"></asp:CompareValidator>            
            </div>
            <asp:Button ID="RegisterBtn" CssClass="btn btn-primary" runat="server" Text="Register" OnClick="RegisterBtn_Click" />
            <div class="form-group already-reg">
                <p>Already Registered? <a href="login.aspx">Login</a></p>
            </div>
        </form>
    </div>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</body>
</html>
