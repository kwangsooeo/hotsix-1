<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<%@include file="../include/header.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="content-wrapper">
		<!-- Content Header (Page header) -->
		<section class="content-header">
		<h1>Q & A</h1>
		<ol class="breadcrumb">
			<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
			<li class="subPage active">Q&A</li>
		</ol>
		</section>
		<section class="content">

		<div class="box box-success">
			<div class="box-header">
				<i class="fa fa-comments-o"></i>
				<h3 class="box-title"></h3>
				<div class="box-tools pull-right" data-toggle="tooltip"
					title="Status">
					<div class="btn-group" data-toggle="btn-toggle">
						<button type="button" class="btn btn-default btn-sm active">
							<i class="fa fa-square text-green"></i>
						</button>
						<button type="button" class="btn btn-default btn-sm">
							<i class="fa fa-square text-red"></i>
						</button>
					</div>
				</div>
			</div>
			
			
			<div class='box-body chat' id='chat-box'>
				<!-- chat item -->
				
			</div>
			<!-- /.box (chat box) -->
		</div>
		</section>
		
	</div>
	<!-- /.content-wrapper -->
<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
<script type="text/javascript">
		
	$(document).ready(function(){
		
		var data= $('#hidForm').serialize();
		$.get("/qna/listData",data, function(data){
			var str ="";
			$(data).each(function(){
				var qna = this.qnaNo;
				if(this.depth=='a'){
				str+= "<form id='qnaForm'>";
				str+= "<div class='item' style='padding-bottom: 30px'>";
				str+=	"<span class='online'>"+this.qnaNo+"/"+this.memberNo+"</span>";
				str+= "<p class='message'><a href='#' class='name'>";
				str+= 		"<button id='delQna' value='"+this.qnaNo+"' class='btn btn-danger btn-xs'>";
				str+=		"<i class='glyphicon glyphicon-remove'></i></button>";
				str+= 	"<span style='color: #adadad; font-size: 9pt' > ["+this.qna_type+"] </span>";
				str+= 	"<small class='text-muted pull-right'>";
				str+= 	"<i class='fa fa-clock-o'></i>"+this.regdate+"</small>"+this.title+"</a>";
				str+= 	this.contents+"</p>";
				str+= "<div class='attachment'>";
				};
				$(data).each(function(){
					if(qna == this.parent && this.depth =='b'){
						str+= "<strong>Re </strong>("+this.regdate+")<br><span>: "+this.contents+"</span><br>" ;
					}
				});
			
				if(this.depth=='a'){
				str+= "<form><div class='input-group'><input type='hidden' name='parent' value='"+this.parent+"'>";
				str+= "<textarea class='form-control' rows='5' cols='10' name='contents'></textarea>";
				str+= "<div class='input-group-btn'>";
				str+= "<button class='btn btn-primary btn-sm'>";
				str+= "<i class='fa fa-check'>등록</i></button>";
				str+= "</div></div></form></div></div></form>";
				};
			});
			$('#chat-box').html(str);
		});
	});
	
	$('#chat-box').on("click","#delQna", function(){
		console.log("들어옴");
		var qnaNo = $(this).attr('value');
		$.post("/qna/deleteQnA/"+qnaNo, function(data){
			console.log(data);
			alert(data);
		});
	});
		

	</script>
</body>
<%@include file="../include/footer.jsp"%>
</html>