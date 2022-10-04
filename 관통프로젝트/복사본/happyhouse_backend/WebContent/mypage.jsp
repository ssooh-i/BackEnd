<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
  <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap" rel="stylesheet">
  <script src="https://kit.fontawesome.com/53a8c415f1.js" crossorigin="anonymous"></script>
  <link rel="stylesheet" href="css/mypage-main.css">
  <title>mypage_main</title>
</head>
<body>
<div class="wrap">
  <div class="login">
      <h2>My Page</h2>
        <div class="search">
          <input type="button" value="회원 정보 조회" onclick="location.href='searchUser.html';">
        </div>

        <div class ="create">
          <input type="button" value="회원 정보 등록" onclick="location.href='createUser.html';">
        </div>

        <div class="update">
          <input type="button" value="회원 정보 수정" onclick="location.href='updateUser.html';">
        </div>

        <div class ="delete">
          <input type="button" value="회원 정보 삭제" onclick="location.href='deleteUser.html';">
        </div>

   <div><br>
    <p class="find">
      <span><a href="index.html" style="color : gray">홈 화면으로 이동</a></span>
    </p>
   </div>

    </div>
  </div>
</body>
</html>