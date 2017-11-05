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
							<span id="board_title">공지사항</span>
						
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
							<c:choose>
								<c:when test="${count <= 0}">
									<tr>
										<td></td>
										<td></td>
										<td><c:out value="요청 내역이  없습니다."></c:out></td>
									</tr>
								</c:when>
								<c:when test="${count > 0}">
								<c:forEach items="${list}" var="dto" varStatus="status">
									<tr>
										<td>${dto.rn}</td>
										<td width="400">
										<a href="/control/view?id=${dto.idcontrol_board}">${dto.title}</a>
										<c:if test="${dto.file_exist == 'Y'}">
											<label class="icon fa-save" id="icon"></label>
										</c:if>
										</td>
										<td>${profile.name}</td>
										<td>${dto.regist_date}</td>
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
								</c:when>
							</c:choose>
							</tbody>
						</table>
						<c:set var="pageCount" value="${count/pageSize+(count%pageSize==0?0:1)}"/>
						<c:set var="startPage" value="${pageGroupSize*(numPageGroup-1)+1}"/>
						<c:set var="endPage" value="${startPage + pageGroupSize-1}"/>
						<c:if test="${count > 0}">
						
						<c:if test="${endPage > pageCount}">
							<c:set var="endPage" value="${pageCount}"/>
						</c:if>
						
						<div class="text-center">
							<ul class="pagination pagination-lg">
							<c:if test="${numPageGroup > 1}">
								<li>
									<a id="leftpage" href="/control?pageNum=${(numPageGroup-2)*pageGroupSize+1}" aria-label="Previous">
										<span aria-hidden="true">&laquo;</span>
									</a>
								</li>
							</c:if>
								<c:forEach var="i" begin="${startPage}" end="${endPage}">
									<c:choose>
										<c:when test="${currentPage == i}">
											<li class="active"><a href="#">${i}</a></li>
										</c:when>
										<c:when test="${currentPage != i}">
											<li><a id="paging_${i}" href="/control?pageNum=${i}">${i}</a></li>
										</c:when>
									</c:choose>
								</c:forEach>
								<c:if test="${numPageGroup < pageGroupCount}">
								<li>
									<a id="rightpage" href="/control?pageNum=${numPageGroup*pageGroupSize+1}" aria-label="Next">
										<span aria-hidden="true">&raquo;</span>
									</a>
								</li>		
								</c:if>
							</ul>
						</div>
						</c:if>
						<table>
						<tr>
							<td>
							<form class="form-inline" id="form_board" method="get" action="/control/search">
							  <div class="form-group">
							    <div class="form-control" style="font-weight: bold; border: thin; color: #000;">제목</div>
								    <select class="form-control" name="search_tit" id="search_tit">
								    	<option value="">제목 선택</option>
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
							    <div class="form-control" style="font-weight: bold; border: thin; color: #000;">내용</div>
							    <div class="input-group">
							      <input type="text" class="form-control" name="search_con" id="search_con" placeholder="내용 입력">
							    </div>
							    <div class="form-control" style="font-weight: bold; border: thin; color: #000;">작성일</div>
							    <div class="input-group">
							      <input type="date" class="form-control" name="search_dat" id="search_dat" placeholder="년도-월-일">
							    </div>
							    <a href="#" class="btn btn-primary" id="search_button">검색</a>
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
				<%@ include file="common/Backup.jsp" %>
			</div>

		<!-- Footer -->
			<div id="footer">

				<!-- Copyright -->
					<ul class="copyright">
						<li>&copy; Copyright KJY. All rights reserved.</li>
					</ul>

			</div>

		<!-- Scripts -->
			<script src="<c:url value='/resources/js/jquery-3.2.1.min.js'/>"></script>
			<script src="<c:url value='/resources/js/jquery.scrolly.min.js'/>"></script>
			<script src="<c:url value='/resources/js/jquery.scrollzer.min.js'/>"></script>			
			<script src="<c:url value='/resources/js/skel.min.js'/>"></script>
			<script src="<c:url value='/resources/js/util.js'/>"></script>
			<script src="<c:url value='/resources/js/bootstrap.min.js'/>"></script>
			<script src="<c:url value='/resources/js/semantic.min.js'/>"></script>
			<script src="<c:url value='/resources/js/BackupManage.js' />"></script>
			<script src="<c:url value='/resources/js/main.js' />"></script>
			
			<script>
				
				$("#search_button").click(function(){
					$("#form_board").submit();
				});
				
				$(function(){
					var url = location.href;
					
					var str = url.substring(url.indexOf('control'), url.indexOf('?'));
					var param = url.slice(url.indexOf('?')+1);
					var search_param = param.split('&');
					if(str == 'control/search'){
						var pageNumhref, pageNum;
						var leftgroupNumhref, rightgroupNumhref, groupNum;
						var endPage = ${endPage};
						for(var i=1; i<=endPage; i++){
							pageNumhref = $("#paging_" + i).attr("href");
							if(pageNumhref != undefined){
								pageNum = pageNumhref.slice(pageNumhref.indexOf('?')+1);
								$("#paging_" + i).attr("href", "?" + search_param[0]
									+ "&" + search_param[1] + "&" + search_param[2]
									+ "&" + pageNum);
							}
						}
						
						leftgroupNumhref = $("#leftpage").attr("href");
						rightgroupNumhref = $("#rightpage").attr("href")
						
						if(leftgroupNumhref != undefined){
							groupNum = leftgroupNumhref.slice(leftgroupNumhref.indexOf('?')+1);
							$("#leftpage").attr("href", "?" + search_param[0]
							+ "&" + search_param[1] + "&" + search_param[2]
							+ "&" + groupNum);
						}
						if(rightgroupNumhref != undefined){
							groupNum = rightgroupNumhref.slice(rightgroupNumhref.indexOf('?')+1);
							$("#rightpage").attr("href", "?" + search_param[0]
							+ "&" + search_param[1] + "&" + search_param[2]
							+ "&" + groupNum);
						}
						
					}
					
				});

			</script>

	</body>
</html>