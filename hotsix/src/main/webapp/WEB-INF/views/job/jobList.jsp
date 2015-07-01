<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<%@include file="../include/header.jsp"%>
<div class="content-wrapper">
	<!-- Content Header (Page header) -->
	<section class="content-header">
	<h1>Job</h1>
	<ol class="breadcrumb">
		<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
		<li class="subPage active">job</li>
	</ol>
	
	</section>
	
	<section class="content">
	<div class="row">
	
		<div class="col-xs-12">
			<div class="box">
				<div class="box-header">
					<h3 class="box-title">JobList</h3>
				</div>
			<div class="search pull-right" style="margin-right: 1%">
			
			<select name ="searchType">
				<option value="">---</option>
				<option value="jn"<c:out value="${cri.searchType eq 'jn' ?'selected':''}"/>>JobName</option>
				<option value="d"<c:out value="${cri.searchType eq 'd' ?'selected':''}"/>>Depth</option>
			</select>
			<input type="text" id="searchKey" name="keyword" value="${cri.keyword}">
			
			</div>
				<!-- /.box-header -->
				<div class="box-body">
					<table id="example2" class="table table-bordered table-hover">
						<thead>
							<tr>
								<th>JobNo</th>
								<th>JobName</th>
								<th>Parent</th>
								<th>Depth</th>
								<th></th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${list}" var="list">
								<tr>
									<td><input type="hidden" value="${list.jobNo }" id="jobNoList_${list.jobNo }">${list.jobNo }</td>
									<td>${list.jobName }</td>
									<td>${list.parent }</td>
									<td>${list.depth }</td>
									<td  class="col-xs-1"><button class="glyphicon glyphicon-pencil" value="${list.jobNo }" id="upBtn"></button>
									<button class="glyphicon glyphicon-trash" value="${list.jobNo }" id="delBtn"></button>
									</td>
								<tr>
							</c:forEach>
						</tbody>
						<tfoot>
						</tfoot>
					</table>
				</div>
				<!-- /.box-body -->
				<div class="row box-header">
					<div class="col-sm-3">
						<br>
						<button type="button" onclick="javascript:location.href='/job/regist'" class="btn btn-default">글쓰기</button>
					</div>
					<div class="col-sm-9">
						<ul class="pager pagenation">
							<c:if test="${page.prev  != 0 }">
							<li><a href="${page.prev }">Previous</a></li>
							</c:if>
							<c:forEach var="page" begin="${page.first }" end="${page.last }">
								<li class="active"><a href="${page }">${page }</a></li>
							</c:forEach>
							<c:if test="${page.next != 0 }">
							<li><a href="${page.next }">Next</a></li>
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

<form id="pageForm">
	<input type="hidden" name="jobNo" value="1">
	<input type="hidden" name="page" value="${cri.page }">
	<input type="hidden" name="perPageNum" value="${cri.perPageNum }">
	<input type="hidden" name="displayPageNum" value="${cri.displayPageNum }">
	<input type="hidden" name="searchType" value="">
	<input type="hidden" name="keyword" value="">
</form>
<script src="/resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>
<script type="text/javascript">
$('#example2').on("click","tbody tr td button", function(){
	console.log($('#delBtn').val());
	var targetMode = $(this).attr("id");
	var delValue = $(this).val();
	console.log($('#pageForm').find("input[name=jobNo]").val());
	if(targetMode == "delBtn"){
		$('#pageForm').find("input[name=jobNo]").val(delValue);
		$('#pageForm').attr("action", "/job/del").attr('method','post').submit();
	}else if(targetMode == "upBtn"){
		
	}
});

$('.search').on("keydown",function(event){
	if(event.keyCode==13){
		var searchType = $('.search').find("select[name=searchType]").val();
		var keyword = $('.search').find("input[name=keyword]").val();
		$('#pageForm').find("input[name=searchType]").val(searchType);
		$('#pageForm').find("input[name=keyword]").val(keyword);
		$('#pageForm').attr("action","/job/list").attr("method","get").submit();
	}
});

$(".pager").on("click","li a", function(event){
	event.preventDefault();
	var targetHref = $(this).attr("href");
	$('#pageForm').find("input[name=page]").val(targetHref);
	$('#pageForm').attr("action", "/job/list").attr("method","get");
	$('#pageForm').submit();
});
</script>
<!-- /.content-wrapper -->
<%@include file="../include/footer.jsp"%>
</html>