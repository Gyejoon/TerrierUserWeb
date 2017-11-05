<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
						<nav id="nav">
							<ul>
								<li><a href="${pageContext.request.contextPath}/profile" id="profile" class="skel-layers-ignoreHref"><span class="icon fa-home">Home</span></a></li>
								<li><a href="${pageContext.request.contextPath}/notice" id="notice" class="skel-layers-ignoreHref"><span class="icon fa-bullhorn">공지사항</span></a></li>
								<li><a href="${pageContext.request.contextPath}/lost" id="lost" class="skel-layers-ignoreHref"><span class="icon fa-phone">분실관리</span></a></li>
								<li><a href="${pageContext.request.contextPath}/control" id="control" class="skel-layers-ignoreHref"><span class="icon fa-envelope">제어요청</span></a></li>
       							<li><a href="#" class="skel-layers-ignoreHref"><span class="icon fa-cloud" data-toggle="modal" data-target="#BackUpModal">백업관리</span></a></li>
       							<c:if test="${profile.OTP eq 'NO'}">
       								<li><a href="#" class="skel-layers-ignoreHref"><span class="icon fa-lock" id="OTPModals" data-toggle="modal" data-target="#OTPModal">OTP 발급</span></a></li>
       							</c:if>
							</ul>
						</nav>