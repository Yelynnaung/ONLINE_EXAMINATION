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
<title>Examination</title>
<script type="text/javascript">
	function gotoExam(id) {
		window.location.href = "/examQuestion/questionList/"+id;
	} 
	function checkDate(id, examDate, hours, mins, durationTime) {
		var currentDate = new Date();
		currentDate.setHours(0, 0, 0, 0);

		var date = new Date();
		var currentHours = date.getHours();
		var currentMins = date.getMinutes();

		var examDate = new Date(examDate);

		if (currentDate < examDate) {
			document.getElementById(id).value = "Wait";
			document.getElementById(id).disabled = true;
		} else if (currentDate > examDate) {
			document.getElementById(id).value = "Expired";
			document.getElementById(id).disabled = true;
		} else {
				var start = (hours*60)+mins;  //11:50 => 710
				var end =   start + durationTime; //12:10 => 730
				var current = (currentHours*60)+currentMins; // 11:49 => 709
				if(current < start){
					document.getElementById(id).value = "Wait";
					document.getElementById(id).disabled = true;
				}else if(current >= end){
					document.getElementById(id).value = "Expired";
					document.getElementById(id).disabled = true;
				}else{
					document.getElementById(id).value = "Answer Now";
					document.getElementById(id).disabled = false;
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
		       <span class="nav-link active" style="padding-right: 100px;">User : ${loginUser.username}</span>
		    </div>
	 </div>	 
</nav>
<div class="container">
<h1>Exam List</h1><br/>
<div>
	<a href="/user/" class="btn btn-secondary">Back</a>
</div><br/>
<div class="form-control">
		<c:if test="${loginUser.exams.size() == 0 }">
			You have no exam yet !
		</c:if>
		<c:if test="${examList.size() > 0 }">
			You have <b>${examList.size()}</b> exam.<br /><br />
			<table class="table table-bordered">
				<tr>
					<th>ID</th>
					<th>Examination Name</th>
					<th>Examination DateTime</th>
					<th>Duration
						Time</th>
					<th>Action</th>
				</tr>
				<c:forEach var="exam" items="${examList }" varStatus="status">
					<tr>
						<td>${status.index+1 }</td>
						<td>${exam.examName }</td>
						<td>${exam.examDate }&nbsp;&nbsp;${exam.examHour }H: ${exam.examMinute }M</td>
						<td>${exam.durationTime }Mins</td>
						<td><input type="button" value="" id="${exam.id}"
							onclick="gotoExam(${exam.id});"  class="btn btn-primary"/></td>
						<script>
							var res = checkDate('${exam.id}',
									'${exam.examDate}', ${exam.examHour},
									${exam.examMinute},
									${exam.durationTime});
						</script>
					</tr>
				</c:forEach>
			</table>
		</c:if>
	</div>
</div>
</body>
</html>