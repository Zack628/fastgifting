<%@ page import="java.io.*,java.util.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ page errorPage="error_fastgifting.jsp"%>
<%@ page import="java_fastgifting.*"%>

<%
 

Client client =(Client)session.getAttribute("clientfastgifting");
ClientDAO dao = new ClientDAO();

String password = request.getParameters("password");
String confirm = request.getParameters("confirm");

String city = request.getParameters("city");
String postalcode = request.getParameters("postalcode");
String address = request.getParameters("address");
String phone = request.getParameters("phone");

if (password == null && confirm == null && city == null && postalcode == null && address == null && phone == null) {
	throw new Exception("No parameters specified, please visit <a href="editCl_fastgifting.jsp"> edit profile form </a>)
}

int CountErrors = 0;

if (password != null && password.length() < 6) {
	CountErrors++;
}
if (phone != null && phone.length() != 10) {
	CountErrors++;
}
if (postalcode != null && postalcode.length() != 5) {
	CountErrors++;
}
if (password != null && confirm != null && !password.equals(confirm)) {
    CountErrors++;
}

// convert to UTF-8 to support Greek characters
	if (address != null) {
		address = new String(address.getBytes("ISO-8859-1"), "UTF-8");
	}
	
	if (city != null) {
		city = new String(city.getBytes("ISO-8859-1"), "UTF-8");
	}

if (CountErrors == 0) {

	if (password != null) {

		dao.editPassword(client.getUsername());
	}
	if (city != null) {

		dao.editCity(client.getUsername());
	}
	if (postalcode != null) {

		dao.editPostalcode(client.getUsername());
	}
	if (address != null) {

		dao.editAddress(client.getUsername());
	}
	if (phone != null) {

		dao.editPhone(client.getUsername());
	}
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

	<title>EditClController page</title>

	
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
				<a href="profileCl_fastgifting.jsp">
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
		
		<!-- /container -->
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
					if (password != null && confirm != null && !password.equals(confirm)) {
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
					if (postalcode != null && postalcode.length() != 5) {
					%>


					<li>Ο ταχυδρομικός κώδικας δεν έχει τον σωστό αριθμό ψηφίων (5).</li>

					<%
				     }
					%>


				</ol> 
            </div>

            <br>

			<div>
				<a href="editCl_fastgifting.jsp">
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