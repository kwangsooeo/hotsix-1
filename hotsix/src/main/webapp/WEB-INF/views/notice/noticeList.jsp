<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@include file="../include/header.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
a:link{text-decoration:none ;  color:black;}
a:visited{text-decoration:none; color:black;}
a:active {text-decoration:none; color:black;}
a:hover{text-decoration:none; color:black;}
</style>
</head>
<div class="content-wrapper">
	<!-- Content Header (Page header) -->
	<section class="content-header">
	<h1>Notice</h1>
	<ol class="breadcrumb">
		<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
		<li class="subPage active">Notice</li>
	</ol>
	</section>
	
	<section class="content">
	<div class="row">
		<div class="col-xs-12">
		
			<div class="box">
				<div class="box-header">
					<h3 class="box-title">NoticeList (${pageMaker.totalCount })</h3>
	<form id="noticeForm">
	
	<input type="hidden" name="noticeNo" value=-1>
	<input type="hidden" name="page" value="${cri.page }">
	<input type="hidden" name="perPageNum" value="${cri.perPageNum }">
	<input type="hidden" name="displayPageNum" value="${cri.displayPageNum }">
	
	
	<input type="radio" name="perPageNum" value="10"<c:out value="${cri.perPageNum == 10?'checked':''}"/>>10개
	<select name="searchType">
		<option value ="n"<c:out value="${cri.searchType eq 'n' ? 'selected':'' }"/>>---</option>
		<option value ="t"<c:out value="${cri.searchType eq 't' ? 'selected':'' }"/>>제목</option>
		<option value ="c"<c:out value="${cri.searchType eq 'c' ? 'selected':'' }"/>>내용</option>
		<option value ="tc"<c:out value="${cri.searchType eq 'tc' ? 'selected':'' }"/>>제목+내용</option>
	</select>
	<input type="text" name="keyword" id="keywordInput" value="${cri.keyword }">
	<button id="searchBtn">검색</button>
</form>
	
				</div>
				<!-- /.box-header -->
				<div class="box-body">
					<table id="example2" class="table table-bordered table-hover">
						<thead>
							<tr>
								<td>#</td>
								<td>제목</td>
								<td>첨부파일</td>
								<td>날짜</td>
								<td>조회</td>
								
							</tr>
						</thead>
						
						<tbody >
							
							<c:forEach  var="list" items="${list}">
								<tr class="notice-list">
									<td>${list.noticeNo }</td>
									<td><a href="/notice/noticeRead?noticeNo=${list.noticeNo }"><span id="${list.noticeNo }">${list.title }</span></a></td>
									<td>${list.fileName }</td>
									<td>${list.regdate }</td>
									<td>${list.viewCnt }</td>
									
								<tr>
							
							</c:forEach>
							
						</tbody>
						
					</table>
				</div>
				<!-- /.box-body -->
				<div class="row box-header">
					<div class="col-sm-3">
					
						<br>
						<button type="button"
							onclick="javascript:location.href='/notice/noticeRegist'"
							class="btn btn-default">글쓰기</button>
					</div>
					<div class="col-sm-8">
						<ul class="pager pagenation">
						<c:if test="${pageMaker.prev != 0 }">
							<li><a href="${pageMaker.prev }">Prev</a></li>
							</c:if>
							<c:forEach begin="${pageMaker.first }" end="${pageMaker.last }" var="idx">
								<li <c:out value="${cri.page == idx? 'class =active':''}"/>><a href="${idx}">${idx}</a></li>
							</c:forEach>
							<c:if test="${pageMaker.next != 0 }">
							<li><a href="${pageMaker.next }">Next</a></li>
							</c:if>
						</ul>
					</div>
				</div>
			</div>
			<!-- /.box -->
		</div>
	</div>
	</section>
</div>
	
	

<script src="/resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>
<script>
	$(document).ready(function() {
		
		$(".notice-list").on("click","span",function(envet) {
			var targetId = $(this).attr("id");

			//var targetForm = $("#noticeForm");

			targetForm.find("input[name='noticeNo']").val(targetId);

			targetForm.find("action", "/notice/noticeRead").attr("method", "get");

			noticeForm.submit();

		});

	});
</script>

<script>
	// jQuery를 이용한 스크립트를 별도로 작성
	$(".pager").on("click","li a", function(evnet){
		
		event.preventDefault();
		// preventDefault( )는 <a>태그의 원래의 행동인 페이지 이동이나 화면 전환을 하지 못하도록 막는 역할
		var targetperPageNum = $(this).attr("href");
		//현재 클릭된 페이지 번호를 구하는 부분
		
		var noticeForm = $("#noticeForm");
		noticeForm.find("input[name='noticeNo']").remove();
		// <form>태그내에서 <input type=’hidden’ name=’noticeNo’...
		//태그를 삭제하는 자바스크립트를 사용하는 것이 확실한 방법
		noticeForm.find("input[name='page']").val(targetperPageNum);
		//page인 객체를 찾아 사용자가 선택한 페이지 번호로 변경
		noticeForm.attr("action", "/notice/list").attr("method","get");
		//action속성과 method 속성을 조정
		noticeForm.submit();
	});
</script>
<script>
		$("#serachBtn").on("click",function(evnet){
		
		var noticeForm = $("#noticeForm");
		
		noticeForm.find("input[name='noticeNo']").remove();
		noticeForm.find("input[name='page']").val(1);
		noticeForm.attr("action","/notice/list").attr("method","get");
	});
</script>

<%@include file="../include/footer.jsp"%>
</html>