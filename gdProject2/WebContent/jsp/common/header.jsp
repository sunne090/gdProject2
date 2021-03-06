<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <title>여기에 제목을 입력하십시오</title>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

        <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css"
            rel="stylesheet"
        />
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"></script>
        <style>
			.header-a{
				text-decoration: none;
				color: black;
			}
            .header {
                margin: 0 auto;
                max-width: 1200px;
            }
            #logo {
                background-image: url("img/logo.png");
                background-size: cover;
                background-position: center;
                background-repeat: no-repeat;
                width: 200px;
                height: 100px;
            }
            .flex {
                display: flex;
                justify-content: space-around;

            }
            .flex-vertical {
                display: flex;
                flex-direction: column;
                justify-content: space-around;
                align-items: flex-end;
            }
            #search {
                background-image: url("img/search.png");
                background-size: cover;
                background-position: center;
                background-repeat: no-repeat;
                width: 32px;
                height: 32px;
            }
            ul {
                list-style: none;
            }
            ul li {
                display: inline-block;
            }
            #member-menu li {
                font-size: 16px;
                padding-top: 10px;
            }
            #nav-menu li {
                font-size: 24px;
                margin: 20px;
            }

            #sample-bg {
                margin: 0 auto;
                text-align: center;
                width: 100%;
                max-width: 1200px;
            }
            #sample-bg img {
                width: 100%;
                height: 40%;
            }
            .left {
                float: left;
            }
            .right {
                float: right;
            }
        </style>
    </head>

    <body>
        <div class="header">
            <div class="left">
                <a href="/gdProject2"><div id="logo"></div></a>
            </div>
            <div class="flex-vertical right">
                <ul id="member-menu">
                <c:if test="${pcode == null && dcode == null && mcode == null}">
                    <li><label>로그인
                        <select onchange="if(this.value) location.href=(this.value)">
                        	<option value="">선택</option>
                            <option value="patient_login_input">환자</option>
                            <option value="doctor_login_input">의사</option>
                            <option value="manager_login_input">관리자</option>
                        </select>
                        </label>
                    </li>
                    <li>|</li>
                    <li><a class="header-a" href="patient_input">회원가입</a></li>
                </c:if>
                <c:if test="${pcode != null || dcode != null || mcode != null}">
                	<li><a class="header-a" href="logout">로그아웃</a></li>
                </c:if>
                <c:if test="${sessionScope.pcode != null}">
                	<li>|</li>
					<li><a class="header-a" href="patient_detail?pcode=${pcode}" id="patientUpdate">마이페이지</a></li>
				</c:if>
				<c:if test = "${sessionScope.dcode != null}">
					<li>|</li>
					<a class="header-a" href = "mypage?dcode=${dcode}">마이페이지</a>
				</c:if>
                </ul>
                <ul id="nav-menu">
                    <li>

                    <c:if test="${sessionScope.dcode == null && sessionScope.mcode == null }">
                    	<a class="header-a" href="reservation">예약</a>
                    </c:if>
                    <c:if test = "${sessionScope.dcode != null && sessionScope.pcode == null && sessionScope.mcode == null}">
                    	<a class="header-a" href="schedule_check">업무관리</a>
                    </c:if>
                    <c:if test = "${sessionScope.dcode == null && sessionScope.pcode == null && sessionScope.mcode != null}">
                    	<a class="header-a" href="mg_doctor_list">업무관리</a>
                    </c:if>
                    </li>

                    <li><a class="header-a" href="doctor_search">의료진</a></li>
                    <li><a class="header-a" href="qna_list?reqPage=1">소통정보</a></li>
                    <li><a class="header-a" href="notice_list?reqPage=1">공지사항</a></li>
                    <li>
                        <a href="#"><div id="search"></div></a>
                    </li>
                </ul>
            </div>
        </div>
        <div id="sample-bg">
            <img src="img/bg_hospital.jpg" />
        </div>
    </body>
</html>
