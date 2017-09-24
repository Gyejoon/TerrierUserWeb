<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, height=device-height, initial-scale=1">
  	<title>사원 로그인</title>
    <link rel='stylesheet prefetch' href='http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css'>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
	<script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
  	<link href="<c:url value='/resources/css/style.css' />"  rel="stylesheet" />
</head>

<body>
  <div class="login-form">
     <h1>TERRIER</h1>

     <form action="j_spring_security_check" method="post">
       <div class="form-group ">
         <input type="text" class="form-control" placeholder="사원번호" name="emp" required>
         <i class="fa fa-user"></i>
       </div>
       <div class="form-group log-status">
         <input type="password" class="form-control" placeholder="비밀번호" name="password" required>
         <i class="fa fa-lock"></i>
       </div>
       <c:if test="${SPRING_SECURITY_LAST_EXCEPTION != NULL}">
        	<span class="alert">사원번호가 존재하지 않거나 비밀번호가 틀립니다.</span><br/>
       </c:if>
       <a class="link" href="#">Lost your password?</a>
       <button type="submit" class="log-btn">로그인</button>
     </form>
     
   </div>
</body>
</html>