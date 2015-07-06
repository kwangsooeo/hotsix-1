<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page session="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>

	<form id="noticeForm" action="/notice/list" method="get" >
	<input type="hidden" name="page" value="${cri.page }">
	<input type="hidden" name="perPageNum" value="${cri.perPageNum }">
	<input type="hidden" name="displayPageNum" value="${cri.displayPageNum }">
	<input type="hidden" name="keyword" value="${cri.keyword }">
	<input type="hidden" name="searchType" value="${cri.searchType }">
	</form>
	
	<script src="/resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>
	<script>
	alert("완료!! \n리스트로 이동됩니다.");
	$("#noticeForm").submit();
	</script>
	
	<script>

var result = '${savedName}';

parent.addFilePath(result);

</script>

</html>