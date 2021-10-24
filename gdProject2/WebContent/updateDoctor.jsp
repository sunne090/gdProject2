<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
        .main{
        	max-width: 1200px;
        	margin: 0 auto;
        	display: flex;
        }
        .content {
        	margin: 20px;
        }
        input {
            width: 600px;
            height: 40px;
            border: 1px solid rgb(243, 243, 243);
            border-radius: 5px;
        }
		textarea {
        	border: 1px solid rgb(243, 243, 243);
            border-radius: 5px;
        }
        #idcheck {
            width: 100px;
            height: 35px;
            color: white;
            background-color: rgb(70, 145, 140);
            border: none;
            border-radius: 5px;
        }

        #postbtn {
            width: 140px;
            height: 35px;
            background-color: rgb(223, 220, 220);
            border: none;
            border-radius: 5px;
        }
        table {
            width: 800px;
            border-top: 4px solid rgb(70, 145, 140);
            border-left: none;
            border-right: none;
            border-bottom: 1px solid rgb(223, 220, 220);
            padding-top: 0;
            border-collapse: collapse;
        }

        th {
            background-color: rgb(148, 220, 215);
            margin: 0;
            padding: 10px;
            color: #555;
            font-size: 0.9rem;
            width: 150px;
        }
        tr {
            background-color: white;
            height: 45px;
        }
        td {
            padding: 5px;
        }
        .post input {
            margin-bottom: 5px;
        }

        #savebtn {
            width: 70px;
            height: 35px;
            color: white;
            background-color: rgb(70, 145, 140);
            border: none;
            border-radius: 3px;
            margin-top: 30px;
            margin-left: 350px;
        }
        #cancel {
        	width: 70px;
            height: 35px;
            color: white;
            background-color: rgb(70, 145, 140);
            border: none;
            border-radius: 3px;
            margin-top: 30px;
            margin-left: 20px;
        }
        #sample6_postcode{
        	width: 300px;
        }
        
</style>
</head>
<body>
	<jsp:include page="components/header.jsp"></jsp:include>
	<div class = "main">
		<jsp:include page="components/sidemenu.jsp"></jsp:include>
		<div class ="content">
    	<h1>개인정보수정</h1>
        	<form method="post" action="update_doctor">
            	<table border="1px solid">
                <tr>
                    <th>성명</th>
                    <td>이름 불러오기</td>
                </tr>
                <tr>
                    <th>면허번호</th>
                    <td>면허번호 불러오기</td>
                </tr>
                 <tr>
                    <th>진료과</th>
                    <td>진료과 불러오기</td>
                </tr>
                <tr>
                    <th>아이디</th>
                    <td>아이디 불러오기</td>
                </tr>
                <tr>
                    <th>비밀번호</th>
                    <td><input type="password" name="pwd" placeholder="비밀번호를 입력해주세요."></td>
                </tr>
                <tr>
                    <th>비밀번호 확인</th>
                    <td><input type="password" name="pwdchk" placeholder="비밀번호를 다시 입력해주세요."></td>
                </tr>
                <tr>
                    <th>주소</th>
                    <td class = "post">
                        <input type="text" id="sample6_postcode" placeholder="우편번호">
                        <input type="button" id="postbtn" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
                        <input type="text" id="sample6_address" placeholder="주소"><br>
                        <input type="text" id="sample6_detailAddress" placeholder="상세주소"><br>
                    </td> 
                </tr>
                <tr>
                    <th>생년월일</th>
                    <td>생년월일 불러오기</td>
                </tr>
                <tr>
                    <th>경력사항</th>
                    <td>
                        <textarea name="career" placeholder="내용을 입력해주세요." rows="5" cols="75"></textarea>    
                    </td>
                </tr>
                <tr>
                    <th>휴대폰</th>
                    <td><input type = "tel" name = "tel" placeholder="전화번호를 입력해주세요."></td>
                </tr>
                <tr>
                    <th>이메일</th>
                    <td><input type="email" name="email" placeholder="이메일을 입력해주세요."></td>
                </tr>
            </table>
            <div>
            	<button type = "submit" id = "savebtn">저장</button>
            	<button type = "button" id = "cancel" onclick="location.href = 'index.jsp'">취소</button>
            </div>
        </form>
        </div>
    </div>
    <jsp:include page="components/footer.jsp"></jsp:include>
        <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
    	function sample6_execDaumPostcode() {
        	new daum.Postcode({
            	oncomplete: function(data) {
             
                var addr = ''; // 주소 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
</script>
</body>
</html>