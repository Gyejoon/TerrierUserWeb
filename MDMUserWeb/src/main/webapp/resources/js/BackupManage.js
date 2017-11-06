(function($) {
				$("#image_down").click(function(e){
					var form = $("<form></form");
					form.attr("action", "/common/downloadImg");
					form.attr("method", "post");
					form.appendTo("body");
					
					if(!confirm("다운로드 하시겠습니까?")){
						return;
					}else{
						form.submit();
					}
					
					e.preventDefault();
				});
				
				$("#phone_down").click(function(e){
					var form = $("<form></form");
					form.attr("action", "/common/downloadPhone");
					form.attr("method", "post");
					form.appendTo("body");
					
					if(!confirm("다운로드 하시겠습니까?")){
						return;
					}else{
						form.submit();
					}
					
					e.preventDefault();
				});
				
				$("#OTPModals").click(function(){
					$.ajax({
						url: '/otp',
						type: 'GET',
						success: function(data){
							$("#QR").width("250px");
							$("#QR").height("250px");
							$("#QR").attr("src", data.QR_CODE);
						},
						complete: function(){
							$('#loading').hide();
						},
						error : function(err){
							alert("서버 에러");
						}
					});
				});
				
})(jQuery);