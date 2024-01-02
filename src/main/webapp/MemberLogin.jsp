<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8" errorPage="Error.jsp"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" href="./img/android-chrome-512x512.png">
    <title>로그인/회원가입</title>
    <link rel="stylesheet" href="./css/Login.css"  type="text/css"/>
</head>

<body>
    <div class="wrap">
        
        <!-- header -->
        <header class="header">
            <div class="h_icon">
                <a href="Main.jsp">
                    <img src="./img/tomato.png"
                        alt="" style="width: 55px;">
                </a>
    
                        </div>
                    </div>
            </header>

      <% String joinError = (String)request.getAttribute("joinError");
if (joinError != null && !joinError.isEmpty()) { %>
    <p class="error-message"><%= joinError %></p>
<% } %>   

        <div class="container right-panel-active">
            <!-- 회원가입 -->
            <div class="container__form container--signup">
                <form action="MemberJoin.do" class="form" id="form1" method="post">
                    <h2 class="form__title">회원가입</h2>
                    <input type="text" placeholder="아이디" class="input" name="mem_id" id="mem_id"/>
                  
                   <button class="btn_join" type="button">중복 확인</button><span id="idCheck"></span>
                  
                    <span id="joinError" style="color: red;"></span>
                    
                  <input type="password" placeholder="비밀번호" class="input" name="mem_pw" id="mem_pw"/>
                    <input type="password" placeholder="비밀번호 확인" class="input" name="mem_pw2" id="mem_pw2"/>
               <span id="passwordMatchResult"></span>
               
                    <input type="text" placeholder="닉네임" class="input" name="mem_nick" />
                    <input type="text" placeholder="주소" class="input" name="mem_address" />
                    <input type="text" placeholder="핸드폰" class="input" name="mem_tel" />
                    <input type="hidden" value="초보요리사"   name="rate_name" id="rate_name">
                 <input type="submit" value="회원가입" class="btn" id="signUpButton" onclick="return checkPasswordMatch();">

               
                
                   
                </form>
                
            </div>

            <!-- 로그인 -->
            <div class="container__form container--signin">
                <form action="MemberLogin.do" class="form" id="form2" method="post">
                    <h2 class="form__title">로그인</h2>
                    <input type="text" placeholder="아이디" class="input" name="mem_id" />
                    <input type="password" placeholder="패스워드" class="input" name="mem_pw"/>
                    <!-- <a href="#" class="link">Forgot your password?</a> -->
                    <input type="submit" value="로그인" class="btn" >
                </form>
            </div>

            <!-- 오버레이 -->
            <div class="container__overlay">
                <div class="overlay">
                    <!-- 로그인 넘어가기 -->
                    <div class="overlay__panel overlay--left">
                        <button class="btn" id="signIn" button="signIn">로그인</button>
                    </div>
                    <!-- 회원가입 넘어가기-->
                    <div class="overlay__panel overlay--right">
                        <button class="btn" button="signUp" id="signUp">회원가입</button>
                    </div>
                </div>
            </div>
        </div>



   <script src="//code.jquery.com/jquery-3.7.0.min.js"></script>


   <script type="text/javascript">

   const signInBtn = document.getElementById("signIn");
   const signUpBtn = document.getElementById("signUp");
   const fistForm = document.getElementById("form1");
   const secondForm = document.getElementById("form2");
   const container = document.querySelector(".container");

   signInBtn.addEventListener("click", () => {
     container.classList.remove("right-panel-active");
   });

   signUpBtn.addEventListener("click", () => {
     container.classList.add("right-panel-active");
   });

   /* fistForm.addEventListener("submit", (e) => e.preventDefault());
   secondForm.addEventListener("submit", (e) => e.preventDefault());
 */
 <% String loginError = (String)request.getAttribute("loginError");
 if (loginError != null && !loginError.isEmpty()) { %>
     <p class="error-message"><%= loginError %></p>
 <% } %>
</script>
<script type="text/javascript">
            // on() 메소드 -> 지정 선택자에게 이벤트 연결해주는 메소드
            $('.btn_join').on('click', function(){
               // name="email"인 친구가 2개라서 1번 인덱스에 있는 친구 가져오기 
               var mem_id = $('#mem_id').val();
               $.ajax({
                  url : "MemberIdCheck.do", /* 어디로 보낼지? */
                  // type : "get", /* 어떤 방식으로 보낼지? */      
                  data : {mem_id : mem_id}, /* 어떤 데이터를 보낼지? */
                  dataType : "text", /* 어떤 데이터 타입으로 받아올지? */
                  success : function(data){
                     console.log(data)
                     console.log(typeof(data))
                  
                     
                     if(data == "false"){
                        $('#idCheck').html('사용 불가능한 아이디입니다!')
                     }else if(data == "true"){
                        $('#idCheck').html('사용 가능한 아이디입니다!')
                     }
                  
                  }, /* 성공 시 */   
                  error : function(e){
                     alert('실패');
                     
                  }, /* 실패 시 */
               })
               
            });
         
   </script>

<script type="text/javascript">
    // 회원가입 버튼 클릭 시
    $('#userInfoCheck2').on('click', function(e) {
        e.preventDefault(); // 기본 동작(폼 제출)을 막음
        var mem_id = $('#mem_id').val();
        // 아이디 중복 체크를 수행하고, 중복이 아닌 경우에만 회원가입 진행
        $.ajax({
            url: "MemberIdCheck.do",
            data: { mem_id: mem_id },
            dataType: "text",
            success: function (data) {
                if (data == "false") {
                    $('#idCheck').html('사용 불가능한 아이디입니다!');
                } else if (data == "true") {
                    // 사용 가능한 경우, 회원가입 페이지로 이동
                    $('#form1').submit(); // 폼 제출 (회원가입 페이지로 이동)
                }
            },
            error: function (e) {
                alert('실패');
      
            }
         
                
        });
    });
 
</script>





<script type="text/javascript">
          // 비밀번호 입력 필드의 값이 변경될 때마다 이벤트 발생
               document.getElementById('mem_pw').addEventListener('input', checkPasswordMatch);
               document.getElementById('mem_pw2').addEventListener('input', checkPasswordMatch);
               var signUpButton = document.getElementById('signUpButton'); // 회원가입 버튼

               function checkPasswordMatch() {
                   var password = document.getElementById('mem_pw').value;
                   var confirmPassword = document.getElementById('mem_pw2').value;
                   var passwordMatchResult = document.getElementById('passwordMatchResult');

                    if (password === confirmPassword) {
                       passwordMatchResult.innerHTML = '비밀번호 일치';
                       passwordMatchResult.style.color = 'green';
                       signUpButton.disabled = false; // 비밀번호가 일치하면 회원가입 버튼 활성화
                   } else {
                       passwordMatchResult.innerHTML = '비밀번호 불일치';
                       passwordMatchResult.style.color = 'red';
                       signUpButton.disabled = true; // 비밀번호가 불일치하면 회원가입 버튼 비활성화
                   }
               }  
</script>

</body>




</html>