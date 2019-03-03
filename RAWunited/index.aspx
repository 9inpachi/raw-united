<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="RAWunited.WebForm1" %>

<!DOCTYPE HTML>

<html runat="server">
	<head>
		<title>RAW United</title>
		<meta http-equiv="content-type" content="text/html; charset=utf-8" />
		<meta name="description" content="" />
		<meta name="keywords" content="" />
        <link rel="shortcut icon" href="favicon.png" type="image/png" />
        <link rel="icon" href="favicon.png" type="image/png" />
		<script src="js/jquery.min.js"></script>
		<script src="js/jquery.dropotron.min.js"></script>
		<script src="js/jquery.scrollgress.min.js"></script>
		<script src="js/jquery.scrolly.min.js"></script>
		<script src="js/jquery.slidertron.min.js"></script>
		<script src="js/skel.min.js"></script>
		<script src="js/skel-layers.min.js"></script>
		<script src="js/init.js"></script>
		<link rel="stylesheet" href="css/skel.css" />
		<link rel="stylesheet" href="css/style-f.css" />
		<link rel="stylesheet" href="css/style-xlarge.css" />
	</head>
	<body class="landing">

		<!-- Header -->
			<header id="header" class="alt skel-layers-fixed">
				<h1><a href="/">RAW United   <span>  ( So Easy To Use )</span></a></h1>
				<nav id="nav">
					<ul>
						<li><a href="#home">Home</a></li>
                        <li><a href="#one">How It Works?</a></li>
                        <li><a href="#two">Members</a></li>
                        <li><a href="#three">Categories</a></li>
                        <li><a href="logout.aspx">Logout</a></li>
					</ul>
				</nav>
			</header>

		<!-- Banner -->
        <a name="home"></a>
			<section id="banner">
				<div class="inner">
					<h2>RAW United</h2>
					<p>Item Rating - Rating and Reviews for You</p>
					<ul class="actions">
						<li><a href="#one" class="button big scrolly">Learn More</a></li>
						<li><a href="items-list.aspx" class="button big scrolly">Start Rating</a></li>
					</ul>
				</div>
			</section>

		<!-- One -->
			<section id="one" class="wrapper style1">
				<div class="container">
					<header class="major">
                        <a name="howitworks"></a>
						<h2>HOW IT WORKS</h2>
						<p>Admin can vote from RAW United admin side and Users can vote on the public side <br />
						of the website. Admin and frontend votes are matched to calculate a global<br />
						 score. Admin can choose to balanced the result by forcing the score.</p>
					</header>
				</div>
			</section>

		<!-- Two -->
			<section id="two" class="wrapper style2">
				<div class="container">
                    <a name="members"></a>
					<div class="row uniform">
						<div class="4u 6u(2) 12u$(3)">
							<section class="feature fa-briefcase">
								<h3>Fawad Ali</h3>
								<p>Developer and Manager of this Platform and also having skills in all other OOP Languages</p>
							</section>
						</div>
						<div class="4u 6u$(2) 12u$(3)">
							<section class="feature fa-code">
								<h3>Obaid Ur Rehman </h3>
								<p>Programmer and coder of this platform and also having good skills in managing other activities</p>
							</section>
						</div>
						<div class="4u$ 6u(2) 12u$(3)">
							<section class="feature fa-save">
								<h3>Adil Wahla </h3>
								<p>Best Software Engineer of UET. Also having great skills in Writing documents and Software Requirements Specifications</p>
							</section>
						</div>
                    </div>
				</div>
			</section>

		<!-- Three -->
			<section id="three" class="wrapper style1">
				<div class="container">
					<header class="major">
						<a name="categories"></a>
						<h2>CATEGORIES</h2>
						<p>RAW United offers alot of categories to be provided to the customers including <br />
						househeld items, furniture, Groceries, Wooden Work, Tables, Shelfs, food, Items<br />
						and a number of others items are also included in our categories .</p>
					</header>
					<div class="row">
						<div class="4u 6u(2) 12u$(3)">
							<article class="box post">
								<a href="#" class="image fit"><img src="images/pic01.jpg" alt="" height= "250px" /></a>
								<h3>House Hold Items</h3>
								<p>household goods include air conditioners, baby items, baking dishes, beds/bedframes, blankets.</p>
								<ul class="actions">
									<li><a href="#" class="button">Learn More</a></li>
								</ul>
							</article>
						</div>
						<div class="4u 6u$(2) 12u$(3)">
							<article class="box post">
								<a href="#" class="image fit"><img src="images/pic02.jpg" alt="" height= "250px" /></a>
								<h3>Furniture</h3>
								<p>Buy furniture online with Pakistan's leading furniture brand offering Home Furniture, Office Furniture, Kids Furniture</p>
								<ul class="actions">
									<li><a href="#" class="button">Learn More</a></li>
								</ul>
							</article>
						</div>
						<div class="4u$ 6u(2) 12u$(3)">
							<article class="box post">
								<a href="#" class="image fit"><img src="images/pic03.jpg" alt="" height= "250px" /></a>
								<h3>GROCERIES</h3>
								<p>We have a wide variety of groceries available at here RAW United for rating and reviews</p>
								<ul class="actions">
									<li><a href="#" class="button">Learn More</a></li>
								</ul>
							</article>
						</div>
						<div class="4u 6u$(2) 12u$(3)">
							<article class="box post">
								<a href="#" class="image fit"><img src="images/pic04.jpg" alt=""  height= "250px"/></a>
								<h3>VEHICLES</h3>
								<p>We also cover a wide variety of cars motobikes and even cycles here at RAW United </p>
								<ul class="actions">
									<li><a href="#" class="button">Learn More</a></li>
								</ul>
							</article>
						</div>
						<div class="4u 6u(2) 12u$(3)">
							<article class="box post">
								<a href="#" class="image fit"><img src="images/pic05.jpg" alt=""  height= "250px"/></a>
								<h3>FASHION</h3>
								<p>We also cover a wide variety of dressers, designers  and botiques from all across the globe  </p>
								<ul class="actions">
									<li><a href="#" class="button">Learn More</a></li>
								</ul>
							</article>
						</div>
						<div class="4u$ 6u$(2) 12u$(3)">
							<article class="box post">
								<a href="#" class="image fit"><img src="images/pic06.jpg" alt="" height= "250px" /></a>
								<h3>INSTITUTES</h3>
								<p>We also cover a wide variety of Schools, Colleges and Universties from across the globe</p>
								<ul class="actions">
									<li><a href="#" class="button">Learn More</a></li>
								</ul>
							</article>
						</div>
					</div>
				</div>
			</section>

		<!-- CTA -->
			<section id="cta" class="wrapper style3">
				<h2>RAW United</h2>
				<ul class="actions">
					<li><a href="items-list.aspx" class="button big">Get Started</a></li>
				</ul>
			</section>
        <script type="text/javascript">
            $(document).ready(function () {

                $('a[href*="#"]')
                // Remove links that don't actually link to anything
                .not('[href="#"]')
                .not('[href="#0"]')
                .click(function (event) {
                    // On-page links
                    if (
                    location.pathname.replace(/^\//, '') == this.pathname.replace(/^\//, '')
                    &&
                    location.hostname == this.hostname
                    ) {
                        // Figure out element to scroll to
                        var target = $(this.hash);
                        target = target.length ? target : $('[name=' + this.hash.slice(1) + ']');
                        // Does a scroll target exist?
                        if (target.length) {
                            // Only prevent default if animation is actually gonna happen
                            event.preventDefault();
                            $('html, body').animate({
                                scrollTop: target.offset().top
                            }, 1000, function () {
                                // Callback after animation
                                // Must change focus!
                                var $target = $(target);
                                $target.focus();
                                if ($target.is(":focus")) { // Checking if the target was focused
                                    return false;
                                } else {
                                    $target.attr('tabindex', '-1'); // Adding tabindex for elements not focusable
                                    $target.focus(); // Set focus again
                                };
                            });
                        }
                    }
                });
            })
        </script>
	</body>
</html>

