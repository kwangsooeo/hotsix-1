<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@include file="../include/header.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script src="//code.jquery.com/jquery-2.1.4.min.js"></script>
<body>
	<div class="content-wrapper">
		<!-- Content Header (Page header) -->
		
		<div style = "display:none">
	 		<div id = "player" ></div>
	 	</div> 
		<section class="content-header">
		
		<h1>Contents</h1>
		<ol class="breadcrumb">
			<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
			<li class="subPage active">Contents</li>
		</ol>
		</section>
		
		<!--Search Select  -->
		<form id="jobForm">
			<input type='hidden' name='contentsNo'> 
			<input type='hidden'name='page' value='${cri.page }'> 
			<input type='hidden'name='perPageNum' value='${cri.perPageNum }'> 
			<input type='hidden' name='displayPageNum' value='${cri.displayPageNum }'>
		
		
		<select name="searchType">
			<option value="n">----</option>
			<option value="jobName"<c:out value="${cri.searchType eq 'jobName'?'selected':''}"/>>JobName</option>
			<option value="jobNo"<c:out value="${cri.searchType eq 'jobNo'?'selected':''}"/>>JobNo</option>
		</select>
		<input type="text" name='keyword' id="keywordInput" value='${cri.keyword}'>
		<button id='searchBtn'>Search</button>
		</form>
		
		<!--Contetns-->
		
		<section class="content">
		
		<div class="row">
			<div class="col-xs-12">
				<div class="box">
					<div class="box-header">
						<h3 class="box-title">ContentsList</h3>
					</div>
					<!-- /.box-header -->
					<div class="box-body">
						<table id="example2" class="table table-bordered table-hover">
							<thead>
								<tr>
									<th>ContentsNo</th>
									<th>jobNo</th>
									<th>jobName</th>
									<th>Registration Date</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${list}" var="list">
									<tr class="task-list">
										<th>${list.contentsNo}</th>
										<th>${list.jobNo }</th>
										<th><span id="${list.contentsNo }">${list.jobName}</span></th>
										<th>${list.regdate }</th>
									</tr>
								</c:forEach>	
									
							</tbody>
							<tfoot>
							</tfoot>
						</table>
					</div>
					
					<form id="ajaxForm">
						<input type="hidden" name="contentsNo" value="">
						<input type="hidden" name="link" value="">
					</form>
					<!-- /.box-body -->
					<div class="row box-header">
						<div class="col-sm-3">
							<br>
							<button type="button"
								onclick="javascript:location.href='/contents/contentsRegist'"
								class="btn btn-default">글쓰기</button>
						</div>
						<div class="col-sm-9">
							<ul class="pagination">
							
							<!--prev-->
							<c:if test="${pageMaker.prev != 0 }">
								<li><a href="${pageMaker.prev}">&laquo;</a></li>							
							</c:if>
							
								<c:forEach begin="${pageMaker.first }" end="${pageMaker.last }" var="idx">
									<li <c:out value="${cri.page == idx?'class=active':''}"/>><a href="${idx}">${idx }</a></li>
								</c:forEach>
							
							<!--next-->	
							<c:if  test="${pageMaker.next !=0 }">
								<li><a href="${pageMaker.next }">&raquo;</a></li>
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
	
	<!--Javascript  -->

	

	<script>
		$(".pagination li a").on("click", function(event){
			event.preventDefault();
			var targetPageNum = $(this).attr("href");
			
			var jobForm =  $("#jobForm");
			jobForm.find("[name='contentsNo']").remove();
			jobForm.find("[name='page']").val(targetPageNum);
			jobForm.attr("action","/contents/contentsListCri").attr("method","get");
			jobForm.submit();
		});
		
		$(".task-list").on("click","span", function(event) {
			
				var targetId = $(this).attr("id");

				var targetForm = $("#jobForm");

				targetForm.find("input[name='contentsNo']").val(targetId);

				targetForm.attr("action","/contents/contentsReadPage").attr("method", "get");
				targetForm.submit();
		});
		
		$("#searchBtn").on("click", function(event){
			var jobForm = $("#jobForm");
			jobForm.find("input[name='bno']").remove();
			jobForm.find("[name='page']").val(1);
			jobForm.attr("action","/contents/contentsListCri").attr("method","get");
		});
		
	</script>
	
</body>
<%@include file="../include/footer.jsp"%>
</html>