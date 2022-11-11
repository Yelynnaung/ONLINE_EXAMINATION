<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<c:if test="${user.id > 0 }">
<title>Edit User</title>
</c:if>
<c:if test="${user.id == 0 }">			
<title>Create User</title>
</c:if>
<link href="/webjars/bootstrap/5.2.2/css/bootstrap.min.css" rel="stylesheet">
<script src="/webjars/bootstrap/5.2.2/js/bootstrap.min.js"></script>
<script src="/webjars/jquery/3.6.0/jquery.min.js"></script>
<!-- <script src="/js/custom.js"></script>
<link href="/css/custom.css" rel="stylesheet"> -->
<script>
	$(function() {
	  $("#datepicker").datepicker();
	});
		
	function goUserList(){
		window.location.href = '/user/userList';
	}
	function goDetail(){
		var id = document.getElementById("id").value;
		window.location.href = '/user/detail/'+id;
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
	<c:if test="${not empty message }">
		<div
			style="background-color: green; color: white; padding: 10px; width: 400px;">
			<h3>${message}</h3>
		</div>
	</c:if>
	<c:remove var="message" scope="session" />
	
	<c:if test="${user.id > 0 }">
		<br/><h1>Edit User Information</h1>
	</c:if>
	<c:if test="${user.id == 0 }">		
		<br/><h1>Create New User</h1>
	</c:if>
	
	<div class="form-control" style="padding: 20px 0px 20px 30px;">
	<form:form id="userForm" action="/user/save" method="POST" modelAttribute="user" enctype="multipart/form-data">
		<form:hidden path="id" id="id"/>
		<div class="input-group mb-3">
		    <div class="col-2 form-label">User Name</div>
		    <div class="col-4 ">
		    	<form:input class="form-control" path="username" required="required" />
		    </div>
		    <div class="col-6 ">
		    	<form:errors path="username" style="color:red;"/>
		    </div>
		 </div>
		 <div class="input-group mb-3">
		    <div class="col-2 form-label">Email</div>
		    <div class="col-4 ">
		    	<form:input class="form-control" path="email"  required="required" />
		    </div>
		    <div class="col-6 ">
		    	<form:errors path="email" style="color:red;"/>
		    </div>
		 </div>
		  <div class="input-group mb-3">
		    <div class="col-2 form-label">Phone</div>
		    <div class="col-4 ">
		    	<form:input class="form-control" path="phone"  required="required" />
		    </div>
		    <div class="col-6 ">
		    	<form:errors path="phone" style="color:red;"/>
		    </div>
		 </div>
		  <div class="input-group mb-3">
		    <div class="col-2 form-label">Password</div>
		    <div class="col-4 ">
		    	<form:password class="form-control" path="password"  required="required" />
		    </div>
		    <div class="col-6 ">
		    	<form:errors path="password" style="color:red;"/>
		    </div>
		 </div>
		  <div class="input-group mb-3">
		    <div class="col-2 form-label">Age</div>
		    <div class="col-4 ">
		    	<form:input class="form-control" path="age"  required="required" />
		    </div>
		    <div class="col-6 ">
		    	<form:errors path="age" style="color:red;"/>
		    </div>
		 </div>
		 <div class="input-group mb-3">
		    <div class="col-2 form-label">Gender</div>
		    <div class="col-4 ">
		    	<form:select class="form-select" path="gender">
						<form:option value="Male" label="Male"></form:option>
						<form:option value="Female" label="Female"></form:option>
				</form:select>
		    </div>
		 </div>
		 <div class="input-group mb-3">
		    <div class="col-2 form-label">Address</div>
		    <div class="col-4 ">
		    	<form:textarea class="form-control" path="address"  required="required" />
		    </div>
		    <div class="col-6 ">
		    	<form:errors path="address" style="color:red;"/>
		    </div>
		 </div>
		  <div class="input-group mb-3">
		    <div class="col-2 form-label">Role</div>
		    <div class="col-4 ">
		    	<form:select path="role"  class="form-select">
					   <form:options items="${roles}" />
				</form:select>
		    </div>
		 </div>
		  <div class="input-group mb-3">
		    <div class="col-2 form-label">Photo</div>
		    <div class="col-4 ">
		    	<input type="file" name="image" accept="image/png, image/jpeg" class="form-control"  required="required" />
		    </div>
		 </div>
		  <div class="input-group mb-3">
		    <div class="col-2 form-label"></div>
		    <div class="col-2 ">
		    	<c:if test="${user.id > 0 }"><input type="button" value="Cancel" onclick="goDetail();" class="btn btn-secondary"/></c:if>
		    	<c:if test="${user.id == 0 }"><input type="button" value="Cancel" onclick="goUserList();" class="btn btn-secondary"/></c:if>
		    	<input type="submit" value="Save" class="btn btn-primary"/>
		  </div>
		 </div>
	</form:form>
	</div>
</div>
</body>
</html>