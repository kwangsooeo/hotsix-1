<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</head>
<body>
<div class='contentsDiv'>
	<form class="regForm">
	<input type='hidden' name='memberNo' value='${qna.memberNo }'>
	<input type='hidden' name='qnaNo' value='${qna.qnaNo }'>
		<div class="form-group">
			<label class="col-sm-2 control-label">문의유형</label>
			<div class="col-sm-10">
				<input type="text" class="form-control" name='qna_type' value="${qna.qna_type }" readOnly> 
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label">아이디</label>
			<div class="col-sm-10">
			<input type="text" class="form-control" name='id' value="${qna.id }" readOnly> 
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label">제목</label>
			<div class="col-sm-10">
				<input type="text" class="form-control" name="title" value="${qna.title}" readOnly>
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label">내용</label>
			<div class="col-sm-10">
			<textarea class="form-control" rows="10" name="contents" readonly="readonly">${qna.contents }</textarea>
			</div>
		</div>
		
		<div class="form-group" >
		<div align="right">
	      		<button type="button" class="modBtn btn btn-default">수정</button>
	    
	      		<button type="button" class="delBtn btn btn-default">삭제</button>
	     
	      		<button type="button" class="listBtn btn btn-default">Q&A List</button>
	      	</div>
      	</div>

	</form>
</div>

<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	var form= $(".regForm");
	var qnaNo = form.find("input[name='qnaNo']").val();
	
	$(".modBtn").on("click",function(){
		form.attr("action","/hotsix/qna/qnaModify").attr("method","get");
		form.submit();
	})
	$(".delBtn").on("click", function(){
		console.log(qnaNo);
		$.post("/hotsix/qna/qnaDelete/"+qnaNo, function(data){
			alert(data);
			self.location="/hotsix/qna/qnaList";
		});
	});
	$(".listBtn").on("click", function(){
		self.location="/hotsix/qna/qnaList";
	});
});
</script>
</body>
</html>