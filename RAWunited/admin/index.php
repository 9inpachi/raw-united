<?php

session_start();
include_once '../includes/admin_class.php';
include_once '../includes/user_class.php';
$admin = new admin();
$user = new User();

if($user->get_session()){
    header("location:../index.php");
}else if(!$admin->get_session()){
    header("location: login.php");
}

$id = $_SESSION['admin_id'];
$admin_name = $admin->get_admin_username($id);

if(isset($_GET["logout"])){
    $admin->session_logout();
    header("location: login.php");
}

?>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>YourOffice | Admin</title>
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/font-awesome.min.css">
    <link rel="stylesheet" href="css/ionicons.min.css">
    <link rel="stylesheet" href="css/AdminLTE.min.css">
    <link rel="stylesheet" href="css/_all-skins.min.css">
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->

    <!-- Google Font -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
</head>

<body class="hold-transition skin-blue sidebar-mini">
    <!-- Site wrapper -->
    <div class="wrapper">

        <header class="main-header">
            <!-- Logo -->
            <a href="index.php" class="logo">
                <!-- mini logo for sidebar mini 50x50 pixels -->
                <span class="logo-mini"><b>A</b>P</span>
                <!-- logo for regular state and mobile devices -->
                <span class="logo-lg"><b>Admin</b> Panel</span>
            </a>
            <!-- Header Navbar: style can be found in header.less -->
            <nav class="navbar navbar-static-top">
                <!-- Sidebar toggle button-->
                <a href="#" class="sidebar-toggle" data-toggle="push-menu" role="button">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </a>

                <div class="navbar-custom-menu">
                    <ul class="nav navbar-nav">
                        <!-- User Account: style can be found in dropdown.less -->
                        <li class="dropdown user user-menu">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                <img src="images/profiles/<?php $admin->display_admin_picture($id); ?>" class="user-image" alt="User Image">
                                <span class="hidden-xs"><?php echo $admin->get_admin_fullname($id); ?></span>
                            </a>
                            <ul class="dropdown-menu">
                                <!-- User image -->
                                <li class="user-header">
                                    <img src="images/profiles/<?php $admin->display_admin_picture($id); ?>" class="img-circle" alt="User Image">
                                    <p>
                                        <?php echo $admin->get_admin_fullname($id); ?> - Website Main Admin
                                    </p>
                                </li>
                                <!-- Menu Footer-->
                                <li class="user-footer">
                                    <div class="pull-right">
                                        <a href="index.php?logout=true" class="btn btn-default btn-flat">Logout</a>
                                    </div>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </nav>
        </header>

        <!-- =============================================== -->

        <!-- Left side column. contains the sidebar -->
        <aside class="main-sidebar">
            <!-- sidebar: style can be found in sidebar.less -->
            <section class="sidebar">
                <!-- Sidebar user panel -->
                <div class="user-panel">
                    <div class="pull-left image">
                        <img src="images/profiles/<?php $admin->display_admin_picture($id); ?>" class="img-circle" alt="User Image">
                    </div>
                    <div class="pull-left info">
                        <p><?php echo $admin->get_admin_fullname($id); ?></p>
                    </div>
                </div>
                <!-- sidebar menu: : style can be found in sidebar.less -->
                <ul class="sidebar-menu" data-widget="tree">
                    <li class="header">MAIN NAVIGATION</li>
                    
                    <li class="treeview">
                        <a href="#">
                            <i class="fa fa-circle-o-notch"></i>
                            <span>Requests</span>
                            <span class="pull-right-container">
                              <i class="fa fa-angle-left pull-right"></i>
                            </span>
                        </a>
                        <ul class="treeview-menu">
                            <li><a href="donations.php"><i class="fa fa-heart"></i> Donations</a></li>
                            <li><a href="loads-purchased.php"><i class="fa fa-mobile"></i> Loads Purchased</a></li>
                            <li><a href="update-balance.php"><i class="fa fa-dollar" aria-hidden="true"></i> Update Balance</a></li>
                    <li><a href="card-issue-requests.php"><i class="fa fa-address-card"></i> <span>Card Issue</span></a></li>
                    <li><a href="withdraw-balance.php"><i class="fa fa-money"></i> <span>Withdraw Balance</span></a></li>
                        </ul>
                    </li>
                    <li><a href="tokens.php"><i class="fa fa-key"></i> <span>Tokens</span></a></li>
                    <li><a href="referrals.php"><i class="fa fa-gear"></i> <span>Referral Settings</span></a></li>
                    <li><a href="all-users.php"><i class="fa fa-users"></i> <span>All Users</span></a></li>
                    <li><a href="give-balance.php"><i class="fa fa-glass"></i> <span>Give Balance</span></a></li>
                    <li class="treeview">
                        <a href="#">
                            <i class="fa fa-inbox"></i>
                            <span>Messages</span>
                            <span class="pull-right-container">
                              <i class="fa fa-angle-left pull-right"></i>
                            </span>
                        </a>
                        <ul class="treeview-menu">
                            <li><a href="view-sent-messages.php"><i class="fa fa-circle-o"></i> View Sent Messages</a></li>
                            <li><a href="message-single-user.php"><i class="fa fa-circle-o"></i> Message Single User</a></li>
                            <li><a href="message-new-users.php"><i class="fa fa-circle-o"></i> Message New Users</a></li>
                            <li><a href="message-reward-users.php"><i class="fa fa-circle-o" aria-hidden="true"></i> Message for Rewards</a></li>
                        </ul>
                    </li>
                    <li><a href="set-offer.php"><i class="fa fa-gift"></i> <span>Offer</span></a></li>
                    <li><a href="https://dashboard.tawk.to/login" target="_blank"><i class="fa fa-comments"></i> <span>Live Chat</span></a></li>
                    <li><a href="settings.php"><i class="fa fa-cog"></i> <span>Settings</span></a></li>
                </ul>
            </section>
            <!-- /.sidebar -->
        </aside>

        <!-- =============================================== -->

        <!-- Content Wrapper. Contains page content -->
        <div class="content-wrapper">
            <!-- Content Header (Page header) -->
            <section class="content-header">
                <h1>
                    Welcome
                    <small>welcome to admin panel</small>
                </h1>
            </section>

            <!-- Main content -->
            <section class="content">

                <!-- Default box -->
                <div class="box">
                    <div class="box-header with-border">
                        <h3 class="box-title">Manage YourOffice.com</h3>

                        <div class="box-tools pull-right">
                            <button type="button" class="btn btn-box-tool" data-widget="collapse" data-toggle="tooltip" title="Collapse">
              <i class="fa fa-minus"></i></button>
                        </div>
                    </div>
                    <div class="box-body">
                        Manage YourOffice.com from here. Navigate through the menu. See and operate on requests, view and operate on user. Send messages to users and update your settings.
                    </div>
                </div>
                <!-- /.box -->

            </section>
            <!-- /.content -->
        </div>
        <!-- /.content-wrapper -->

    </div>
    <!-- ./wrapper -->

    <script src="http://code.jquery.com/jquery-3.1.1.min.js" integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8=" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
    <!-- SlimScroll -->
    <script src="js/jquery.slimscroll.min.js"></script>
    <!-- FastClick -->
    <script src="js/fastclick.js"></script>
    <!-- AdminLTE App -->
    <script src="js/adminlte.min.js"></script>
    <!-- AdminLTE for demo purposes -->
    <script src="js/demo.js"></script>
    <script>
        $(document).ready(function() {
            $('.sidebar-menu').tree()
        })
    </script>
</body>

</html>