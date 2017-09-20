<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<title>사원 페이지</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<script src="<c:url value='/resources/js/jquery-1.7.min.js'/>"></script>
		<style>
			#loading {
			 width: 100%;   
			 height: 100%;   
			 top: 0px;
			 left: 0px;
			 display: block;
			 opacity: 0.7;   
			 background-color: #fff;   
			 z-index: 99; }  
			  
			#loading-image {   
			 position: absolute; 
			 top: 50%;   
			 left: 50%;  
			 z-index: 100; }
			 
		</style>
		<script type="text/javascript">
			$(window).load(function() {    
				$('#loading').hide();  
			});
		</script>
	<body>
		<center>
		<div>
			<div id="loading"><img id="loading-image" src="<c:url value='/resources/images/loading.gif' />" alt="" /></div>
			<img id="QR"src="${otpinfo.QR_CODE}" alt="" />			
		</div>	
		</center>
	</body>
</html>