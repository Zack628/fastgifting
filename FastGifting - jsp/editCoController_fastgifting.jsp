<%@ page import="java.io.*,java.util.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ page errorPage="error_fastgifting.jsp"%>
<%@ page import="java_fastgifting.*"%>

<%

Courier courier =(Courier)session.getAttribute("courierfastgifting");
CourierDAO dao = new CourierDAO();

String password = request.getParameters("password");
String confirm = request.getParameters("confirm");

String city = request.getParameters("city");
String phone = request.getParameters("phone");

String strmaxweight = request.getParameters("maxWeight");
String strvolume = request.getParameters("maxVolume");
String availability = request.getParameters("availability");

if (password == null && confirm == null && city == null && phone == null && strmaxweight == null && strvolume == null && availability == null) {
	throw new Exception("No parameters specified, please visit <a href="editCo_fastgifting.jsp"> edit profile form </a>)
}


int CountErrors = 0;

boolean w = false;
boolean v = false;



try {
Float maxweight = parseFloat(strmaxweight);
} catch (Exception e) {
	CountErrors++;
	w = true;
}

try {
Float maxvolume = parseFloat(strmaxvolume);
} catch (Exception e) {
	CountErrors++;
	v = true;
}




if (password != null && password.length() < 6) {
	CountErrors++;
}
if (phone != null && phone.length() != 10) {
	CountErrors++;
}
if (password != null && !password.equals(confirm)) {
    CountErrors++;
}
if (availability != null && availability != 0 && availability != 1) {
	CountErrors++;
}

if (CountErrors == 0) {

	if (password != null) {

		dao.editPassword(courier.getUsername());
	}
	if (phone != null) {

		dao.editPhone(client.getUsername());
	}
	if (strmaxvolume != null && w = false;) {

		dao.editMaxweight(courier.getUsername());
	}
	if (strmaxvolume != null && w = false;) {

		dao.editMaxweight(courier.getUsername());
	}
	if (availability != null && availability != 0 && availability != 1) {

		dao.editAvailability(courier.getUsername());
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

	<title>EditCoController page</title>

	
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
				<h1>Ολοκλήρωση Επεξεργασίας</h1>
			</div>				
		</div>
		
		<!-- /container -->
		<div class="container">
		    
			<div style="text-align: center;" class="alert alert-success" role="success">
                <b>Οι αλλαγές στο προφίλ σας ολοκληρώθηκαν επιτυχώς</b> 
            </div>

            <br>
            <br>
    			
			<div class="text-center">
				<a href="profileCo_fastgifting.jsp">
					<button type="button" class="btn btn-primary"><span class="glyphicon glyphicon-user"></span> Ανανεωμένο προφίλ</button>
				</a>										
			</div>
		</div>

		<%
		    } else {
			%>

			<div class="page-header">
				<h1>Υπήρξαν σφάλματα στα αλλαγμένα πεδία</h1>
			</div>				
		</div>

		<div class="container">


			<div class="alert alert-danger" role="alert">
                <ol>
                    <%
					if (password != null && password.length() < 6) {
					%>

					<li>Ο κωδικός πρέπει να έχει τουλάχιστον 6 χαρακτήρες.</li>

					<%
					}
					%>


					<%
					if (password != null && !password.equals(confirm)) {
					%>


					<li>Το πεδιο "επιβεβαίωση" δεν αντιστοιχεί στον νέο κωδικό.</li>


					<%
					}
					%>


					<%
					if (phone != null && phone.length() != 10) {
					%>


					<li>Το τηλέφωνο δεν έχει τον σωστό αριθμό ψηφίων (10).</li>


					<%
					}
					%>


					<%
                    if (strmaxweight != null && w == true) {
					%>


					<li>Το βάρος που δώσατε δεν είναι σε μορφή δεκαδικού αριθμού.</li>


					<%
					}
					%>


					<%
					if (strmaxvolume != null && v == true) {
					%>


                    <li>Ο όγκος που δώσατε δεν είναι σε μορφή δεκαδικού αριθμού.</li>


					<%
					}
					%>


					<%
					if (availability != null && availability != 0 && availability != 1) {
					%>


                    <li>Η διαθεσιμότητα που δώσατε δεν είναι σωστή (παίρνει τιμές 0 ή 1)</li>


					<%
                    }
					%>


				</ol> 
            </div>

            <br>

			<div>
				<a href="editCo_fastgifting.jsp">
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