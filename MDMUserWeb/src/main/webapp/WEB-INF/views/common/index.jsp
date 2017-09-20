<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="s" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, height=device-height, initial-scale=1">
		
		<title>홈 화면</title>
		
		<link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.0.2/css/bootstrap.min.css"> <!-- load bootstrap css -->
    	<link rel="stylesheet" href="//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.min.css"> <!-- load fontawesome -->
    	
    	<style>
        	body { padding-top:80px; }
        	
			@font-face {
				font-family: 'Nanum Gothic'; font-style: normal; font-weight: 400;
				src: url('../public/NanumGothic-Regular.eot');
				src: local('NanumGothic'),
					url('../public/NanumGothic-Regular.eot?#iefix') format('embedded-opentype'),
					url('../public/NanumGothic-Regular.woff2') format('woff2'),
					url('../public/NanumGothic-Regular.woff') format('woff'),
					url('../public/NanumGothic-Regular.ttf') format('truetype');
			}
        	
        	h1, p, a { font-family: 'Nanum Gothic' }
    	</style>
    
	</head>
	<body>
		<div class="container">
		    <div class="jumbotron text-center">
		        <h1><span class="fa fa-shopping-cart"></span> 사원 프로필 홈</h1>
				<br>
				<s:authorize ifAnyGranted="ROLE_USER">
					<p>로그인되어 있습니다.</p>
					<br>
					<a href="${pageContext.request.contextPath}/profile" class="btn btn-default"><span class="fa fa-user"></span>프로필</a>
					<a href="${pageContext.request.contextPath}/logout" class="btn btn-default"><span class="fa fa-user"></span>로그아웃</a>
				</s:authorize>
				<s:authorize ifNotGranted="ROLE_USER">
					<p>로그인하세요.<p>
					<br>
			        <a href="${pageContext.request.contextPath}/login" class="btn btn-default"><span class="fa fa-user"></span>로그인</a>
				</s:authorize>
		    </div>
		
		</div>
	</body>
</html>
