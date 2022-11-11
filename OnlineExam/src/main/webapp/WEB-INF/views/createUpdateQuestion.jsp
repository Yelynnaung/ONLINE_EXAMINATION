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
<meta charset="ISO-8859-1">
	<c:if test="${question.id == 0}">
		<title>Create Question</title>
	</c:if>
	<c:if test="${question.id > 0}">
		<title>Update Question</title>
	</c:if>
	
	<script type="text/javascript">
		function back(){
			window.location.href = "/examQuestion/"+${examId};
			
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
</nav><br/>
<div class="container">
	<c:if test="${question.id == 0}">		
		<h1>Create New Question</h1>
	</c:if>
	<c:if test="${question.id > 0}">
		<h1>Edit Question</h1>
	</c:if>

	<div class="form-control" style="padding: 20px 0px 20px 20px">	
		<form:form action="/examQuestion/save" method="POST" modelAttribute="question">
			<input type="hidden" name="examId" value="${examId}"/>
			<form:hidden path="id" />
			<div class="input-group mb-3">
				<div class="col-2 form-label">Question Description</div>
				<div class="col-4 ">
					<form:textarea class="form-control" path="question_description" required="required" />
				</div>
				<div class="col-6 ">
					 <form:errors path="question_description" style="color:red;"/>
				</div>
			</div>
			<div class="input-group mb-3">
				<div class="col-2 form-label">Answer 1</div>
				<div class="col-4 ">
					<form:input class="form-control" path="answer1" required="required" />
				</div>
				<div class="col-6 ">
					 <form:errors path="answer1" style="color:red;"/>
				</div>
			</div>
			<div class="input-group mb-3">
				<div class="col-2 form-label">Answer 2</div>
				<div class="col-4 ">
					<form:input class="form-control" path="answer2" required="required" />
				</div>
				<div class="col-6 ">
					 <form:errors path="answer2" style="color:red;"/>
				</div>
			</div>
			<div class="input-group mb-3">
				<div class="col-2 form-label">Answer 3</div>
				<div class="col-4 ">
					<form:input class="form-control" path="answer3"/>
				</div>
			</div>
			<div class="input-group mb-3">
				<div class="col-2 form-label">Answer 4</div>
				<div class="col-4 ">
					<form:input class="form-control" path="answer4"/>
				</div>
			</div>
			<div class="input-group mb-3">
				<div class="col-2 form-label">Correct Answer</div>
				<div class="col-4 ">
					<form:input class="form-control" path="correct_answer" required="required" />
				</div>
				<div class="col-6 ">
					 <form:errors path="correct_answer" style="color:red;"/>
				</div>
			</div>
			<div class="input-group mb-3">
				<div class="col-2 form-label">Pay Mark</div>
				<div class="col-4 ">
					<form:input class="form-control" path="pay_mark" required="required" />
				</div>
				<div class="col-6 ">
					 <form:errors path="pay_mark" style="color:red;"/>
				</div>
			</div>
			 <div class="input-group mb-3">
				<div class="col-2 form-label"></div>
				<div class="col-2 ">
					<input type="button" value="Cancel" onclick="back();" class="btn btn-secondary"/>
					<input type="submit" value="Save" class="btn btn-primary"/>
				</div>
			 </div>		
		</form:form>
	</div>
</div>
</body>
</html>