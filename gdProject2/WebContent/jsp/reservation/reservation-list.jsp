<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta />
        <meta
            http-equiv="Content-Type"
            content="text/html; charset=UTF-8"
            name="viewport"
            content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no"
        />

        <title>여기에 제목을 입력하십시오</title>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

        <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css"
            rel="stylesheet"
        />
        <link rel="stylesheet" href="css/default.css" />
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"></script>

        <style>
			a {
			    display: inline-block;
			    text-decoration: none !important;
			}
			button {
			    border: 0;
			    background: transparent;
			    cursor: pointer;
			}
			ul{
				padding: 0;
			}
			.home-img{
				background-image: url("img/home.png");
			    background-size: cover;
			    background-position: center;
			    background-repeat: no-repeat;
			    width: 20px;
			    height: 20px;
			}
			.fmenu{
				padding-left: 0px;
			}
			.fmenu li:not(.fmenu li:first-child)::before{
				content: ">";
			}
			
			.container-box {
			    margin: 0 auto;
			    width: 100%;
			    max-width: 1200px;
			}
			.content {
			    flex: 3;
			    max-width: 800px;
			    margin: 50px;
			}
			.select {
			    border: 1px solid #468c91;
			    padding: 25px;
			    margin: 25px 0;
			}
			.card-list {
			    max-width: 800px;
			    margin: 10px 50px;
			    display: flex;
			    flex-wrap: wrap;
			    justify-content: space-around;
			}
			.card-box {
			    display: block;
			    font-size: 24px;
			    border: 1px solid #468c91;
			    border-radius: 5px;
			    padding: 10px 40px;
			    margin: 10px;
			    color: #468c91;
			}

            .card-box.doctor {
                display: block;
                font-size: 24px;
                border: 1px solid #468c91;
                border-radius: 5px;
                padding: 10px 0 0 0;
                margin: 10px;
                color: #468c91;
            }
            .card-box.doctor .flex {
                margin: 0 40px;
            }

            .card-box:hover:not(.not-available),
            .card-box.active:not(.not-available) {
                background-color: #468c91;
                color: white;
            }
            .card-box.not-available {
                background-color: #b8b8b8;
                border: none;
                color: white;
            }

            .rsv-time .card-box {
                font-size: 16px !important;
            }
            .doctor-img {
                background-image: url("img/doctor-img.png");
                background-size: cover;
                background-position: center;
                background-repeat: no-repeat;
                filter: opacity(0.5) drop-shadow(0 0 0 #468c91);
                margin: 25px 20px 25px 0;
                width: 100px;
                height: 100px;
            }

            .card-box button {
                width: 100%;
                background-color: #468c91;
                color: white;
                text-align: center;
            }
            .card-box:hover button,
            .card-box.active button {
                background-color: white;
                color: #468c91;
            }
            .doctor-name {
                margin-top: 25px;
            }
            .doctor-subject {
                font-size: 16px;
            }
            .doctor-code {
                display: none;
            }
            .book {
                margin-left: 0;
            }
            .table {
                border-color: #468c91;
                border-top: 3px;
                border-bottom: 3px;
                border-style: solid;
                border-collapse: collapse;
            }
            .table-head {
                background-color: #b8b8b8;
            }
            .table-rcode{
            	display: none;
            }
            .radios{
            	float: right;
            }
            .radios label{
            	margin-left: 5px;
            }
      		.manager-back{
      			text-align: right;
      		}
        </style>
        <script>
            $(function () {
            	console.log(${pcode});
                <c:forEach items="${rsvList}" var="rsv">
                    $("#rsv-mylist tbody").append(
                    "<tr><td class='table-rcode'>" + "${rsv.rcode}" + "</td>"
                    + "<td>"+ "${rsv.rn}" + "</td>"
                    + "<td>" + "${rsv.rsvdate}" + "</td>"
                    + "<td>" + "${rsv.rsvtime}" + "</td>"
                    + "<td>" + "${rsv.name}" + "</td>"
                    + "<td>" + "${rsv.state}" + "</td></tr>");
                </c:forEach>

                $("#rsv-mylist tbody")
                    .find("tr")
                    .click(function (idx, item) {
                        var rcode = $(this).find(".table-rcode").text();
                        //console.log(rcode);
                        $("#form-rcode").val(rcode);
                        $("#form").submit();
                    });
				$("#patient-list").click(function(){
					location.href = "mg_patient_list";
				})
            });
        </script>
    </head>
    <body>
        <jsp:include page="../common/header.jsp"></jsp:include>
        <div class="flex container-box">
            <jsp:include page="../common/sidemenu.jsp">
                <jsp:param name="side" value="${side}" />
            </jsp:include>
            <div class="content">
                <ul class="fmenu">
                	<li><div class="home-img"></div></li>
                    <li>예약</li>
                    <li>예약조회</li>
                </ul>
                <h1>예약조회</h1>
                <p> - 항목을 클릭하면 상세페이지로 이동합니다</p>

                <table id="rsv-mylist" class="table">
                    <thead class="table-head">
                        <tr>
                            <th>No.</th>
                            <th>예약일자</th>
                            <th>예약시간</th>
                            <th>진료과</th>
                            <th>예약 상태</th>
                        </tr>
                    </thead>
                    <tbody></tbody>
                </table>
                <c:if test="${sessionScope.mcode != null}">
                <div class="manager-back">
                	<button type="button" id="patient-list" class="btn btn-success">환자 목록으로 돌아가기</button>
                </div>
                </c:if>
                <form style="display: none" action="reservation-detail" method="POST" id="form">
  					<input type="hidden" id="form-rcode" name="rcode" value=""/>
				</form>
				<c:if test="${sessionScope.mcode == null}">
                <ul class="pagination justify-content-center">
                    <c:if test="${pageGroupResult.beforePage}">
                        <li class="page-item">
                            <a
                                class="page-link"
                                href="reservation-list?reqPage=${pageGroupResult.selectPageNumber - 1}"
                                >before</a
                            >
                        </li>
                    </c:if>
                    <c:forEach
                        var="index"
                        begin="${pageGroupResult.groupStartNumber}"
                        end="${pageGroupResult.groupEndNumber}"
                    >
                        <c:choose>
                            <c:when
                                test="${pageGroupResult.selectPageNumber == index}"
                            >
                                <li class="page-item active">
                                    <a
                                        class="page-link"
                                        href="reservation-list?reqPage=${index}"
                                        >${index}</a
                                    >
                                </li>
                            </c:when>

                            <c:otherwise>
                                <li class="page-item">
                                    <a
                                        class="page-link"
                                        href="reservation-list?reqPage=${index}"
                                        >${index}</a
                                    >
                                </li>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                    <c:if test="${pageGroupResult.afterPage}">
                        <li class="page-item">
                            <a
                                class="page-link"
                                href="reservation-list?reqPage=${pageGroupResult.selectPageNumber + 1}"
                                >after</a
                            >
                        </li>
                    </c:if>
                </ul>
                </c:if>
                <c:if test="${sessionScope.mcode != null}">
                <ul class="pagination justify-content-center">
                    <c:if test="${pageGroupResult.beforePage}">
                        <li class="page-item">
                            <a
                                class="page-link"
                                href="reservation-list?reqPage=${pageGroupResult.selectPageNumber - 1}&pcode=${pcode}"
                                >before</a
                            >
                        </li>
                    </c:if>
                    <c:forEach
                        var="index"
                        begin="${pageGroupResult.groupStartNumber}"
                        end="${pageGroupResult.groupEndNumber}"
                    >
                        <c:choose>
                            <c:when
                                test="${pageGroupResult.selectPageNumber == index}"
                            >
                                <li class="page-item active">
                                    <a
                                        class="page-link"
                                        href="reservation-list?reqPage=${index}&pcode=${pcode}"
                                        >${index}</a
                                    >
                                </li>
                            </c:when>

                            <c:otherwise>
                                <li class="page-item">
                                    <a
                                        class="page-link"
                                        href="reservation-list?reqPage=${index}&pcode=${pcode}"
                                        >${index}</a
                                    >
                                </li>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                    <c:if test="${pageGroupResult.afterPage}">
                        <li class="page-item">
                            <a
                                class="page-link"
                                href="reservation-list?reqPage=${pageGroupResult.selectPageNumber + 1}&pcode=${pcode}"
                                >after</a
                            >
                        </li>
                    </c:if>
                </ul>
                </c:if>
            </div>
        </div>
        <jsp:include page="../common/footer.jsp"></jsp:include>
    </body>
</html>
