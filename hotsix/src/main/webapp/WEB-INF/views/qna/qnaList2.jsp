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
			<c:forEach items="${list}" var="list">
		
			
			<div class='box-body chat' id='chat-box'>
				<!-- chat item -->
				
				<div class='item'>
					<span class='online'>${list.memberNo}</span>
					<p class='message'>
						<a href='#' class='name'> 
						<span style='color: #adadad; font-size: 9pt' >[${list.qna_type}]</span>
						<small class='text-muted pull-right'><i
								class='fa fa-clock-o'></i> ${list.regdate}</small> ${list.title}
						</a> ${list.parents} ${list.depth} / ${list.contents }
					</p>
					<div class='attachment'>
						<h4>Reply:</h4><span>${list.contents }</span>
						<form>
						<div class='input-group'>
						
							<textarea class='form-control' rows='5' cols='10' name='contents'></textarea>
							<div class='input-group-btn'>
								<button class='btn btn-primary btn-sm'>
									<i class='fa fa-check'>등록</i>
								</button>
							</div>
						</div></form>
					</div>
					<!-- /.attachment -->
				</div>
				<!-- /.item -->
				
			</div></c:forEach>
			<!-- /.box (chat box) -->
		</div>
		</section>
	</div>
	<!-- /.content-wrapper -->
</body>
<%@include file="../include/footer.jsp"%>
</html>