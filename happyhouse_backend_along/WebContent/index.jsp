<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}" ></c:set>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta name="author" content="Untree.co" />
    <link rel="shortcut icon" href="favicon.png" />

    <meta name="description" content="" />
    <meta name="keywords" content="bootstrap, bootstrap5" />

    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Work+Sans:wght@400;500;600;700&display=swap"
      rel="stylesheet"
    />

    <link rel="stylesheet" href="fonts/icomoon/style.css" />
    <link rel="stylesheet" href="fonts/flaticon/font/flaticon.css" />

    <link rel="stylesheet" href="css/tiny-slider.css" />
    <link rel="stylesheet" href="css/aos.css" />
    <link rel="stylesheet" href="css/style.css" />

    <title>
      HAPPYHOUSE &mdash; 김성욱 김소희 이경창
    </title>
  </head>
  <body>
    <div class="site-mobile-menu site-navbar-target">
      <div class="site-mobile-menu-header">
        <div class="site-mobile-menu-close">
          <span class="icofont-close js-menu-toggle"></span>
        </div>
      </div>
      <div class="site-mobile-menu-body"></div>
    </div>

    <nav class="site-nav">
      <div class="container">
        <div class="menu-bg-wrap">
          <div class="site-navigation">
            <a href="index.jsp" class="logo m-0 float-start">HAPPY HOUSE</a>

            <ul
              class="js-clone-nav d-none d-lg-inline-block text-start site-menu float-end"
            >
              <li class="active"><a href="index.jsp">Home</a></li>

			<c:if test="${empty logOK }">
				<li><a href="login.jsp">login</a></li>
				<li><a href="${root}/user/createUser.jsp">join Us</a></li>
			</c:if>
			<c:if test="${!empty logOK }">
				<li><a href="logout/logout.jsp">logout</a></li>
            	<li><a href="${root}/user?action=show">myInfo</a></li>
           		<li><a href="${root}/board?action=getlistBoard">post</a></li>
			</c:if>
            </ul>

            <a
              href="#"
              class="burger light me-auto float-end mt-1 site-menu-toggle js-menu-toggle d-inline-block d-lg-none"
              data-toggle="collapse"
              data-target="#main-navbar"
            >
              <span></span>
            </a>
          </div>
        </div>
      </div>
    </nav>

    <div class="hero">
      <div class="hero-slide">
        <div
          class="img overlay"
          style="background-image: url('images/hero_bg_3.jpg')"
        ></div>
        <div
          class="img overlay"
          style="background-image: url('images/hero_bg_2.jpg')"
        ></div>
        <div
          class="img overlay"
          style="background-image: url('images/hero_bg_1.jpg')"
        ></div>
      </div>

      <div class="container">
        <div class="row justify-content-center align-items-center">
          <div class="col-lg-9 text-center">
            <h1 class="heading" data-aos="fade-up">
              알고싶은 정보를 선택해주세요
            </h1>
            <form
              action="#"
              class="narrow-w form-search d-flex align-items-stretch mb-3"
              data-aos="fade-up"
              data-aos-delay="200"
            >
              <div class="row col-md-12 justify-content-center mb-2">
                <div class="form-group col-md-4">
                  <select class="form-select bg-secondary text-light" id="sido">
                    <option value="">시도선택</option>
                  </select>
                </div>
                <div class="form-group col-md-4">
                  <select class="form-select bg-secondary text-light" id="gugun">
                    <option value="">구군선택</option>
                  </select>
                </div>
                <div class="form-group col-md-4">
                  <select class="form-select bg-secondary text-light" id="dong">
                    <option value="">동선택</option>
                  </select>
                </div>
                <div><p></p></div>
                <div class="form-group col-md-4">
                  <select class="form-select 
                  bg-dark text-light" id="year"></select>

                </div>
                <div class="form-group col-md-4">
                  <select class="form-select bg-dark text-light" id="month">
                    <option value="">매매월선택</option>
                  </select>
                </div>
                <div><p></p></div>
                <div class="form-group col-md-8">
                  <button type="button" id="list-btn" class="btn-outline-primary">
                    click
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
          <script src="js/index.js">
          </script>
        </div>
              <!--<button type="submit" class="btn btn-primary">Search</button>-->
            </form>
          </div>
        </div>
      </div>
    </div>

    <div class="site-footer">
      <div class="container">
        <div class="row">
          <div class="col-lg-4">
            <div class="widget">
              <h3>MAKER</h3>
              <a>김성욱 김소희 이경창</a>
            </div>
            <!-- /.widget -->
          </div>

          <!-- /.col-lg-4 -->
          <div class="col-lg-4">
            <div class="widget">
              <h3>SSAFY8</h3>
              <a>WebDb Project</a>
            </div>
            <!-- /.widget -->
          </div>
          <!-- /.col-lg-4 -->

          <div class="col-lg-4">
            <div class="widget">
              <h3>DATE</h3>
              <a>2022.09.28</a>
            </div>
            <!-- /.widget -->
          </div>
        </div>
        <!-- /.row -->

        <div class="row mt-5">
          <div class="col-12 text-center">

            <p>
              Copyright &copy;
              <script>
                document.write(new Date().getFullYear());
              </script>
              . All Rights Reserved. &mdash; Designed with love by
              <a href="https://untree.co">Untree.co</a>
              <!-- License information: https://untree.co/license/ -->
            </p>
            <div>
              Distributed by
              <a href="https://themewagon.com/" target="_blank">themewagon</a>
            </div>
          </div>
        </div>
      </div>
      <!-- /.container -->
    </div>
    <!-- /.site-footer -->

    <!-- Preloader -->
    <div id="overlayer"></div>
    <div class="loader">
      <div class="spinner-border" role="status">
        <span class="visually-hidden">Loading...</span>
      </div>
    </div>

    <script src="js/bootstrap.bundle.min.js"></script>
    <script src="js/tiny-slider.js"></script>
    <script src="js/aos.js"></script>
    <script src="js/navbar.js"></script>
    <script src="js/counter.js"></script>
    <script src="js/custom.js"></script>
  </body>
</html>
