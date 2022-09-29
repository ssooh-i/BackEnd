<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap"
	rel="stylesheet">
<script src="https://kit.fontawesome.com/53a8c415f1.js"
	crossorigin="anonymous">
  </script>
<link rel="stylesheet" href="css/login.css">
</head>
<body>
	<div class="wrap">
		<div class="login">
			<h2>Log-in</h2>
			<form action="/hh/user" method="post">
				<input type="hidden" name="action" value="login">
				<div class="login_id">
					<h4>Id</h4>
					<input type="text" id="userId" class="user-id" placeholder="아이디" name="user_id">
				</div>
				<div class="login_pw">
					<h4>Password</h4>
					<input type="password" id="userPw" class="user-pw" placeholder="비밀번호" name="user_password">
				</div>
				<div class="submit">
					<input type="submit" id="submitBtn" class="submit-btn" value="login" onclick="return loginCheck();"> <!--onclick : onclick 클릭할 때마다 실행된다.  -->
				</div>
			</form>

			<div class="login_etc">
				<div class="forgot_pw">
					<a href="login/find_password.jsp"> 비밀번호 찾기 </a>
				</div>
			</div>
		</div>
	</div>
	<script>
	const idInputElem = document.getElementById("userId");
	const pwInputElem = document.getElementById("userPw");
	
	function loginCheck(){
		const id = idInputElem.value;
		const pw = pwInputElem.value;
		if(id == ""){
			alert("아이디를 입력해주세요.");
			return false;
		}else if(pw == ""){
			alert("비밀번호를 입력해주세요.");
			return false;
		}else{
			return true;
		}
	}
	</script>


</body>
</html>