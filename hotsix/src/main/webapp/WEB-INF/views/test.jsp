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
	
	#img3d{
		left:0;
		top:0;
		margin-left:80%;
		margin-top: 50%;
	}
	
	#img3dAfter{
		left:0;
		top:0;
		margin-left:80%;
		margin-top: 50%;
		-webkit-animation-name: flip;
		-webkit-animation-duration: 3000ms;
		-webkit-animation-name: imgFrame;
	}
	
	@-webkit-keyframes flip { 
    	0% { 
    	    -webkit-transform: perspective(400px) rotateY(0); 
    	    -webkit-animation-timing-function: ease-out; 
    	} 
    	40% { 
    	    -webkit-transform: perspective(400px) translateZ(150px) rotateY(170deg); 
    	    -webkit-animation-timing-function: ease-out; 
    	} 
    	50% { 
    	    -webkit-transform: perspective(400px) translateZ(150px) rotateY(190deg) scale(1); 
    	    -webkit-animation-timing-function: ease-in; 
    	} 
    	80% { 
    	    -webkit-transform: perspective(400px) rotateY(360deg) scale(.95); 
    	    -webkit-animation-timing-function: ease-in; 
    	} 
    	100% { 
    	    -webkit-transform: perspective(400px) scale(1); 
    	    -webkit-animation-timing-function: ease-in; 
    	} 
	} 
	
	@-webkit-keyframes imgFrame {
		0% { 
    	    -webkit-transform: perspective(400px) rotateY(0); 
    	    -webkit-animation-timing-function: ease-out; 
    	} 
    	10% { 
    	    -webkit-transform: perspective(400px) translateZ(150px) rotateY(170deg); 
    	    -webkit-animation-timing-function: ease-out; 
    	} 
    	20% { 
    	    -webkit-transform: perspective(400px) translateZ(150px) rotateY(190deg) scale(1); 
    	    -webkit-animation-timing-function: ease-in; 
    	} 
    	30% { 
    	    -webkit-transform: perspective(400px) rotateY(360deg) scale(.95); 
    	    -webkit-animation-timing-function: ease-in; 
    	} 
    	40% { 
    	    -webkit-transform: perspective(400px) scale(1); 
    	    -webkit-animation-timing-function: ease-in; 
    	} 
		60%{
			-webkit-transform: translateX(-500px) translateY(-500px);		
		}
			
		70%{
			-webkit-transform: translateX(-500px) translateY(-500px) ;		
		}
		
		100%{
			-webkit-transform: translateX(500px) translateY(-500px) ;
		}
	}	
		
</style>
</head>
<body>
<img style="width: 200px" id="img3d" alt="ddd" src="/resources/dist/img/mail-297139_1280.png">
<button id="clickBtn">클릭</button>
<script src="//code.jquery.com/jquery-2.1.4.min.js"></script>
<script type="text/javascript">
$('#clickBtn').on("click", function(){
	$('#img3d').attr("id","img3dAfter");
	setTimeout(function(){
		$('#img3dAfter').attr("id","img3d");
	},4000);
});
$('ddsdd').on("click", function(){
	$('#img3dAfter').attr("id","img3d");
})
</script>
</body>
</html>