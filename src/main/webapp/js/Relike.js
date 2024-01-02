
				// on() 메소드 -> 지정 선택자에게 이벤트 연결해주는 메소드
				$('.Re_like').on('click', function(){
					var params={
						mem_id : $('#mem_id').val()
						,re_code : $('#re_code').val()
						
					} 
					
					$.ajax({
						url : "RelikeInsert.do", /* 어디로 보낼지? */
						type : "post", /* 어떤 방식으로 보낼지? */		
						data : params,	/* 어떤 데이터를 보낼지? */
						dataType : "int",
						success : function(data){
							if(data > 0){
							alert("북마크 완료!");
							}else{
								alert("북마크 실패")
							}
						
						
						}, /* 성공 시 */	
						error : function(e){
							
							
						}, /* 실패 시 */
					})
					
				});
			
