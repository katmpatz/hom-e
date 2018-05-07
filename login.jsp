<%@page language="java" contentType = "text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="omadiki.*"%>
<%@page import="java.util.*"%>
<%@page errorPage="error.jsp"%>

<!-- Login -->
	 <div class="modal fade" id="login" role="dialog">
    <div class="modal-dialog">
		
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-body">
			<button type="button" class="close" data-dismiss="modal">&times;</button>
			
			
			<form method="post" action="login_controller.jsp" class="form-horizontal">
				<div class="form-signin-heading text-center">
					<span class="fa-stack fa-3x">
						<i class="fa fa-circle fa-stack-2x text-primary"></i>
						<i class="fa fa-key fa-stack-1x fa-inverse"></i>
					</span>
				</div>
				<h2 class="form-signin-heading text-center">Sign in</h2>
				<hr>
				<div class="form-group row">
                    <label for="email" class="col-sm-2 control-label" style="text-align:right"><b>Email:</b></label>
					<div class="col-sm-10">
						<input type="text" name="email" placeholder="Email" class="form-control" id="email">
					</div>
                </div>
                <div class="form-group row">
                    <label for="password" class="col-sm-2 control-label" style="text-align:right"><b>Password:</b></label>
					<div class="col-sm-10">
						<input type="password" name="password" placeholder="Password" class="form-control" id="password">
					</div>
                </div> 
				
				<hr>
				<div class="text-center">
					<button class="btn btn-primary" type="submit" id="find">Submit</button>
				</div>
			
       
   
			</form>
    </div>
  </div>
  </div>
  </div>