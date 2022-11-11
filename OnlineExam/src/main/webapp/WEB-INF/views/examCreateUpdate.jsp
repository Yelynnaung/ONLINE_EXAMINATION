<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<c:if test="${exam.id == 0 }">
	<title>Create New Examination</title>
</c:if>
<c:if test="${exam.id > 0 }">
	<title>Edit Examination</title>
</c:if>
<link href="/webjars/bootstrap/5.2.2/css/bootstrap.min.css" rel="stylesheet">
<link href="/webjars/bootstrap/3.3.7/css/bootstrap.css" rel="stylesheet" >
<script src="/webjars/bootstrap/5.2.2/js/bootstrap.min.js"></script> 
<!-- <script src="/webjars/jquery/3.6.0/jquery.min.js" type="text/javascript"></script> -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src=https://code.jquery.com/jquery-1.12.4.js></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
	 $(function() {
		$(".datepicker").datepicker();
	}); 
	
	function goExamList(){
		window.location.href = '/exam/examList';
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
		<c:if test="${exam.id == 0 }">
			<br/><h1>Create New Examination</h1>
		</c:if>
		<c:if test="${exam.id > 0 }">
			<br/><h1>Update Examination</h1>
		</c:if>
		
		<div class="form-control" style="padding: 20px 0px 20px 30px;">
			<form:form id="examForm" action="/exam/save" method="POST" modelAttribute="exam" enctype="multipart/form-data">
				<form:hidden path="id" id="id"/>
				<div class="input-group mb-3">
				    <div class="col-2 form-label">Examination Name</div>
				    <div class="col-4 ">
				    	<form:input class="form-control" path="examName" required="required" />
				    </div>
				    <div class="col-6 ">
				    	<form:errors path="examName" style="color:red;"/>
				    </div>
				 </div>
				 <div class="input-group mb-3">
				    <div class="col-2 form-label">Examination Date</div>
				    <div class="col-4 ">
				    	<form:input class="form-control datepicker" path="examDate" required="required" />
				    </div>
				    <div class="col-6 ">
				    	<form:errors path="examDate" style="color:red;"/>
				    </div>
				 </div>
				  <div class="input-group mb-3">
				    <div class="col-2 form-label">Start Hour</div>
				    <div class="col-4 ">
				    	<form:input class="form-control" path="examHour" required="required" />
				    </div>
				    <div class="col-6 ">
				    	<form:errors path="examHour" style="color:red;"/>
				    </div>
				 </div>
				  <div class="input-group mb-3">
				    <div class="col-2 form-label">Start Minute</div>
				    <div class="col-4 ">
				    	<form:input class="form-control" path="examMinute"  required="required" />
				    </div>
				    <div class="col-6 ">
				    	<form:errors path="examMinute" style="color:red;"/>
				    </div>
				 </div>
				 <div class="input-group mb-3">
				    <div class="col-2 form-label">Duration Time</div>
				    <div class="col-4 ">
				    	<form:input class="form-control" path="durationTime"  required="required" />
				    </div>
				    <div class="col-6 ">
				    	<form:errors path="durationTime" style="color:red;"/>
				    </div>
				 </div>
				  <div class="input-group mb-3">
				    <div class="col-2 form-label">Pass Mark</div>
				    <div class="col-4 ">
				    	<form:input class="form-control" path="passMark"  required="required" />
				    </div>
				    <div class="col-6 ">
				    	<form:errors path="passMark" style="color:red;"/>
				    </div>
				 </div>
				 <div class="input-group mb-3">
				    <div class="col-2 form-label"></div>
				    <div class="col-2 ">
				    	<input type="button" value="Cancel" onclick="goExamList();" class="btn btn-secondary"/>
				    	<input type="submit" value="Save" class="btn btn-primary"/>
				  </div>
				 </div>
			 </form:form>		
	</div>
</div>
</body>
</html>