<%@page import="com.smhrd.model.CommentDAO"%>
<%@page import="com.smhrd.model.CommentVO"%>
<%@page import="com.smhrd.model.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="Error.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" href="./img/android-chrome-512x512.png">
<title>댓글 수정</title>
<link href="./css/Header.css" rel="stylesheet" type="text/css"/>
<link href="./css/MemberComment.css" rel="stylesheet" type="text/css"/>
</head>
<body>
<%
				//session값 가져오기
				MemberVO loginVO = (MemberVO) session.getAttribute("loginVO");
				String co_num = request.getParameter("co_num");
				String mem_id = request.getParameter("mem_id");
				CommentDAO dao = new CommentDAO();
				CommentVO comment = dao.CommentDetail(new CommentVO(mem_id, co_num));
				
				System.out.println("co_num : " +co_num);
				System.out.println(mem_id);
				System.out.println(comment.getCo_text());
				
				
				
		%>
   <div class="wrap">
	<!-- header -->
        <header>
            <div class="header">
              <div class="h_cont1">
                <div class="h_icon">
                  <a href="Main.jsp"><img  class="logo" src="./img/tomato.png" alt="Logo" width="55px"></a>
                </div> 
              </div>
                <form action="RecipeSelect.do">
                <div class="h_cont2">
                <li>
                 <input type="text" placeholder="search" class="h_cont2_input" name="food_name">
                      <input type="submit" value="검색"; class="h_cont2_btn">
                </li>
				</form>
				<form>
                <%	if (loginVO == null) {	%>
					<li><a href="MemberLogin.jsp">로그인</a></li>
				<%	} else { %>
                <li><a href="MemberComment.jsp">마이페이지</a></li>
                <li><a href="MemberLogout.do">로그아웃</a></li>
                <%	}%>
            </div>
            </form>
          </div>

      </header>
	</div>	
	
	 <!-- sidebar -->
        <div id="sidebar">
            <div class="navigation">
                <!-- <input type="checkbox" id="expand-menu" name="expand-menu"> -->
                <ul>
                    <li>
                        <a href="mypage_test.html">
                            <span class="icon">
                                <span class="material-symbols-outlined">
                                    home
                                </span>
                            </span>
                            <span class="title">홈</span>
                        </a>
                    </li>
                    <li>
                        <a href="test_of_update.html">
                            <span class="icon">
                                <span class="material-symbols-outlined">
                                    account_circle
                                </span>
                            </span>
                            <span class="title">회원정보수정</span>
                        </a>
                    </li>
                    <li>
                        <a href="test_of_like.html">
                            <span class="icon">
                                <span class="material-symbols-outlined">
                                    favorite
                                </span>
                            </span>
                            <span class="title">북마크</span>
                        </a>
                    </li>
                    <li>
                        <a href="test_of_comment.html">
                            <span class="icon">
                                <span class="material-symbols-outlined">
                                    chat_bubble
                                </span>
                            </span>
                            <span class="title">내 댓글</span>
                        </a>
                    </li>
                    <li>
                        <a href="mailto:smart1234@gmail.com?body=문의사항을 작성해주세요.">
                            <span class="icon">
                                <span class="material-symbols-outlined">
                                    mail
                                </span>
                            </span>
                            <span class="title">문의사항</span>
                        </a>
                    </li>
                </ul>        
            </div>
        </div>
	
	
	
 <!-- 댓글 영역 -->

   <section id="section">
            <div class="title">
                <h3>내 댓글</h3>
            </div>
            <div class="content">
               <form action = "CommentUpdate.do" method="post" enctype="multipart/form-data"> 
                    <table>
                        <tr>
                            <td class="profile_td_1">
                                <div class="text_output">
                                   <textarea   name="co_text"  style="resize: none;"><%=comment.getCo_text()%></textarea>		
									<input  type="file"  name="co_img" style="float: right;">
                                </div>
                                
                        </tr>
                        <tr>
                            <td class="profile_td_2">
                                <p style="text-align: right;" >
                                	<input type="hidden" name="co_num" value="<%=co_num %>">
                                   <input type="submit" value="댓글수정">
                                </p>
                            </td>
                        </tr>
                    </table>
                </form>
            </div>
        </section>
   
     




</body>
</html>