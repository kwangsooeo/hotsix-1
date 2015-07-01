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
<div class="content-wrapper">
	<!-- Content Header (Page header) -->
	<section class="content-header">
	<h1>Mentee</h1>
	<ol class="breadcrumb">
		<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
		<li class="subPage active">Mentee</li>
	</ol>
	</section>
	<section class="content">
	<div class="row">
		<div class="col-xs-12">
			<div class="box">
				<div class="box-header">
					<h3 class="box-title">MenteeList</h3>
				</div>

				<div class="col-lg-6">
					<form id="jobForm">
						<input type="hidden" name="menteeNo" value=${cri.menteeNo }>
						 <input	type="hidden" name="page" value='${cri.page }'> <input
							type="hidden" name="displayPageNum" value='${cri.displayPageNum }'>
						<input type="radio" name="perPageNum" value="10"
							<c:out value="${cri.perPageNum ==10 ? 'checked':''}"/>>10개
						<select name="searchType">
							<option value="null"
								>---</option>
							<option value="i"
								<c:out value="${cri.searchType eq 'i' ? ' selected':'' }"/>>아이디</option>
							<option value="n"
								<c:out value="${cri.searchType eq 'n' ? ' selected':''}"/>>닉네임</option>
							<option value="nm"
								<c:out value="${cri.searchType eq 'nm' ? ' selected':''}"/>>이름</option>
							
							<option value="ed"
								<c:out value="${cri.searchType eq 'ed' ? ' selected':''}"/>>최종학력</option>
						</select> <input type="text" name='keyword' value='${cri.keyword }'>
						<button id="searchBtn">검색</button>
					</form>
				</div>
				<div class="panel-heading">
					<div class="pull-left">
						<h5>
							<i class="fa fa-tasks"></i>TotalCount: ${pm.totalCount }
						</h5>
					</div>
				</div>
				<!-- /.box-header -->
				-
				<div class="box-body">
					<table id="example2" class="table table-bordered table-hover">
						<thead>
							<tr>
								<th><input type="checkbox" id="allck" name="allck"  onclick="allCk(this.checked);"></th>
								<th>멘티 아이디</th>
								<th>닉네임</th>
								<th>이름</th>
								<th>멘토 아이디</th>
								<th>시간</th>
								<th>마지막 접속 시간</th>
								<th>최종학력</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${list}" var="list">
								<tr>
									<td><label><input class="CkNo" type="checkbox" name="cp_no[]" id="oneCk_${list.menteeNo }" value="${list.menteeNo }"></label></td>
									<td><span class="task-title-sp">${list.id}</span></td>
									<td><span class="task-title-sp">${list.nickname }</span></td>
									<td><span class="task-title-sp">${list.name }</span></td>
									<td><span class="task-title-sp">${list.mentoId }</span></td>
									<td><span class="task-title-sp">${list.regdate }</span></td>
									<td><span class="task-title-sp">${list.logdate }</span></td>
									<td><span class="task-title-sp">${list.edu_level }</span></td>
								</tr>
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
							<button class="btn btn-default" id="saveBtn">저장</button>
							<button class="btn btn-default" id="delBtn">삭제</button>
							<button class="btn btn-default" id="email">이메일</button>
							<button class="btn btn-default" id="massage">쪽지</button>
					</div>
					<div class="col-sm-7">
						<ul class="pager pagenation">
							<c:if test="${pm.prev !=0 }">
								<li><a href="${pm.prev }">&laquo;</a></li>
							</c:if>

							<c:forEach begin="${pm.start}" end="${pm.last}" var="idx">
								<li <c:out value="${cri.page == idx?'class=active':''}"/>><a
									href="${idx}">${idx }</a></li>
							</c:forEach>
							<c:if test="${pm.next !=0}">
								<li><a href="${pm.next }">&raquo;</a></li>
							</c:if>
						</ul>
					</div>
				</div>
			</div>
			<script src="http://code.jquery.com/jquery-1.11.3.js"></script>
			<script>
			var id = new Array();
			$('.CkNo').on("click", function(){
				id.push($(this).attr("value"));
			});
			
			
			$(".pager li a").on("click",function(event){
				event.preventDefault();
				var targetPageNum = $(this).attr("href");
				var jobForm = $("#jobForm");
				jobForm.find("input[name='bno']").remove();
				jobForm.find("[name='page']").val(targetPageNum);
				jobForm.attr("action", "/mentee/list").attr("method","get");
				jobForm.submit();
			});

			$("#searchBtn").on("click",function(event){
				var jobForm = $("#jobForm");
				/* jobForm.find("input[name='menteeNo']").remove(); */
				jobForm.find("[name='page']").val(1);
				jobForm.attr("action","/mentee/list").attr("method","get");
			});
         
			var jobForm = $('#jobForm');
			$('#saveBtn').click(function(){
				jobForm.attr("action","/mentee/list");
				jobForm.attr("method","get");
				jobForm.submit();
			});
			
			$('#delBtn').click(function(){
				for(var i=0; i<=id.length; i++){
					console.log(id.pop());
				}
				
				jobForm.attr("action","/mentee/delete");
     			jobForm.attr("method","post");
     			jobForm.submit();
     		});
     	
     	
     	function allCk(objCheck){ 
     		  var checks = document.getElementsByName('cp_no[]');
     		  for( var i = 0; i < checks.length; i++ ){
     		   checks[i].checked = objCheck; 
     		  }
     		 };

     		
     	
         </script>
			<!-- /.box -->
			<form id="jobForm">
				<input type="hidden" name="mentoNo" value=-1> <input
					type="hidden" name="page" value='${cri.page }'> <input
					type="hidden" name="perPageNum" value='${cri.perPageNum }'>
				<input type="hidden" name="displayPageNum" value='${cri.displayPageNum }'>
				<input type="hidden" name="keyword" value='${cri.keyword }'>
				<input type="hidden" name="searchType" value='${cri.searchType }'>
			</form>
		</div>
	</div>
	</section>
</div>
<%@include file="../include/footer.jsp"%>
</html>