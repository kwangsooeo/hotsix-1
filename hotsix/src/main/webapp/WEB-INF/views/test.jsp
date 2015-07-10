<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.hideDiv{
		display: none;
	}
</style>
</head>
<body>
<button>프레임 나와라</button>
<iframe src="http://localhost:8080/notice/list" class="NoticeFrame hideDiv" style="z-index: 10%; height: 900px; width: 80%;" frameborder="0" scrolling="yes" onload="autoResize(this)"></iframe>
<script src="//code.jquery.com/jquery-2.1.4.min.js"></script>
<script type="text/javascript">
$('button').on("click", function(){
	$('.NoticeFrame').toggleClass("hideDiv");
});
</script>
</body>
</html>