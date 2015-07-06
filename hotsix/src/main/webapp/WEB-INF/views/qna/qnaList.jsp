<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<%@include file="../include/header.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.hideDiv{display: none;}
</style>
</head>
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
<c:forEach items="${list}" var="list" >

<div class='box-body chat' id='chat-box'>
		
    <div class='item' style='padding-bottom: 30px'>
        <span class='online'>${list.qnaNo } / ${list.memberNo} </span>
        <p class='message'>
        <a class='name'>
		<button value='${list.qnaNo }' class='delQna btn btn-danger btn-xs'>
            <i class='glyphicon glyphicon-remove'></i></button>
        <span style='color: #adadad; font-size: 9pt'>[${list.qna_type }]</span>
			<small class='text-muted pull-right'>
                <i class='fa fa-clock-o'></i>${list.regdate }
            </small>  ${list.title}</a>    ${list.contents }
        </p>
	        <div class="${list.qnaNo} attachment" id="replyDiv">
				<h5><a class="reply" href="${list.qnaNo}">댓글(${list.replycnt})</a></h5>
				
		   		<div class='replyListDiv hideDiv'></div>
				
			</div>
    </div>
</div>
</c:forEach>

    <div class="row box-header">
           <div class="col-sm-3">
                  <br>
           </div>
           <div class="col-sm-9">
              <ul class="pager pagenation">
                    <c:if test="${pageMaker.prev != 0}">
			      	<li><a href="${pageMaker.prev }">&laquo;</a> </li>
			    	</c:if>
			   		 <c:forEach begin="${pageMaker.first}" end="${pageMaker.last }" var="pageNum">
			    	<li <c:out value="${pageNum==cri.page? 'class=active':''}"/>>
			    	<a href="${pageNum}"> ${pageNum}</a></li>
			    	
			   		 </c:forEach>
				    <c:if test="${pageMaker.next != 0}">
				    <li><a href="${pageMaker.next}">&raquo;</a></li>
				    </c:if>
             </ul>
            </div>
      </div>
   
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
		<input type="hidden" name="contents" value="">
		<input type="hidden" name="qnaNo" value="">
		<input type='hidden' name='parent'>
	</form>
	<form class="pageForm">
			<input type="hidden" name="page" value='${cri.page }'>
			<input type="hidden" name="perPageNum" value='${cri.perPageNum }'>
			<input type="hidden" name="displayPageNum" value='${cri.displayPageNum }'>
	</form>
<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
<script type="text/javascript">
		console.log("ddd");
$(document).ready(function(){
	console.log('dddd');
	var targetForm = $(".pageForm");
	$(".pager").on("click","li a", function(event){
		event.preventDefault();
		var target = $(this).attr("href");
		
		$("[name='page']").attr("value",target);
		targetForm.attr("action","/qna/list").attr("method","get");
		targetForm.submit();
	});
	
	
});

$('.reply').on("click", function(event){
	event.preventDefault();
	var qnaNo= $(this).attr('href');
	console.log(qnaNo);
	var listDiv = $("."+qnaNo).find('.replyListDiv');
	listDiv.toggleClass('hideDiv');
		$.get("/qna/listData2/"+qnaNo, function(data){
			var str="";
			$(data).each(function(){
				if(this.parent==qnaNo){
					str+= "<strong>Re </strong>("+this.regdate+")";
					str+= "<button id='modReply' value='"+this.qnaNo+"' class='btn-link btn-xs'>수정</button>|";
					str+= "<button id='"+this.parent+"' value='"+this.qnaNo+"' class='delReply btn-link btn-xs'>삭제</button>";
					str+= "<br><span>: "+this.contents+"</span><br>" ;
				}
			});		
			str+= "<div class='registDiv'>";
			str+= "<textarea class='form-control' rows='5' cols='10' name='contents'></textarea>";
			str+= "<button id='registBtn' value='"+qnaNo+"' class='registBtn btn btn-primary btn-sm'>";
			str+= "<i class='fa fa-check'>등록</i></button></div>";		
			listDiv.html(str);
		});  

});

$('.delQna').on("click", function(){
	var qnaNo= $(this).val();
	$.post("/qna/deleteQnA/"+qnaNo, function(data){
		alert(data);
		var targetForm = $(".pageForm");
		targetForm.attr("action","/qna/list").attr("method","get");
		targetForm.submit();
	});
	
});

$('.replyListDiv').on("click",'.registBtn', function(){
	var qnaNo = $(this).val();
	var contents = $('.'+qnaNo).find("div textarea").val();	
	$("#regForm input[name='qnaNo']").attr("value",qnaNo);
	$("#regForm input[name='contents']").val(contents);
	$("input[name='parent']").remove();
	var listDiv = $("."+qnaNo).find('.replyListDiv');
	var data = $('#regForm').serialize();
	$.post("/qna/registQnA", data, function(data){
		alert(data);
		var targetForm = $(".pageForm");
		targetForm.attr("action","/qna/list").attr("method","get");
		targetForm.submit();
		
		$.get("/qna/listData2/"+qnaNo, function(data){
			var str="";
			$(data).each(function(){
				if(this.parent==qnaNo){
					str+= "<strong>Re </strong>("+this.regdate+")";
					str+= "<button id='modReply' value='"+this.qnaNo+"' class='btn-link btn-xs'>수정</button>|";
					str+= "<button id='"+this.parent+"' value='"+this.qnaNo+"' class='delReply btn-link btn-xs'>삭제</button>";
					str+= "<br><span>: "+this.contents+"</span><br>" ;
				}
			});		
			str+= "<div class='registDiv'>";
			str+= "<textarea class='form-control' rows='5' cols='10' name='contents'></textarea>";
			str+= "<button id='registBtn' value='"+qnaNo+"' class='registBtn btn btn-primary btn-sm'>";
			str+= "<i class='fa fa-check'>등록</i></button></div>";		
			listDiv.html(str);
			
		});  
	});  
});

$('.replyListDiv').on("click",".delReply",function(){
	var qnaNo = $(this).val();
	var parent = $(this).attr("id");
	console.log(qnaNo+": "+parent);
	$("#regForm input[name='qnaNo']").attr("value",qnaNo);
	$("#regForm input[name='parent']").val(parent);
	var data = $('#regForm').serialize();
	
	$.post("/qna/deleteReply",data, function(data){
		alert(data);
		var targetForm = $(".pageForm");
		targetForm.attr("action","/qna/list").attr("method","get");
		targetForm.submit();
	}); 
});
$('.replyListDiv').on("click",'#modReply', function(){
	var qnaNo = $(this).attr('value');
	console.log(qnaNo);
	$('#regForm').find("input[name=qnaNo]").val(qnaNo);
	$.get("/qna/readReply/"+qnaNo, function(data){
		
		var modal = $("#modifyModal");
		modal.find(".modal-title").text(data.regdate);
		modal.find("#replytext").val(data.contents);
		modal.modal();	
	});
});

$("#replyModBtn").on("click", function(event){
	var contents = $("#modifyModal").find("#replytext").val();
	console.log("con:"+contents+"//");
	$('#regForm').find("input[name=contents]").val(contents);
	$("input[name='parent']").remove();
	console.log($('#regForm').find("input[name=contents]").val());
	var modData = $('#regForm').serialize();
	$.post("/qna/modifyReply",modData, function(data){
		console.log(data);
		$("#modifyModal").modal("hide");
		var targetForm = $(".pageForm");
		targetForm.attr("action","/qna/list").attr("method","get");
		targetForm.submit();
	});
});
 
</script>
<%@include file="../include/footer.jsp"%>
</html>