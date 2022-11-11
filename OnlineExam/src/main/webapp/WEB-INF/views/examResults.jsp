<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<title>Exam Results</title>
<link href="/webjars/bootstrap/5.2.2/css/bootstrap.min.css" rel="stylesheet">
<link href="/webjars/bootstrap/3.3.7/css/bootstrap.css" rel="stylesheet" >
<script src="/webjars/bootstrap/5.2.2/js/bootstrap.min.js"></script> 
<!-- <script src="/webjars/jquery/3.6.0/jquery.min.js" type="text/javascript"></script> -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src=https://code.jquery.com/jquery-1.12.4.js></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
	function back(){
		window.location.href = "/exam/examList";
	}
	$(function() {
	  $("#examDate").datepicker();
	});
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

<div class="container"><h1>All Exam Results</h1>
<br/>
<div>
  <input type="button" value="Back" onclick="back();" class="btn btn-secondary">
</div><br/>
	<form:form class="row g-3 col-6" action="/examResult/search" method="POST" modelAttribute="exam">
			<form:hidden path="id" />
			<table>
				<tr>
					<td><form:input path="examName" id="examName" placeholder="Search by exam name..."  class="form-control"/></td>
					<td><form:input path="examDate" id="examDate" placeholder="Search by exam date..." class="form-control"/></td>
					<td><input type="submit" value="Search" class= "btn btn-primary"></td>
				</tr>
			</table>
		</form:form><br/>

<div class="form-control">	
	<c:if test="${empty examResultList }">
		<br/><h3>No Records</h3>
	</c:if>
	
	<c:if test="${not empty examResultList }">	
		<h3>Results</h3>
		<form:form>
			<table class="table table-bordered">
				<tr>
					<th>Id</th>
					<th>Examination Name</th>
					<th>Examination DateTime</th>
					<th>Pass Mark</th>
					<th>Result Mark</th>
					<th>Student Name</th>
					<th>Pass Status</th>
				</tr>
				<c:forEach var="examResult" items="${examResultList }" varStatus="status">
					<tr>
						<td>${status.index+1 }</td>
						<td align="center">${examResult.examName }</td>
						<td align="center">${examResult.examDate } &nbsp;&nbsp;   ${examResult.examHour }H : ${examResult.examMin }M </td>
						<td align="center">${examResult.passMark } </td>
						<td align="center">${examResult.marks } </td>
						<td align="center">${examResult.userName }</td>
						<td align="center">${examResult.passStatus }</td>
					</tr>
				</c:forEach>
			</table>
		</form:form>
	</c:if>
</div>
</div>
</body>
</html>