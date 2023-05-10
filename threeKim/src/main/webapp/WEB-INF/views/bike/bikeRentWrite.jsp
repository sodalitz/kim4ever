<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
/*리셋코드*/

*{margin:0;padding:0;}
li{list-style:none;}
#main{width:1440px; margin:35px auto 70px; text-align:center; }
#content{width:1440px; height:1500px;}
#bottom{width:1440px; height:300px;}
#content table {width:600px; height:800px; border-collapse:collapse; margin:160px auto 20px; text-align:center;}
#content table td {border:1px solid #ddd; padding:10px;font-size:16px; line-height:1.5; margin-left:60px;}
#content table h2 {font-size:24px; margin-bottom:5px; }
#content table p {margin: 0;}
#content table input[type="text"],textarea{
  box-sizing: border-box;
  width: 100%;
  padding: 10px;
  margin: 2px 0;
  border: 1px solid #ccc;
  border-radius: 4px;
}
#content table button{width:100px; height:40px; text-align:center; font-family: 'omyu_pretty'; font-size:21px; border-radius:10px; border:0px solid #ff9933; background:#ff9933;}
#content table button:active {background:#ffcc66; box-shadow:0 2px 2px rgba(0,0,0,0.1); transform:translateY(2px);}
</style>
</head>
<body>
<div id="main">
<%@include file="../header.jsp" %>
	
	<div id="content">
	
		<table>
			<tr>
				<td style="height:500px;"><input type="file" name="uploadfile"/></td>	
			</tr>
			
		 	<tr>
		 		<td>
				<input type="text" placeholder="이름을 입력해 주세요"/>
				</td>
			</tr>
				
			<tr>
				<td>
				<input id="price" type="text" placeholder="가격을 입력해 주세요"/>
				</td>
			</tr>
			
			<tr>
				<td>
					<button type="button" onclick="location.href='<%=request.getContextPath()%>/bike/bikeRent.do'">등록</button>
				</td>
			</tr> 
		</table>
	

	
	</div>
	
	<div id="bottom">
	 <%@include file="../bottom.jsp" %>
	</div>


</div>
</body>
<%@include file="../footer.jsp" %>
</html>