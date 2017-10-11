<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<title>사원 페이지</title>
		<meta charset="utf-8" />
		<!-- <meta name="viewport" content="width=device-width, initial-scale=1" />-->
		<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
		<link rel="stylesheet" href="<c:url value='/resources/css/jquery.smartPop.css' />" />
		<link rel="stylesheet" href="<c:url value='/resources/css/bootstrap-theme.css' />" />
		<link rel="stylesheet" href="<c:url value='/resources/css/bootstrap.min.css' />" />
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
			
			table {
				margin-top: 30px;
				font-size: 16px;
				color: #000;
			}
			
			th {
				font-weight: bold;
			}
			
			a:hover {text-decoration: none;}
			
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
							<span id="board_title">제어 요청 내역</span>
						
						<table class="table table-hover">
							<thead>
							<tr>
								<th>번호</th>
								<th>제목</th>
								<th>작성자</th>
								<th>작성일</th>
								<th>승인여부</th>
							</tr>
							</thead>
							<tbody>
							<c:forEach items="${list}" var="dto" varStatus="status">
								<tr>
									<td>${count - status.index}</td>
									<td width="400"><a href="/control/view?id=${dto.idcontrol_board}">${dto.title}</a></td>
									<td>${profile.name}</td>
									<td>${dto.date}</td>
									<c:choose>
										<c:when test="${dto.admit == 0}">
											<td>미확인</td>
										</c:when>
										<c:when test="${dto.admit == 1}">
											<td>승인완료</td>
										</c:when>
										<c:when test="${dto.admit == 2}">
											<td>승인거부</td>
										</c:when>
									</c:choose>
								</tr>
							</c:forEach>																																
							</tbody>
						</table>
						<div class="text-center">
							<ul class="pagination pagination-lg">
								<li class="disabled">
								<a href="#" aria-label="Previous">
									<span aria-hidden="true">&laquo;</span>
								</a>
								</li>
								<li><a href="#">1</a></li>
								<li class="active"><a href="#">2</a></li>
								<li><a href="#">3</a></li>
								<li><a href="#">4</a></li>
								<li><a href="#">5</a></li>
								<li>
									<a href="#" aria-label="Next">
										<span aria-hidden="true">&raquo;</span>
									</a>
								</li>						
							</ul>
						</div>
						<table>
						<tr>
							<td>
							<form class="form-inline">
							  <div class="form-group">
							    <select class="form-control">
							    	<option>제목</option>
							    	<option>제목+내용</option>
							    	<option>내용</option>
							    </select>
							    <div class="input-group">
							      <input type="text" class="form-control" name="search">
							    </div>
							    <button type="submit" class="btn btn-primary">검색</button>
							  </div>
							  
							</form>
							</td>					
							<td class="text-right">
								<a href="/control/write" class="btn btn-primary">글쓰기</a>
							</td>
						</tr>
						</table>
						

						
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
			<script src="<c:url value='/resources/js/bootstrap.min.js'/>"></script>
			<script src="<c:url value='/resources/js/semantic.min.js'/>"></script>
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
						url: '/config'
					});
				}
			</script>

	</body>
</html>