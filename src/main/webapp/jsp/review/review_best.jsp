<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Semi - Reviews</title>
<script type="text/javascript" src="js/review/review.js"></script>
</head>
<body>
<div class="list_title">
		<h1>리뷰베스트</h1>
</div>
<div class="list_subtitle">
	<h6></h6>
</div>
<div id="review_columnsWrap_label">
	<div class="review_label_no">글번호</div>
	<div class="review_label_title">제목</div>
	<div class="review_label_writer">작성자</div>
	<div class="review_label_date">작성일</div>
	<div class="review_label_viewLike"><i class="fa-solid fa-eye"></i></div>
	<div class="review_label_viewLike"><i class="fas fa-heart"></i></div>
</div>
<div id="review_table2">
<c:forEach var="notice" items="${notices }">
		<a href="ReviewDetailC?no=${notice.id }">
			<div class="review_table2_notice">
				<div class="review_label_no">공지</div>
				<div class="review_label_title">
					<div>${notice.name }</div>
					<div class="review_title_commentN">[${notice.comment }]</div>
				</div>
				<div class="review_label_writer">${notice.au_id }</div>
				<div class="review_label_date">${notice.date }</div>
				<div class="review_label_viewLike">${notice.view }</div>
				<div class="review_label_viewLike">${notice.like }</div>
			</div>
		</a>
</c:forEach>
<c:forEach var="review" items="${reviews }" varStatus="status">
	<a href="ReviewDetailC?no=${review.id }">
		<div class="review_table2_row">
			<c:choose>
			<c:when test="${param.p eq null}">
				<div class="review_label_no">${status.count}</div>
			</c:when>
			<c:otherwise>
				<div class="review_label_no">${status.count + 10*(param.p-1) }</div>
			</c:otherwise>
			</c:choose>
			<div class="review_label_title">
				<div>${review.name }</div>
				<div class="review_title_commentN">[${review.comment }]</div>
			</div>
			<div class="review_label_writer">${review.au_id }</div>
			<div class="review_label_date">${review.date }</div>
			<div class="review_label_viewLike">${review.view }</div>
			<div class="review_label_viewLike">${review.like }</div>
		</div>
	</a>
</c:forEach>

<div class="review_bottom">
	<div class="review_bottom_btn">
		<button onclick="location.href='ReviewC'">전체글</button>
	</div>
	<div>
		<a href="ReviewBestPageC?p=1">[맨 처음]</a>
		<c:forEach var="i" begin="1" end="${pageCount }">
			<a href="ReviewBestPageC?p=${i }">[${i }]</a>
		</c:forEach>
		<a href="ReviewBestPageC?p=${pageCount }">[맨 뒤]</a>
	</div>
	<div class="review_bottom_btn">
	
	</div>
</div>


</div>


</body>
</html>