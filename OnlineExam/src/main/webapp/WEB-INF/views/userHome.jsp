<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<title>Home</title>
<link href="/webjars/bootstrap/5.2.2/css/bootstrap.min.css" rel="stylesheet">
<script src="/webjars/bootstrap/5.2.2/js/bootstrap.min.js"></script>
<script src="/webjars/jquery/3.6.0/jquery.min.js"></script>
<!-- <script src="/js/custom.js"></script>
<link href="/css/custom.css" rel="stylesheet"> -->
</head>
<body>
<!-- navigation -->
<nav class="navbar navbar-dark bg-dark">
	<div class="container-fluid">
		 <h1 class="navbar-brand" >Online Examination System</h1>		 
           <div class="navbar-nav"   style="padding-right: 100px;">
		          <a class="nav-link active" href="/logout" onclick="return confirm('Are your sure to logout?')">Logout</a>
		    </div>
	 </div>	 
</nav>
<div class="container">
	<h1>Hello ${loginUser.username}</h1><br/>
	<div class="form-control">
		<h3><a href="/user/userExam">Exam List</a> | <a href="/user/examResult">Result List</a></h3><br/>
	</div>
</div>
</body>
</html>