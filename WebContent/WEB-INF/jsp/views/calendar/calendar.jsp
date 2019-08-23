<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html>
<head>
	<title>HYESUKTIVAL</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, maximum-scale=1">
	
	<!-- <link rel="icon" href="favicon.png" type="image/png">
	<link rel="shortcut icon" href="favicon.ico" type="img/x-icon">
 -->
	<link href='https://fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'>
	<link href='https://fonts.googleapis.com/css?family=Open+Sans:400,300,800italic,700italic,600italic,400italic,300italic,800,700,600' rel='stylesheet' type='text/css'>

	<link href="/resources/main/css/bootstrap.css" rel="stylesheet" type="text/css">
	<link href="/resources/main/css/style.css" rel="stylesheet" type="text/css">
	
	<link href="/resources/main/css/responsive.css" rel="stylesheet" type="text/css">
	<link href="/resources/main/css/magnific-popup.css" rel="stylesheet" type="text/css">
	<link href="/resources/main/css/animate.css" rel="stylesheet" type="text/css">

	<script type="text/javascript" src="/resources/main/js/jquery.1.8.3.min.js"></script>
	<script type="text/javascript" src="/resources/main/js/bootstrap.js"></script>
	<script type="text/javascript" src="/resources/main/js/jquery-scrolltofixed.js"></script>
	<script type="text/javascript" src="/resources/main/js/jquery.easing.1.3.js"></script>
	<script type="text/javascript" src="/resources/main/js/jquery.isotope.js"></script>
	<script type="text/javascript" src="/resources/main/js/wow.js"></script>
	<script type="text/javascript" src="/resources/main/js/classie.js"></script>
	<script type="text/javascript" src="/resources/main/js/magnific-popup.js"></script>
	<script src="/resources/main/contactform/contactform.js"></script>

	<!-- =======================================================
    Theme Name: Knight
    Theme URL: https://bootstrapmade.com/knight-free-bootstrap-theme/
    Author: BootstrapMade
    Author URL: https://bootstrapmade.com
	======================================================= -->
	
	<!-- calendar.css -->
	<link href='/resources/fullcalendar/packages/core/main.css' rel='stylesheet' />
	<link href='/resources/fullcalendar/packages/daygrid/main.css' rel='stylesheet' />
	<script src='/resources/fullcalendar/packages/core/main.js'></script>

	<!-- calendar content start-->
	<script>
	document.addEventListener('DOMContentLoaded', function() {
	    var calendarEl = document.getElementById('calendar');
	    var calendar = new FullCalendar.Calendar(calendarEl, {
	      plugins: [ 'interaction', 'dayGrid' ],
	      editable: true,
	      eventLimit: true, // allow "more" link when too many events
	      events: [${requestScope.festivalList}],
	      contentHeight : 700,
	      aspectRatio: 2
	    });
	    calendar.render();
	  });
	</script>
	
	<!-- calendar content end-->
	
	
	<style>
	 #calendar {
	margin-top:-40px;
  	display: inline-block;
    max-width: 1200px;    
    margin-left: 20%;
    background-color: rgba( 0, 0, 0, 0.4 );
    
    /* border: 50px solid rgba(0,0,0,0.001); */
    border-top-color: rgba(0, 0, 0, 0);
    border-top-style: solid;
    border-top-width: 30px;
    border-right-color: rgba(0, 0, 0, 0);
    border-right-style: solid;
    border-right-width: 50px;
    border-bottom-color: rgba(0, 0, 0, 0);
    border-bottom-style: solid;
    border-bottom-width: 30px;
    border-left-color: rgba(0, 0, 0, 0);
    border-left-style: solid;
    border-left-width: 50px;
    border-image-source: initial;
    border-image-slice: initial;
    border-image-width: initial;
    border-image-outset: initial;
    border-image-repeat: initial; */
  		}
	
	</style>


</head>

