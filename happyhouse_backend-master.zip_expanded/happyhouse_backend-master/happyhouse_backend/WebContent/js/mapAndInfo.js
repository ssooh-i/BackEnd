//지도 띄우기
      var container = document.getElementById("map"); //지도를 담을 영역의 DOM 레퍼런스
      var options = {
        //지도를 생성할 때 필요한 기본 옵션
        center: new kakao.maps.LatLng(33.450701, 126.570667), //지도의 중심좌표.
        level: 3, //지도의 레벨(확대, 축소 정도)
      };
      var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴

      // 주소로 지도에 찍기
      function pickMap(addr, aptName) {
        // 주소-좌표 변환 객체를 생성합니다
        var geocoder = new kakao.maps.services.Geocoder();

        // 주소로 좌표를 검색합니다
        geocoder.addressSearch(addr, function (result, status) {
          // 정상적으로 검색이 완료됐으면
          if (status === kakao.maps.services.Status.OK) {
            var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

            // 결과값으로 받은 위치를 마커로 표시합니다
            var marker = new kakao.maps.Marker({
              map: map,
              position: coords,
            });

            // 인포윈도우로 장소에 대한 설명을 표시합니다
            var infowindow = new kakao.maps.InfoWindow({
              content: `<div style="width:150px;text-align:center;padding:6px 0;">${aptName}</div>`,
            });
            infowindow.open(map, marker);

            // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
            map.setCenter(coords);
          }
        });
      }

      var queryParams = JSON.parse(localStorage.getItem("infos"));
      var url = JSON.parse(localStorage.getItem("url"));

      fetch(`${url}?${queryParams}`)
        .then((response) => response.text())
        .then((data) => makeList(data));

      function makeList(data) {
        document.querySelector("table").setAttribute("style", "display: ;");
        let tbody = document.querySelector("#aptlist");
        let parser = new DOMParser();
        const xml = parser.parseFromString(data, "application/xml");
        // console.log(xml);
        initTable();
        let apts = xml.querySelectorAll("item");
        apts.forEach((apt) => {
          console.log(apt);
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
            document.createTextNode(apt.querySelector("거래금액").textContent + "만원")
          );
          priceTd.classList.add("text-end");
          tr.appendChild(priceTd);

          let jibun = apt.querySelector("지번").textContent;

          tr.addEventListener("click", function (e) {
            pickMap(
              apt.querySelector("법정동").textContent + " " + jibun,
              apt.querySelector("아파트").textContent
            );
          });

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