<%@page import="com.smhrd.model.IngreSelectVO"%>
<%@page import="com.smhrd.model.IngreSelectDAO"%>
<%@page import="com.smhrd.model.MemberVO"%>
<%@page import="com.smhrd.model.RecipeVO"%>
<%@page import="java.util.List"%>
<%@page import="com.smhrd.model.RecipeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="Error.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" href="./img/android-chrome-512x512.png">
<title>골라봐요 모두의 레시피</title>
<link href="./css/Header.css" rel="stylesheet" type="text/css" />
<link href="./css/RecipeSelect.css" rel="stylesheet" type="text/css" />


	<%
	MemberVO loginVO = (MemberVO) session.getAttribute("loginVO");
	RecipeDAO dao = new RecipeDAO();
	String food_name = request.getParameter("food_name");

	List<RecipeVO> RecipeSelectList = dao.RecipeSelect(food_name);
	
	System.out.println("food_name"+ food_name);
	System.out.println("리스트사이즈 : " + RecipeSelectList.size());
	
   %>
	<div class="wrap">
		<!-- header -->
		<header>
			<div class="header">
				<div class="h_cont1">
					<div class="h_icon">
						<a href="Main.jsp"><img class="logo"
							src="./img/tomato.png" alt="Logo" width="55px"></a>
					</div>
				</div>
				<form action="RecipeSelect.do" class="recipe">
					<div class="h_cont2">
						<li>
							<input type="text" placeholder="search"
							class="h_cont2_input" name="food_name">
							<input type="submit" value="검색" class="h_cont2_btn">
						</li>
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







</head>
<body>


	
	
	<div class="cardWrap">
		<!-- 아이스크림 메뉴판 전체 영역 -->
		<%if(RecipeSelectList.size() == 0) {%>
		<h1>안타깝지만 찾으시는 레시피가 없습니다</h1>

		<%} else{ %>
		<%for(int i=0; i<RecipeSelectList.size(); i++) { %>
		<div class="BoardWrap">

			<!-- 아이스크림 메뉴 하나의 영역 -->
			<div class="Board">


				<a class="a_board"
					href="RecipeOne.do?food_name=<%=RecipeSelectList.get(i).getFood_name()%>&re_code=<%=RecipeSelectList.get(i).getRe_code()%>">
					<img class="BoardImg"
					src="<%=RecipeSelectList.get(i).getRe_url() %>">
				</a>


			</div>

			<div class="Boardtitle">
				<div class="Boardname"><%=RecipeSelectList.get(i).getFood_name()%></div>

				<div class="Boardname2">
					⭐<%=RecipeSelectList.get(i).getRe_level()%>
					🕒<%=RecipeSelectList.get(i).getRe_time()%>
					👩<%=RecipeSelectList.get(i).getRe_per() %></div>

				<!--  <div class="recipename2">❤ 30 🏷 50 🗨 30</div> -->

			</div>

		</div>
		<%} %>
		<%} %>
	</div>

</body>
</html>