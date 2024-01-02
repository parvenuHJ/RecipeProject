<%@page import="com.smhrd.model.CommentVO"%>
<%@page import="java.util.List"%>
<%@page import="com.smhrd.model.CommentDAO"%>
<%@page import="com.smhrd.model.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="Error.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" href="./img/android-chrome-512x512.png">
<title>골라봐요 모두의 레시피</title>
<link href="./css/Header.css" rel="stylesheet" type="text/css"/>
<link href="./css/MemberComment.css" rel="stylesheet" type="text/css"/>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
</head>
<body>

<%
				//session값 가져오기
				MemberVO loginVO = (MemberVO) session.getAttribute("loginVO");
				CommentDAO dao = new CommentDAO();
				String mem_id = loginVO.getMem_id();
				List<CommentVO> CommentList = dao.CommentMember(mem_id);
				System.out.println("리스트사이즈 : " + CommentList.size());

		%>
   <div class="wrap">
<!-- header -->
		<header>
			<div class="header">
				<div class="h_cont1">
					<div class="h_icon">
						<a href="Main.jsp"><img class="logo" src="./img/tomato.png"
							alt="Logo"></a>
					</div>
				</div>
				<form action="RecipeSelect.do">
					<div class="h_cont2">
						<li><input type="text" placeholder="search"
							class="h_cont2_input" name="food_name"> <input
							type="submit" value="검색" ; class="h_cont2_btn"></li>
				</form>
				<%
				if (loginVO == null) {
				%>
				<li><a href="MemberLogin.jsp">로그인</a></li>
				<%
				} else {
				%>
				<li><a href="MemberPage.jsp"><img src="./img/프로필6.png"
						alt="" width="35px"></a></li>
				<li><a href="MemberLogout.do">로그아웃</a></li>
				<%
				}
				%>
			</div>
	</div>
	</header>


  <!-- sidebar -->
        <div id="sidebar">
            <div class="navigation">
                <!-- <input type="checkbox" id="expand-menu" name="expand-menu"> -->
                <ul>
                    <li>
                        <a href="Main.jsp">
                            <span class="icon">
                                <span class="material-symbols-outlined">
                                    home
                                </span>
                            </span>
                            <span class="title">홈</span>
                        </a>
                    </li>
                    <li>
                        <a href="MemberPage.jsp">
                            <span class="icon">
                                <span class="material-symbols-outlined">
                                    account_circle
                                </span>
                            </span>
                            <span class="title">회원정보</span>
                        </a>
                    </li>
                    <li>
                        <a href="Relike.jsp">
                            <span class="icon">
                                <span class="material-symbols-outlined">
                                    favorite
                                </span>
                            </span>
                            <span class="title">북마크</span>
                        </a>
                    </li>
                    <li>
                        <a href="MemberComment.jsp">
                            <span class="icon">
                                <span class="material-symbols-outlined">
                                    chat_bubble
                                </span>
                            </span>
                            <span class="title">내 댓글</span>
                        </a>
                    </li>
                    <li>
                        <a href="https://mail.naver.com/write/popup?srvid=note&to=gnswhd001@naver.com">
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
                <form class="form">
                <%for(int i = 0; i < CommentList.size(); i++){ 
					System.out.println("전체 co_num : " + CommentList.get(i).getCo_num());

				%>
                    <table>
                        <tr>
                            <td class="profile_td_1">
                                <div class="text_output">
                                   <%=CommentList.get(i).getCo_text() %>
                                </div>
                                <%if(CommentList.get(i).getCo_img() != null){ %>
                                <div class="com_img">
                                <img alt="댓글이미지" src="./file/<%=CommentList.get(i).getCo_img()%>">
                                </div>
                                <%} %>
                            </td>
                        </tr>
                                <%if(CommentList.get(i).getMem_id() != null && CommentList.get(i).getMem_id().equals(loginVO.getMem_id()) ) 
									{%>
									<form action="CommentUpdate" method="post">
                        <tr>
                            <td class="profile_td_2">
                                <p style="text-align: right;" >
                                    <a href="CommentModify.jsp?co_num=<%=CommentList.get(i).getCo_num() %>&mem_id=<%=CommentList.get(i).getMem_id() %>" type="button" id="btn" onclick="answerEdit()" class="btn-primary">수정</a>&nbsp;&nbsp;|
                                    </form>
                                    <a onclick="return confirm('정말로 삭제하시겠습니까?')" href= "CommentDelete.do?co_num=<%=CommentList.get(i).getCo_num() %>" class="btn-primary">삭제</a>&nbsp;&nbsp;
                                </p>
                            </td>
                        		<%} %>
                        </tr>
                    </table>
                   <%} %>
                </form>
            </div>
        </section>

    </div>



</body>
</html>