<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<title>Exam Result</title>
<link href="/webjars/bootstrap/5.2.2/css/bootstrap.min.css" rel="stylesheet">
<script src="/webjars/bootstrap/5.2.2/js/bootstrap.min.js"></script>
<script src="/webjars/jquery/3.6.0/jquery.min.js"></script>
<!-- <script src="/js/custom.js"></script>
<link href="/css/custom.css" rel="stylesheet"> -->
<script>
function back(){
	window.location.href = "/exam/examList";
}
function exportPDF(){
	window.location.href = "/examResult/exportPDF";
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
<div class="container"><br/>
	<div>
		<input type="button" value="Back" onclick="back();" class="btn btn-secondary">
	</div>
<br/><h1>Exam Result</h1>
<div class="form-control">	
	<c:if test="${empty examResultList }">
		<h3>No Records</h3>
	</c:if>
	
	<c:if test="${not empty examResultList }"><br/>
		<b>${examResultList[0].examName } exam for </b> (${examResultList[0].examDate } : ${examResultList[0].examHour }H : ${examResultList[0].examMin }M)<br/><br/>
		<form:form>
			<table class="table table-bordered ">
				<tr>
					<th>Id</th>
					<th >Student Name</th>
					<th >Pass Mark</th>
					<th >Result Mark</th>
					<th >Pass Status</th>
				</tr>
				<c:forEach var="examResult" items="${examResultList }" varStatus="status">
					<tr>
						<td>${status.index+1 }</td>
						<td align="center">${examResult.userName }</td>
						<td align="center">${examResult.passMark } </td>
						<td align="center">${examResult.marks } </td>
						<td align="center">${examResult.passStatus }</td>
					</tr>
				</c:forEach>
			</table>
		</form:form><br/><br/>
		<input type="button" value="ExportPDF" onclick="exportPDF();" class="btn btn-primary"/>
	</c:if>
</div>
</div>
</body>
</html>