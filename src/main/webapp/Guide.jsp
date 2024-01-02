<%@page import="com.smhrd.model.MemberVO"%>
<%@page import="com.smhrd.model.GuideVO"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="com.smhrd.model.GuideDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="Error.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" href="./img/android-chrome-512x512.png">
<title>골라봐요 모두의 레시피</title>

<link href="./css/Header.css" rel="stylesheet" type="text/css" />
<link href="./css/Board.css" rel="stylesheet" type="text/css" />


	<%
	GuideDAO dao = new GuideDAO();
	List<GuideVO> GuideList = dao.GuideShow();
	System.out.println(GuideList.size());
	MemberVO loginVO = (MemberVO) session.getAttribute("loginVO");
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
				<form action="RecipeSelect.do" class="right">
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
		</header>
	</div>


</head>
<body>

	<div class="title">
		<h2>초보자 가이드</h2>
	</div>

	<div class="cardWrap">
		<!-- 아이스크림 메뉴판 전체 영역 -->
		<%
			for (int i = 0; i < GuideList.size(); i++) {
			%>
		<div class="BoardWrap">

			<!-- 아이스크림 메뉴 하나의 영역 -->
			<div class="Board">
				<a href="<%=GuideList.get(i).getCho_url()%>" class="a_board">
					<div class="board_b">
						<img class="BoardImg" src="<%=GuideList.get(i).getCho_th()%>">
					</div>
					<div class="Boardtitle">
						<div class="Boardname">
							<%=GuideList.get(i).getCho_name()%>
						</div>
					</div>
				</a>
			</div>
		</div>
		<%
			}
			%>
	</div>
	</div>
</body>
</html>