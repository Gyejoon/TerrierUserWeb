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
						<span id="board_title">홈</span>
						
						<hr>
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

			</script>			

	</body>
</html>