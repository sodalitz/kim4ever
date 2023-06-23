<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>모임 메인화면</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/reset.css"/>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/fonts.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style_gathering.css">
		<link rel="stylesheet" media="(min-width: 300px) and (max-width: 940px)" href="${pageContext.request.contextPath}/css/style_gathering_mo.css">
		  <meta name="viewport" content="width=device-width, initial-scale=1">		
		  
		<style type="text/css">
			.gContainer{border: 1px solid #0000;}
			/*게시글 틀*/ 
			.gBoardList { width: 100%; border: 1px solid #bbb;background-color: #f1f1f1;border-radius: 10px;}
			/*검색하기 부분*/
			#searchCategory{text-align: right; font-size: 20px; margin: 40px 60px; height: 30px; font-family: 'omyu_pretty';} 
			#searchCategory>div{display: inline-block; vertical-align: top;} 
			#searchCategory>div>select{width: 80px; height: 30px; font-size: 18px; font-family: 'omyu_pretty';vertical-align: top;} 
			#searchCategory>div>input{width: 300px; height: 26px; font-size: 18px;vertical-align: top;} 
			#searchCategory>div>button{width: 100px; height: 30px; margin-top: 0px;margin-bottom: 0px;} 
			/*공지사항부분*/
			.gNotice{text-align: left; font-size: 20px; margin: 40px 60px;}
			.gNotice>div>div{display: inline-block; font-size: 25px; font-weight: bold;}
			.gNotice>div>div:nth-child(1){color: #f00; margin-right: 20px;}
			.gNotice>div:nth-child(2){border-bottom: 2px solid #bbb; padding-bottom: 10px; margin-top: 10px;}/* 끝나는바*/
			/*게시글 부분*/
			.gBoard{text-align: left; font-size: 20px; margin: 40px 60px;} 
			.gBoard>div>div:nth-child(1){width: 50px; height: 50px; float: left;}/*프로필*/ 
			.gProfileimage img{width: 50px; height: 50px; object-fit: cover; border-radius: 50%;}/*프로필이미지*/
			.gBoard>div>div:nth-child(2){height: 25px; margin-left: 70px;}/*모임장,이름*/ 
			.gBoard>div>div:nth-child(2)>div{display: inline-block; margin-top: 5px;} 
			.gBoard>div>div:nth-child(3)>div:nth-child(1){height: 25px; margin-left: 70px; font-size: 15px; margin-top: 5px;}/*날짜 카테고리*/ 
			.gBoard>div:nth-child(2){clear: both;margin-top: 10px; font-weight: bold;}/*게시글제목*/
			.gBoard>div:nth-child(2)>span{font-size: 18px;}/*게시글 카테고리*/
			.gBoard>div:nth-child(3){font-size: 18px; margin-top: 10px; border-bottom: 2px solid #bbb; padding-bottom: 10px; margin-top: 10px;}/*게시글 내용*/
			/*버튼 부분*/
			#writeBtn{text-align: right;}	
			/*페이징 부분*/
			.gPaging{font-size: 25px;}
			/*a태그*/
			a{text-decoration: none; color: #000;}					
			
			/*************************모바일****************************************/
				/*****모바일 넓이***/
				@media (min-width: 300px) and (max-width: 940px)  {
			.gBoardList { width: 100%; border: 1px solid #bbb;background-color: #f1f1f1;border-radius: 10px;}
				
			/*검색하기 부분*/
			#searchCategory{text-align: right; font-size: 18px; margin: 20px 10px; height: 30px; font-family: 'omyu_pretty';} 
			#searchCategory>div{display: inline-block; vertical-align: top;} 
			#searchCategory>div>select{width: 21%; height: 30px; font-size: 15px; font-family: 'omyu_pretty';vertical-align: top;} 
			#searchCategory>div>input{width: 53%; max-width:300px; height: 26px; font-size: 15px;vertical-align: top;} 
			#searchCategory>div>button{width: 18%; height: 30px; margin-top: 0px;margin-bottom: 0px;} 
			/*공지사항부분*/
			.gNotice{text-align: left; font-size: 20px; margin: 40px 60px;}
			.gNotice>div>div{display: inline-block; font-size: 25px; font-weight: bold;}
			.gNotice>div>div:nth-child(1){color: #f00; margin-right: 20px;}
			.gNotice>div:nth-child(2){border-bottom: 2px solid #bbb; padding-bottom: 10px; margin-top: 10px;}/* 끝나는바*/
			/*게시글 부분*/
			.gBoard{text-align: left; font-size: 20px; margin: 40px 60px;} 
			.gBoard>div>div:nth-child(1){width: 50px; height: 50px; float: left;}/*프로필*/ 
			.gProfileimage img{width: 50px; height: 50px; object-fit: cover; border-radius: 50%;}/*프로필이미지*/
			.gBoard>div>div:nth-child(2){height: 25px; margin-left: 70px;}/*모임장,이름*/ 
			.gBoard>div>div:nth-child(2)>div{display: inline-block; margin-top: 5px;} 
			.gBoard>div>div:nth-child(3)>div:nth-child(1){height: 25px; margin-left: 70px; font-size: 15px; margin-top: 5px;}/*날짜 카테고리*/ 
			.gBoard>div:nth-child(2){clear: both;margin-top: 10px; font-weight: bold;}/*게시글제목*/
			.gBoard>div:nth-child(2)>span{font-size: 18px;}/*게시글 카테고리*/
			.gBoard>div:nth-child(3){font-size: 18px; margin-top: 10px; border-bottom: 2px solid #bbb; padding-bottom: 10px; margin-top: 10px;}/*게시글 내용*/
			/*버튼 부분*/
			#writeBtn{text-align: right;}	
			/*페이징 부분*/
			.gPaging{font-size: 25px;}
			/*a태그*/
			a{text-decoration: none; color: #000;}		
			.search{width:80%}
				}
		</style>
	</head>
	<body>
		<%@include file="../header2.jsp" %>
		<%@include file="header3.jsp" %>
		<main id="main">
			<section class="gContainer">
				<div class="gBoardList">
					<form id="searchCategory" name="frm" action="${pageContext.request.contextPath}/gathering/gBoardList.do" method="post">
						<div class="search">
							<select name="searchType">
									<option value="daily">일상</option>	
									<option value="hobby">취미</option>	
									<option value="regularMeeting">정모</option>	
									<option value="greet">가입인사</option>	
									<option value="notice">공지사항</option>	
							</select>
							<input type="text" name="keyword" size="10">
							<button type="submit" id="searchBtn" class="gBtn2">검색</button>
						</div>
					</form>
					<c:forEach var="gjvb" items="${gjvblist}">
			    		<c:if test="${gjvb.gBoardCategory.equals('공지사항')}">
							<div class="gNotice">
								<div>
									<div>공지사항</div>
									<div><a href="${pageContext.request.contextPath}/gathering/gBoard/${gjvb.gbidx}/Content.do">${gjvb.gBoardTitle}</a></div>
								</div>
								<div><a href="${pageContext.request.contextPath}/gathering/gBoard/${gjvb.gbidx}/Content.do">${gjvb.gBoardContents}</a></div>
							</div>
						</c:if>	
					</c:forEach>	
			    	<c:forEach var="gjvb" items="${gjvblist}">
			    		<c:if test="${!gjvb.gBoardCategory.equals('공지사항')}">
							<div class="gBoard">
								<div>
									<div class="gProfileimage"><img alt="프로필사진" src="../resources/MemberProfile/${gjvb.memberProfile}"></div>
									<div>
										<c:set var="gatheringMemberType" value="${gjvb.gatheringMemberType}" />
										<c:choose>
										    <c:when test="${gatheringMemberType eq 'TL'}">
										        <div style="color: #fd0000c7;">모임장</div>
										    </c:when>
										    <c:when test="${gatheringMemberType eq 'TLD'}">
										        <div style="color: #ff8400d6;">[부]모임장</div>
										    </c:when>
										    <c:otherwise>
										        <div>모임원</div>
										    </c:otherwise>
										</c:choose>
										<div>${gjvb.memberName}</div>
									</div>
									<div>
										<div>
											<fmt:parseDate value="${gjvb.gBoardWriteDay}" pattern="yyyy-MM-dd HH:mm:ss" var="parsedRentDay" />
											<fmt:formatDate value="${parsedRentDay}" pattern="yyyy-MM-dd HH:mm" var="formattedRentDay" />
											${formattedRentDay}
											<span>${gjvb.gBoardCategory}</span><span>&nbsp;&nbsp;&nbsp;조회수[${gjvb.gBoardViewsCNT}회]&nbsp;&nbsp;좋아요[${gjvb.gBoardLikeCNT}개] </span>
										</div>
									</div>					
								</div>
									<div><a href="${pageContext.request.contextPath}/gathering/gBoard/${gjvb.gbidx}/Content.do">${gjvb.gBoardTitle}</a></div>
									<div><a href="${pageContext.request.contextPath}/gathering/gBoard/${gjvb.gbidx}/Content.do">${gjvb.gBoardContents}</a></div>
							</div>
						</c:if>	
					</c:forEach>	
					<div class="gPaging">
						<c:if test="${pm.prev == true}">
							<a href="${pageContext.request.contextPath}/gathering/gBoardList.do?page=${pm.startPage-1}&serchType=${pm.scri.searchType}&keyword=${pm.encoding(pm.scri.keyword)}">◀</a>
						</c:if><!--if문-end-->
						<c:forEach var="i" begin="${pm.startPage}" end="${pm.endPage}" step="1">
						<a href="${pageContext.request.contextPath}/gathering/gBoardList.do?page=${i}&serchType=${pm.scri.searchType}&keyword=${pm.encoding(pm.scri.keyword)}">${i}</a>
						</c:forEach><!--for문-end-->
						<c:if test="${pm.next && pm.endPage > 0}">
							<a href="${pageContext.request.contextPath}/gathering/gBoardList.do?page=${pm.endPage+1}&serchType=${pm.scri.searchType}&keyword=${pm.encoding(pm.scri.keyword)}">▶</a>
						</c:if><!--if문-end-->
					</div><!-- 페이징 -->
				</div><!-- gBoardList 끝 -->
				<div id="writeBtn">
					<button class="gBtn2" onclick="location.href='${pageContext.request.contextPath}/gathering/gBoardWrite.do'">글쓰기</button>
				</div>
					
				
			</section>
		</main>
		<%@include file="../footer.jsp" %>
	</body>
</html>