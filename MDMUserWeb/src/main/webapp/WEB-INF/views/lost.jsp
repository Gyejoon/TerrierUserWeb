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
			
			#map {
				margin-top: 20px;
				width: 100%;
				height: 600px;
				background-color: grey;
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
								<li><a href="${pageContext.request.contextPath}/cloud" id="about-link" class="skel-layers-ignoreHref"><span class="icon fa-cloud">백업관리</span></a></li>
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
						<li><a href="#" onclick="javascript:config()" class="icon fa-cog"><span class="label">설정</span></a></li>
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
						<span id="board_title">내 디바이스 위치</span>
						
						<div id="map"></div>
						<script>
							function initMap() {
								var uluru = {lat: 37.4772339, lng: 126.9544534};
								var map = new google.maps.Map(document.getElementById('map'), {
									zoom: 16,
									center: uluru
								});
								var marker = new google.maps.Marker({
									position: uluru,
									map: map
								});
							}
						</script>
						<script async defer 
						src = "https://maps.googleapis.com/maps/api/js?key=AIzaSyAHUEeHC6eKVtvQqP7X1AGK6zg9aNTJUww&callback=initMap">
						</script>
						<hr>
						<h1 style="text-align: center;">Hello World WebSocket Client</h1>
					    <br>
					    	<div style="text-align: center;">
					            <form action="">
					                <input onclick="send_message()" value="Send" type="button">
					                <input id="textID" name="message" value="Hello WebSocket!" type="text"><br>
					            </form>
					        </div>
					        <div id="output"></div>
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
			<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
			<script>
				function otpadd(){
					$.smartPop.open({
						background : "black", 
						width: 400, 
						height: 400, 
						url: '/otp'
						});
				}
				function config(){
					$.smartPop.open({
						background : "black",
						width: 600,
						height: 600,
						url: '/config'
					});
				}
				
				var wsUri = "ws://localhost:8181/websocket/location";
				
				function init(){
					output = document.getElementById("output");
				}
				
				function send_message(){
					websocket = new WebSocket(wsUri);
					websocket.onopen = function(evt){
						onOpen(evt)
					};
					websocket.onmessage = function(evt){
						onMessage(evt)
					};
					websocket.onerror = function(evt){
						onError(evt)
					}
				}
				
				function onOpen(evt){
					writeToScreen("Connected to Endpoint!");
					doSend(textID.value);
				}
				
				function onMessage(evt){
					writeToScreen("Message Received: " + evt.data);
				}
				
				function onError(evt){
					writeToScreen("ERROR : " + evt.data);
				}
				
				function doSend(message){
					writeToScreen("Message Sent: " + message);
					websocket.send(message);
				}
				
				function writeToScreen(message){
					var pre = document.createElement("p");
					pre.style.wordWrap = "break-word";
					pre.innerHTML = message;
					
					output.appendChild(pre);
				}
				
				window.addEventListener("load", init, false);
			</script>			

	</body>
</html>