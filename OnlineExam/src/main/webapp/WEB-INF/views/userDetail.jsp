<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<link href="/webjars/bootstrap/5.2.2/css/bootstrap.min.css" rel="stylesheet">
<script src="/webjars/bootstrap/5.2.2/js/bootstrap.min.js"></script>
<script src="/webjars/jquery/3.6.0/jquery.min.js"></script>
<!-- <script src="/js/custom.js"></script>
<link href="/css/custom.css" rel="stylesheet"> -->
<title>User Detail</title>
<script>
	function back(){
		window.location.href = "/user/userList"
	}
	function goEdit(){
		var id= document.getElementById("id").value;
		window.location.href = "/user/edit/"+${user.id };
	}
	function goDelete(){
		var confirmValue = confirm("Are you sure to delete?");
		if(confirmValue){
			var id= document.getElementById("id").value;
			window.location.href = "/user/delete/"+${user.id };
		}
	}
</script>
</head>
<body>
<!-- navigation -->
	<nav class="navbar navbar-dark bg-dark">
		<div class="container-fluid">
			 <h1 class="navbar-brand" >Online Examination System</h1>		 
	           <div class="navbar-nav"  style="padding-right: 100px;">
			          <a class="nav-link active" href="/adminHome">Home</a>
			    </div>
		 </div>	 
	</nav>
<div class="container">
	<!-- Message -->
	<c:if test="${not empty message }">
		<div
			style="background-color: green; color: white; width: 300px; padding: 10px;">${message }</div>
	</c:if>
	<c:remove var="message" scope="session" />
	<!-- Form -->
	<h1>User Detail Information</h1><br/>
	<div>
		<input type="button" value="Back" onclick="back();" class="btn btn-secondary">
	</div><br/>
	<div class="form-control col-8" style="padding: 20px 0px 20px 30px;">	
	<input type="hidden" value="${user.id }" id="id">
	<img src="/src/images/${user.photo }" width="200" height="200"/><br/><br/>
	
		<div class="input-group mb-3">
		    <div class="col-4 form-label"><b>User Name</b></div>
		    <div class="col-4 "><i>${user.username }</i></div>
		 </div>
		<div class="input-group mb-3">
		    <div class="col-4 form-label"><b>Email</b></div>
		    <div class="col-4 "><i>${user.email }</i></div>
		 </div>
		 <div class="input-group mb-3">
		    <div class="col-4 form-label"><b>Password</b></div>
		    <div class="col-4 "><i>${user.password }</i></div>
		 </div>
		 <div class="input-group mb-3">
		    <div class="col-4 form-label"><b>Phone</b></div>
		    <div class="col-4 "><i>${user.phone }</i></div>
		 </div>
		<div class="input-group mb-3">
		    <div class="col-4 form-label"><b>Age</b></div>
		    <div class="col-4 "><i>${user.age }</i></div>
		 </div>
		  <div class="input-group mb-3">
		    <div class="col-4 form-label"><b>Gender</b></div>
		    <div class="col-4 "><i>${user.gender }</i></div>
		 </div>
		<div class="input-group mb-3">
		    <div class="col-4 form-label"><b>Role</b></div>
		    <div class="col-4 "><i>${user.role }</i></div>
		 </div>
		 <div class="input-group mb-3">
		    <div class="col-4 form-label"><b>Address</b></div>
		    <div class="col-4 "><i>${user.address }</i></div>
		 </div>
		 <div class="input-group mb-3">
		    <div class="col-4 ">
		    	<input type="button" value="Edit User" onclick="goEdit();" class="btn btn-primary">
				<input type="button" value="Delete User" onclick="return goDelete();" class="btn btn-danger">
			</div>
		    <div class="col-4 "></div>
		 </div> 		
	</div>
</div>
</body>
</html>