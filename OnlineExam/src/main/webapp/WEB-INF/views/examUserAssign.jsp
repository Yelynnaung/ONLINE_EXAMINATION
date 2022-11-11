<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<title>Manage Examinee</title>
<link href="/webjars/bootstrap/5.2.2/css/bootstrap.min.css" rel="stylesheet">
<script src="/webjars/bootstrap/5.2.2/js/bootstrap.min.js"></script>
<script src="/webjars/jquery/3.6.0/jquery.min.js"></script>
<!-- <script src="/js/custom.js"></script>
<link href="/css/custom.css" rel="stylesheet"> -->
<script type="text/javascript">
	function messageBox(message){
		$("#msg").text(message);
		 $("#msg").fadeIn("slow", function() {
			    setTimeout(function() {
			      $("#msg").fadeOut("slow");
			    }, 3000);
			  });
	}
	function back(){
		window.location.href = "/exam/examList"
	}
	function add() {
		var selectedAddUserIds = document.getElementsByName('selectedAddUserIds');
		var checked = false;
		selectedAddUserIds.forEach((user) => {
            if (user.checked) {
            	checked = true;            	
            }
        });
		if(checked){
			document.getElementById('addForm').submit();
		}else{
			alert("Please check to ADD !");
		}		
	}
	
	function remove() {
		var selectedRemoveUsers = document.getElementsByName('selectedRemoveUserIds');
		var checked = false;
		selectedRemoveUsers.forEach((user) => {
			 if (user.checked) {
	            	checked = true;            	
	     	}
        });
		if(checked){
			document.getElementById('removeForm').submit();
		}else{
			alert("Please check to REMOVE !");
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
	
		<h1>
			Assign Examinees For "<u> ${exam.examName } </u>" Exam
		</h1>	
		<div>
		<input type="button" value="Back" onclick="back();" class="btn btn-secondary">
		</div><br/>
		<div class="form-control" style="padding: 20px 0px 20px 20px">
				<input type="hidden" value="${user.id }" id="id">
				<div class="input-group mb-3">
				    <div class="col-3 form-label"><b>Exam Name</b></div>
				    <div class="col-4 "><i>${exam.examName }</i></div>
				 </div>
				<div class="input-group mb-3">
				    <div class="col-3 form-label"><b>Exam Date</b></div>
				    <div class="col-4 "><i>${exam.examDate }</i></div>
				 </div>
				 <div class="input-group mb-3">
				    <div class="col-3 form-label"><b>Total Examinees</b></div>
				    <div class="col-4 "><i>${exam.users.size() }</i></div>
				 </div>
				<br>
		
				<div class="form-control">
					<h3>Already Added</h3>
					<c:if test="${empty addedUsers }">
						<i>No Records</i>
					</c:if>
					<c:if test="${not empty addedUsers }">
						<form:form id="removeForm" action="/exam/removeExaminees"
							method="POST">
							<input type="hidden" name="examId" value="${exam.id }" />
							<table class="table table-bordered">
								<tr>
									<th>No</th>
									<th>Username</th>
									<th>Email</th>
									<th>Phone</th>
									<th><input type="button" value="Remove" onclick="remove();" class="btn btn-primary"></th>
								</tr>
								<c:forEach var="user" items="${addedUsers }" varStatus="status">
									<tr>
										<td>${status.index+1 }</td>
										<td>${user.username }</td>
										<td>${user.email }</td>
										<td>${user.phone }</td>
										<td><input type="checkbox" name="selectedRemoveUserIds" value="${user.id }" class="form-check-input" ></td>
									</tr>
								</c:forEach>
							</table>
						</form:form>
					</c:if>
				</div>
				<br/>
		</div><br/>
		<div class="form-control">
			<h3>Remaining</h3>
			<c:if test="${empty userList }">
				<i>No Records</i>
			</c:if>
			<c:if test="${not empty userList }">
				<form:form id="addForm" action="/exam/addExaminees" method="POST">
					<input type="hidden" name="examId" value="${exam.id }" />
					<table class="table table-bordered">
						<tr>
							<th>No</th>
							<th>Username</th>
							<th>Email</th>
							<th>Phone</th>
							<th><input type="button" value="Add" onclick="add();" class="btn btn-primary"></th>
						</tr>
						<c:forEach var="user" items="${userList }" varStatus="status">
							<tr>
								<td>${status.index+1 }</td>
								<td>${user.username }</td>
								<td>${user.email }</td>
								<td>${user.phone }</td>
								<td><input type="checkbox" name="selectedAddUserIds" value="${user.id }" class="form-check-input" ></td>
							</tr>
						</c:forEach>
					</table>
				</form:form>
			</c:if>
		</div>
	</div>
</body>
</html>