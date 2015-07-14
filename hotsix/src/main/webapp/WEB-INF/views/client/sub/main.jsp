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
	       #page .frame {
	       		position:absolute;
                width: 98%;
                height:96.5%;
                margin: 1% 1% 1% 1%;
                padding: 8% 0 6% 0;
                border: 8px solid #ffec00;
            }
            
            .frame #player{
                width: 100%;
                height: 100%;
            }
            
            .logo {
               top: 0;
               width: 20%;
               margin: 0 auto;

            }

        #main {
            width: 100%;
            height: 100%;
            position: absolute;
            top: 0;
            left: 0;
        }
        
        .top{
            position: absolute;
            width: 98%;
            height: 10%;
            margin: 2.5% 2% 0 2%;
            z-index:10;
            
        }

        .top_bar{
            display: inline;
        }

        .menu_bar{
            width: 30%;
            position: absolute;
            margin: 0 5%;
            right: 0;
            top: 0;
        }

        body{
            overflow: hidden;
        }
        .side_menu{
        	float: right;
        	margin-top:3px;
        	margin-right: 2.65%;
        	background-color: white;
        	border-radius: 10px 0 60px 60px / 10px 0 60px 60px; 
        	padding-right: 5%;
        }
        .animatedIn{
	        -webkit-animation-duration: 1s; 
	    	animation-duration: 1s; 
    		-webkit-animation-fill-mode: both; 
   			animation-fill-mode: both; 
        }
		@-webkit-keyframes fadeInDown { 
		    0% { 
		        opacity: 0; 
		        -webkit-transform: translateY(-20px); 
		    } 
		    100% { 
		        opacity: 1; 
		        -webkit-transform: translateY(0); 
		    } 
		} 
		
		@keyframes fadeInDown { 
		    0% { 
		        opacity: 0; 
		        transform: translateY(-20px); 
		    } 
		    100% { 
		        opacity: 1; 
		        transform: translateY(0); 
		    } 
		} 
	
		.fadeInDown { 
		    -webkit-animation-name: fadeInDown; 
		    animation-name: fadeInDown; 
		}
		
        .side_menu ul li{
                list-style-type: none;
        }
        
   		.animatedOut { 
		    -webkit-animation-duration: 1s; 
		    animation-duration: 1s; 
		    -webkit-animation-fill-mode: both; 
    		animation-fill-mode: both; 
		} 

		@-webkit-keyframes fadeOutUp { 
		    0% { 
		        opacity: 1; 
		        -webkit-transform: translateY(0); 
		    } 
		    100% { 
		        opacity: 0; 
		        -webkit-transform: translateY(-20px); 
		    } 
		} 
		@keyframes fadeOutUp { 
		    0% { 
		        opacity: 1; 
		        transform: translateY(0); 
		    } 
		    100% { 
		        opacity: 0; 
		        transform: translateY(-20px); 
		    } 
		} 
		.fadeOutUp { 
		    -webkit-animation-name: fadeOutUp; 
		    animation-name: fadeOutUp; 
		}
	</style>
</head>
<body>
<div id="main">
<div id="page">
    <div class="top">
        <div class="top_bar">
        <div class="logo">
            <a href="#">
                <img src="\resources\dist\img\logo.png" alt="vividream">
            </a>
        </div>
            <div class="menu_bar">
                <input class="borderStyle" type="text" id="searchBox" size="4" style="margin:30px 0 30px 100px; height:36px; padding:2px auto; font-size:16pt;">   
                <img id="menuShow" src="\resources\dist\img\menu.png" style="float: right;">
            </div>
            <div class="side_menu hideDiv">
        		<ul>
        			<li><br></li>
            		<li><h1><a href="intro">Intro</a></h1></li>
            		<li><br></li>
            		<li><h1><a href="notice">Notice</a></h1></li>
            		<li><br></li>
            		<li><h1><a href="qna">Q & A</a></h1></li>
           		 	<li><br></li>
           		 	<li><h1><a href="mento">Mento List</a></h1></li>
            		<li><br></li>
        		</ul>
    		</div>
        </div>
    </div>
	<div class="frame">
    <div id="player"></div>
    </div>
</div>
</div>

<a href="#" class="hideDiv" id="hideBtn" style="position: absolute; z-index: 101; left: 0; top: 0; margin-left: 90%; width: 100px;"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></a>
<iframe src="" id="mainFrame" class="MainFrame hideDiv" style="position: absolute; z-index:100; left:0; top:0; margin-left:10%; width: 80%; height: 100%; background: white;" frameborder="0" scrolling="yes" onload="autoResize(this)"></iframe>
<iframe class="MainFrame hideDiv" id="sideFrame" style="position: absolute; background:rgba(72, 72, 72, .5); z-index:90; left:0; top:0; width: 100%; height: 100%;" frameborder="0" scrolling="yes" onload="autoResize(this)"></iframe>
<script src="https://www.googleapis.com/youtube/v3/playlists"></script>
<script src="//code.jquery.com/jquery-2.1.4.min.js"></script>

<form id="searchForm">
	<input type="hidden" name="searchData">
</form>

<script>
	$('.logo').on("click", function(event){
		event.preventDefault();
		$('#searchForm').find("[name=searchData]").val("");
		$('#searchForm').attr("action", "/hotsix/main").attr("method", "post").submit();
	});
	
	$('.side_menu').on("click","li a", function(event){
		event.preventDefault();
		var targetHref = $(this).attr("href");
		if(targetHref == "intro"){
			$('#mainFrame').attr("src","http://localhost:8080/hotsix/intro");
			$('#hideBtn').toggleClass("hideDiv");
			$('.MainFrame').toggleClass("hideDiv");
		}else if(targetHref == "notice"){
			alert("notice 클릭됨");
		}
	});
	
	$('.side_menu').on("blur", function(){
		console.log("ddd");
		$('.side_menu').addClass("fadeOutUp");
		$('.side_menu').addClass("animatedOut");
		$('.side_menu').removeClass("fadeInDown");
		$('.side_menu').removeClass("animatedIn");
		setTimeout(function(){$('.side_menu').addClass("hideDiv")},1000);
		$('#menuHide').attr("id", "menuShow"); 	
	});
	
	$('.menu_bar').on("click","#menuShow", function(){
		$('.side_menu').addClass("fadeInDown");
		$('.side_menu').addClass("animatedIn");
		$('.side_menu').removeClass("fadeOutUp");
		$('.side_menu').removeClass("animatedOut");
		$('.side_menu').removeClass("hideDiv");
		$('#menuShow').attr("id", "menuHide");
	});
	
	$('.menu_bar').on("click","#menuHide", function(){
		$('.side_menu').addClass("fadeOutUp");
		$('.side_menu').addClass("animatedOut");
		$('.side_menu').removeClass("fadeInDown");
		$('.side_menu').removeClass("animatedIn");
		setTimeout(function(){$('.side_menu').addClass("hideDiv")},1000);
		$('#menuHide').attr("id", "menuShow");
	});
		
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
    
    function onYouTubeIframeAPIReady() {
        player = new YT.Player('player', {
        	height: '720',
            width: '1280',
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