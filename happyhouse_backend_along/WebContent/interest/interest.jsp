<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String root = request.getContextPath();
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>HappyHouse</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous" />
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css" />
<link rel="stylesheet" href="./assets/css/main.css" />
<style type="text/css">
body {
	margin: 30px 0px;
}

ul {
	list-style: none;
	font-style: italic;
	font-weight: bold;
}

.items {
	float: left;
	margin: 0px 20px;
}

a {
	text-decoration-line: none;
	color: white;
}

#page-items {
	color: black;
}
</style>
</head>
<body style="background-color: rgba(0, 85, 85, 1)">
	<header class="header">

		<div class="container"
			style="background: #005555; padding-bottom: 10px; padding-top: 10px">
				<div class="site-navigation">
					<ul class="js-clone-nav d-none d-lg-inline-block text-start site-menu float-end">
						
						<li class="items"><a href="logout/logout.jsp">Log Out</a></li>
					</ul>
				</div>
			<div class="title" style="color: white">
				<h2 style="font-weight: bold"><a href="./index.jsp">HAPPY HOUSE</a></h2>
			</div>
		</div>
	</header>
	<hr>
	<div class="row justify-content-center">
		<div class="col-lg-8 col-md-10 col-sm-12">
			<h2 class="my-3 py-3 text-center">
				<p style="color: white; font-weight: bold;">관심 지역 관리</p>
			</h2>
		</div>
		<div class="col-lg-8 col-md-10 col-sm-12">
			<div class="row align-self-center mb-2">
				<div class="form-group col-md-3">
				<select class="form-select bg-secondary text-light" id="sido">
					<option value="">시도선택</option>
				</select>
			</div>
			<div class="form-group col-md-3">
				<select class="form-select bg-secondary text-light" id="gugun">
					<option value="">구군선택</option>
				</select>
			</div>
			<div class="form-group col-md-3">
				<select class="form-select bg-secondary text-light" id="dong">
					<option value="">동선택</option>
				</select>
			</div>
			<div class="form-group col-md-3">
				<button type="button" id="search-btn" class="btn btn-dark">
					관심지역 추가</button>
			</div>
			</div>
			<table class="table table-hover" style="background: white;">
				<thead>
					<tr class="text-center">
						<th scope="col">관심 지역</th>
						<th scope="col"></th>
						<th scope="col"></th>
						<th scope="col"></th>
						<th scope="col"></th>
						<th scope="col">삭제</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="article" items="${boardlist}">
						<tr class="text-center">

							<th scope="row">${article.article_no}</th>
							<td>${article.title}</td>
							<td>${article.user_id}</td>
							<td>${article.content}</td>
							<td>
								<form action="<%=root%>/board/detail.jsp" method="post">
									<input type="hidden" name="article_no"
										value="${article.article_no}"> <input type="hidden"
										name="title" value="${article.title}"> <input
										type="hidden" name="user_id" value="${article.user_id}">
									<input type="hidden" name="content" value="${article.content}">
									<input type="submit" value="수정">
								</form>
							</td>

							<td>
								<form action="<%=root%>/board?action=deleteBoard" method="post">
									<input type="hidden" name="article_no"
										value="${article.article_no}"> <input type="submit"
										value="삭제">
								</form>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		
	</div>
	
	<script>
      window.onload = function () {
        // 브라우저가 열리면 시도정보 얻기.
        sendRequest("sido", "");
      };

      

      // 시도가 바뀌면 구군정보 얻기.
      document.querySelector("#sido").addEventListener("change", function () {
        if (this[this.selectedIndex].value) {
          let regcode = this[this.selectedIndex].value;
          sendRequest("gugun", regcode);
        } else {
          initOption("gugun");
          initOption("dong");
        }
      });

      // 구군이 바뀌면 동정보 얻기.
      document.querySelector("#gugun").addEventListener("change", function () {
        if (this[this.selectedIndex].value) {
          let regcode = this[this.selectedIndex].value;
          sendRequest("dong", regcode);
        } else {
          initOption("dong");
        }
      });

      function sendRequest(selid, regcode) {
        const url = "http://localhost:8080/hh/interest";
        let params = "act="+selid + "&code="+regcode;
        let path = `${url}?${params}`;
        console.log(path);
        fetch(path)
          .then((response) => response.json())
          .then((data) => addOption(selid, data));
      }

      function addOption(selid, data) {
    	 console.log(data);
        let opt = ``;
        initOption(selid);
        switch (selid) {
          case "sido":
            opt += `<option value="">시도선택</option>`;
            data.forEach(function (regcode) {
              opt += `
              <option value="${regcode.code}">${regcode.name}</option>
              `;
            });
            break;
          case "gugun":
        	  opt += `<option value="">구군선택</option>`;
              data.forEach(function (regcode) {
                opt += `
                <option value="${regcode.code}">${regcode.name}</option>
                `;
              });
            break;
          case "dong":
            opt += `<option value="">동선택</option>`;
            data.forEach(function (regcode) {
              opt += `
              <option value="${regcode.code}">${regcode.name}</option>
              `;
            });
        }
        document.querySelector(`#${selid}`).innerHTML = opt;
      }

      function initOption(selid) {
        let options = document.querySelector(`#${selid}`);
        options.length = 0;
      }
      document.querySelector("#search-btn").addEventListener("click", function () {
          let gugunSel = document.querySelector("#gugun");
          let gugun = gugunSel[gugunSel.selectedIndex].value;
          let dongSel = document.querySelector("#dong");
          let dong = dongSel[dongSel.selectedIndex].value;
          alert(gugun + " , " + dong)
        });
      ///////////////////////// 아파트 매매 정보 /////////////////////////

    </script>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
</body>
</html>
