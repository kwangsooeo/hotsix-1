<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		<div class="form-group">
		<input type='hidden' name='memberNo' value='6'>
			<label class="col-sm-2 control-label">문의유형</label>
			<div class="col-sm-10">
				<select name= 'qna_type' class="qnaType form-control">
					<option value="">All----------</option>
					<option value="회원문의">회원문의</option>
					<option value="이용문의">이용문의</option>
					<option value="컨텐츠문의">컨텐츠문의</option>
					<option value="멘토문의">멘토문의</option>
					<option value="멘티문의">멘티문의</option> 
					<option value="기타문의">기타문의</option>
				</select>
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label">아이디</label>
			<div class="col-sm-10">
			<input type="text" class="form-control" name='id' value="id" readOnly> 
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label">제목</label>
			<div class="col-sm-10">
				<input type="text" class="form-control" name="title" value="">
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label">내용</label>
			<div class="col-sm-10">
			<textarea class="form-control" rows="10" name="contents"></textarea>
			</div>
		</div>
		
		<div class="form-group">
    	<div class="col-sm-offset-2 col-sm-10">
      		<button type="button" class="btn btn-default">문의하기</button>
      	</div>
      	</div>
	</form>
	

</div>

<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	var form = $(".regForm");
	
	$('.btn').on("click", function(event){
		
		var data = form.serialize();
		$.post("/hotsix/qna/qnaWrite",data,function(data){
			alert(data);
			
			form.attr("action","/hotsix/qna/qnaRead").attr("method","get");
			form.submit();
		}); 
		
	});
});
</script>
</body>
</html>