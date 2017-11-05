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
			
			.form-control {
				font-size: 14px;
				width: 100%;
				height: 40px;
			}
			
			#file_id {
				width: 100%;
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
						<%@ include file="../common/nav.jsp" %>
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
							<span id="board_title">제어 요청 글쓰기</span>								
						
						<div class="ui blue fluid card">
							 <div class="content">
						       		 
								<form class="content ui form" id="form_board" method="post" action="/control/write" enctype="multipart/form-data">

									<div class="two fields">
							    		<div class="field">
							      			<label> 제목</label>
											<select class="form-control" name="title" id="title_tit">
												<option>와이파이 차단</option>
												<option>와이파이 허용</option>
												<option>블루투스 차단</option>
												<option>블루투스 허용</option>
												<option>카메라 차단</option>
												<option>카메라 허용</option>
												<option>테더링 차단</option>
												<option>테더링 허용</option>
												<option>음성녹음 허용</option>
												<option>음성녹음 차단</option>
											</select>
										</div>
										<div class="field"></div>
									</div>
											
									<div class="field">
							    		<label> 내용</label>
							    		<textarea class ="form-control" id="contents_id" name="contents" rows="15" cols="80"></textarea>
							  		</div>
							  		
							  		<div class="field">
							  			<label> 첨부파일</label>
							  			<input type="file" class="form-control" name="file" id="file_id"> 
							  		</div>
									<div class="text-right">
										<a href="#" class="btn btn-primary" id="board_add" name="">추가</a>
										<a href="#" class="btn btn-primary" name="" onclick="javascript:history.back()" >목록</a>
									</div>
								</form>
							</div>
						</div>
						
					</div>
				</div>
				<%@ include file="../common/Backup.jsp" %>
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
			<script src="<c:url value='/resources/js/jquery.smartPop.js'/>"></script>
			<script src="<c:url value='/resources/js/jquery.scrolly.min.js'/>"></script>
			<script src="<c:url value='/resources/js/jquery.scrollzer.min.js'/>"></script>
			<script src="<c:url value='/resources/js/skel.min.js'/>"></script>
			<script src="<c:url value='/resources/js/util.js'/>"></script>
			<script src="<c:url value='/resources/ckeditor/ckeditor.js'/>"></script>
			<script src="<c:url value='/resources/js/bootstrap.min.js'/>"></script>
			<script src="<c:url value='/resources/js/semantic.min.js'/>"></script>
			<script src="<c:url value='/resources/js/BackupManage.js' />"></script>
			<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
			<script src="<c:url value='/resources/js/main.js' />"></script>
			
			<script>
				window.onload = function(){
					CKEDITOR.replace('contents');
				}
			
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
				
				$("#board_add").click(function(e){
					e.preventDefault();
					
					if($("#title_tit").val() == ""){
						alert("제목을 입력해 주세요.");
						return;
					}
					if(!confirm("제어요청 글을 작성하시겠습니까?")){
						return;
					};
					$("#form_board").submit();
				});

			</script>

	</body>
</html>