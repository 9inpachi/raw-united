<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="RAWunited.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login - RAW United</title>
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
        <form id="login_form" runat="server">
            <h2>Login</h2>
            <hr />
            <div class="form-group">
                <label>Username</label>
                <asp:TextBox ID="loginUsername" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="form-group">
                <label>Password</label>
                <asp:TextBox ID="loginPassword" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:Label ID="Result" runat="server" Text="" ForeColor="Red"></asp:Label>
                <asp:RequiredFieldValidator ID="passwordValidator" runat="server" ErrorMessage="Password is required" ControlToValidate="loginPassword" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:RequiredFieldValidator ID="usernameValidator" runat="server" ErrorMessage="Username is required" ControlToValidate="loginUsername" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
            </div>
            <asp:Button ID="loginBtn" CssClass="btn btn-primary" runat="server" Text="Login" OnClick="LoginBtn_Click" />
            <div class="form-group already-reg">
                <p>New here? <a href="register.aspx">Get Registered</a></p>
            </div>
        </form>
    </div>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</body>
</html>
