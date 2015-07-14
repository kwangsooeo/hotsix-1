<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta
	content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no'
	name='viewport'>
<!-- Bootstrap 3.3.4 -->
<link href="/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet"
	type="text/css" />
<!-- Font Awesome Icons -->
<link
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css"
	rel="stylesheet" type="text/css" />
<!-- Ionicons -->
<link
	href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css"
	rel="stylesheet" type="text/css" />
<!-- Theme style -->

<link href="/resources/dist/css/AdminLTE.min.css" rel="stylesheet"
	type="text/css" />
<link href="/resources/dist/css/skins/skin-blue.min.css"
	rel="stylesheet" type="text/css" />

<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
<title>Insert title here</title>
<style type="text/css">
	.hideDiv{
		display:none;
	}
</style>
</head>
<body>
<button id="showBtn" class="" style="position: absolute; left: 0; top: 0; z-index: 40">페이지 열기</button>
<div id="player" style="width: 100%; height: 100%; position: absolute; left: 0; top: 0"></div>
<a href="#" class="hideDiv" id="hideBtn" style="position: absolute; z-index: 101; left: 0; top: 0; margin-left: 90%; width: 100px;"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></a>
<iframe src="http://localhost:8080/hotsix/intro" id="mainFrame" class="MainFrame hideDiv" style="position: absolute; z-index:100; left:0; top:0; margin-left:10%; width: 80%; height: 100%; background: white;" frameborder="0" scrolling="yes" onload="autoResize(this)"></iframe>
<iframe class="MainFrame hideDiv" id="sideFrame" style="position: absolute; background:rgba(72, 72, 72, .5); z-index:90; left:0; top:0; width: 100%; height: 100%;" frameborder="0" scrolling="yes" onload="autoResize(this)"></iframe>
<input class="borderStyle" type="text" id="searchBox" size="4" style="position: absolute; z-index: 2; top: 3%; right: 0px; margin-right: 2%; ">
<script src="https://www.googleapis.com/youtube/v3/playlists"></script>
<script src="//code.jquery.com/jquery-2.1.4.min.js"></script>
<form id="searchForm">
	<input type="hidden" name="searchData">
</form>
<script>
	var play = new Array();
	playSplit = "${link}".split("[");
	playSplit2 = playSplit[1].split("]");
	play = playSplit2[0];
    console.log(play);
    $('#searchBox').on("keypress", function(event){
		if(event.keyCode==13){
			var test = $(this).val();
			$('#searchForm').find("[name=searchData]").val(test);
			$('#searchForm').attr("action", "/hotsix/main").attr("method", "post").submit();
		}
	});
    
    var player;
	$('.borderStyle').on("click", function(){
		$(this).attr("size", 12);
	});
	$('.borderStyle').on("blur", function(){
		$(this).attr("size", 4);
	});
	$('#showBtn').on("click", function(event){
		event.preventDefault();
		$('#hideBtn').toggleClass("hideDiv");
		$('.MainFrame').toggleClass("hideDiv");
	});
	$('#hideBtn').on("click", function(event){
		event.preventDefault();
		$('#hideBtn').toggleClass("hideDiv");
		$('.MainFrame').toggleClass("hideDiv");
	});
	$('#sideFrame').on("click", function(){
		console.log('ddd');
		$('#hideBtn').toggleClass("hideDiv");
		$('.MainFrame').toggleClass("hideDiv");
	});
	
    var tag = document.createElement('script');

    tag.src = "https://www.youtube.com/iframe_api";
    var firstScriptTag = document.getElementsByTagName('script')[0];
    firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);
   
    function start(){
    	alert("스타트");
    }
    
    function onYouTubeIframeAPIReady() {
        player = new YT.Player('player', {
            playerVars:{
            	'playlist' : play
            },
            events:{
            	'autoplay' : '1',
                'onReady': onPlayerReady,
                'onStateChange' : onPlayerStateChange
            }
        });
    }
   
    function playVideo(){
    	player.playVideo();
    }
    function onPlayerReady(event) {
    	event.target.playVideo();
    }
    var done = false;
    function onPlayerStateChange(event) {
        if (event.data == YT.PlayerState.PLAYING && !done) {
            console.log(event);
            console.log(event.target.B.playlist);
            done = true;
        }
    }
    function stopVideo() {
        player.stopVideo();
    }
</script>
</body>
</html>