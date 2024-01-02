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
<!-- <link href="./css/Board.css" rel="stylesheet" type="text/css" />
 -->
 <link href="./css/RecipeSelect.css" rel="stylesheet" type="text/css" />


	<%
	MemberVO loginVO = (MemberVO) session.getAttribute("loginVO");
		
	String input1 = request.getParameter("input1");
	String input2 = request.getParameter("input2");
	String input3 = request.getParameter("input3");
	String input4 = request.getParameter("input4");
	String input5 = request.getParameter("input5");
	String input6 = request.getParameter("input6");
	
	System.out.println(input1 + input2 + input3 + input4 + input5 + input6);
		
	IngreSelectVO vo = new IngreSelectVO(input1, input2, input3, input4, input5, input6);
	IngreSelectDAO ingreSelectDAO = new IngreSelectDAO();
	
	
	 List<RecipeVO> IngreSelectList = ingreSelectDAO.IngreSelect(vo);
	  
	  System.out.println("사이즈 " +IngreSelectList.size());
	  System.out.println("이름 " +IngreSelectList.get(0).getFood_name());
	
	
	
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
		<%if(IngreSelectList.size() == 0) {%>
		<h1>안타깝지만 찾으시는 레시피가 없습니다</h1>

		<%} else{ %>
		<%for(int i=0; i<IngreSelectList.size(); i++) { %>
		<div class="BoardWrap">

			<!-- 아이스크림 메뉴 하나의 영역 -->
			<div class="Board">


				<a
					href="RecipeOne.do?food_name=<%=IngreSelectList.get(i).getFood_name()%>&re_code=<%=IngreSelectList.get(i).getRe_code()%>">
					<img class="BoardImg"
					src="<%=IngreSelectList.get(i).getRe_url() %>">
				</a>


			</div>

			<div class="Boardtitle">
				<div class="Boardname"><%=IngreSelectList.get(i).getFood_name()%></div>

				<div class="Boardname2">
					⭐<%=IngreSelectList.get(i).getRe_level()%>
					🕒<%=IngreSelectList.get(i).getRe_time()%>
					👩<%=IngreSelectList.get(i).getRe_per() %></div>

				<!--  <div class="recipename2">❤ 30 🏷 50 🗨 30</div> -->

			</div>

		</div>
		<%} %>
		<%} %>
	</div>

</body>
</html>