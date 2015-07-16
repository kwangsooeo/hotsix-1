<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
@font-face {
    font-family: 'NanumGothic';
    src: local('NanumGothic'),
    url('../../resources/bootstrap/fonts/NanumGothic.ttf');}
   

	p {
  display: block;
  -webkit-margin-before: 1em;
  -webkit-margin-after: 1em;
  -webkit-margin-start: 0px;
  -webkit-margin-end: 0px;}
	
</style>
</head>
<body>
<div class='container'>
	<div class="help">
		<div class='help-header'>
			
				<h2 style="font-weight: bold;">도움말</h2>
				<p>자주 묻는 질문들 입니다. <br>궁금하신 <b>서비스를 선택 </b>해 주세요.</p>
		</div>
		<div class='category-select'>
			<form class="pageForm">
				<input type='hidden' name=page value='${cri.page}'>
				<input type='hidden' name=perPageNum value='${cri.perPageNum}'>
				<input type='hidden' name=displayPageNum value='${cri.displayPageNum}'>
				<input type='hidden' name=memberNo value='${vo.memberNo }'>
					<select name= 'qnaType' class="qnaType">
						<option value="all">All----------</option>
						<option value="use"<c:out value="${cri.qnaType eq 'use'? 'selected':''}"></c:out>>이용문의</option>
						<option value="con"<c:out value="${cri.qnaType eq 'con'? 'selected':''}"></c:out>>컨텐츠문의</option>
						<option value="mento"<c:out value="${cri.qnaType eq 'mento'? 'selected':''}"></c:out>>멘토문의</option>
						<option value="menti"<c:out value="${cri.qnaType eq 'menti'? 'selected':''}"></c:out>>멘티문의</option>
						<option value="member"<c:out value="${cri.qnaType eq 'member'? 'selected':''}"></c:out>>회원문의</option> 
						<option value="etc"<c:out value="${cri.qnaType eq 'etc'? 'selected':''}"></c:out>>기타문의</option>
					</select>
				<input type="text" name="keyword" value="${cri.keyword }" placeholder="도움말을 검색해보세요">
			</form>
			
		</div>

		<div class="faq-table">
		<c:forEach items="${list}" var="list">
			<details class="off ">
   				<summary>
   					<span class="text">
			   			<a class="faq-title">${list.title}</a>
			   		</span>
			 	</summary>
				<div class="centent">
					<p>${list.contents}</p>
		   		</div>
		  	</details>
	  	</c:forEach>
	  	</div>
	  	
	  	<div class="paging">
		  	<div class="row box-header">
		  		<ul class="pager pagenation">
		  			<c:if test="${page.prev != 0}">
		  				<li><a href="${page.prev }">&laquo;</a> </li>
		  			</c:if>
		  			<c:forEach begin="${page.first}" end="${page.last }" var="pageNum">
		  				<li <c:out value="${pageNum==cri.page? 'class=active':''}"/>>
		  					<a href="${pageNum}"> ${pageNum}</a>
	  					</li>
		  			</c:forEach>
		  			<c:if test="${page.next != 0}">
		  				<li><a href="${page.next}">&raquo;</a></li>
		  			</c:if>
		  		</ul>
		  	</div>
	  	</div>
	  	<div class='footer'>
	  		<p>궁금한 항목에 대한 도움말이 없으시다면, 문의해 주세요.
			<button type="button" class="qnaBtn btn btn-default">문의하기</button></p>
		</div>
	</div>
</div>

<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
<script type="text/javascript">

$(document).ready(function(){
	console.log($('input[name=memberNo]').val());
	console.log($("select[name=qnaType]").val());
	var targetForm= $('.pageForm');
	
	$(".pager").on("click","li a", function(event){
		event.preventDefault();
		var target = $(this).attr("href");		
		$("[name='page']").attr("value",target);

		targetForm.attr("action","/hotsix/qna/qnaList").attr("method","get");
		targetForm.submit();
	});
	
	$('.qnaType').on("change", function(){
		
		$("input[name=page]").val(1);
		$("input[name=keyword]").remove();
		targetForm.attr("action","/hotsix/qna/qnaList").attr("method","get");
		targetForm.submit();
		
	});
	$('.qnaBtn').on("click", function(){
		console.log("ddd");
		$("input[name=page]").remove();
		$("input[name=perPageNum]").remove();
		$("input[name=displayPageNum]").remove();
		targetForm.attr("action","/hotsix/qna/qnaWrite").attr("method","get");
		targetForm.submit();
	});
	
});

</script>
</body>
</html>