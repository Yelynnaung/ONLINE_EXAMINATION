<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<link href="/webjars/bootstrap/5.2.2/css/bootstrap.min.css" rel="stylesheet">
<link href="/webjars/bootstrap/3.3.7/css/bootstrap.css" rel="stylesheet" >
<script src="/webjars/bootstrap/5.2.2/js/bootstrap.min.js"></script> 
<!-- <script src="/webjars/jquery/3.6.0/jquery.min.js" type="text/javascript"></script> -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src=https://code.jquery.com/jquery-1.12.4.js></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<title>Examination List</title>
<script>
	function messageBox(message){
		$("#msg").text(message);
		 $("#msg").fadeIn("slow", function() {
			    setTimeout(function() {
			      $("#msg").fadeOut("slow");
			    }, 3000);
			  });
	}
	$(function() {
	  $("#examDate").datepicker();
	});
	function viewResult(examId,examDate,hour,min){
		var d = new Date(examDate);
		window.location.href = "/examResult/viewResult/"+examId+"/"+d+"/"+hour+"/"+min;
	}
	function createExam(){
		window.location.href = "/exam/create";
	}
	function examResult(){
		window.location.href = "/examResult/";
	}
	function checkDate(id,examDate,hours,mins,durationTime){

		var currentDate = new Date(); 
		currentDate.setHours(0,0,0,0);
		
		var date = new Date();
		var currentHours = date.getHours();
		var currentMins = date.getMinutes();
		
		var examDate=new Date(examDate);
		
		if(currentDate < examDate){
			document.getElementById(id).innerHTML = "Active";
			document.getElementById("result_"+id).style.visibility = 'hidden';
		}else if(currentDate > examDate){
			document.getElementById(id).innerHTML = "Finished";
			document.getElementById("result_"+id).style.visibility = 'visible';
		}else{
			var start = (hours*60)+mins;  //11:50 => 710
			var end =   start + durationTime; //12:10 => 730
			var current = (currentHours*60)+currentMins; // 11:49 => 709
			if(current < end){
				document.getElementById(id).innerHTML = "Active";	
				document.getElementById("result_"+id).style.visibility = 'hidden';
			}else{
				document.getElementById(id).innerHTML = "Finished";
				document.getElementById("result_"+id).style.visibility = 'visible';
			}			
		}
		window.setTimeout("checkDate("+id+",'"+examDate+"',"+hours+","+mins+","+durationTime+");", 1000);
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

	<h1>Exam Management</h1><br/>
	<input type="button" value="Add New Exam" onclick="createExam();" class="btn btn-primary">
	<input type="button" value="View Exam Results" onclick="examResult();" class="btn btn-outline-secondary">
	<br/><br/>
		
	<form:form class="row g-3 col-6" action="/exam/search" method="POST" modelAttribute="exam">
			<form:hidden path="id" />
			<table>
				<tr>
					<td><form:input path="examName" id="examName" placeholder="Search by exam name..." class="form-control"/></td>
					<td><form:input path="examDate" id="examDate" placeholder="Search by exam date..." class="form-control"/></td>
					<td><input type="submit" value="Search" class="btn btn-primary"></td>
				</tr>
			</table>
	</form:form><br/>
	
	<div class="form-control">
	<c:if test="${empty examList }">
		<h3>No Records</h3>
	</c:if>
	<c:if test="${not empty examList }">
	<h3>Exam List</h3>		
		<form:form>
			<table class="table table-bordered">
				<tr>
					<th>Id</th>
					<th>Examination Name</th>
					<th>Examination DateTime</th>
					<th>Duration Time</th>
					<th>Pass Mark</th>
					<th>Total Examination</th>
					<th>Manage Examinee</th>
					<th>Total Question</th>
					<th>Manage Questions</th>
					<th>Status</th>
					<th>Result</th>
					<th>Action</th>
				</tr>
				<c:forEach var="exam" items="${examList }" varStatus="status">
					<tr>
						<td>${status.index+1 }</td>
						<td>${exam.examName }</td>
						<td>${exam.examDate } &nbsp;&nbsp;   ${exam.examHour }H : ${exam.examMinute }M </td>
						<td>${exam.durationTime } Mins</td>
						<td>${exam.passMark } Marks</td>
						<td align="center">${exam.users.size() }</td>
						<td align="center"><a href="/exam/addUsersForExam/${exam.id }">Add or Remove</a></td>
						<td align="center">${exam.questions.size() }</td>						
						<td align="center"><a href="/examQuestion/${exam.id }">Add or Remove</a></td>						
			            <td><span id="${exam.id }"></span></td>
			            <td><input class="btn btn-outline-secondary" type="button" id="result_${exam.id }" value="View Result" onclick="viewResult(${exam.id},'${exam.examDate}',${exam.examHour },${exam.examMinute })"/></td>
			            <td><a href="/exam/edit/${exam.id }" class="btn btn-primary">Edit</a> 
						| <a href="/exam/delete/${exam.id }" onclick="return confirm('Are you sure to delete?');" class="btn btn-danger">Delete</a> 
						</td>						
						<script>
						var res = checkDate('${exam.id}','${exam.examDate}',${exam.examHour},${exam.examMinute},${exam.durationTime});
						</script>
					</tr>
				</c:forEach>
			</table>
		</form:form>
	</c:if>
	</div>
</div>
</body>
</html>