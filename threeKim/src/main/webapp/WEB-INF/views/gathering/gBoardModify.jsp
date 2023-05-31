<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>모임 메인화면</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/reset.css"/>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/fonts.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style_gathering.css">  
		<style type="text/css">
			.gContainer{border: 1px solid #0000;}
			/*게시글 틀*/ 
			.gBoardList { width: 100%; border: 1px solid #bbb;background-color: #f1f1f1;border-radius: 10px;}
			/*검색하기 부분*/
			#searchCategory{text-align: right; font-size: 20px; margin: 40px 60px; height: 30px; font-family: 'omyu_pretty';} 
			#searchCategory>div{display: inline-block; vertical-align: top;} 
			#searchCategory>div>select{width: 80px; height: 30px; font-size: 18px; font-family: 'omyu_pretty';} 
			#searchCategory>div>input{width: 300px; height: 26px; font-size: 18px;} 
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
			.gBoard>div>div:nth-child(3)>div{height: 25px; margin-left: 70px; font-size: 15px; margin-top: 5px;}/*날짜*/ 
			.gBoard>div:nth-child(2){clear: both;margin-top: 10px; font-weight: bold;}/*게시글제목*/
			.gBoard>div:nth-child(2)>span{font-size: 18px;}/*게시글 카테고리*/
			.gBoard>div:nth-child(3){font-size: 18px; margin-top: 10px; border-bottom: 2px solid #bbb; padding-bottom: 10px; margin-top: 10px;}/*게시글 내용*/
			/*버튼 부분*/
			#writeBtn{text-align: right;}	
			/*페이징 부분*/
			.gPaging{font-size: 25px;}		
		</style>
	</head>
	<body>
		<%@include file="../header2.jsp" %>
		<%@include file="header3.jsp" %>
		<main id="main">
			<section class="gContainer">
				<div class="gBoardList">
					<div id="searchCategory">
						<div> 
							<select>
								<option>공지사항</option>	
								<option>취미</option>	
								<option>일상</option>	
								<option>정모</option>	
								<option>가입인사</option>	
							</select> 
						</div>
						<div><input type="text" placeholder="내용을 입력해주세요."></div>
						<div> <button class="gBtn2">검색하기</button> </div>
					</div>
					<div class="gNotice">
						<div>
							<div>공지사항</div>
							<div>공지사항 제목</div>
						</div>
						<div>일정이 취소되었습니다</div>
					</div>
					<div class="gNotice">
						<div>
							<div>공지사항</div>
							<div>필독사항</div>
						</div>
						<div>1. 규칙을 지키자 2. 일정을 잘 맞추자</div>
					</div>
					<div class="gBoard">
						<div>
							<div class="gProfileimage"><img alt="프로필사진" src="../resources/images/profile.jpg"></div>
							<div>
								<div>모임장</div>
								<div>이름</div>
							</div>
							<div>
								<div>2023-05-30 12:00</div>
							</div>					
						</div>
						<div>게시글제목 <span>카테고리이름</span> </div>
						<div>게시글내용게시글내용게시글내용게시글내용게시글내용게시글내용게시글내용게시글내용</div>
					</div>	
					<div class="gBoard">
						<div>
							<div class="gProfileimage"><img alt="프로필사진" src="../resources/images/profile.jpg"></div>
							<div>
								<div>모임장</div>
								<div>이름</div>
							</div>
							<div>
								<div>2023-05-30 12:00</div>
							</div>					
						</div>
						<div>게시글제목 <span>카테고리이름</span> </div>
						<div>게시글내용게시글내용게시글내용게시글내용게시글내용게시글내용게시글내용게시글내용</div>
					</div>	
					<div class="gBoard">
						<div>
							<div class="gProfileimage"><img alt="프로필사진" src="../resources/images/profile.jpg"></div>
							<div>
								<div>모임장</div>
								<div>이름</div>
							</div>
							<div>
								<div>2023-05-30 12:00</div>
							</div>					
						</div>
						<div>게시글제목 <span>카테고리이름</span> </div>
						<div>게시글내용게시글내용게시글내용게시글내용게시글내용게시글내용게시글내용게시글내용</div>
					</div>
					<div class="gPaging">1-2-3</div><!-- 페이징 -->
				</div><!-- gBoardList 끝 -->
				<div id="writeBtn">
					<button class="gBtn2">글쓰기</button>
				</div>
					
				
			</section>
		</main>
		<%@include file="../footer.jsp" %>
	</body>
</html>