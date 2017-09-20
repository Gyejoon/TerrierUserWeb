<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<title>사원 페이지</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
		<link rel="stylesheet" href="<c:url value='/resources/css/jquery.smartPop.css' />" />
		<link rel="stylesheet" href="<c:url value='/resources/css/semantic.min.css' />" />
		<link rel="stylesheet" href="<c:url value='/resources/css/main.css' />" />
		<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
		<!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->
		<style>
			.container {
				margin-right: auto;
				margin-left: auto;
				padding-left: 20px;
				padding-right: 20px;
			}
			
			.contianer div a span {
				color: #333;
			}
			
			#titleOutput {
				margin-bottom: 10px;
				line-height: 1.2em;
			}
			
			#contentsOutput {
				margin-top: 10px;
				margin-bottom: 10px;
				line-height: 1.8em;
			}
			
			#board_title {
				font_size:1.2em;
				font-weight:bold;
				color:teal;
			}
			
			#cardlayout {
				margin-top: 10px;
			}
			
			img {
				height: 200px;
			}
			
			#imagename {
				color: #444;
				font-size: 15px;
				font-family: 굴림;
				text-align: center;
			}
			
			#imagecard {
				
			}
			
			.custom-menu {
			    z-index:1000;
			    position: absolute;
			    background-color:#fff;
			    border: 1px solid black;
			    padding: 2px;
			}
			
			
		</style>
	</head>
	<body>

		<!-- Header -->
			<div id="header">
				<div class="top">

					<!-- Logo -->
						<div id="logo">
							<span class="image avatar48"><img src="<c:url value='/resources/images/avatar.jpg' />" alt="" /></span>
							<h1 id="title"><c:out value="${profile.name}"/></h1>
							<p><c:out value="${profile.department}"/>&nbsp;<c:out value="${profile.rank}"/></p>
						</div>

					<!-- Nav -->
						<nav id="nav">
							<ul>
								<li><a href="${pageContext.request.contextPath}/profile" id="top-link" class="skel-layers-ignoreHref"><span class="icon fa-home">Home</span></a></li>
								<li><a href="${pageContext.request.contextPath}/cloud" id="about-link" class="skel-layers-ignoreHref"><span class="icon fa-cloud">클라우드</span></a></li>
								<li><a href="${pageContext.request.contextPath}/lost" id="contact-link" class="skel-layers-ignoreHref"><span class="icon fa-phone">분실관리</span></a></li>
								<li><a href="${pageContext.request.contextPath}/control" id="contact-link" class="skel-layers-ignoreHref"><span class="icon fa-envelope">제어요청</span></a></li>
							</ul>
						</nav>

				</div>

				<div class="bottom">
					<ul class="icons">
						<c:if test="${profile.OTP eq 'NO'}">
       						<li><a href="#" onclick="javascript:otpadd()" class="icon fa-lock"><span class="label">OTP</span></a></li>
       					</c:if>
						<li><a href="${pageContext.request.contextPath}/config" class="icon fa-cog"><span class="label">설정</span></a></li>
						<li><a href="${pageContext.request.contextPath}/logout" class="icon fa-sign-out"><span class="label">로그아웃</span></a></li>
					</ul>
				</div>

			</div>

		<!-- Main -->
			<div id="main">
				<div class="container">
					<br>
					
					<div class="ui raised segment">
						<a class="ui blue ribbon label">Terrier</a>
							<span id="board_title">이미지</span>
						
						
						<div class="ui four cards" id="cardlayout">
							<div class="card" id="imagecard">
								<img src="<c:url value='/resources/images/pic08.jpg' />" alt=""/>						
								<span class="label" id="imagename">강준영.jpg</span>
							</div>

							<div class="card" id="imagecard">
								<img src="<c:url value='/resources/images/cap.PNG' />" alt="" />								
								<span class="label" id="imagename">강준영.jpg</span>
							</div>
							
							<div class="card" id="imagecard">
								<img src="<c:url value='/resources/images/pic02.jpg' />" alt="" />								
								<span class="label" id="imagename">강준영.jpg</span>
							</div>
						
							<div class="card" id="imagecard">
								<img src="<c:url value='/resources/images/pic07.jpg' />" alt="" />								
								<span class="label" id="imagename">강준영.jpg</span>
							</div>
							
							<div class="card" id="imagecard">
								<img src="<c:url value='/resources/images/pic08.jpg' />" alt="" />								
								<span class="label" id="imagename">강준영.jpg</span>
							</div>
						
							<div class="card" id="imagecard">
								<img src="<c:url value='/resources/images/banner.jpg' />" alt="" />								
								<span class="label" id="imagename">강준영.jpg</span>
							</div>
							
							<div class="card" id="imagecard">
								<img src="<c:url value='/resources/images/pic04.jpg' />" alt="" />								
								<span class="label" id="imagename">강준영.jpg</span>
							</div>
						
							<div class="card" id="imagecard">
								<img src="<c:url value='/resources/images/banner.jpg' />" alt="" />								
								<span class="label" id="imagename">강준영.jpg</span>
							</div>
						</div>		
						
					</div>
				</div>				
			
			</div>

		<!-- Footer -->
			<div id="footer">

				<!-- Copyright -->
					<ul class="copyright">
						<li>&copy; Copyright Team Terrier. All rights reserved.</li>
					</ul>

			</div>

		<!-- Scripts -->
			<script src="<c:url value='/resources/js/jquery.min.js'/>"></script>
			<script src="<c:url value='/resources/js/jquery-1.7.min.js'/>"></script>
			<script src="<c:url value='/resources/js/jquery.smartPop.js'/>"></script>
			<script src="<c:url value='/resources/js/jquery.scrolly.min.js'/>"></script>
			<script src="<c:url value='/resources/js/jquery.scrollzer.min.js'/>"></script>
			<script src="<c:url value='/resources/js/skel.min.js'/>"></script>
			<script src="<c:url value='/resources/js/util.js'/>"></script>
			<script src="<c:url value='/resources/js/semantic.min.js'/>"></script>
			<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
			<script src="<c:url value='/resources/js/main.js' />"></script>
			<script>								
				$(document).bind("contextmenu", function(event) { 
				    event.preventDefault();
				    $("div.custom-menu").hide();
				    var node = event.target.nodeName;
				    var Id = event.target.id;
				    if(node === "IMG" || event.target.id === "imagename"){
					    $("<div class='custom-menu'>Custom menu1</div>")
					        .appendTo(".container")
					        .css({top: event.pageY + "px", left: event.pageX + "px"});
				    }
				}).bind("click", function(event) {
				    $("div.custom-menu").hide();
				});
				
				$("img").click(function(){
					
				});
				function otpadd(){
					$.smartPop.open({
						background : "black", 
						width: 400, 
						height: 400, 
						url: '/mdmuserweb/otp'
						});
				}
			</script>

	</body>
</html>