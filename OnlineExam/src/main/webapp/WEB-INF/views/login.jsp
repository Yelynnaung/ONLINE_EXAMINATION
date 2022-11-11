<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<title>Login</title>
<link href="webjars/bootstrap/5.2.2/css/bootstrap.min.css" rel="stylesheet">
<script src="webjars/bootstrap/5.2.2/js/bootstrap.min.js"></script>
<script src="webjars/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>
<div align="center" class="container col-5" style="padding-top: 150px;">
	<div class="form-control" style="padding-top: 20px;">
		<h1>Online Examination System</h1>
		<div class="form-control" style="padding-top: 40px;">
		<form:form action="/login" method="POST" modelAttribute="user">	
			<div class="input-group mb-3">			
				<div class="col-6 form-label">User Name</div>
				<div class="col-4 ">
					<form:input class="form-control" path="username" required="required" />
				</div>
				<div class="col-2 ">
					 <form:errors path="username" style="color:red;"/>
				</div>
			</div>
			<div class="input-group mb-3">
				<div class="col-6 form-label">Password</div>
				<div class="col-4 ">
					<form:password class="form-control" path="password" required="required" />
				</div>
				<div class="col-2 ">
					 <form:errors path="password" style="color:red;"/>
				</div>
			</div>
			 <div class="input-group mb-3">
				<div class="col-6 form-label"></div>
				<div class="d-grid gap-2 col-4">
					<input type="submit" value="Log In" class="btn btn-primary"/>
				</div>
			 </div>	
			 <div class="input-group mb-3">
				<div class="col-4"></div>
				<div class="col-4">
					<c:if test="${not empty message }">
					   <span  style="color:red;">${message}</span>
					 </c:if>
				</div>
			</div>
			</form:form>
			<c:remove var="message" scope="session" />
		</div>
	</div>
</div>
</body>
</html>