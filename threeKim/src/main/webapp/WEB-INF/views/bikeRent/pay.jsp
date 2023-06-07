<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.myezen.myapp.domain.BikeVo" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
	    <!-- jQuery -->
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
    <!-- iamport.payment.js -->
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
    
    <script>
        var IMP = window.IMP; 
        IMP.init("imp67011510"); 
      
        var today = new Date();   
        var hours = today.getHours(); // 시
        var minutes = today.getMinutes();  // 분
        var seconds = today.getSeconds();  // 초
        var milliseconds = today.getMilliseconds();
        var makeMerchantUid = hours +  minutes + seconds + milliseconds;
        

        function requestPay() {
            IMP.request_pay({
                pg : 'kakaopay', //카카오 페이
                pay_method : 'card',
                merchant_uid: "IMP"+makeMerchantUid, 
                name : ' 타:바 자전거 대여',
         	    amount: '10', // 가격
                buyer_name : ' <%=session.getAttribute("memberName")%>',
                buyer_tel : '구매자 번호',
                buyer_addr : '전주시 덕진구',
                buyer_postcode : '123-456',
                popup: true,

                m_redirect_url: '<%=request.getContextPath()%>/bikeRent/bikeRentUpdate.do',
                	notice_url: "<%=request.getContextPath()%>/webhook/view.do" 
                	// 웹훅url 웹훅연동을 생략하시는 경우 결제결과를 정상적으로 수신받지 못하는 상황이 발생
                	                	
           }, function(rsp) {
    			console.log(rsp);
    		    if ( rsp.success ) {
    		    	var msg = rsp.name+'결제가 완료되었습니다.' + '\n';
    		        msg += '구매자 : ' + rsp.buyer_name + '\n';
    		        msg += '결제 금액 : ' + rsp.paid_amount ;
    		    } else {
    		    	 var msg = '결제에 실패하였습니다.';
    		         msg += '에러내용 : ' + rsp.error_msg;
    		    }
    		    alert(msg);
    		});
    	}
   
    </script>
	
		<meta charset="UTF-8">
		<title>결제</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/reset.css"/>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/fonts.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style_bikeRent.css">  
	</head>


	<body>
		<%@include file="../header.jsp" %>
		<main id="main">
			<section id="content">
		<h1> kakaoPay 테스트 이용 요금 : ${bjv.rentPrice}원</h1>
 
    <button onclick="requestPay()">결제하기</button>

 
			
			</section>
			
			
			
			
		</main>
		<%@include file="../footer.jsp" %>
	</body>
	


</html>