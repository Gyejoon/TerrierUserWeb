<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<title>��� ������</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
		<link rel="stylesheet" href="<c:url value='/resources/css/jquery.smartPop.css' />" />
		<link rel="stylesheet" href="<c:url value='/resources/css/main.css' />" />
		<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
		<!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->
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
								<c:if test="${profile.OTP eq 'NO'}">
       								<li><a href="#" onclick="javascript:otpadd()" id="contact-link" class="skel-layers-ignoreHref"><span class="icon fa-lock">OTP</span></a></li>
       							</c:if>
								<li><a href="${pageContext.request.contextPath}/profile" id="notice" class="skel-layers-ignoreHref"><span class="icon fa-bullhorn">��������</span></a></li>
								<li><a href="${pageContext.request.contextPath}/lost" id="lost" class="skel-layers-ignoreHref"><span class="icon fa-phone">�нǰ���</span></a></li>
								<li><a href="${pageContext.request.contextPath}/control" id="control" class="skel-layers-ignoreHref"><span class="icon fa-envelope">�����û</span></a></li>
       							<li><a href="#" onclick="javascript:config()" id="contact-link" class="skel-layers-ignoreHref"><span class="icon fa-cloud">�������</span></a></li>
       							<li><a href="${pageContext.request.contextPath}/logout" id="contact-link" class="skel-layers-ignoreHref"><span class="icon fa-sign-out">�α׾ƿ�</span></a></li>
							</ul>
						</nav>

				</div>

			</div>

		<!-- Main -->
			<div id="main">

				<!-- Intro -->
					<section id="top" class="one dark cover">
						<div class="container">

							<header>
								<h2 class="alt">��å���� ������<br />
							</header>


							<footer>
								
							</footer>

						</div>
					</section>
					
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
			<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
			<script src="<c:url value='/resources/js/main.js' />"></script>
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
						url: '/cloud'
					});
				}
				
				$("#notice").click(function(){
					$("#notice").attr("href", );
					$("#leftpage").attr("href", "?" + search_param[0]
				});
				
			</script>
	</body>
</html>