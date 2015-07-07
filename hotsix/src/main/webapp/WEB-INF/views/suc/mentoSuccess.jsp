<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form id="jobForm" action="/mento/list" method="get">
            <input type='hidden' name='mentoNo' value="${cri.mentoNo}">
			<input type='hidden' name='page' value="${cri.page}">
			<input type='hidden' name='displayPageNum' value="${cri.displayPageNum}">
</form>

<script src="//code.jquery.com/jquery-2.1.4.min.js"></script>
	<script>
		alert("멘토등록하였습니다.");
		$("#jobForm").submit();

	</script>
</body>
</html>