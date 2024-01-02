
				// on() 메소드 -> 지정 선택자에게 이벤트 연결해주는 메소드
				$('.commentInsert').on('click', function(){
					var params={
						mem_id : $('#mem_id').val()
						,re_code : $('#re_code').val()
						,co_text : $('#cmt_tx_content1').val()
						,food_name : $('#food_name').val()
						,co_img : $('#file_1').val()
					}
					
					$.ajax({
						url : "CommentInsert.do", /* 어디로 보낼지? */
						type : "post", /* 어떤 방식으로 보낼지? */		
						data : params,	/* 어떤 데이터를 보낼지? */
						dataType : "json",
						success : function(result){
							
							if(result>0){
								$('#reply').html('댓글 등록이 성공하였습니다.')
								$('#cmt_tx_content1').val("");
							}else{
								$('#reply').html('댓글 등록이 실패하였습니다.')
								$('#cmt_tx_content1').val("");
							}
							
						
						}, /* 성공 시 */	
						error : function(e){
							alert('댓글을 등록하지 못 했습니다.')
							
						}, /* 실패 시 */
					})
					
				});