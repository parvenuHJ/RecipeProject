<%@page import="com.smhrd.model.RelikeDAO"%>
<%@page import="com.smhrd.model.RecipeDetailVO"%>
<%@page import="com.smhrd.model.RecipeDetailDAO"%>
<%@page import="com.smhrd.model.IngrementVO"%>
<%@page import="com.smhrd.model.IngrementDAO"%>
<%@page import="com.smhrd.model.RecipeVO"%>
<%@page import="com.smhrd.model.RecipeDAO"%>
<%@page import="com.smhrd.model.CommentVO"%>
<%@page import="java.util.List"%>
<%@page import="com.smhrd.model.CommentDAO"%>
<%@page import="com.smhrd.model.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="icon" href="./img/android-chrome-512x512.png">
<title>골라봐요 모두의 레시피</title>
<link href="./css/RecipeDetail2.css" rel="stylesheet" type="text/css" />
<link href="./css/Header.css" rel="stylesheet" type="text/css" />
<link href="./css/Map.css" rel="stylesheet" type="text/css" />



<% MemberVO loginVO = (MemberVO)session.getAttribute("loginVO"); %>

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

<body style="padding: 0%;">

	<%
		String nick = request.getParameter("nick");
		String re_code = request.getParameter("re_code");
		String mem_id = request.getParameter("mem_id");
		String food_name = request.getParameter("food_name");
		
		CommentDAO commentDAO = new CommentDAO();
		List<CommentVO> ShowList = commentDAO.CommentShow(re_code);
		
		RecipeDAO recipeDAO = new RecipeDAO();
		List<RecipeVO> recipeOneList = recipeDAO.RecipeOne(food_name);
		
		IngrementDAO ingrementDAO = new IngrementDAO();
		List<IngrementVO> IngrementList = ingrementDAO.Ingrement(re_code); 
		
		RecipeDetailDAO recipeDetailDAO = new RecipeDetailDAO();
		List<RecipeDetailVO> RecipeDetailList = recipeDetailDAO.RecipeDetail(re_code); 
		
		RelikeDAO dao = new RelikeDAO();
	    List<RecipeVO> RelikeSelectList = dao.RelikeSelect(mem_id);
		
		System.out.println("레시피코드: " + re_code);
		System.out.println("넘어온 음식이름 : " + food_name);
		System.out.println("재료 개수 : " + IngrementList.size());
	    System.out.println("북마크리스트 :" + RelikeSelectList.size());
