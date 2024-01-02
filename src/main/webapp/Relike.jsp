<%@page import="com.smhrd.controller.RecipeSelect"%>
<%@page import="com.smhrd.model.RecipeVO"%>
<%@page import="com.smhrd.model.RecipeDAO"%>
<%@page import="com.smhrd.model.MemberVO"%>
<%@page import="com.smhrd.model.MemberDAO"%>
<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="com.smhrd.model.RelikeVO"%>
<%@page import="java.util.List"%>
<%@page import="com.smhrd.model.RelikeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" href="./img/android-chrome-512x512.png">
    <title>좋아요</title>
    <link rel="stylesheet" href="./css/Relike.css"> 
    <link rel="stylesheet" href="./css/Header.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />

</head>
<body>

<%
      //session값 가져오기
      MemberVO loginVO = (MemberVO) session.getAttribute("loginVO");
      String mem_id = loginVO.getMem_id();
      
      RelikeDAO dao = new RelikeDAO();
      List<RecipeVO> RelikeSelectList = dao.RelikeSelect(mem_id);
      System.out.println("좋아요리스트 :" +RelikeSelectList.size());
      
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

      
        
        <div class="title">
		<h2>나의 북마크</h2>
	</div>

<div class="cardWrap">
		<!-- 아이스크림 메뉴판 전체 영역 -->
		<%if(RelikeSelectList.size() == 0) {%>
		<h1>북마크한 레시피가 없습니다</h1>

		<%} else{ %>
		<%for(int i=0; i<RelikeSelectList.size(); i++) { %>
		<div class="BoardWrap">

			<!-- 아이스크림 메뉴 하나의 영역 -->
			<div class="Board">


				<a class="a_board"
					href="RecipeOne.do?food_name=<%=RelikeSelectList.get(i).getFood_name()%>&re_code=<%=RelikeSelectList.get(i).getRe_code()%>">
					<img class="BoardImg"
					src="<%=RelikeSelectList.get(i).getRe_url() %>">
				</a>


			</div>

			<div class="Boardtitle">
				<div class="Boardname"><%=RelikeSelectList.get(i).getFood_name()%></div>

				<div class="Boardname2" style="margin-right: 40px">
					⭐<%=RelikeSelectList.get(i).getRe_level()%>
					🕒<%=RelikeSelectList.get(i).getRe_time()%>
					👩<%=RelikeSelectList.get(i).getRe_per() %>
					
										
					<form action="RelikeDelete.do" method="post" >
                    	<input type="hidden"  name="mem_id" value="<%=loginVO.getMem_id()%>">
                    	<input type="hidden"  name="re_code" value="<%=RelikeSelectList.get(i).getRe_code() %>" >
						<span>
                    	<input type="submit" value="삭제">
                		</span>
                	</form> 
                </div>

			</div>

		</div>
		<%} %>
		<%} %>
	</div>
	
</body>
</html>