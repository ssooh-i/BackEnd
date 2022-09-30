<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>SSAFY BOOK CAFE</title>
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
      crossorigin="anonymous"
    />
    <link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css"
    />
    <link rel="stylesheet" href="./assets/css/main.css" />
  </head>
  <body>
    <!-- 상단 navbar start -->
    <nav class="navbar navbar-expand-lg navbar-light bg-light shadow fixed-top">
      <div class="container">
        <a class="navbar-brand text-primary fw-bold" href="index.html">
          <img src="./assets/img/ssafy_logo.png" alt="" width="60" />
          SSAFY BOOK CAFE
        </a>
        <button
          class="navbar-toggler"
          type="button"
          data-bs-toggle="collapse"
          data-bs-target="#navbarSupportedContent"
          aria-controls="navbarSupportedContent"
          aria-expanded="false"
          aria-label="Toggle navigation"
        >
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
          <ul class="navbar-nav me-auto mb-lg-0">
            <li class="nav-item">
              <a class="nav-link" aria-current="page" href="#">공지사항</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" aria-current="page" href="aptlist.html">아파트매매정보</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" aria-current="page" href="hospital.html">호흡진료지정병원</a>
            </li>
          </ul>
          <!-- 로그인 전 -->
          <ul class="navbar-nav mb-2 me-2 mb-lg-0">
            <li class="nav-item">
              <a class="nav-link" aria-current="page" href="#">회원가입</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" aria-current="page" href="#">로그인</a>
            </li>
          </ul>
          <!-- 로그인 후 -->
          <ul class="navbar-nav mb-2 me-2 mb-lg-0">
            <li class="nav-item">
              <a class="nav-link" aria-current="page" href="#">로그아웃</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" aria-current="page" href="#">마이페이지</a>
            </li>
            <li class="nav-item dropdown">
              <a
                class="nav-link dropdown-toggle"
                href="#"
                id="navbarDropdown"
                role="button"
                data-bs-toggle="dropdown"
                aria-expanded="false"
              >
                관리자
              </a>
              <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                <li>
                  <a
                    class="dropdown-item"
                    href="#"
                    data-bs-toggle="modal"
                    data-bs-target="#pollModal"
                    >투표만들기</a
                  >
                </li>
                <li><a class="dropdown-item" href="#">차트보기</a></li>
                <li><a class="dropdown-item" href="#">회원관리</a></li>
              </ul>
            </li>
          </ul>
        </div>
      </div>
    </nav>
    <!-- 상단 navbar end -->
    <!-- 중앙 content start -->
    <div class="container">
      <div style="height: 70px"></div>
      <h2 class="text-center mt-5 mb-3">아파트 매매 정보</h2>
      <div class="row col-md-12 justify-content-center mb-2">
        <div class="form-group col-md-2">
          <select class="form-select bg-secondary text-light" id="sido">
            <option value="">시도선택</option>
          </select>
        </div>
        <div class="form-group col-md-2">
          <select class="form-select bg-secondary text-light" id="gugun">
            <option value="">구군선택</option>
          </select>
        </div>
        <div class="form-group col-md-2">
          <select class="form-select bg-secondary text-light" id="dong">
            <option value="">동선택</option>
          </select>
        </div>
        <div class="form-group col-md-2">
          <select class="form-select bg-dark text-light" id="year"></select>

        </div>
        <div class="form-group col-md-2">
          <select class="form-select bg-dark text-light" id="month">
            <option value="">매매월선택</option>
          </select>
        </div>
        <div class="form-group col-md-2">
          <button type="button" id="list-btn" class="btn btn-outline-primary">
            아파트매매정보가져오기
          </button>
        </div>
      </div>
      <table class="table table-hover text-center" style="display: none">
        <tr>
          <th>아파트이름</th>
          <th>층</th>
          <th>면적</th>
          <th>법정동</th>
          <th>거래금액</th>
        </tr>
        <tbody id="aptlist"></tbody>
      </table>
    </div>
    <script>
      ///////////////////////// select box 설정 (지역, 매매기간) /////////////////////////
      let date = new Date();

      window.onload = function () {
        let yearEl = document.querySelector("#year");
        let yearOpt = `<option value="">매매년도선택</option>`;
        let year = date.getFullYear();
        for (let i = year; i > year - 20; i--) {
          yearOpt += `<option value="${i}">${i}년</option>`;
        }
        yearEl.innerHTML = yearOpt;

        // 브라우저가 열리면 시도정보 얻기.
        sendRequest("sido", "*00000000");
      };

      document.querySelector("#year").addEventListener("change", function () {
        let month = date.getMonth() + 1;
        let monthEl = document.querySelector("#month");
        let monthOpt = `<option value="">매매월선택</option>`;
        let yearSel = document.querySelector("#year");
        let m = yearSel[yearSel.selectedIndex].value == date.getFullYear() ? month : 13;
        for (let i = 1; i < m; i++) {
          monthOpt += `<option value="${i < 10 ? "0" + i : i}">${i}월</option>`;
        }
        monthEl.innerHTML = monthOpt;
      });

      // https://juso.dev/docs/reg-code-api/
      // let url = "https://grpc-proxy-server-mkvo6j4wsq-du.a.run.app/v1/regcodes";
      // let regcode = "*00000000";
      // 전국 특별/광역시, 도
      // https://grpc-proxy-server-mkvo6j4wsq-du.a.run.app/v1/regcodes?regcode_pattern=*00000000

      // 시도가 바뀌면 구군정보 얻기.
      document.querySelector("#sido").addEventListener("change", function () {
        if (this[this.selectedIndex].value) {
          let regcode = this[this.selectedIndex].value.substr(0, 2) + "*00000";
          sendRequest("gugun", regcode);
        } else {
          initOption("gugun");
          initOption("dong");
        }
      });

      // 구군이 바뀌면 동정보 얻기.
      document.querySelector("#gugun").addEventListener("change", function () {
        if (this[this.selectedIndex].value) {
          let regcode = this[this.selectedIndex].value.substr(0, 5) + "*";
          sendRequest("dong", regcode);
        } else {
          initOption("dong");
        }
      });

      function sendRequest(selid, regcode) {
        const url = "https://grpc-proxy-server-mkvo6j4wsq-du.a.run.app/v1/regcodes";
        let params = "regcode_pattern=" + regcode + "&is_ignore_zero=true";
        fetch(`${url}?${params}`)
          .then((response) => response.json())
          .then((data) => addOption(selid, data));
      }

      function addOption(selid, data) {
        let opt = ``;
        initOption(selid);
        switch (selid) {
          case "sido":
            opt += `<option value="">시도선택</option>`;
            data.regcodes.forEach(function (regcode) {
              opt += `
              <option value="${regcode.code}">${regcode.name}</option>
              `;
            });
            break;
          case "gugun":
            opt += `<option value="">구군선택</option>`;
            for (let i = 0; i < data.regcodes.length; i++) {
              if (i != data.regcodes.length - 1) {
                if (
                  data.regcodes[i].name.split(" ")[1] == data.regcodes[i + 1].name.split(" ")[1] &&
                  data.regcodes[i].name.split(" ").length !=
                    data.regcodes[i + 1].name.split(" ").length
                ) {
                  data.regcodes.splice(i, 1);
                  i--;
                }
              }
            }
            let name = "";
            data.regcodes.forEach(function (regcode) {
              if (regcode.name.split(" ").length == 2) name = regcode.name.split(" ")[1];
              else name = regcode.name.split(" ")[1] + " " + regcode.name.split(" ")[2];
              opt += `
              <option value="${regcode.code}">${name}</option>
              `;
            });
            break;
          case "dong":
            opt += `<option value="">동선택</option>`;
            let idx = 2;
            data.regcodes.forEach(function (regcode) {
              if (regcode.name.split(" ").length != 3) idx = 3;
              opt += `
              <option value="${regcode.code}">${regcode.name.split(" ")[idx]}</option>
              `;
            });
        }
        document.querySelector(`#${selid}`).innerHTML = opt;
      }

      function initOption(selid) {
        let options = document.querySelector(`#${selid}`);
        options.length = 0;
        // let len = options.length;
        // for (let i = len - 1; i >= 0; i--) {
        //   options.remove(i);
        // }
      }

      ///////////////////////// 아파트 매매 정보 /////////////////////////
      document.querySelector("#list-btn").addEventListener("click", function () {
        let url =
          "http://openapi.molit.go.kr/OpenAPI_ToolInstallPackage/service/rest/RTMSOBJSvc/getRTMSDataSvcAptTradeDev";
        let gugunSel = document.querySelector("#gugun");
        let regCode = gugunSel[gugunSel.selectedIndex].value.substr(0, 5);
        let yearSel = document.querySelector("#year");
        let year = yearSel[yearSel.selectedIndex].value;
        let monthSel = document.querySelector("#month");
        let month = monthSel[monthSel.selectedIndex].value;
        let dealYM = year + month;
        let queryParams =
          encodeURIComponent("serviceKey") + "=" + " *** 발급받은 API KEY 입력 ***"; /*Service Key*/
        queryParams +=
          "&" +
          encodeURIComponent("LAWD_CD") +
          "=" +
          encodeURIComponent(regCode); /*아파트소재 구군*/
        queryParams +=
          "&" + encodeURIComponent("DEAL_YMD") + "=" + encodeURIComponent(dealYM); /*조회년월*/
        queryParams +=
          "&" + encodeURIComponent("pageNo") + "=" + encodeURIComponent("1"); /*페이지번호*/
        queryParams +=
          "&" + encodeURIComponent("numOfRows") + "=" + encodeURIComponent("30"); /*페이지당건수*/

        fetch(`${url}?${queryParams}`)
          .then((response) => response.text())
          .then((data) => makeList(data));
      });

      function makeList(data) {
        document.querySelector("table").setAttribute("style", "display: ;");
        let tbody = document.querySelector("#aptlist");
        let parser = new DOMParser();
        const xml = parser.parseFromString(data, "application/xml");
        // console.log(xml);
        initTable();
        let apts = xml.querySelectorAll("item");
        apts.forEach((apt) => {
          let tr = document.createElement("tr");

          let nameTd = document.createElement("td");
          nameTd.appendChild(document.createTextNode(apt.querySelector("아파트").textContent));
          tr.appendChild(nameTd);

          let floorTd = document.createElement("td");
          floorTd.appendChild(document.createTextNode(apt.querySelector("층").textContent));
          tr.appendChild(floorTd);

          let areaTd = document.createElement("td");
          areaTd.appendChild(document.createTextNode(apt.querySelector("전용면적").textContent));
          tr.appendChild(areaTd);

          let dongTd = document.createElement("td");
          dongTd.appendChild(document.createTextNode(apt.querySelector("법정동").textContent));
          tr.appendChild(dongTd);

          let priceTd = document.createElement("td");
          priceTd.appendChild(
            document.createTextNode(apt.querySelector("거래금액").textContent + "만원"),
          );
          priceTd.classList.add("text-end");
          tr.appendChild(priceTd);

          tbody.appendChild(tr);
        });
      }

      function initTable() {
        let tbody = document.querySelector("#aptlist");
        let len = tbody.rows.length;
        for (let i = len - 1; i >= 0; i--) {
          tbody.deleteRow(i);
        }
      }
    </script>
    <!-- 중앙 content end -->
    <footer
      class="navbar navbar-expand-lg navbar-light bg-light container justify-content-end fixed-bottom bottom-0"
    >
      <div class="row">
        <ul class="navbar-nav">
          <li><a href="#" class="nav-link text-secondary">카페소개</a></li>
          <li><a href="#" class="nav-link text-secondary">개인정보처리방침</a></li>
          <li><a href="#" class="nav-link text-secondary">이용약관</a></li>
          <li><a href="#" class="nav-link text-secondary">오시는길</a></li>
          <li><label class="nav-link text-secondary">&copy; SSAFY Corp.</label></li>
        </ul>
      </div>
    </footer>
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
      crossorigin="anonymous"
    ></script>
  </body>
</html>