%>


	<!-- 레시피 세부 전체 -->


	<div class="container">
		<div id="contents_area_full" style="clear: both;">
			<div class="view2_pic">

				<div class="centeredcrop">
					<img id="main_thumbs" src=<%=recipeOneList.get(0).getRe_url() %>
						alt="main thumb">
				</div>
			</div>
			<div class="view2_summary st3">
				<h3><%=recipeOneList.get(0).getRe_name() %></h3>
				<div class="view2_summary_info">
					<span class="view2_summary_info1"><%=recipeOneList.get(0).getRe_per() %></span>
					<span class="view2_summary_info2"><%=recipeOneList.get(0).getRe_time() %></span>
					<span class="view2_summary_info3"><%=recipeOneList.get(0).getRe_level() %></span>
					
					<div>
              <%if(loginVO != null){ %>
                  <input type="hidden"  name="mem_id" value="<%=loginVO.getMem_id() %>" id="mem_id">
                  <input type="hidden"  name="re_code" value="<%=recipeOneList.get(0).getRe_code() %>" id="re_code">
                 			<button class="Re_like" type="button">북마크😎    </button>
					<%-- <%for(int i = 0; i < RelikeSelectList.size(); i++) {%>
						<%if(RelikeSelectList.get(i).getRe_code().equals(RecipeDetailList.get(0).getRe_code())){ %>
                 		<%}%>
             		<%} %>
						<button class="Re_like2" type="button">좋아요❤</button>
     				 --%>
             <script src="//code.jquery.com/jquery-3.7.0.min.js"></script>
             <script src="./js/Relike.js"></script>
     		<%} %>
             </div>
   
					
					
				</div>
				
			</div>






			<!-- 재료 -->

			<div class="view2_btn"></div>
			<div class="blank_bottom"></div>
			<div class="cont_inger2">
				<div class="best_tit">
					<b>재료</b>

				</div>

				<div class="ready_ingre3" id="divConfirmedMaterialArea">
					<ul class="case1">


						<% for(int i = 0 ; i < IngrementList.size(); i++){ %>
						<li><%=IngrementList.get(i).getIngre_name()%></li>

						<%} %>
					
				</div>
				<div class="blank_bottom"></div>
				<div class="view_step">
					<div class="best_tit">
						<b>조리순서</b> <span>Steps</span>
					</div>
				</div>






				<% for(int i = 0 ; i < RecipeDetailList.size(); i++) { %>
				<div id="stepDiv1" class="view_step_cont media step1">
					<div id="stepimg1" class="media-right">
						<img src="<%=RecipeDetailList.get(i).getDe_url()%>">
					</div>
					<div id="stepdescr1" class="media-body"><%=RecipeDetailList.get(i).getDe_text()%>
					</div>
				</div>
				<%} %>

				<!-- <dl class="view_step-tip">
                <dt>
                    <img src="https://recipe1.ezmember.co.kr/img/tit_tip.gif" alt="팁 -주의사항">
                </dt>
                <dd>계란은 반숙으로 하셔야 더욱 맛있어요.</dd>
               </dl> -->

				<div class="blank_bottom"></div>

				<div class="view_step" id="relationGoods"
					style="padding: 20px 0 0 0;">
					<div class="best_tit">
						<b style="color: #74b243;">주변 식당 추천</b>
					</div>





					<!-- 지도 api ------------------------------------------------------------------------------------------------------ -->



					<div class="map_wrap">
						<div id="map"
							style="width: 100%; height: 100%; position: relative; overflow: hidden;"></div>

						<div id="menu_wrap" class="bg_white">
							<div class="option">
								<div>
									<form onsubmit="searchPlaces(); return false;">
										키워드 : <input type="text" value="<%=food_name %>" id="keyword"
											size="5">
										<button type="submit">검색하기</button>
									</form>
								</div>
							</div>
							<hr>
							<ul id="placesList"></ul>
							<div id="pagination"></div>
						</div>
					</div>

					<script type="text/javascript"
						src="//dapi.kakao.com/v2/maps/sdk.js?appkey=67e6e65c1944c28da3758e59709bc702&libraries=services"></script>
					<script>
// 마커를 담을 배열입니다
var markers = [];

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(35.150015, 126.919509), // 지도의 중심좌표 // 스마트인재개발원
        level: 3 // 지도의 확대 레벨
    };  



// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 



// 장소 검색 객체를 생성합니다
var ps = new kakao.maps.services.Places();  

// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
var infowindow = new kakao.maps.InfoWindow({zIndex:1});

// 키워드로 장소를 검색합니다
searchPlaces();



// 키워드 검색을 요청하는 함수입니다
function searchPlaces() {

    var keyword = document.getElementById('keyword').value;

    if (!keyword.replace(/^\s+|\s+$/g, '')) {
        alert('키워드를 입력해주세요!');
        return false;
    }

      var options = {
          location : new kakao.maps.LatLng(35.150015, 126.919509),
            radius : 9000
            
    }  
    // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
   
    ps.keywordSearch(keyword, placesSearchCB, options); 
    
}

// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
function placesSearchCB(data, status, pagination) {
    if (status === kakao.maps.services.Status.OK) {
       
       

        // 정상적으로 검색이 완료됐으면
        // 검색 목록과 마커를 표출합니다
        displayPlaces(data);

        // 페이지 번호를 표출합니다
        displayPagination(pagination);

    } else if (status === kakao.maps.services.Status.ZERO_RESULT) {

        alert('이 레시피를 판매하는 식당은 존재하지 않습니다.');
        return;

    } else if (status === kakao.maps.services.Status.ERROR) {

        alert('검색 결과 중 오류가 발생했습니다.');
        return;

    }
}

