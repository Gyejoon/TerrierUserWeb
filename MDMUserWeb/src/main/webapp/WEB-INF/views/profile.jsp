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
			
			table {
				color: #000;
				font-size: 15px;
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

				<div class="container" style="width: 1200px; ">
					<br>
					<div class="row">
					<div class="col">					
						<div class="ui card" style="width: 550px;">
						<a class="ui blue label"><span style="font-size:20px;">디바이스  현황</span></a>
						<div class="text-center">
							<i class="icon fa-wifi"></i> <a class="ui green button" style="margin-left: 50px;" id="wifi">${manage.wifi}</a><br>
							<i class="icon fa-bluetooth"></i> <a class="ui green button" style="margin-left: 50px;" id="bluetooth">${manage.bluetooth}</a><br>
							<i class="icon fa-signal"></i> <a class="ui green button" style="margin-left: 50px;" id="tethering">${manage.tethering}</a><br>
							<i class="icon fa-camera"></i> <a class="ui green button" style="margin-left: 50px;" id="camera">${manage.camera}</a><br>
							<i class="unmute icon"></i> <a class="ui green button" style="margin-left: 50px;" id="voicerecord">${manage.voiceRecord}</a><br>
						</div>
						</div>
					</div>
					<div class="col">
						<div class="ui card" style="width: 550px;">
						<a class="ui blue label"><span style="font-size:20px;">기기 검사 기록</span></a>
						<div class="text-center">
							최근 기기 검사 날짜 : 2017-11-08 <br>
							보안 상태 : 안전 <br>
							변조탐지 결과 : 정상 <br>
							루팅탐지 결과 : 정상 <br>
							권장 기기 검사 날짜 : 2017-11-09 <br>
						</div>
						</div>
					</div>
					</div>
					<div class="row">
					<div class="col">
					<div class="ui card" style="width: 550px;">
					<a class="ui blue label"><span style="font-size:20px;">내 디바이스 관리</span></a>
					<div class="text-center">
						<div class="ui four buttons">
							<button class="ui green button" id="numberback">연락처 백업</button>
							<button class="ui green button" id="imageback">이미지 백업</button>
							<button class="ui red button" id="location">위치 찾기</button>
							<button class="ui red button" id="bell">벨 울리기</button>
							<input type="hidden" value="${manage.gps}" id="locationval"><input type="hidden" value="${manage.alarm}" id="bellval">
						</div>
					</div>
					</div>
					</div>
					<div class="col">
					<div class="ui card" style="width: 550px;">
					<a class="ui blue label"><span style="font-size:20px;">출퇴근 현황</span></a>
					<div class="text-center">
							<a style="width: 550px;" class="ui red button" id="active">${manage.active}</a>
					</div>
					</div>
					</div>
					</div>
					<div class="row">
					<div class="col">
						<div class="ui card" style="width: 1140px;">
						<a class="ui blue label"><span style="font-size:20px;">앱  정보</span></a>
						<div class="row" style="color:#000; size: 17px;">
							<div class="col" style="width: 305px; margin-left: 15px;">
								<span style="font-size:18px; font-weight: bold;">이름</span>
							</div>
							<div class="col" style="width: 180px; margin-left: 70px;">
								<span style="font-size:18px; font-weight: bold;">사이즈</span>
							</div>
							<div class="col" style="width: 300px;">
								<span style="font-size:18px; font-weight: bold;">버전</span>
							</div>
						</div>
						<div style="overflow:scroll; width:1140px; height:300px; padding:10px;">
						<table class="table table-hover"><c:forEach items="${applist}" var="dto" varStatus="status"><tr><td width="375"><a href="https://play.google.com/store/apps/details?id=${dto.packagename}" target="_blank">${dto.name}</a></td><td>${dto.size}</td><td>${dto.version}</td></tr></c:forEach>
						</table>
						</div>
					</div>
					</div>	
				</div>

				</div>
				<!-- Backup Modal -->		
				<%@ include file="common/Backup.jsp" %>	
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
			<script src="<c:url value='/resources/js/semantic.js'/>"></script>
			<script src="<c:url value='/resources/js/BackupManage.js' />"></script>
			<script src="<c:url value='/resources/js/main.js' />"></script>
			<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
			<script>
			$(function(){
				if('${manage.wifi}' == 'off'){$("#wifi").attr('class', 'ui red button');}
				if('${manage.bluetooth}' == 'off'){$("#bluetooth").attr('class', 'ui red button');}
				if('${manage.camera}' == 'off'){$("#camera").attr('class', 'ui red button');}
				if('${manage.tethering}' == 'off'){$("#tethering").attr('class', 'ui red button');}
				if('${manage.voiceRecord}' == 'off'){$("#voicerecord").attr('class', 'ui red button');}
				if('${manage.active}' == '출근'){$("#active").attr('class', 'ui green button');}
				if('${manage.alarm}' == 'on'){$("#bell").attr('class', 'ui green button');}
				if('${manage.gps}' == 'on'){$("#location").attr('class', 'ui green button');}
				
				$("#numberback").click(function(){
					if(!confirm("연락처 백업을 하시겠습니까?")){
						return;
					}
					$.ajax({
						url: 'https://www.terrier.co19.kr:55356/process/devicepush?controller=Backup&emp=${profile.employee_num}&onoff=Number',
						type: 'GET',
						dataType: 'jsonp',
						jsonp: 'callback',
						success: function(data){
							alert("연락처 백업 성공");
						},
						error: function(err){
							alert("에러 발생");
							alert(err);
						}
					});
				});
				$("#imageback").click(function(){
					if(!confirm("이미지 백업을 하시겠습니까?")){
						return;
					}
					$.ajax({
						url: 'https://www.terrier.co19.kr:55356/process/devicepush?controller=Backup&emp=${profile.employee_num}&onoff=Img',
						type: 'GET',
						dataType: 'jsonp',
						jsonp: 'callback',
						success: function(data){
							alert("이미지 백업 성공");
						},
						error: function(err){
							alert("에러 발생");
							alert(err);
						}
					});
				});
				$("#location").click(function(){
					var onoff = '';
					if($("#locationval").val() == 'off'){
						onoff = 'on';
					}else{
						onoff = 'off';
					}
					if(!confirm("위치 찾기 실행을 하시겠습니까?")){
						return;
					}
					$.ajax({
						url: 'https://www.terrier.co19.kr:55356/process/devicepush?controller=Gps&emp=${profile.employee_num}&onoff='+onoff.toUpperCase(),
						type: 'GET',
						dataType : 'jsonp',
						jsonp: 'callback',
						success: function(data){
							if(onoff == 'on'){
								alert("내 디바이스 위치 찾기 실행");
								$("#locationval").val(onoff);
								$("#location").attr('class', 'ui green button');
							}else{
								alert("내 디바이스 위치 찾기 끄기");
								$("#locationval").val(onoff);
								$("#location").attr('class', 'ui red button');
							}
						},
						error : function(err){
							alert("에러 발생");
							alert(err);
						}
					});
				});
				$("#bell").click(function(){
					var onoff = '';
					if($("#bellval").val() == 'off'){
						onoff = 'on';
					}else{
						onoff = 'off';
					}
					if(!confirm("벨 울리기 실행을 하시겠습니까?")){
						return;
					}
					$.ajax({
						url: 'https://www.terrier.co19.kr:55356/process/devicepush?controller=Alarm&emp=${profile.employee_num}&onoff='+onoff.toUpperCase(),
						type: 'GET',
						dataType : 'jsonp',
						jsonp: 'callback',
						success: function(data){
							if(onoff == 'on'){
								alert("벨 울림 실행");
								$("#bellval").val(onoff);
								$("#bell").attr('class', 'ui green button');
							}else{
								alert("벨 울림 끄기");
								$("#bellval").val(onoff);
								$("#bell").attr('class', 'ui red button');
							}
						},
						error : function(err){
							alert("에러 발생");
							alert(err);
						}
					});
				});
			});
			</script>

	</body>
</html>