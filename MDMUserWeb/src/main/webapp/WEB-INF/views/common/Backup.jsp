<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>						
						<!-- Backup Modal -->
						<div class="modal fade bs-example-modal-sm" id="BackUpModal" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
						  <div class="modal-dialog modal-sm">
						    <div class="modal-content">
						      <div class="modal-header">
						      	<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span style="color:#000;" aria-hidden="true">×</span></button>
						        <h5 style="color:black;font-size: 20px;" class="modal-title" id="exampleModalLabel">백업관리</h5>
						      </div>
						      <div class="modal-body">
									<div class="text-center">
										<a href="#" class="btn btn-default btn-lg" id="image_down"><span style="color: #000;">이미지 다운로드</span></a>
									</div>
									<hr>
									<div class="text-center">
										<a href="#" class="btn btn-default btn-lg" id="phone_down"><span style="color: #000;">연락처 다운로드</span></a>
									</div>
									<span id="temps"></span>
									<hr>
					          </div>
						    </div>
						  </div>
						</div>
						<!-- OTP Modal -->
						<div class="modal fade bs-example-modal-sm" id="OTPModal" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
						  <div class="modal-dialog modal-sm">
						    <div class="modal-content">
						      <div class="modal-header">
						      	<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span style="color:#000;" aria-hidden="true">×</span></button>
						        <h5 style="color:black;font-size: 20px;" class="modal-title" id="exampleModalLabel">OTP</h5>
						      </div>
						      <div class="modal-body">
						      	  <div id="loading" class="text-center"><img id="loading-image" src="<c:url value='/resources/images/loading.gif' />" alt="" /></div>
						          <div class="text-center"><img id="QR" src="" alt="" /></div>
						          <hr>
					          </div>
						    </div>
						  </div>
						</div>