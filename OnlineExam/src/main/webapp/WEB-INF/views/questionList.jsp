<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<link href="/webjars/bootstrap/5.2.2/css/bootstrap.min.css" rel="stylesheet">
<script src="/webjars/bootstrap/5.2.2/js/bootstrap.min.js"></script>
<script src="/webjars/jquery/3.6.0/jquery.min.js"></script>
<!-- <script src="/js/custom.js"></script>
<link href="/css/custom.css" rel="stylesheet"> -->
<meta charset="ISO-8859-1">
<title>${exam.examName } Exam</title>

<script>
var hour = ${hour};  // set the hours
var min = ${min};   // set the minutes
var sec = ${sec};   // set the seconds

function countDown() {
	if(hour == 0 && min == 0 && sec == 0){
		alert("Time out ! Your answer will be submit automatically .");
		document.getElementById("examForm").submit();
	}else{
		document.getElementById("theTime").innerHTML =  "<b>Time left :</b>   ( "+
															(hour <= 9 ? "0" + hour : hour) + "h : "+ 
															(min <= 9 ? "0" + min : min) + "m : " + 
															(sec <= 9 ? "0" + sec : sec) + "s )";
					
		if (--sec < 0) {
			if(min >= 1){
				sec = 59;
		  	    min = min - 1;
			}	  	    
	    }
	  	if (min == 0) {
	  		if(hour >= 1){
		  	    min = 59;
		  	    hour = hour - 1;
	  		}
	    }
		window.setTimeout("countDown();", 1000);	  	
	}
}
</script>	
</head>
<body>
<!-- navigation -->
<nav class="navbar navbar-dark bg-dark">
	<div class="container-fluid">
		 <h1 class="navbar-brand" >Online Examination System</h1>		 
           <div class="navbar-nav">
		          <span class="nav-link active" style="padding-right: 100px;">User  :  ${loginUser.username}</span>
		    </div>
	 </div>	 
</nav>
<div class="container">
<h1>${exam.examName } Exam</h1><br/>
<div class="form-control"  style="padding: 20px 0px 20px 30px;">
	<div class="row">
		<div class="col-8">	
			Please answer the following question.		
		</div>
		<div class="col-4">	
			<p id="theTime"/>		
		</div>
	</div>
	<form:form action="/examQuestion/submitAnswer" method="POST" id = "examForm">
	<input type="hidden" name="examId" value="${exam.id}">
	<ol>
		<c:forEach var="question" items="${questions}">
			<li>
				<input type="hidden" name="questionId" value="${question.id }">
				${question.question_description }<br/>
				
					<c:forEach var="answer" items="${question.answers }">
						<c:if test="${!empty answer.answer_description}">
							<input type="radio" class="form-check-input" name="answerForQuestionId_${question.id }" value="${answer.answer_description}"> ${answer.answer_description}
							<br/>
						</c:if> 
					</c:forEach>
				<br/>
			</li>
		</c:forEach>
	</ol>
	<input type="submit" value="Summit Answer" class="btn btn-primary" onclick="return confirm('Are you sure to summit?');">
	</form:form>
	<script>countDown();</script>
</div>
</div>
</body>
</html>