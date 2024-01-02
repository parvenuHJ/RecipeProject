<%@page import="com.smhrd.model.InfoDAO"%>
<%@page import="com.smhrd.model.MemberVO"%>
<%@page import="com.smhrd.model.GuideVO"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="com.smhrd.model.GuideDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="Error.jsp"%>

<!DOCTYPE html>
<html lang="en">

<%
//session값 가져오기
MemberVO loginVO = (MemberVO) session.getAttribute("loginVO");
%>

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="icon" href="./img/android-chrome-512x512.png">
<title>골라봐요 모두의 레시피</title>
<link rel="stylesheet" href="./css/Main.css">
<script src="./js/Main.js"></script>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
</head>

<body>
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

		</header>


		<div class="pages">
			<!-- main -->
			<div class="main page"
				style="background-image: url('./img/진짜메인.gif')">
				<h2 class="title"></h2>
			</div>
			<!-- menu1 -->
			<div class="menu1 page"
				style="background-image: url('./img/장바구니.png')">
				<div class="title1">
					<h2>재료 검색</h2>
				</div>
				<br> <br> <br> <br> <br> <br> <br>
				<br> <br> <br>
				<div class="food-in">
					<h4>쓸 재료</h4>
					<div class="in">
						<form action="IngreSelect.do">
							<input type="text" name="input1" placeholder="재료를 입력해주세요"
								style="width: 20%; height: 55px;"> <input type="text"
								name="input2" placeholder="재료를 입력해주세요"
								style="width: 20%; height: 55px;"> <input type="text"
								name="input3" placeholder="재료를 입력해주세요"
								style="width: 20%; height: 55px;">
					</div>
				</div>
				<div class="food-out">
					<h4>안 쓸 재료</h4>
					<div class="out">
						<input type="text" name="input4" placeholder=" 재료를 입력해주세요"
							style="width: 20%; height: 55px;"> <input type="text"
							name="input5" placeholder=" 재료를 입력해주세요"
							style="width: 20%; height: 55px;"> <input type="text"
							name="input6" placeholder=" 재료를 입력해주세요"
							style="width: 20%; height: 55px;"> <br> <br> <br>
						<br>
						<input class="menu1_btn" type="submit" value="입력완료">
						<!-- <button class="menu1_btn" type="button" button="recipe_search"
							onclick="location.href='Recipe.html'">입력완료</button> -->
					</div>
					</form>
				</div>
			</div>


			<!-- menu2 -->
			<div class="menu2 page" style="background-image: url('./img/진짜메뉴.png')">
				<div class="title2">
					<h2>메뉴 추천</h2>
					<!-- <img src="/Project_copy/img/장바구니.png" alt=""> -->
				</div>

				<div id="menu">
					<canvas width="550" height="550" style="margin-bottom: 30px;"></canvas>
					<button class="menu2_btn" onclick="rotate()">돌려돌려 돌림판</button>
					<div id="addDiv">
						<input type="text" id="menuAdd"
							style="margin-top: 15px; width: 50%; height: 55px;"
							placeholder=" 메뉴를 입력해주세요">
						<button class="menu2_btn2" onclick="add()"
							style="margin-top: 15px;">메뉴추가</button>
					</div>
				</div>
				<script src="./js/Main2.js"></script>
			</div>


			<!-- menu3 -->
			<div class="menu3 page"
				style="background-image: url('./img/진짜가이드.gif')">
				<a href="Guide.jsp">
					<h2 class="title3">초보자 가이드</h2>
				</a>
					<p>클릭!</p>
			</div>

			<!-- menu4 -->
			<div class="menu4 page"
				style="background-image: url('./img/진짜정보.gif')">
				<a href="Info.jsp">
					<h2 class="title4">식생활 정보</h2>
				</a>
				<p>클릭!</p>
			</div>

		</div>

		<!-- 페이징 -->
		<ul class="pagination"></ul>
	</div>
</body>
</html>