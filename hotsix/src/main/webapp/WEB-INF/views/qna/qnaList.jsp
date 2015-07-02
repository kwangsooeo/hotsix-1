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
		
	</div><!-- /.content-wrapper -->
	<!-- Modal -->
<div id="modifyModal" class="modal modal-primary fade" role="dialog">
  <div class="modal-dialog">
    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title"></h4>
      </div>
      <div class="modal-body">
        <p><textarea id="replytext" class="form-control" rows="15"></textarea></p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-info" id="replyModBtn">Modify</button>
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>
	<form id="regForm">
		<input type="hidden" name="contents">
		<input type="hidden" name="qnaNo">	
	</form>
	
<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
<script type="text/javascript">
		
$(document).ready(function(){
	
	qnaList();
	
});
var qnaList =function(){
	$.get("/qna/listData", function(data){
		var str ="";
		$(data).each(function(){
			var qna = this.qnaNo;
			if(this.depth=='a'){
			str+= "<div class='item' style='padding-bottom: 30px'>";
			str+=	"<span class='online'>"+this.qnaNo+"/"+this.memberNo+"</span>";
			str+= "<p class='message'><a class='name'>";
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
					str+= "<strong>Re </strong>("+this.regdate+")";
					str+= "<button id='modReply' value='"+this.qnaNo+"' class='btn-link btn-xs' ";
					str+= ">수정</button>|";
					str+= "<button id='delReply' value='"+this.qnaNo+"' class='btn-link btn-xs'>삭제</button>";
					str+= "<br><span>: "+this.contents+"</span><br>" ;
				}
			});
		
			if(this.depth=='a'){
			str+= "<div class='"+this.qnaNo+"'>";
			str+= "<textarea class='form-control' rows='5' cols='10' name='contents'></textarea>";
			str+= "<button id='"+this.qnaNo+"' class='registBtn btn btn-primary btn-sm'>";
			str+= "<i class='fa fa-check'>등록</i></button></div>";
			str+= "</div></div>";
			};
			
		});

		$('#chat-box').html(str);
	});

};
$('#chat-box').on("click",".registBtn", function(){
	var targetId = $(this).attr("id");
	var targetContents = $('.'+targetId).find("textarea").val();
	$('#regForm').find("input[name=contents]").val(targetContents);
	$('#regForm').find("input[name=qnaNo]").val(targetId);
	var formData = $('#regForm').serialize();
	$.post("/qna/registQnA", formData, function(data){
		alert(data);
		qnaList();
	});
});

$('#chat-box').on("click","#delQna", function(){
		var qnaNo = $(this).attr('value');
		
		$.post("/qna/deleteQnA/"+qnaNo, function(data){
			alert(data);
			qnaList();
		});
});
	
$('#chat-box').on("click",'#delReply', function(){
	var qnaNo = $(this).attr('value');
	console.log(qnaNo);
	$.post("/qna/deleteReply/"+qnaNo, function(data){
		alert(data);
		qnaList();
	});
});		

$('#chat-box').on("click",'#modReply', function(){
	
	var qnaNo = $(this).attr('value');
	console.log(qnaNo);
	$('#regForm').find("input[name=qnaNo]").val(qnaNo);
	$.get("/qna/readReply/"+qnaNo, function(data){
		console.log(data);
		var modal = $("#modifyModal");
		modal.find(".modal-title").text(data.regdate);
		modal.find("#replytext").val(data.contents);
		modal.modal();	
		console.log(modal);
	});
});
	

$("#replyModBtn").on("click", function(event){
	var contents = $("#modifyModal").find("#replytext").val();
	console.log("con:"+contents+"//");
	$('#regForm').find("input[name=contents]").val(contents);
	var modData = $('#regForm').serialize();
	$.post("/qna/modifyReply",modData, function(data){
		console.log(data);
		$("#modifyModal").modal("hide");
		qnaList();
	});
});
	</script>
</body>
<%@include file="../include/footer.jsp"%>
</html>