</html><%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.myezen.myapp.domain.BoardVo"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %><!-- 날짜태그 --> 


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
/*리셋코드*/ 
*{margin:0;padding:0;}
li{list-style:none;}

@font-face {
    font-family: 'GangwonEdu_OTFBoldA';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2201-2@1.0/GangwonEdu_OTFBoldA.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
@font-face {
    font-family: 'omyu_pretty';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2304-01@1.0/omyu_pretty.woff2') format('woff2');
    font-weight: normal;
    font-style: normal;
}

@font-face {
    font-family: 'KCC-Ganpan';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2302@1.0/KCC-Ganpan.woff2') format('woff2');
    font-weight: normal;
    font-style: normal;
}


#main{width:1440px; margin:35px auto 70px; text-align:center;}
#main #content{width:1440px; height:2400px;}
#main #bottom{width:1440px; height:300px;}
h2{text-align: center; margin-top:20px;}
#content table {width:60%; border-collapse:collapse; border:1px solid #ddd; margin: 60px auto 0; text-align:center;  line-height:100px; font-family:'omyu_pretty'; font-size:24px;}
#content table th{width:200px; text-align:center; border:1px solid #ddd; padding:8px;}
#content table td{border:1px solid #ddd; padding:8px; text-align:left;}
#content table td:nth-child(1){width:140px;text-align:center;}
#content table td:nth-child(2){width:400px; text-align:left;}
#content table tr:last-child td input{display: inline-block; width:120px; height:50px;}
input{
  font-family: 'omyu_pretty';
  font-size:24px;
  box-sizing: border-box;
  width: 100%;
  padding: 10px;
  margin: 2px 0;
  border: 1px solid #ccc;
  border-radius: 4px;
}
</style>

</head>

<script src="https://code.jquery.com/jquery-3.6.0.js"></script>

<body>
	<div id="main">
		<%@include file="../header4.jsp"%>

		<div id="content">
			<h2>신고 내용</h2>

	
			<table>
		 <tr>
		    <th colspan="2"><h2>신고 내역</h2></th>
		  </tr>
		  		
				<tr>
					<th>고객명</th>
					<td>${ejv.memberName}</td>
					
				</tr>
				
				<tr>
					<th>연락처</th>
					<td>${ejv.memberPhone}</td>
				</tr>
				
				<tr>
					<th>자전거 종류</th>
					<td>${ejv.bikeType}</td>
				</tr>
				
				<tr>
					<th>자전거 번호</th>
					<td>${ejv.bikeCode}</td>
				</tr>
				
				<tr>
					<th>대여 장소</th>
					<td>${ejv.rentPlace}</td>
				</tr>
				
				<tr>
					<th>고장 시간</th>
					<td>
				         <fmt:parseDate value="${ejv.errorDay}" pattern="yyyy-MM-dd HH:mm" var="parsedRentDay" /><!-- 날짜 변경 -->
            			<fmt:formatDate value="${parsedRentDay}" pattern="yyyy-MM-dd HH:mm" var="formattedRentDay" /><!-- 시간 설정 변경 -->
	           	 			${formattedRentDay}
						</td>  
				</tr>
				<tr>
					<th>고장 내용</th>
					<td>${ejv.errorContent}</td>
				</tr>

		</table>
				
		
		</div>





		<div id="bottom"></div>
	</div>
</body>
<%@include file="../footer.jsp"%>
</html>