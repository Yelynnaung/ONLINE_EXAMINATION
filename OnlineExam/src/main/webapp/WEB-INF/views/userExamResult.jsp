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
<title>Exam Result</title>
</head>
<body>
<!-- navigation -->
<nav class="navbar navbar-dark bg-dark">
	<div class="container-fluid">
		 <h1 class="navbar-brand" >Online Examination System</h1>		 
           <div class="navbar-nav" >
		          <span class="nav-link active" style="padding-right: 100px;">User : ${loginUser.username}</span>
		    </div>
	 </div>	 
</nav>
<div class="container">
<h1>Exam Result</h1><br/>	
<div>
	<a href="/user/" class="btn btn-secondary">Back</a>
</div><br/>
	<div class="form-control">
		<c:if test="${examResult.size() == 0 }">
			You have no exam result yet !
		</c:if>
		
		<c:if test="${examResult.size() > 0 }">
			You have finished <b>${examResult.size()}</b> exam.<br/><br />
			<table class="table table-bordered">
				<tr>
					<th>ID</th>
					<th>Exam Name</th>
					<th>Exam DateTime</th>
					<th>Duration Time</th>
					<th>Pass Mark</th>
					<th>Your Mark</th>
					<th>Status</th>
				</tr>
				<c:forEach var="examResult" items="${examResult }" varStatus="status">
					<tr>
						<td>${status.index+1 }</td>
						<td>${examResult.examName }</td>
						<td>${examResult.examDate }&nbsp;&nbsp; ${examResult.examHour }H : ${examResult.examMin }M </td>
						<td>${examResult.durationTime } M</td>
						<td>${examResult.passMark }</td>
						<td>${examResult.marks }</td>
						<td>${examResult.passStatus }</td>
					</tr>
				</c:forEach>
			</table>
		</c:if>
	</div>
</div>
</body>
</html>