<body>
	<!--header-start-->
	<header class="header" id="header">		
		<div class="container">
			<figure class="logo animated fadeInDown delay-07s">
				<!-- insert logo img -->
			</figure>
			<h1 class="animated fadeInDown delay-07s">Welcome To<h1 style="font-family: Summer Festival;"><strong>HYESUKTIVAL</strong></h1></h1>
			<ul class="we-create animated fadeInUp delay-1s">
				<li><h6>We loves festival</h6></li>
			</ul>
			<a class="link animated fadeInUp delay-1s servicelink" href="#service">Get Started</a>
		</div>
	</header>
	<!--header-end-->

	<!-- nav start -->
	<nav class="main-nav-outer" id="test"style="font-family: Summer Festival;">
		<!--main-nav-start-->
		<div class="container">
			<ul class="main-nav" >						
				<li class="small-logo"><a href="#header"><h2 style="font-family: Summer Festival;
				color:white;"><strong>HYESUKTIVAL</strong></h2></a></li>	
							
				<li><a href="#service"class="container-1" style="width: 300px;vertical-align: middle;white-space: nowrap; position: relative;">				
						<span class="icon"style="position: absolute;margin-left: -26%;margin-top: 4%;z-index: 1;color: #4f5b66;">
							<i class="fa fa-search"></i></span>										 	
				<form action="/search" method="get">
				<input type="text" name="search" id="search" placeholder="Search..." style=" width: 190px;  height: 40px; margin-left: 100px; border: none;font-size: 10pt;float: left;
					  padding-left: 45px;
					  -webkit-border-radius: 5px;
					  -moz-border-radius: 5px;
					  border-radius: 5px;
					  opacity: 0.6;
					  -webkit-transition: background .55s ease;
					  -moz-transition: background .55s ease;
					  -ms-transition: background .55s ease;
					  -o-transition: background .55s ease;
					  transition: background .55s ease;	"/>			
				</form>
				</a></li>
				
				<c:catch>
					<c:choose>
						<c:when test="${sessionId != null}">
							<li style="font-family:lottemartdream;">${sessionName}님&nbsp;반갑습니다</li>
							<li style="font-family:lottemartdream;"><a href="/myPage"><i class="mypage"></i> 마이페이지</a></li>
							<li style="font-family:lottemartdream;"><a href="/logout"><i class="logout"></i> 로그아웃</a></li>							
						</c:when>
						<c:when test="${empty AuthInfoId && empty sessionId}">
							<li><a href="/signup" style="font-size: 24px;font-family: Summer Festival;" >Sign Up</a></li>
							<li><a href="/login" style="font-size: 24px;font-family: Summer Festival;">Login</a></li>
						</c:when>
						
						<c:otherwise>
							<li style="font-family: lottemartdream;">${AuthInfoNickname }님&nbsp;반갑습니다</li>							
							<li><a href="/myPage" style="font-family: lottemartdream;"><i class="mypage"></i> 마이페이지</a></li>
							<li style="margin-right: -60px;"><a href="/logout" style="font-family: lottemartdream;"><i class="logout"></i> 로그아웃</a></li>
						</c:otherwise>
					</c:choose>
				</c:catch>
			</ul>
			<a class="res-nav_click" href="#"><i class="fa fa-bars"></i></a>
		</div>
	</nav>
	<!--nav end-->
			
	<!--calendar start-->
	<section class="main-section wow" id="service">
 		 <div id='calendar' class="wow fadeInDown delay-03"></div> 	 
	</section>
	<!-- calendar end-->	

	<section class="main-section client-part" id="client">
		<!--main-section client-part-start-->
		<div class="container">
			
			<div class="row">
				<div class="col-lg-12">
					<h1 class="wow fadeInDown delay-05"style="color: black;font-family: lottemartdream;">
					"&nbsp;최애는 바뀌는 것이 아니라 쌓이는 것이다&nbsp;"</h1>
				</div>
			</div>
			
		</div>
	</section>
	
	<footer class="footer">
		<div class="container">
			<h2><a class="animated fadeInUp delay-1s servicelink"
					href="#service"style="font-family: Summer Festival;color:white;">HYESUKTIVAL</a>	</h2>
			<span class="copyright">&copy; Knight Theme. All Rights Reserved</span>
			<div class="credits">
			
				Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a>
			</div>
		</div>
	</footer>


	<script type="text/javascript">
		$(document).ready(function(e) {

			$('#test').scrollToFixed();
			$('.res-nav_click').click(function() {
				$('.main-nav').slideToggle();
				return false

			});

      $('.Portfolio-box').magnificPopup({
        delegate: 'a',
        type: 'image'
      });

		});
	</script>

	<script>
		wow = new WOW({
			animateClass: 'animated',
			offset: 100
		});
		wow.init();
	</script>


	<script type="text/javascript">
		$(window).load(function() {

			$('.main-nav li a, .servicelink').bind('click', function(event) {
				var $anchor = $(this);

				$('html, body').stop().animate({
					scrollTop: $($anchor.attr('href')).offset().top - 102
				}, 1500, 'easeInOutExpo');
				/*
				if you don't want to use the easing effects:
				$('html, body').stop().animate({
					scrollTop: $($anchor.attr('href')).offset().top
				}, 1000);
				*/
				if ($(window).width() < 768) {
					$('.main-nav').hide();
				}
				event.preventDefault();
			});
		})
	</script>

	<script type="text/javascript">
		$(window).load(function() {


			var $container = $('.portfolioContainer'),
				$body = $('body'),
				colW = 375,
				columns = null;


			$container.isotope({
				// disable window resizing
				resizable: true,
				masonry: {
					columnWidth: colW
				}
			});

			$(window).smartresize(function() {
				// check if columns has changed
				var currentColumns = Math.floor(($body.width() - 30) / colW);
				if (currentColumns !== columns) {
					// set new column count
					columns = currentColumns;
					// apply width to container manually, then trigger relayout
					$container.width(columns * colW)
						.isotope('reLayout');
				}

			}).smartresize(); // trigger resize to set container width
			$('.portfolioFilter a').click(function() {
				$('.portfolioFilter .current').removeClass('current');
				$(this).addClass('current');

				var selector = $(this).attr('data-filter');
				$container.isotope({

					filter: selector,
				});
				return false;
			});

		});
	</script>

<!-- Bootstrap core JavaScript -->
  <script src="/resources/Detail/resources/vendor/jquery/jquery.min.js"></script>
  <script src="/resources/Detail/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Plugin JavaScript -->
  <script src="/resources/Detail/resources/vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Contact Form JavaScript -->
  <script src="/resources/Detail/resources/js/jqBootstrapValidation.js"></script>
  <script src="/resources/Detail/resources/js/contact_me.js"></script>

  <!-- Custom scripts for this template -->
  <script src="/resources/Detail/resources/js/freelancer.min.js"></script>
  
  <script src='/resources/fullcalendar/packages/interaction/main.js'></script>
  <script src='/resources/fullcalendar/packages/daygrid/main.js'></script>

</body>

</html>

