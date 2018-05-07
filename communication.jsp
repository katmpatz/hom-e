<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "omadiki2.*"%>
<%@ page import= "java.util.List"%>
<%@ page import= "java.util.ArrayList"%>
<%@ page errorPage="error.jsp"%>


<!DOCTYPE html>
<html lang="en">

  <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.4/angular.min.js"></script>

  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Messages</title>

    <!-- Bootstrap core CSS -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom fonts for this template -->
    <link href="vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
    <link href='https://fonts.googleapis.com/css?family=Kaushan+Script' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Droid+Serif:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700' rel='stylesheet' type='text/css'>
	<link href="https://fonts.googleapis.com/css?family=Lobster|Saira+Semi+Condensed" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Indie+Flower" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="css/agency.min.css" rel="stylesheet">

  </head>

  <body id="page-top"  ng-app="my-app">

	 <%@ include file="navbar.jsp"  %>

	<% traveller = (Traveller)session.getAttribute("traveller-object");
	if(traveller==null) {
		request.setAttribute("message","Please login"); %>

		<jsp:forward page="login2.jsp"/>
	<%}
		int trav_id = traveller.getId();
	%>

<br>
<br>
  <section class="bg-light" id="portfolio">
      <div class="container ">
		<div class="row">
          <div class="col-lg-12 text-center">
            <h2 class="section-heading text-uppercase">Messages</h2>
			<br>
          </div>
        </div>
		<%	LocalBuddyDAO lbd = new LocalBuddyDAO();
			CommunicationDAO cd = new CommunicationDAO();
		LocalBuddy local = lbd.getLocalBuddyByTraveller(trav_id);
		if(local!=null) {
			List<Communication> com = cd.showNewRequests(local.getId());%>
			<div  class="row">
				<div class="col-lg-6">
				<h4 class="section-heading text-uppercase">Someone wants you to guide him in your city!</h4>
				<h5 class="section-subheading text-muted">Take a look on your requests.</h5>
				</div>
			</div>
			<%if(com.size()==0) {	%>
			<div class="alert alert-secondary col-lg-12 text-center">
				<strong>"You have not any new requests."</strong>
			 </div>

			<%} else {%>
			<div ng-controller="AppController">
			<ul class="list-unstyled">



			 <li><div class="jumbotron" style="padding-top: 1rem;padding-bottom: 1rem;">
				<img src="img/<%=com.get(0).getTraveller().getPhoto()%>.jpg" style="width:200px; height:200px;" id="photo" class="img-thumbnail">
				 <label style="padding-left: 20px;"><h4><%=com.get(0).getTraveller().getName()%><small>  <%=com.get(0).getDate()%></small></h4><label>
				 <p><small> " <%=com.get(0).getMessage()%>"</small><p>
				 <a class="btn btn-link" href="profil.jsp?id=<%=com.get(0).getTraveller().getId()%>" role="button">View traveller's profil!</a>

				<button id="AcceptButton" class="btn btn-primary btn-sm" style="background-color:#FF0055; border-color:red;" type="submit" data-toggle="modal" data-target="#accept<%=com.get(0).getId()%>"><b>Accept</b></button>
				<button id="DeleteButton" class="btn btn-primary btn-sm"  style="background-color:#FF0055; border-color:red;" type="submit" data-toggle="modal" data-target="#delete<%=com.get(0).getId()%>"><b>Delete</b></button>
				</div>
				</li>

			<%if(com.size()>=2) {%>

        <div ng-show="showMe">
          <%for(int i=1;i<com.size();i++) {%>

            <li><div class="jumbotron" style="padding-top: 1rem;padding-bottom: 1rem;">
     				<img src="img/<%=com.get(i).getTraveller().getPhoto()%>.jpg" style="width:200px; height:200px;" id="photo" class="img-thumbnail">
     				 <label style="padding-left: 20px;"><h4><%=com.get(i).getTraveller().getName()%><small>  <%=com.get(i).getDate()%></small></h4><label>
     				 <p><small> " <%=com.get(i).getMessage()%>"</small><p>
     				 <a class="btn btn-link" href="profil.jsp?id=<%=com.get(i).getTraveller().getId()%>" role="button">View traveller's profil!</a>

     				<button id="AcceptButton" class="btn btn-primary btn-sm" style="background-color:#FF0055; border-color:red;" type="submit" data-toggle="modal" data-target="#accept<%=com.get(i).getId()%>"><b>Accept</b></button>
     				<button id="DeleteButton" class="btn btn-primary btn-sm"  style="background-color:#FF0055; border-color:red;" type="submit" data-toggle="modal" data-target="#delete<%=com.get(i).getId()%>"><b>Delete</b></button>
     				</div>
     				</li>
            <%}%>
        </div>

			</ul>

      <div class="text-center">
        <button ng-click="myFunc()" class="btn btn-primary btn-md"> Show more/less </button>
      </div>
		</div>

			<%}}%>



		<br>
		<br>
		<hr>
		<%
		List<Communication> com2 = cd.showAnsweredRequests(local.getId());%>
		<div  class="row">
			<div class="col-lg-6">
				<h4 class="section-heading text-uppercase">You have accepted these requests.</h4 >
			</div>
		</div>
		<%if(com2.isEmpty()) {	%>
			<div class="alert alert-secondary col-lg-12 text-center">
				<strong>"You haven't got answered requests."</strong>
			 </div>

		<%}else {%>

		<div ng-controller="AppController">
			<ul class="list-unstyled">

				<li>

			<div class="jumbotron" style="padding-top: 1rem;padding-bottom: 1rem;">


				<img src="img/<%=com2.get(0).getTraveller().getPhoto()%>.jpg" style="width:200px; height:200px;" id="photo" class="img-thumbnail">
				 <label style="padding-left: 20px;"><h4><%=com2.get(0).getTraveller().getName()%><small>  <%=com2.get(0).getDate()%></small></h4><label>
				 <p><small> " <%=com2.get(0).getMessage()%>"</small><p>
				 <small><%=com2.get(0).getTraveller().getEmail()%></small>
				 <a class="btn btn-link" href="profil.jsp?id=<%=com2.get(0).getTraveller().getId()%>" role="button">View traveller's profil!</a>
				</div>
				</li>

        <%if(com2.size()>=2) {%>

          <div ng-show="showMe">
            <%for(int i=1;i<com2.size();i++) {%>
            <li>
              <div class="jumbotron" style="padding-top: 1rem;padding-bottom: 1rem;">
                <img src="img/<%=com2.get(i).getTraveller().getPhoto()%>.jpg" style="width:200px; height:200px;" id="photo" class="img-thumbnail">
                <label style="padding-left: 20px;"><h4><%=com2.get(i).getTraveller().getName()%><small>  <%=com2.get(i).getDate()%></small></h4><label>
                <p><small> " <%=com2.get(i).getMessage()%>"</small><p>
                <small><%=com2.get(i).getTraveller().getEmail()%></small>
                <a class="btn btn-link" href="profil.jsp?id=<%=com2.get(i).getTraveller().getId()%>" role="button">View traveller's profil!</a>
            </div>
            </li>



		      <%}%>
		</ul>
    <div class="text-center">
      <button ng-click="myFunc()" class="btn btn-primary btn-md"> Show more/less </button>
    </div>

			</div>
		<%}%>

		<br>
		<br>
		<hr>

		<%}}List<Communication> com3 = cd.showResponse(trav_id);%>

		<div  class="row">
			<div class="col-lg-6">
				<h4 class="section-heading text-uppercase">A local accept your request!</h4>
				<h5 class="section-subheading text-muted">Send him an email for further information.</h5>
			</div>
		</div>
		<%if(com3.size()==0) {	%>
			<div class="alert alert-secondary col-lg-12 text-center">
				<strong> "You haven't got any responses."</strong>
			 </div>

		<%}else {%>

		<div ng-controller="AppController">
			<ul class="list-unstyled">

				<li>

			<div class="jumbotron" style="padding-top: 1rem;padding-bottom: 1rem;">

				<img src="img/<%=com3.get(0).getLocalBuddy().getPhoto()%>.jpg" style="width:200px; height:200px;" id="photo" class="img-thumbnail">
				 <label style="padding-left: 20px; padding-top:20px; "><p><%=com3.get(0).getLocalBuddy().getName()%> has accepted your request! Contact him.</p>
				 <a class="fa fa-envelope">  <%=com3.get(0).getLocalBuddy().getEmail()%><a>
				 <a class="btn btn-link" href="profil.jsp?id=<%=com3.get(0).getLocalBuddy().getId()%>" role="button">View local buddy's profil!</a></label>
				</div>
				</li>

        <%if(com3.size()>=2) {%>

          <div ng-show="showMe">
            <%for(int i=1;i<com3.size();i++) {%>
            <li>

    			<div class="jumbotron" style="padding-top: 1rem;padding-bottom: 1rem;">

    				<img src="img/<%=com3.get(i).getLocalBuddy().getPhoto()%>.jpg" style="width:200px; height:200px;" id="photo" class="img-thumbnail">
    				 <label style="padding-left: 20px; padding-top:20px; "><p><%=com3.get(i).getLocalBuddy().getName()%> has accepted your request! Contact him.</p>
    				 <a class="fa fa-envelope">  <%=com3.get(i).getLocalBuddy().getEmail()%><a>
    				 <a class="btn btn-link" href="profil.jsp?id=<%=com3.get(i).getLocalBuddy().getId()%>" role="button">View local buddy's profil!</a></label>
    				</div>
    				</li>
            <%}%>
          </div>


		</ul>

    <div class="text-center">
      <button ng-click="myFunc()" class="btn btn-primary btn-md"> Show more/less </button>
    </div>

			</div>
			<%}}%>

		</div>
  </div>


		</section>

	<!-- /container -->








	<%if(!(local==null)) {
			List<Communication> com = cd.showNewRequests(local.getId());
			if(!(com.isEmpty())){
			for(int i=0;i<com.size();i++) {%>

		<!-- Message-->
	<div class="modal fade" id="accept<%=com.get(i).getId()%>" role="dialog">
    <div class="modal-dialog">

      <!-- Modal content-->
      <div class="modal-content">
		<div class="modal-heading" style="background-color: #14141F;">
			<button type="button" class="close" data-dismiss="modal">&times;</button>
			<div class="form-signin-heading text-center">
			<br>
					<span class="fa-stack fa-3x">
						<i class="fa fa-circle fa-stack-2x text-primary"></i>
						<i class="fa fa-check fa-stack-1x fa-inverse"></i>
					</span>
					<h4 style="color:white;">Accept</h4>
					<small style="color:white;">If you accept traveller's request, he will be able to see your email and contact you.</small>
				</div>

			<br>
		</div>
        <div class="modal-body container-fluid">

			<form method="post" action="message_controller.jsp" class="form-horizontal">

				<input type="hidden" name="answer" class="form-control" value="accept">
				<input type="hidden" name="id" class="form-control" value="<%=com.get(i).getId()%>">
				<hr>
				<div class="text-center">
					<button class="btn btn-primary btn-sm" data-dismiss="modal">Cancel</button>
					<button class="btn btn-primary btn-sm"  style="background-color:#FF0055; border-color:red;" type="submit" >Accept</button>
				</div>

			</form>
    </div>
  </div>
  </div>
  </div>

  <!-- Delete-->
	<div class="modal fade" id="delete<%=com.get(i).getId()%>" role="dialog">
    <div class="modal-dialog">

      <!-- Modal content-->
      <div class="modal-content">
		<div class="modal-heading" style="background-color: #14141F;">
			<button type="button" class="close" data-dismiss="modal">&times;</button>
			<div class="form-signin-heading text-center">
			<br>
					<span class="fa-stack fa-3x">
						<i class="fa fa-circle fa-stack-2x text-primary"></i>
						<i class="fa fa-trash fa-stack-1x fa-inverse"></i>
					</span>
					<h4 style="color:white;">Delete</h4>
					<small style="color:white;">"Are you sure that you want to delete traveller's request?"</small>
				</div>

			<br>
		</div>
        <div class="modal-body container-fluid">

			<form method="post" action="message_controller.jsp" class="form-horizontal">

				<input type="hidden" name="answer" class="form-control" value="delete">
				<input type="hidden" name="id" class="form-control" value="<%=com.get(i).getId()%>">
				<hr>
				<div class="text-center">
					<button class="btn btn-primary btn-sm" data-dismiss="modal">Cancel</button>
					<button class="btn btn-primary btn-sm"  style="background-color:#FF0055; border-color:red;" type="submit" >Delete</button>
				</div>

			</form>
    </div>
  </div>
  </div>
  </div>
			<%}}}%>



    <!-- Bootstrap core JavaScript -->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Plugin JavaScript -->
    <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Contact form JavaScript -->
    <script src="js/jqBootstrapValidation.js"></script>


    <!-- Custom scripts for this template -->
    <script src="js/agency.min.js"></script>

    <!--angular-->
    <script>
    var app = angular.module('my-app', []);

    app.controller('AppController', function($scope) {
      $scope.showMe = false;
      $scope.myFunc = function(){
      $scope.showMe = !$scope.showMe;
    }
    });


    </script>



  </body>

</html>
