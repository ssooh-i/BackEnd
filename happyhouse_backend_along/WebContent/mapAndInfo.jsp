<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
      crossorigin="anonymous"
    />
    <link rel="stylesheet" href="./style.css" />

    <title>Document</title>
  </head>
  <body style="background-color: rgba(0, 85, 85, 1)">
    <header class="header">
      <div class="container" style="background: #005555; padding-bottom: 10px; padding-top: 10px">
        <div class="title" style="color: white"><h2 style="font-weight: bold">HAPPY HOUSE</h2></div>
      </div>
    </header>
    <section>
      <div class="container1" style="display: inline-block; padding-left: 40px">
        <div id="map" style="width: 800px; height: 690px"></div>
        <script
          type="text/javascript"
          src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9c5b3ca695c88dde09115fa4ed6e3afd&libraries=services,clusterer,drawing"
        ></script>
      </div>
      <div class="container2" style="display: inline-block; padding-left: 40px">
        <div style="background-color: white; overflow: scroll; width: 550px; height: 690px">
          <table class="table table-striped" style="display: none">
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
      </div>
    </section>
    <script src="js/mapAndInfo.js">
      
    </script>
  </body>
</html>
