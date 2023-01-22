<%@ page import="java.io.*,java.util.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ page errorPage="error_fastgifting.jsp"%>
<%@ page import="java_fastgifting.*"%>

<%

if (request.getAttribute("clientfastgifting") == null) {

    throw new Exception("You are not authorized to access this resource, please visit <a href='loginCl_fastgifting.jsp'>sign in form</a>");
} 

Client client = (Client)request.getAttribute("clientfastgifting");

String usernamecourier = request.getAttribute("usernamecourier");

String date = request.getParsmeters("date");
String speed = request.getParameters("speed");
String friendliness = request.getParameters("friendliness");
String professionalism = request.getParameters("professionalism");
String comment = request.getParameters("comment");

String usernameclient = client.getUsername();

int CountErrors = 0;

if (speed != 1 && speed != 2 && speed != 3 && speed != 4 && speed != 5) {

	CountErrors++;
}
if (friendliness != 1 && friendliness != 2 && friendliness != 3 && friendliness != 4 && friendliness != 5) {

	CountErrors++;
}
if (professionalism != 1 && professionalism != 2 && professionalism != 3 && professionalism != 4 && professionalism != 5) {

	CountErrors++;
}

if (CountErrors == 0) {
    
	Review review = new Review (usernameclient, usernamecourier, date, speed, friendliness, professionalism, comment);
    ReviewDAO dao = new ReviewDAO();

    dao.register(review);
}

%>

<!DOCTYPE html>
<html lang="en">
	<head>
		<%@ include file="header_fastgifting.jsp"%>
	
	<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
	<meta name="description" content="Lab exercise template 2019-2020">
	<meta name="author" content="ismgroup76">
	<link rel="icon" href="<%=request.getContextPath() %>/images/favicon.ico">

	<title>CreateReviewController page</title>

	
	</head>
	
	<body>

		<!-- Fixed navbar -->
		<%@ include file="navigationmenu_fastgifting.jsp"%>

		<div class="container theme-showcase" role="main">

			<!-- Main jumbotron for a primary marketing message or call to action -->
			<div class="jumbotron" style="background-color:#eda736;" >
				<h1>FastGifting</h1>
			</div>

			<%

			if (CountErrors == 0) {

			%>

			<!-- Page Title -->
			<div class="page-header">
				<h1>Ολοκλήρωση Κριτικής</h1>
			</div>				
		</div>
		
		<!-- /container -->
		<div class="container">
		    
			<div style="text-align: center;" class="alert alert-success" role="success">
                <b>Η κριτική αποθηκεύτηκε επιτυχώς.</b> 
            </div>

            <br>
            <br>
    			
			<div class="text-center">
				<a href="profileCl_fastgifting.jsp">
					<button type="button" class="btn btn-primary"><span class="glyphicon glyphicon-chevron-left"></span> Πίσω στο Προφίλ</button>
				</a>										
			</div>
		</div>

			<%

		    } else {

			%>

			<div class="page-header">
				<h1>Η κριτική παρουσιάζει σφάλματα</h1>
			</div>				
		</div>
		
		<!-- /container -->
		<div class="container">

			

			<div class="alert alert-danger" role="alert">
                <ol>
                     <%
                     if (speed != 1 && speed != 2 && speed != 3 && speed != 4 && speed != 5) {
					 %>

					<li>Το πεδίο "Ταχύτητα" δεν συμπληρώθηκε με αριθμό στην κλίμακα (1-5).</li>

					<%
				     }
					%>



					<%
					if (professionalism != 1 && professionalism != 2 && professionalism != 3 && professionalism != 4 && professionalism != 5) {
					%>


					<li>Το πεδίο "Επαγγελματισμός" δεν συμπληρώθηκε με αριθμό στην κλίμακα (1-5).</li>

					<%
				     }
					%>




					<%
					if (friendliness != 1 && friendliness != 2 && friendliness != 3 && friendliness != 4 && friendliness != 5) {
					%>


					<li>Το πεδίο "Φιλικότητα" δεν συμπληρώθηκε με αριθμό στην κλίμακα (1-5).</li>

					<%
				     }
					%>


				</ol> 
            </div>

            <br>

			<div>
				<a href="createReview_fastgifting.jsp">
					<button type="button" class="btn btn-primary"><span class="glyphicon glyphicon-chevron-left"></span> Πίσω στη φόρμα</button>
				</a>										
			</div>

			<br>
			<br>
		</div>

		<%

	     }

		%>

			

		<!-- /container -->
		

		<!-- footer -->
		<%@ include file="footer_fastgifting.jsp"%>
	</body>
</html>