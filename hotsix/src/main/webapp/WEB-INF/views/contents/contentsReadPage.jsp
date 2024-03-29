<%@ page language="java" contentType="text/html; charset=UTF-8"

pageEncoding="UTF-8"%>

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
          <h1>
            Contents
          </h1>
        </section>

        <!-- Main content -->

        <section class="content">

          <!-- row -->

          <div class="row">

            <div class="col-md-12">

              <!-- The time line -->

              <ul class="timeline">

                <!-- timeline item -->

                <li>

                  <i class="fa fa-video-camera bg-maroon"></i>

                  <div class="timeline-item">

                    <span class="time"><i class="fa fa-clock-o"></i>${contentsVO.regdate}</span>

                    <h3 class="timeline-header">${contentsVO.link}</h3>

                    <div class="timeline-body">

                      <div class="embed-responsive embed-responsive-16by9">

                        <iframe class="embed-responsive-item" src="${contentsVO.link }" frameborder="0" allowfullscreen></iframe>                        

                      </div>

                    </div>

                    <div class="col-sm-3 col-sm-3 pull-right">

                      <button type="button" id="listBtn" class="btn btn-theme">List</button>

                      <button type="button" id="modBtn" class="btn btn-theme02">Modify</button>

                      <button type="button" id="delBtn" class="btn btn-theme03">Delete</button>

                    </div>

                  </div>

                </li>
                

                <!-- END timeline item -->

                

                  </pre>

                </div><!-- /.box-body -->

              </div><!-- /.box -->

            </div><!-- /.col -->

          </div><!-- /.row -->



        </section><!-- /.content -->

      </div><!-- /.content-wrapper -->
      
      <form id='jobForm'>
      	<input type='hidden' name='contentsNo' value='${contentsVO.contentsNo}'>
      	<input type='hidden' name='title' value='${contentsVO.title }'>
      	<input type='hidden' name='link' value='${contentsVO.link }'>
      	
		<input type='hidden' name='page' value='${cri.page }'>
		<input type='hidden' name='perPageNum' value='${cri.perPageNum }'>
		<input type='hidden' name='displayPageNum' value='${cri.displayPageNum }'>
	  </form>


      <!-- Control Sidebar -->      

      <aside class="control-sidebar control-sidebar-dark">                

        <!-- Create the tabs -->

        <ul class="nav nav-tabs nav-justified control-sidebar-tabs">

          <li><a href="#control-sidebar-home-tab" data-toggle="tab"><i class="fa fa-home"></i></a></li>

          

          <li><a href="#control-sidebar-settings-tab" data-toggle="tab"><i class="fa fa-gears"></i></a></li>

        </ul>

        <!-- Tab panes -->

        <div class="tab-content">

          <!-- Home tab content -->

          <div class="tab-pane" id="control-sidebar-home-tab">

            <h3 class="control-sidebar-heading">Recent Activity</h3>

            <ul class='control-sidebar-menu'>

              <li>

                <a href='javascript::;'>

                  <i class="menu-icon fa fa-birthday-cake bg-red"></i>

                  <div class="menu-info">

                    <h4 class="control-sidebar-subheading">Langdon's Birthday</h4>

                    <p>Will be 23 on April 24th</p>

                  </div>

                </a>

              </li>

              <li>

                <a href='javascript::;'>

                  <i class="menu-icon fa fa-user bg-yellow"></i>

                  <div class="menu-info">

                    <h4 class="control-sidebar-subheading">Frodo Updated His Profile</h4>

                    <p>New phone +1(800)555-1234</p>

                  </div>

                </a>

              </li>

              <li>

                <a href='javascript::;'>

                  <i class="menu-icon fa fa-envelope-o bg-light-blue"></i>

                  <div class="menu-info">

                    <h4 class="control-sidebar-subheading">Nora Joined Mailing List</h4>

                    <p>nora@example.com</p>

                  </div>

                </a>

              </li>

              <li>

                <a href='javascript::;'>

                  <i class="menu-icon fa fa-file-code-o bg-green"></i>

                  <div class="menu-info">

                    <h4 class="control-sidebar-subheading">Cron Job 254 Executed</h4>

                    <p>Execution time 5 seconds</p>

                  </div>

                </a>

              </li>

            </ul><!-- /.control-sidebar-menu -->



            <h3 class="control-sidebar-heading">Tasks Progress</h3> 

            <ul class='control-sidebar-menu'>

              <li>

                <a href='javascript::;'>               

                  <h4 class="control-sidebar-subheading">

                    Custom Template Design

                    <span class="label label-danger pull-right">70%</span>

                  </h4>

                  <div class="progress progress-xxs">

                    <div class="progress-bar progress-bar-danger" style="width: 70%"></div>

                  </div>                                    

                </a>

              </li> 

              <li>

                <a href='javascript::;'>               

                  <h4 class="control-sidebar-subheading">

                    Update Resume

                    <span class="label label-success pull-right">95%</span>

                  </h4>

                  <div class="progress progress-xxs">

                    <div class="progress-bar progress-bar-success" style="width: 95%"></div>

                  </div>                                    

                </a>

              </li> 

              <li>

                <a href='javascript::;'>               

                  <h4 class="control-sidebar-subheading">

                    Laravel Integration

                    <span class="label label-waring pull-right">50%</span>

                  </h4>

                  <div class="progress progress-xxs">

                    <div class="progress-bar progress-bar-warning" style="width: 50%"></div>

                  </div>                                    

                </a>

              </li> 

              <li>

                <a href='javascript::;'>               

                  <h4 class="control-sidebar-subheading">

                    Back End Framework

                    <span class="label label-primary pull-right">68%</span>

                  </h4>

                  <div class="progress progress-xxs">

                    <div class="progress-bar progress-bar-primary" style="width: 68%"></div>

                  </div>                                    

                </a>

              </li>               

            </ul><!-- /.control-sidebar-menu -->         



          </div><!-- /.tab-pane -->

          <!-- Stats tab content -->

          <div class="tab-pane" id="control-sidebar-stats-tab">Stats Tab Content</div><!-- /.tab-pane -->

          <!-- Settings tab content -->

          <div class="tab-pane" id="control-sidebar-settings-tab">            

            <form method="post">

              <h3 class="control-sidebar-heading">General Settings</h3>

              <div class="form-group">

                <label class="control-sidebar-subheading">

                  Report panel usage

                  <input type="checkbox" class="pull-right" checked />

                </label>

                <p>

                  Some information about this general settings option

                </p>

              </div><!— /.form-group —>



              <div class="form-group">

                <label class="control-sidebar-subheading">

                  Allow mail redirect

                  <input type="checkbox" class="pull-right" checked />

                </label>

                <p>

                  Other sets of options are available

                </p>

              </div><!— /.form-group —>



              <div class="form-group">

                <label class="control-sidebar-subheading">

                  Expose author name in posts

                  <input type="checkbox" class="pull-right" checked />

                </label>

                <p>

                  Allow the user to show his name in blog posts

                </p>

              </div><!— /.form-group —>



              <h3 class="control-sidebar-heading">Chat Settings</h3>



              <div class="form-group">

                <label class="control-sidebar-subheading">

                  Show me as online

                  <input type="checkbox" class="pull-right" checked />

                </label>                

              </div><!— /.form-group —>



              <div class="form-group">

                <label class="control-sidebar-subheading">

                  Turn off notifications

                  <input type="checkbox" class="pull-right" />

                </label>                

              </div><!— /.form-group —>



              <div class="form-group">

                <label class="control-sidebar-subheading">

                  Delete chat history

                  <a href="javascript::;" class="text-red pull-right"><i class="fa fa-trash-o"></i></a>

                </label>                

              </div><!— /.form-group —>

            </form>

          </div><!— /.tab-pane —>

        </div>

      </aside>

      <div class='control-sidebar-bg'></div>

    </div> 
  
    
    <script src="//code.jquery.com/jquery-2.1.4.min.js"></script>
	<script>
		$(document).ready(function() {
			var jobForm = $("#jobForm");

			$("#listBtn").click(function() {
				self.location = "/contents/contentsListCri";
			});

			$("#modBtn").click(function() {
				jobForm.attr("action", "/contents/contentsModifyPage");
				jobForm.attr("method", "get");
				jobForm.submit();
			});

			$("#delBtn").click(function() {
				jobForm.attr("action", "/contents/contentsRemove");
				jobForm.attr("method", "post");
				jobForm.submit();
			});
		});
		
		
		
		
		var tag = document.createElement('script');

	    tag.src = "https://www.youtube.com/iframe_api";
	    var firstScriptTag = document.getElementsByTagName('script')[0];
	    firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);

	    var player;
	    function onYouTubeIframeAPIReady() {
	        player = new YT.Player('player', {
	            height: '390',
	            width: '640',
	            'videoId': '프로그래머',
	            playerVars:{
	                'autoplay': 1,
	                'listType':'search',
	                 'list': '요리사'
	            }
	        });
	    }

	    function onPlayerReady(event) {
	        event.target.playVideo();
	    }
	    var done = false;
	    function onPlayerStateChange(event) {
	        if (event.data == YT.PlayerState.PLAYING && !done) {
	            setTimeout(stopVideo, 6000);
	            done = true;
	        }
	    }
	    function stopVideo() {
	        player.stopVideo();
	    }
	</script>
</body>
<%@include file="../include/footer.jsp"%>

</html>