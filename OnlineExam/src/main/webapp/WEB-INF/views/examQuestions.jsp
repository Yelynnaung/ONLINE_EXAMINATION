<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<title>Exam Questions</title>
<link href="/webjars/bootstrap/5.2.2/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="/webjars/bootstrap/5.2.2/js/bootstrap.min.js"></script>
<script src="/webjars/jquery/3.6.0/jquery.min.js"></script>
<script src="/webjars/jquery/3.6.0/jquery.js"></script>
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
function createQuestion(){
	window.location.href = "/examQuestion/create/"+${exam.id};
}
</script>
</head>
<body><!-- navigation -->
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
<h1>Questions for "<u>${exam.examName }</u>" exam</h1>

	<div>
		<input type="button" value="Back" onclick="back();" class="btn btn-secondary">
	</div><br/>
	
	<div class="form-control" style="padding: 20px 0px 20px 20px">
		<input type="button" value="Add New Question" onclick="createQuestion();"  class="btn btn-primary"/><br/><br/>
		<c:if test="${questions.size() == 0 }"> 
			<h3>No Question Yet</h3>
		</c:if>
		 <c:if test="${questions.size() > 0 }"> 
			 <table class="table table-bordered">
			 <tr>
			 	<th>ID</th>
			 	<th>Questions</th>
			 	<th>Answers</th>
			 	<th>Correct Answer</th>
			 	<th>Pay Mark</th>
			 	<th>Action</th>
			 </tr>
			 <c:forEach var="question" items="${questions}"  varStatus="status">
			 <tr>
			 	<td>${status.index+1 }</td>
			 	<td>${question.question_description }</td>
			 	<td >
			 		<table>
			 			<c:forEach var="answer" items="${question.answers }">
			 				<tr>
			 					<td>${answer.answer_description }</td>
			 				</tr>
			 			</c:forEach>
			 		</table>
			 	</td>
			 	<td>${question.correct_answer }</td>
			 	<td>${question.pay_mark }</td>
			 	<td><a href="/examQuestion/edit/${exam.id}/${question.id }" class="btn btn-primary">Edit</a>
			 	     <a href="/examQuestion/delete/${exam.id}/${question.id }" onclick="return confirm('Are you sure?');" class="btn btn-danger">Delete</a></td>
			 </tr>
			 </c:forEach>
			 </table>
		</c:if>	
	</div>
</div>
</body>
</html>