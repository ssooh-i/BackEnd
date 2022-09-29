<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
  <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap" rel="stylesheet">
  <script src="https://kit.fontawesome.com/53a8c415f1.js" crossorigin="anonymous"></script>
  <link rel="stylesheet" href="css/signin.css">
</head>
<div id="con">
  <div id="login">
    <div id="login_form"><!--로그인 폼-->
      <form>
        <h3 class="login" style="letter-spacing:-1px;">회원 정보 업데이트</h3>

        <hr>

        <p style="text-align: left; font-size:12px; color:#666">username</p>
        <input type="text" placeholder="아이디" class="size">
        <p></p>
        </label><!--아이디-->

        <label>
          <!-- <span>PW</span> -->
          <p style="text-align: left; font-size:12px; color:#666">Password </p>
          <input type="password" placeholder="비밀번호" class="size">
        </label><!--비밀번호-->

        <label>
          <!-- <span>PW</span> -->
          <p style="text-align: left; font-size:12px; color:#666"></p>
          <input type="password" placeholder="비밀번호 확인" class="size">
        </label><!--비밀번호 확인-->

        <label>
          <!-- <span>PW</span> -->
          <p style="text-align: left; font-size:12px; color:#666">E-mail</p>
          <input type="text" placeholder="이메일" class="size">
        </label> <!--이메일-->

        <label>
          <!-- <span>PW</span> -->
          <p style="text-align: left; font-size:12px; color:#666"></p>
        <input type="text" placeholder="이메일 확인" class="size">
        </label><!--이메일 확인-->

        <br>
        <p>
          <input type="submit" value="Update User" class="btn">
        </p>
      </form>

      <hr>
      <p class="find">
        <span><a href="mypage.jsp">나의 페이지로 이동</a></span>
      </p>
    </div>
  </div>
</div>