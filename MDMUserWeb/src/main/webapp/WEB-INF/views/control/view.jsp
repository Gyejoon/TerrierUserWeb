<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<title>사원 페이지</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
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
				font-size: 16px;
				color: #000;
			}
			
			th {
				font-weight: bold;
			}
			
			a:hover {text-decoration: none;}
			
			.form-control {
				font-size: 14px;
				width: 3000px;
				height: 40px;
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
			
				<div class="container" style="width: 1200px; ">
					<br>
					
					<div class="ui raised segment">
						<a class="ui blue ribbon label">Terrier</a>
							<span id="board_title">제어 요청 글</span>								
						
						<div class="ui blue fluid card">
							 <div class="content">
							     <table class="table table-hover">
							        <colgroup>
							            <col width="15%"/>
							            <col width="35%"/>
							            <col width="15%"/>
							            <col width="35%"/>
							        </colgroup>
							        <tbody>
							            <tr>
							                <th scope="row">글 번호</th>
							                <td>${view.idcontrol_board}</td>
							                <th scope="row">승인 여부</th>
							           		<c:choose>
												<c:when test="${view.admit == 0}">
													<td>미확인</td>
												</c:when>
												<c:when test="${view.admit == 1}">
													<td>승인완료</td>
												</c:when>
												<c:when test="${view.admit == 2}">
													<td>승인거부</td>
												</c:when>
											</c:choose>
							            </tr>
							            <tr>
							                <th scope="row">작성자</th>
							                <td>${profile.name}</td>
							                <th scope="row">작성시간</th>
							                <td>${view.regist_date}</td>
							            </tr>
							            <tr>
							                <th scope="row">제목</th>
							                <td colspan="3">${view.title}</td>
							            </tr>
							            <tr id="fileform">
							                <th scope="row">첨부파일</th>
							                <td colspan="3">
								                <input type="hidden" name="idcontrol_board_file" id="idcontrol_board_file" value="${file.idcontrol_board_file}">
								                <a href="#" id="file" name="file">${file.original_file_name}</a>
								                <label id="size">${file.file_size}</label>
							                </td>
							            </tr>
							            <tr>
							                <td colspan="4">${view.contents}</td>
							            </tr>            
							        </tbody>
							    </table>
									<div class="text-right">
									<c:if test="${view.admit == 0}">
										<a href="/control/update?id=${view.idcontrol_board}" class="btn btn-primary" type="button" name="" >수정</a>
										<a href="/control/delete?id=${view.idcontrol_board}" class="btn btn-primary" type="button" name="" id="delete">삭제</a>
									</c:if>
										<a href="#" class="btn btn-primary" type="button" name="" onclick="javascript:history.back()" >목록</a>
									</div>
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
				
				$(document).ready(function(){
					var ori_size = $("#size").text();
					if(ori_size != ""){
						ori_size /= 1024;
						ori_size = ori_size.toFixed(2);
						$("#size").text("(" + ori_size + "kb)");
					}
				});
				
				$("#file").click(function(e){
					e.preventDefault();
					
					var form = $("<form></form");
					form.attr("action", "<c:url value='/common/downloadFile' />");
					form.attr("method", "get");
					form.appendTo("body");
					
					form.append($("#idcontrol_board_file"));
					form.submit();
				});
				
				$("#delete").click(function(e){
					if(!confirm("제어요청 글을 삭제하시겠습니까?")){
						e.preventDefault();
						return;
					}
				});

			</script>

	</body>
</html>