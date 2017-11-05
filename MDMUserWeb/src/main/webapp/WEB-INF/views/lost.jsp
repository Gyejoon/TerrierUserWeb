<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<title>사원 페이지</title>
		<meta charset="utf-8" />
		<!-- <meta name="viewport" content="width=device-width, initial-scale=1" />-->
		<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
		<link rel="stylesheet" href="<c:url value='/resources/css/semantic.min.css' />" />
		<link rel="stylesheet" href="<c:url value='/resources/css/bootstrap-theme.css' />" />
		<link rel="stylesheet" href="<c:url value='/resources/css/bootstrap.min.css' />" />
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
					<%@ include file="common/nav.jsp" %>

				</div>

				<div class="bottom">
					<ul class="icons">
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
							var uluru = {lat: ${location.latitude}, lng: ${location.longitude}};
							var contentString = '<div style="width:180px;height:140px;color:#000;">';
							var contentString1 = '위치주소 : ${address}<hr><p class="text-center"><a class="btn btn-default" data-toggle="modal" data-target="#myModal">분실신고</a>';
							var contentString2 = '</p></div>';
							var contentString3 = contentString+=contentString1+=contentString2;
							
							function initMap() {
								var map = new google.maps.Map(document.getElementById('map'), {
									zoom: 16,
									center: uluru
								});
								
								var marker = new google.maps.Marker({
									position: uluru,
									map: map,
									title: '클릭하면 상세한 주소를 확인할 수 있습니다.'
								});
								
								
								var infowindow = new google.maps.InfoWindow({
									content: contentString3
								});
								
								infowindow.open(map, marker);

								google.maps.event.addListener(marker, 'click', function(){
									infowindow.open(map, marker);
								});
							}
							
							google.setOnLoadCallback(initMap);
							google.maps.event.addDomListener(window, 'load', initMap);
						</script>
						<script async defer 
						src = "https://maps.googleapis.com/maps/api/js?key=AIzaSyAHUEeHC6eKVtvQqP7X1AGK6zg9aNTJUww&callback=initMap">
						</script>
						<hr>
						<!-- Modal -->
						<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
						  <div class="modal-dialog">
						    <div class="modal-content">
						      <div class="modal-header">
						        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span style="color:#000;" aria-hidden="true">×</span></button>
						        <h5 style="color:black;font-size: 20px;" class="modal-title" id="exampleModalLabel">분실 신고</h5>
						      </div>
						      <div class="modal-body">
							  	<form id="form_board" method="post" action="/request/lost">
							          <div class="form-group">
							            <label style="color:black;font-size:15px; font-weight:bold;" for="recipient-name" class="control-label">작성자</label>
							            <input type="text" class="form-control" id="recipient-name" name="name" value="${profile.employee_num}" readonly>
							          </div>
							          <div class="form-group">
							            <label style="color:black;font-size:15px; font-weight:bold;" for="message-text" class="control-label">신고내용</label>
							            <textarea class="form-control" id="message-text" name="contents"></textarea>
							          </div>
						      	</form>
					          </div>
						      <div class="modal-footer">
						        <a class="btn btn-default" data-dismiss="modal">취소</a>
						        <a class="btn btn-primary" id="requestlost" onclick="javascript:lostsubmit()">전송</a>
						      </div>
						    </div>
						  </div>
						</div>
						<!-- Backup Modal -->		
						<%@ include file="common/Backup.jsp" %>		
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
			<script src="<c:url value='/resources/js/jquery-3.2.1.min.js'/>"></script>
			<script src="<c:url value='/resources/js/jquery.scrolly.min.js'/>"></script>
			<script src="<c:url value='/resources/js/jquery.scrollzer.min.js'/>"></script>			
			<script src="<c:url value='/resources/js/bootstrap.min.js'/>"></script> 
			<script src="<c:url value='/resources/js/skel.min.js'/>"></script>
			<script src="<c:url value='/resources/js/util.js'/>"></script>
			<script src="<c:url value='/resources/js/semantic.min.js'/>"></script>
			<script src="<c:url value='/resources/js/BackupManage.js' />"></script>
			<script src="<c:url value='/resources/js/main.js' />"></script>
			<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
			<script>				
				function lostsubmit(){
					var contents = $("#message-text").val();
					var blank_pattern = /^\s+|\s+$g/;
					
					if(contents == "" || contents.length <= 0 || contents == null){
						alert("신고 내용을 작성해 주세요.");
						$("#message-text").focus();
						return;
					}else if(contents.replace(blank_pattern, "") == ""){
						alert("신고 내용을 작성해 주세요.");
						$("#message-text").focus();
						return;
					}
					if(!confirm("분실신고 요청을 하시겠습니까?")){
						return;
					};
					
					alert("분실신고 요청이 완료되었습니다. \n수분 내로 처리할 예정이오니 잠시만 기다려주세요.");
					$("#form_board").submit();
				}
				
				var wsUri = "ws://www.terrier.co19.kr/websocket/location";
				
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
					};
				}
				
				function onOpen(evt){
					doSend("hello");
				}
				
				function onMessage(evt){
					var location = evt.data.split(":");
					uluru.lat = parseFloat(location[0]);
					uluru.lng = parseFloat(location[1]);
					contentString3 = location[2];
					initMap();
				}
				
				function onError(evt){
					alert("서버와의 연결이 불안정 합니다.");
				}
				
				function doSend(message){
					websocket.send(message);
				}
				
				
				window.onload = send_message;
			</script>			

	</body>
</html>