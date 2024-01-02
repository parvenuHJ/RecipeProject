<%@page import="com.smhrd.model.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  errorPage="Error.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" href="./img/android-chrome-512x512.png">
<title>골라봐요 모두의 레시피</title>
<link href="./css/Header.css" rel="stylesheet" type="text/css"/>
<link rel="stylesheet" href="./css/MemberPage.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
</head>
<body>

<%
				//session값 가져오기
				MemberVO loginVO = (MemberVO)session.getAttribute("loginVO");
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

        <div class="home">
            <img class="profile" src="./img/프로필2.png" alt="profile">
            <h3><%=loginVO.getMem_nick() %>님의 페이지 입니다</h3>
            <br><br><br>
            <div class="container">
                <button id="cell_a" onclick="location.href='MemberUpdate.jsp'">회원정보수정</button>
                <button id="cell_b" onclick="location.href='Relike.jsp'">북마크</button>
                <button id="cell_c" onclick="location.href='MemberComment.jsp'">내 댓글</button>
               <button id="cell_d" onclick="location. href='https://mail.naver.com/write/popup?srvid=note&to=gnswhd001@naver.com'">문의사항</button>
            </div>




      

    </div>

</body>
</html>