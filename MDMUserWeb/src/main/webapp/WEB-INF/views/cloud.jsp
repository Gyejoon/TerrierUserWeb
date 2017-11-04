<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<title>사원 페이지</title>
		<meta charset="utf-8" />
		<!--<meta name="viewport" content="width=device-width, initial-scale=1" /> -->
		<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
		<link rel="stylesheet" href="<c:url value='/resources/css/bootstrap-theme.css' />" />
		<link rel="stylesheet" href="<c:url value='/resources/css/bootstrap.min.css' />" />
		<link rel="stylesheet" href="<c:url value='/resources/css/semantic.min.css' />" />
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
				font-size:1.4em;
				font-weight:bold;
				color:teal;
			}
			
			#frm {
				margin-top: 30px;
			}
			
			#comm{
				font-size: 7px;
			}
		</style>
	</head>
	<body>
	
			<div id="main">

				<div class="container">
					<br>
					
					<div class="ui raised segment">
						<a class="ui blue ribbon label">Terrier</a>
							<span id="board_title">백업관리</span>
							<hr>
							<div class="text-center">
								<a href="#" class="btn btn-primary" id="image_down">이미지 다운로드</a>
							</div>
							<hr>
							<div class="text-center">
								<a href="#" class="btn btn-primary" id="phone_down">연락처 다운로드</a>
							</div>
							<span id="temps"></span>
							<hr>
					</div>
				</div>
					
			</div>

		<!-- Scripts -->
			<script src="<c:url value='/resources/js/jquery.min.js'/>"></script>
			<script src="<c:url value='/resources/js/jquery-1.7.min.js'/>"></script>
			<script src="<c:url value='/resources/js/jquery.scrolly.min.js'/>"></script>
			<script src="<c:url value='/resources/js/jquery.scrollzer.min.js'/>"></script>
			<script src="<c:url value='/resources/js/skel.min.js'/>"></script>
			<script src="<c:url value='/resources/js/util.js'/>"></script>
			<script src="<c:url value='/resources/js/semantic.min.js'/>"></script> 
			<script src="<c:url value='/resources/js/jquery.techbytarun.excelexportjs.js'/>"></script> 
			<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
			<script src="<c:url value='/resources/js/main.js' />"></script>
			
			<script>
			
				$("#image_down").click(function(e){
					var form = $("<form></form");
					form.attr("action", "<c:url value='/common/downloadImg' />");
					form.attr("method", "post");
					form.appendTo("body");
					
					form.submit();
					
					e.preventDefault();
				});
				
				$("#phone_down").click(function(e){
					var form = $("<form></form");
					form.attr("action", "<c:url value='/common/downloadPhone' />");
					form.attr("method", "post");
					form.appendTo("body");
					
					form.submit();
					
					e.preventDefault();
				});
			</script>

	</body>
</html>