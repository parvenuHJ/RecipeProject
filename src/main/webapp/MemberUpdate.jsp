<%@page import="com.smhrd.model.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="Error.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" href="./img/android-chrome-512x512.png">
    <title>회원정보 수정</title>
    <link href="./css/Header.css" rel="stylesheet" type="text/css"/>
<link href="./css/MemberUpdate.css" rel="stylesheet" type="text/css"/>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
   

</head>
<body>
<%
		MemberVO loginVO = (MemberVO)session.getAttribute("loginVO");


%>


   <div class="wrap">

        <!-- header -->
        <header>
            <div class="header">
                <div class="h_cont1">
                    <div class="h_icon">
                        <a href="./img/tomato.png"><img class="logo" src="./img/tomato.png" alt="Logo"
                                width="55px"></a>
                    </div>
                </div>
        
                <div class="h_cont2">
                    <li>
                    <input type="text" placeholder="search" class="h_cont2_input" name="food_name">
                    <input type="submit" value="검색"; class="h_cont2_btn">

                    </li>
                    <li><a href="MemberPage.jsp">마이페이지</a></li>
                    <li><a href="MemberLogin.jsp">로그인</a></li>
                    <li><a href="MemberLogout.do">로그아웃</a></li>
                </div>
            </div>
        </header>
    
        <!-- sidebar -->
        <div id="sidebar">
            <div class="navigation">
                <!-- <input type="checkbox" id="expand-menu" name="expand-menu"> -->
                <ul>
                    <li>
                        <a href="MemberPage.jsp">
                            <span class="icon">
                                <span class="material-symbols-outlined">
                                    home
                                </span>
                            </span>
                            <span class="title">홈</span>
                        </a>
                    </li>
                    <li>
                        <a href="MemberUpdate.jsp">
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
                            <span class="title">좋아요</span>
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

        <div class="ui_box">
            <h3>회원정보 수정</h3>
            <br><br>
            <div class="row_wrap">
            <form action="MemberUpdate.do" method="post" >
                <div class="row">
                    <span class="title_content">닉네임</span>
                    <input class="txtfield" type="text" name="mem_nick" value="<%=loginVO.getMem_nick() %>">
                </div>
                <div class="row">
                    <span class="title_content">비밀번호</span>
                    <input class="txtfield" type="password" name="mem_pw" value="<%=loginVO.getMem_pw() %>">
                </div>
                <div class="row">
                    <span class="title_content big">주소 </span>
                    <input class="txtfield big" type="text" name="mem_address" value="<%=loginVO.getMem_address() %>">
                </div>
                <div class="row">
                    <span class="title_content big">휴대폰</span>
                    <input class="txtfield big" type="text" name="mem_tel" value="<%=loginVO.getMem_tel()%>">
                </div>
                <input type="hidden" name="mem_id" value=<%=loginVO.getMem_id() %> >
				<input type="hidden" name="rate_name" value=<%=loginVO.getRate_name()%> >
				
							
                <div class="update_btn">
				<input type="submit" value="수정완료" class="up_btn">
                <!-- <button class="up_btn" type="button" button="update_user"
                    onclick="location.href='MemberUpdate.do'">수정완료</button> -->
                </form>
                 
                <button class="de_btn" type="button" button="delete_user"
                    onclick="location.href='MemberDelete.do?mem_id=<%=loginVO.getMem_id()%>'">회원탈퇴</button>
                </div>    
            </div>
        </div>

    </div>
</body>
</html>
    