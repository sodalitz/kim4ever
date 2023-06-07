<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 <% BoardVo bv = (BoardVo)request.getAttribute("bv"); %>   
 

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
    font-family:'GangwonEdu_OTFBoldA';
    src:url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2201-2@1.0/GangwonEdu_OTFBoldA.woff') format('woff');
    font-weight:normal;
    font-style:normal;
}
@font-face {
    font-family:'omyu_pretty';
    src:url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2304-01@1.0/omyu_pretty.woff2') format('woff2');
    font-weight:normal;
    font-style:normal;
}
@font-face {
    font-family: KCC-Ganpan';
    src:url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2302@1.0/KCC-Ganpan.woff2') format('woff2');
    font-weight:normal;
    font-style:normal;
}

#main{width:1440px; margin:35px auto 70px; text-align:center;}
#main #content{width:1440px; height:auto;}
#main #content h2{text-align:left; margin-top:50px; margin-left:160px; font-family: 'GangwonEdu_OTFBoldA'; font-size:25px;}
#main #bottom{width:1440px; height:300px;}
#content table {width:80%; border-collapse:collapse; margin:60px auto 0; line-height:100px; font-size:24px; font-family: 'omyu_pretty'; cursor:pointer;}
#content table th{width:100px;padding: 10px;text-align: center; border-top:3px solid #000 ;border-bottom:3px solid #000;}
#content table td{padding: 10px; text-align:center;border-bottom:1px solid #CCCCCC;}
#content table tr th:nth-child(1){width: 20px;}
#content table tr th:nth-child(2){width: 80px;}
#content table tr th:nth-child(3){width: 80px;}
#content table tr th:nth-child(4){width: 80px;}
#content table tr th:nth-child(5){width: 20px;}
#content #btn{text-align:right; margin-top:20px; margin-right:144px; }
#content #btn button{width:100px; height:40px; text-align:center; font-family: 'omyu_pretty'; font-size:21px; border-radius:10px; border:0px solid #ff9933; background:#ff9933;}
#content #btn button:active {background:#ffcc66; box-shadow:0 2px 2px rgba(0,0,0,0.1); transform:translateY(2px);}
/*메뉴바 테이블*/
.tab__contents {display:none;}
.show {display: block;}
.tab__list li{
  display: inline-block;
  border: 1px solid #ccc;
  background-color: #f8f8f8;
  padding: 10px 20px;
  cursor: pointer;
  margin-top:30px;
  font-family: 'omyu_pretty';
  font-size:21px;
  border-radius:5px;
}
.tab__list__item.active {background-color:#333;color:#fff;border:1px solid #333;}

 a {color: inherit; text-decoration: none;}

</style>
</head>
<body>

	<div id="main">
		<%@include file="../header.jsp"%>

		<div id="content">
			<div class="tab">
				<ul class="tab__list">
					<li class="tab__list__item active" data-list="1">공지사항</li>

					<li class="tab__list__item" data-list="2">문의게시판</li>

					<li class="tab__list__item" data-list="3">자주묻는질문</li>
				</ul>

				<div class="tab__contents show" data-order="1">
<!-- 공지사항 -->			

					<h2>공지사항</h2>
					<table>
						<tr>
							<th>No</th>
							<th>제목</th>
							<th>작성자</th>
							<th>작성일</th>
							<th>조회수</th>
						</tr>
										<c:forEach var="bv" items="${blist}" varStatus="status">
								<c:if test="${bv.boardType == 0 && bv.delyn == 'N'}"><!-- 보드타입 0 delyn 이 n -->
									<tr>
										<td>${bv.sortN}</td>
										<td><a
											href="${pageContext.request.contextPath}/board/boardNoticeContent.do?bidx=${bv.bidx}">
												${bv.subject} </a></td>
										<td>${bv.writer}</td>
										<td>${bv.writeday.substring(0, 10)}</td>
										<td>${bv.boardView}</td>
									</tr>	
								</c:if>
							</c:forEach>
							</table>
						

		
		
<!-- 버튼 -->
					<div id="btn">
						<c:if test="${membertype == '관리자'}">
				    		<button type="button" onclick="location.href='${pageContext.request.contextPath}/board/boardNoticeWrite.do'">작성</button>
				    	</c:if>
					</div>
	
				</div>

<!-- QNA -->
				<div class="tab__contents" data-order="2">
				<h2>문의게시판</h2>
					<table>
						<tr>
							<th>No</th>
							<th>제목</th>
							<th>작성자</th>
							<th>작성일</th>
							<th>조회수</th>
						</tr>
	<tr>
							<c:forEach var="bv" items="${blist}" varStatus="status">
								<c:if test="${bv.boardType == 1 && bv.delyn == 'N'}"><!-- 보드타입 o delyn 이 n -->
									<tr>
										<c:choose>
											<c:when test="${bv.sortN != 0}">
												<td>${bv.sortN}</td>
											</c:when>
											<c:otherwise>
												<td>✉</td>
										
											</c:otherwise>
										</c:choose>
										<td>
										<c:forEach begin="1" end="${bv.level_}" var="i">
						          
						          <c:if test="${i == bv.level_}">&nbsp;&nbsp; ㄴ </c:if>
						        </c:forEach>
						        
										<a 	href="${pageContext.request.contextPath}/board/boardQnaContent.do?bidx=${bv.bidx}">
												${bv.subject} </a></td>
										<td>${bv.writer}</td>
										<td>${bv.writeday.substring(0, 10)}</td>
										<td>${bv.boardView}</td>
									</tr>	
								</c:if>
							</c:forEach>
						</tr>
		
					</table>
					
				<table><!-- 페이징 -->
  <tr>
    <td style="text-align: right;">
      <c:if test="${pm.prev == true}">
        <a href="${pageContext.request.contextPath}/board/boardList.do?page=${pm.startPage-1}">◀</a>
      </c:if>
    </td>
    <td style="text-align: center; width: 300px;">
         <c:forEach var="i" begin="${pm.startPage}" end="${pm.endPage}" step="1">
        <a href="${pageContext.request.contextPath}/board/boardList.do?page=${i}">${i}</a>
      </c:forEach>
    </td>
    <td style="width: 200px; text-align: left;">
      <c:if test="${pm.next && pm.endPage > 0}">
        <a href="${pageContext.request.contextPath}/board/boardList.do?page=${pm.endPage+1}">▶</a>
      </c:if>
    </td>
  </tr>
</table>
		
					<div id="btn">
						<button type="button"
							onclick="location.href='<%=request.getContextPath()%>/board/boardQnaWrite.do'">작성</button>
					</div>
				</div>


<!-- FAQ -->
				<div class="tab__contents" data-order="3">
					<h2>자주묻는질문</h2>
					<table>
						<tr>
							<th>No</th>
							<th>제목</th>
							<th>작성자</th>
							<th>작성일</th>
							<th>조회수</th>
						</tr>
				<c:forEach var="bv" items="${blist}" varStatus="status">
								<c:if test="${bv.boardType == 2 && bv.delyn == 'N'}"><!-- 보드타입 2 delyn 이 n -->
									<tr>
										<td>${bv.sortN}</td>
										<td><a
											href="${pageContext.request.contextPath}/board/boardFaqContent.do?bidx=${bv.bidx}">
												${bv.subject} </a></td>
										<td>${bv.writer}</td>
										<td>${bv.writeday.substring(0, 10)}</td>
										<td>${bv.boardView}</td>
									</tr>	
								</c:if>
							</c:forEach>			
							</table>	
				

					<div id="btn">
						<c:if test="${membertype == '관리자'}">					
						<button type="button"
							onclick="location.href='<%=request.getContextPath()%>/board/boardFaqWrite.do'">작성</button>
							</c:if>
					</div>
				</div>

<script>
document.addEventListener("DOMContentLoaded", function() {
  const tab = document.querySelector(".tab");
  const tabListItems = document.querySelectorAll(".tab__list__item");
  const tabContents = document.querySelectorAll(".tab__contents");

  // 이전에 선택된 탭이 있는지 로컬 스토리지에서 확인
  const selectedTab = localStorage.getItem("selectedTab");

  // 이전에 선택된 탭이 있다면 해당 탭을 활성화
  if (selectedTab) {
    tabListItems.forEach(function(item) {
      if (item.dataset.list === selectedTab) {
        item.classList.add("active");
      } else {
        item.classList.remove("active");
      }
    });

    tabContents.forEach(function(content) {
      if (content.dataset.order === selectedTab) {
        content.classList.add("show");
      } else {
        content.classList.remove("show");
      }
    });
  }

  tab.addEventListener("click", function(e) {
    const listOrder = e.target.dataset.list;

    if (listOrder) {
      tabListItems.forEach(function(item) {
        item.classList.remove("active");
      });
      e.target.classList.add("active");

      tabContents.forEach(function(content) {
        if (content.dataset.order === listOrder) {
          content.classList.add("show");
        } else {
          content.classList.remove("show");
        }
      });
      // 탭 변경 시 고정 URL로 이동
      const url = "/myapp/board/boardList.do";
      window.location.href = url;
      // 선택된 탭을 로컬 스토리지에 저장
      localStorage.setItem("selectedTab", listOrder);
    }
  });
});
</script>

			</div>

		</div>


		<div id="bottom"></div>
	</div>
</body>
<%@include file="../footer.jsp"%>
</html>