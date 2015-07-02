<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="../include/header.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>멘토 관리</title>
<style>
.table th,td{text-align: center;}


</style>
</head>
<div class="content-wrapper">
   <!-- Content Header (Page header) -->
   <section class="content-header">
   <h1>Mento</h1>
   <ol class="breadcrumb">
      <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
      <li class="subPage active">Mento</li>
   </ol>
   </section>
   <section class="content">
   <div class="row">
      <div class="col-xs-12">
         <div class="box">
            <div class="box-header">
               <h3 class="box-title">MentoList</h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
            <form id="jobForm">
            <input type='hidden' name='mentoNo' value="${cri.mentoNo}">
			<input type='hidden' name='page' value="${cri.page}">
			<input type='hidden' name='displayPageNum' value="${cri.displayPageNum}">
			
			
			<div class="pull-left">
			(총 회원수 : ${pageMaker.totalCount},&nbsp;대기회원 :<span style="color:#3399FF; font-weight:bold">${mentoCount.countWaiting}</span>,&nbsp;탈퇴 : 0)
			</div>
			<div class="pull-right">
			
			<select name="perPageNum">
			<option value="10" <c:out value="${cri.perPageNum ==10? 'selected' : ''}"/>>10개</option>
			<option value="30" <c:out value="${cri.perPageNum ==30? 'selected' : ''}"/>>30개</option>
			<option value="50"<c:out value="${cri.perPageNum ==50? 'selected' :''}"/>>50개</option>
			<option value="100"<c:out value="${cri.perPageNum ==100? 'selected' :''}"/>>100개</option>
			</select>
			<select name ="searchType">
			<option value="i"<c:out value="${cri.searchType eq 'i' ?'selected':''}"/>>아이디</option>
			<option value="n"<c:out value="${cri.searchType eq 'n' ?'selected':''}"/>>이름</option>
			<option value="c"<c:out value="${cri.searchType eq 'c' ?'selected':''}"/>>직업</option>
			<option value="s"<c:out value="${cri.searchType eq 's' ?'selected':''}"/>>상태</option>		 
			 </select>
			 <input type="text" name="keyword" value="${cri.keyword}">
			 <button id="searchBtn"> Search </button>
			
			</div>
               <table id="example2" class="table table-bordered table-hover">
                  <thead>
                     <tr>
                     <th><input id="select_all" type="checkbox"> </th>
                        <th>회원아이디</th>
                        <th>이름</th>
                        <th>닉네임</th>
                        <th>직업</th>
                        <th>멘티아이디</th>
                        <th>가입일</th>
                        <th>최종접속일</th>
                        <th>처리상태</th>
                     </tr>
                  </thead>
                  <tbody>
                     <c:forEach items="${list}" var="list">
                      <tr>
                           <td><input value="${list.mentoNo}" name="checkbox_mento" type="checkbox"></td>
                           <td>${list.id }</td>
                           <td>${list.name}</td>
                           <td>${list.nickname }</td>
                           <td>${list.career }</td>
                           <td>${list.menteeId }</td>
                           <td>${list.regdate }</td>
                           <td>${list.logdate}</td>
                           <td>
                           <c:if test="${list.status == '2'}">멘토등록</c:if>
                           <c:if test="${list.status == '0'}">
                           	<span style="color:#BABABA; font-weight:bold">멘토거절</span></c:if>
                           <c:if test="${list.status == '1'}">
                           <span style="color:#3399FF; font-weight:bold">대기중</span>
                           </c:if>                  
                           </td>
                       </tr>
                     </c:forEach>
                  </tbody>
 
               </table>
               </form>
            </div>
            <!-- /.box-body -->
            <div class="row box-header">
                <div id="pagination" class="col-sm-3">
                  <br>
                  <input id="registBtn" type="button" class="btn btn-default" value='선택등록'>
              	 <input id="rejectBtn" type="button" class="btn btn-default" value='선택거절'>
 				</div>
               <div class="col-sm-9">
                  <ul class="pager pagenation">
                     <c:if test="${pageMaker.prev != 0 }" var="prev">
					<li><a href="${pageMaker.prev}">&laquo;</a></li>
					</c:if>
	
					<c:forEach begin="${pageMaker.first}" end="${pageMaker.last}" var="idx">
						<li <c:out value="${cri.page == idx ? 'class=active' : ''}"/>><a href="${idx}">${idx}</a></li>
					</c:forEach>
					
					<c:if test="${pageMaker.next != 0}">
					<li><a href="${pageMaker.next}">&raquo;</a></li>
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
<script src="http://code.jquery.com/jquery-1.11.3.js"></script>
<script>
$(document).ready(function(){
	var jobForm = $("#jobForm");
	
$(".pager li a").on("click",function(event){
	event.preventDefault();
	var targetPageNum = $(this).attr("href");
	
	jobForm.find("input[name='mentoNo']").remove();
	jobForm.find("[name='page']").val(targetPageNum);
	jobForm.attr("action", "/mento/list").attr("method","get");
	jobForm.submit();
});

$("#searchBtn").on("click",function(event){
	
	jobForm.find("input[name='mentoNo']").remove();
	jobForm.find("[name='page']").val(1);
	jobForm.attr("action","/mento/list").attr("method","get");
});


$('#select_all').change(function() {
    if(this.checked) { // check select status
        $('input[name="checkbox_mento"]').each(function() { //loop through each checkbox
            this.checked = true;  //select all checkboxes with class "checkbox1"               
        });
    }else{
        $('input[name="checkbox_mento"]').each(function() { //loop through each checkbox
            this.checked = false; //deselect all checkboxes with class "checkbox1"                       
        });         
    }
});

	
	
	$("input[name=checkbox_mento]:checked").each(function(){
		var len = this.length;		//체크박스의 전체개수
		var chkRow = "";			 //체크된 체크박스의 value를 담기위한 변수
		var chkCnt = 0;			 //체크된 체크박스의 갯수
		var chkLast ='';		 //체크된 체크박스중 마지막 체크박스의 인덱스를 담기위한 변수
		var rowid = ''; 		 //체크된 체크박스의 모든 value값을 담음
		var cnt = '';
	for(var i=0; i <len; i++){
		chkRow = this[i].value;
		
		if(chkCnt ==1){					//체크된 체크박스의 갯수가 한 개 일때,
			rowid += "'"+chkRow+"'"; 	//value의 뒤에 콤마가 붙지않게	
		}else{
			if(i ==chkLast){			//체크된 체크 박스 중 마지막 체크박스에
				rowid += "'"+chkRow+"'";	// 콤마가 붙지않게
			}else{
				rowid +="'"+chkRow+"',";	//value 뒤에 콤마가 붙게
			}
		}
		cnt++;
		chkRow = ''; //초기화
		console.log(rowid);
}
});
});

	
</script>
<%@include file="../include/footer.jsp"%>
</html>