// 검색 결과 목록과 마커를 표출하는 함수입니다
function displayPlaces(places) {

    var listEl = document.getElementById('placesList'), 
    menuEl = document.getElementById('menu_wrap'),
    fragment = document.createDocumentFragment(), 
    bounds = new kakao.maps.LatLngBounds(), 
    listStr = '';
    
    // 검색 결과 목록에 추가된 항목들을 제거합니다
    removeAllChildNods(listEl);

    // 지도에 표시되고 있는 마커를 제거합니다
    removeMarker();
    
    for ( var i=0; i<places.length; i++ ) {

        // 마커를 생성하고 지도에 표시합니다
        var placePosition = new kakao.maps.LatLng(places[i].y, places[i].x),
            marker = addMarker(placePosition, i), 
            itemEl = getListItem(i, places[i]); // 검색 결과 항목 Element를 생성합니다

        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
        // LatLngBounds 객체에 좌표를 추가합니다
        bounds.extend(placePosition);

        // 마커와 검색결과 항목에 mouseover 했을때
        // 해당 장소에 인포윈도우에 장소명을 표시합니다
        // mouseout 했을 때는 인포윈도우를 닫습니다
        (function(marker, title) {
            kakao.maps.event.addListener(marker, 'mouseover', function() {
                displayInfowindow(marker, title);
            });

            kakao.maps.event.addListener(marker, 'mouseout', function() {
                infowindow.close();
            });

            itemEl.onmouseover =  function () {
                displayInfowindow(marker, title);
            };

            itemEl.onmouseout =  function () {
                infowindow.close();
            };
        })(marker, places[i].place_name);

        fragment.appendChild(itemEl);
    }

    // 검색결과 항목들을 검색결과 목록 Element에 추가합니다
    listEl.appendChild(fragment);
    menuEl.scrollTop = 0;

    // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
    map.setBounds(bounds);
}

// 검색결과 항목을 Element로 반환하는 함수입니다
function getListItem(index, places) {

    var el = document.createElement('li'),
    itemStr = '<span class="markerbg marker_' + (index+1) + '"></span>' +
                '<div class="info">' +
                '   <h5>' + places.place_name + '</h5>';

    if (places.road_address_name) {
        itemStr += '    <span>' + places.road_address_name + '</span>' +
                    '   <span class="jibun gray">' +  places.address_name  + '</span>';
    } else {
        itemStr += '    <span>' +  places.address_name  + '</span>'; 
    }
                 
      itemStr += '  <span class="tel">' + places.phone  + '</span>' +
                '</div>';           

    el.innerHTML = itemStr;
    el.className = 'item';

    return el;
}

// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
function addMarker(position, idx, title) {
    var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
        imageSize = new kakao.maps.Size(36, 37),  // 마커 이미지의 크기
        imgOptions =  {
            spriteSize : new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
            spriteOrigin : new kakao.maps.Point(0, (idx*46)+10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
            offset: new kakao.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
        },
        markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
            marker = new kakao.maps.Marker({
            position: position, // 마커의 위치
            image: markerImage 
        });

    marker.setMap(map); // 지도 위에 마커를 표출합니다
    markers.push(marker);  // 배열에 생성된 마커를 추가합니다

    return marker;
}

// 지도 위에 표시되고 있는 마커를 모두 제거합니다
function removeMarker() {
    for ( var i = 0; i < markers.length; i++ ) {
        markers[i].setMap(null);
    }   
    markers = [];
}

// 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
function displayPagination(pagination) {
    var paginationEl = document.getElementById('pagination'),
        fragment = document.createDocumentFragment(),
        i; 

    // 기존에 추가된 페이지번호를 삭제합니다
    while (paginationEl.hasChildNodes()) {
        paginationEl.removeChild (paginationEl.lastChild);
    }

    for (i=1; i<=pagination.last; i++) {
        var el = document.createElement('a');
        el.href = "#";
        el.innerHTML = i;

        if (i===pagination.current) {
            el.className = 'on';
        } else {
            el.onclick = (function(i) {
                return function() {
                    pagination.gotoPage(i);
                }
            })(i);
        }

        fragment.appendChild(el);
    }
    paginationEl.appendChild(fragment);
}

// 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
// 인포윈도우에 장소명을 표시합니다
function displayInfowindow(marker, title) {
    var content = '<div style="padding:5px;z-index:1;">' + title + '</div>';

    infowindow.setContent(content);
    infowindow.open(map, marker);
}

 // 검색결과 목록의 자식 Element를 제거하는 함수입니다
function removeAllChildNods(el) {   
    while (el.hasChildNodes()) {
        el.removeChild (el.lastChild);
    }
}
</script>



					<!-- 지도 api --------------------------------------------------------------------------------------- -->








					<div class="blank_bottom"></div>
					<div class="view_reply st2">
						<div class="reply_tit">
							요리 후기
							<div class="dropdown clearfix pull-right">

								<button class="btn btn-default dropdown-toggle" type="button"
									id="dropdownMenu1" data-toggle="dropdown" aria-expanded="false">
									최근 날짜순 <span class="glyphicon glyphicon-menu-down"> </span>
								</button>

							</div>
						</div>

						<%for(int i = 0; i < ShowList.size(); i++){ %>
						<div class="media reply_list">
							<div class="media-left">
								<a href="/profile/review.html?uid=76848668"> <img
									class="media-object"
									src="https://recipe1.ezmember.co.kr/img/df/pf_100_100.png"
									data-holder-rendered="true">
								</a>
							</div>
							<div class="media-body2">
								<%if(ShowList.get(i).getCo_img() != null){ %>
								<div class="reply_img">
									<img alt="댓글이미지" src="./file/<%=ShowList.get(i).getCo_img()%>">
								</div>
								<%} %>
								<h4 class="media-heading">
									<b class="info_name_f"><%=ShowList.get(i).getMem_id() %></b>
									2023-09-11 12:44:31 <span class="reply_list_star"> <img
										src="https://recipe1.ezmember.co.kr/img/mobile/icon_star2_on.png">
									</span>
								</h4>
								<p class="reply_list_cont"><%=ShowList.get(i).getCo_text() %></p>

							</div>
						</div>
						<%} %>
						<div class="view_reply">
							<div class="reply_tit">
								댓글작성
								<div id="recipeCommentList_1"></div>
								<div class="reply_write">
									<%if(loginVO != null){ %>
									<form id="insCmtFrm1" action="CommentInsert.do" method="post"
										enctype="multipart/form-data">
										<input type="hidden" id="re_code" name="re_code"
											value="<%=recipeOneList.get(0).getRe_code()%>"> <input
											type="hidden" id="mem_id" name="mem_id"
											value="<%=loginVO.getMem_id()%>">
										<div>
											<div class="input-group" style="width: 100%;">
												<textarea id="cmt_tx_content1" name="co_text"
													class="form-control" placeholder=""
													style="height: 75px; width: 250%; resize: none;"></textarea>
											</div>
										</div>
										<div class="file-submit">
											<input type="hidden" id="food_name" name="food_name"
												value="<%=food_name%>"> <input type="file"
												name="co_img" id="file_1"> <input type="submit"
												id="CommentInsert " value="작성하기">
										</div>
										<span id=reply></span>
										<div class="blank_bottom"></div>
										<div></div>
									</form>
									<%} else{%>
									<div>
										<div class="input-group2" style="width: 100%;">
											<textarea id="cmt_tx_content1"
												onclick="EZ.ATLogin(); return false;" name="co_text"
												class="form-control" placeholder=""
												style="height: 75px; width: 90%; resize: none;">로그인을 해 주세요</textarea>
										</div>
									</div>


									<%} %>
									<script src="./js/Comment.js"></script>

								</div>
							</div>
						</div>




					</div>
				</div>
			</div>

		</div>
	</div>






</body>

</html>