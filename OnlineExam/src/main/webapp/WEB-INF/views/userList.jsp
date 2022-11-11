<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<title>User List</title>
<link href="/webjars/bootstrap/5.2.2/css/bootstrap.min.css" rel="stylesheet">
<script src="/webjars/bootstrap/5.2.2/js/bootstrap.min.js"></script>
<script src="/webjars/jquery/3.6.0/jquery.min.js"></script>
<script>
	function messageBox(message){
		$("#msg").text(message);
		 $("#msg").fadeIn("slow", function() {
			    setTimeout(function() {
			      $("#msg").fadeOut("slow");
			    }, 3000);
			  });
	}
	function createUser(){
		window.location.href = '/user/create';
	}
	function deleteCheck() {
		var selectedAddUserIds = document.getElementsByName('selectedUserId');
		var checked = false;
		selectedAddUserIds.forEach((user) => {
            if (user.checked) {
            	checked = true;            	
            }
        });
		if(checked){
			if(window.confirm("Are you sure to delete?")){
				document.getElementById('userForm').submit();				
			}
		}else{
			alert("Please check to DELETE !");
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
	<c:if test="${not empty message }">
		<br/>	
		<div class="alert alert-info" role="alert" id="msg">
			<script>messageBox('${message}');</script>
		</div>		
	</c:if>
	<c:remove var="message" scope="session" />

	<h1>User Management</h1><br/>
	<input type="button" class="btn btn-primary" value="Add New User" onclick="createUser();"/><br/><br/>
	
	<form:form class="row g-3 col-6" action="/user/search" method="POST" modelAttribute="user">
			<form:hidden path="id" />
			<table>
				<tr>
					<td><form:input class="form-control" path="username" id="username"
							placeholder="Search by user name..." /></td>
					<td><form:input class="form-control" path="email" id="email"
							placeholder="Search by email address..." /></td>
					<td><input type="submit" value="Search" class="btn btn-primary"></td>
				</tr>
			</table>
  </form:form><br/>
	
	<div class="form-control">
	<c:if test="${empty userList }">
		<h3>No Records</h3>
	</c:if>
	<c:if test="${not empty userList }">
	<h3>User List</h3>
	<form:form action="/user/delete" method="POST" id="userForm">
		<table class="table table-bordered">
			<tr>		
				<th>No</th>
				<th>Username</th>
				<th>Email</th>
				<th>Phone</th>	
				<th>About User</th>
				<th align="center"><input type="button" class="btn btn-danger" value="Delete" onclick="deleteCheck()"/></th>
			</tr>
			<c:forEach var="user" items="${userList }" varStatus="status">
			<tr>
				<td>${status.index+1 }</td>
				<td>${user.username }</td>
				<td>${user.email }</td>
				<td>${user.phone }</td>
				<td><a href="/user/detail/${user.id }">Detail...</a></td>
				<td><input type="checkbox" class="form-check-input" name="selectedUserId" value="${user.id }"></td>
			</tr>
			</c:forEach>
		</table>
	</form:form>
	</c:if>
	</div>
</div>
</body>
</html>