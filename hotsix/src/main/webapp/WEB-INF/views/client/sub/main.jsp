<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.hideDiv{
		display:none;
	}
	.boarderStyle{
	}
</style>
</head>
<body>
<button id="showBtn" class="" style="position: absolute; left: 0; top: 0; z-index: 40">페이지 열기</button>
<div id="player" style="width: 100%; height: 100%; position: absolute; left: 0; top: 0"></div>

<button class="hideDiv" id="hideBtn" style="position: absolute; z-index: 101; left: 0; top: 0; margin-left: 90%;">X</button>
<iframe src="http://localhost:8080/notice/list" class="MainFrame hideDiv" style="position: absolute; z-index:100; left:0; top:0; margin-left:10%; width: 80%; height: 100%;" frameborder="0" scrolling="yes" onload="autoResize(this)"></iframe>
<iframe class="MainFrame hideDiv" id="sideFrame" style="position: absolute; background:rgba(72, 72, 72, .5); z-index:90; left:0; top:0; width: 100%; height: 100%;" frameborder="0" scrolling="yes" onload="autoResize(this)"></iframe>
<input type="text" size="4" id="search" style="position: absolute; z-index: 2; top: 3%; right: 0px; margin-right: 2%;">
<script src="https://www.googleapis.com/youtube/v3/playlists"></script>
<script src="//code.jquery.com/jquery-2.1.4.min.js"></script>
<script>
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
    var play = "요리사";
    var tag = document.createElement('script');

    tag.src = "https://www.youtube.com/iframe_api";
    var firstScriptTag = document.getElementsByTagName('script')[0];
    firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);

    var player;
    function onYouTubeIframeAPIReady() {
        player = new YT.Player('player', {
            height: '390',
            width: '640',
            playerVars:{
            	
                'listType':'search',
                'list': '직업 ' + play
            },
            events:{
            	'autoplay' : '1',
                'onReady': onPlayerReady,
                'onStateChange' : onPlayerStateChange
            }
        });
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