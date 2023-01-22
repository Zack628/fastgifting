<%@ page import="java.io.*,java.util.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ page errorPage="error_fastgifting.jsp"%>
<%@ page import="java_fastgifting.*"%>

<%
String name = request.getParameter("name");
String surname = request.getParameter("surname");
String email = request.getParameter("mail");
String username = request.getParameter("username");
String city = request.getParameter("city");
String address = request.getParameter("address");
String postalcode = request.getParameter("postalcode");
String phone = request.getParameter("phone");
String password = request.getParameter("password");
String confirm = request.getParameter("confirm");
String checkbox = request.getParameter("selected");

if ( name == null && surname == null && email == null && username == null && city == null && address == null && postalcode == null && phone == null && password == null && confirm == null && checkbox == null) {
	throw new Exception("No parameters specified, please visit <a href='registerCl_fastgifting.jsp'> registration form </a>");
}

// convert to UTF-8 to support Greek characters
	if (name != null) {
		name = new String(name.getBytes("ISO-8859-1"), "UTF-8");
	}
	
	if (surname != null) {
		surname= new String(surname.getBytes("ISO-8859-1"), "UTF-8");
	}

	if (city != null) {
		city= new String(city.getBytes("ISO-8859-1"), "UTF-8");
	}

	if (address!= null) {
		address= new String(address.getBytes("ISO-8859-1"), "UTF-8");
	}

    int CountErrors = 0;



	int empty = 0;


	if ( name == null || surname == null || email == null || username == null || city == null || address == null || postalcode == null || phone == null || password == null || confirm == null) {
        empty = 1;
		CountErrors++;
	}

	ClientDAO dao = new ClientDAO();
	boolean exists = false;

	


String ePattern = "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@((\\[[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\])|(([a-zA-Z\\-0-9]+\\.)+[a-zA-Z]{2,}))$";
java.util.regex.Pattern p = java.util.regex.Pattern.compile(ePattern);
java.util.regex.Matcher m = p.matcher(email);

if( !m.matches() ) {				
    CountErrors++;
}



	if (name.length() < 5 ) {
		CountErrors++;
	}
	if (surname.length() < 6) {
		CountErrors++;
	}
	if (username.length() < 6) {
		CountErrors++;
	}
	if (postalcode.length() != 5) {
		CountErrors++;
	}
	if (phone.length() != 10) {
		CountErrors++;
	}
	if (password.length() < 6) {
		CountErrors++;
	}
	if (!password.equals(confirm)) {
		CountErrors++;
	}
	if (checkbox == null) {
		CountErrors++;
	}

	if (CountErrors == 0) {
  
        try {
	        Client client = new Client(name, surname, email, city, postalcode, address, username, password, phone);
	        dao.register(client);

        } catch (Exception e) {
	       request.setAttribute("message", e.getMessage());
        }
    }
%>


<!DOCTYPE html>
<html lang="en">
	<head>
		<%@ include file="header_fastgifting.jsp"%>
	
	<meta name="description" content="Lab exercise template 2019-2020">
	<meta name="author" content="ismgroup76">
	<link rel="icon" href="<%=request.getContextPath() %>/images/favicon.ico">

	<title>registerClController page</title>

	
	</head>
	
	<body>

		<!-- Fixed navbar -->
	    <%@ include file="navigationmenu_fastgifting.jsp"%>

		<div class="container theme-showcase" role="main">

			<!-- Main jumbotron for a primary marketing message or call to action -->
			<div class="jumbotron" style="background-color:#eda736;" >
				<h1>FastGifting</h1>
			</div>

			<!-- Page Title -->

		<%
		
        if (request.getAttribute("message") != null || CountErrors > 0) {

			 if(request.getAttribute("message") != null) { %>

                <div class="alert alert-danger text-center" role="alert"><%=(String)request.getAttribute("message") %></div>
            <% 

		    }  else {
				
			%>
    
				<h1>Η εγγραφή παρουσίασε σφάλματα:</h1>
		

			<div class="alert alert-danger" role="alert">
                <ol>
                    <%
                    if (name.length() < 5) {
                    %>

					<li>Το όνομα πρέπει να έχει τουλάχιστον 5 χαρακτήρες.</li>

					<%
					}
					%>

                    <%
                    if (surname.length() < 6) {
                    %>
					<li>Το επώνυμο πρέπει να έχει τουλάχιστον 6 χαρακτήρες.</li>

					<%
					}
					%>


                    <%
                    if (username.length() < 6) {
                    %>
                    <li>Το username πρέπει να έχει τουλάχιστον 6 χαρακτήρες.</li>

					<%
					}
					%>


                    <%
                    if (postalcode.length() != 5) {
                    %>
					<li>Ο ταχυδρομικός κώδικας δεν έχει τον σωστό αριθμό ψηφίων (5).</li>

					<%
					}
					%>


                    <%
                    if (phone.length() != 10) {
                    %>
					<li>Το τηλέφωνο δεν έχει τον σωστό αριθμό ψηφίων (10).</li>

					<%
					}
					%>

 
                    <%
                    if (password.length() < 6) {
                    %>
					<li>Ο κωδικός πρέπει να έχει τουλάχιστον 6 χαρακτήρες.</li>

					<%
					}
					%>



                    <%
                    if (!password.equals(confirm)) {
                    %>
                    <li>Το πεδίο "επιβεβαίωση κωδικού" δεν ταιριάζει με τον κωδικό.</li>

					<%
					}
					%>



                    <%
                    if (checkbox == null) {
                    %>
                    <li>Δεν έχετε συμφωνήσει με τους όρους χρήσης.</li>

					<%
					}
					%>


					<%
                    if( !m.matches() && email != null) {
                    %>

                    <li>Το email έχει σφάλματα.</li>

					<%
					}
					%>


					<%
                    if (empty == 1) {
                    %>

					<li>Ένα ή παραπάνω πεδία έχουν μείνει κενά.</li>

					<%
					}
					%>


					<%
                    if (exists == true) {
                    %>

					<li>Το username που δώσατε υπάρχει είδη.</li>

					<%
					}
					%>
				</ol> 
            </div>

            <br>

			<div>
				<a href="registerCl_fastgifting.jsp">
					<button type="button" class="btn btn-primary"><span class="glyphicon glyphicon-chevron-left"></span> Πίσω στη φόρμα</button>
				</a>										
			</div>
		

			<%

		    }
		} else {
			%>

			<div class="page-header">
				<h1>Ολοκλήρωση Εγγραφής:</h1>
			</div>				
		</div>
		
		<!-- /container -->
		<div class="container">
		    
			<div style="text-align: center;" class="alert alert-success" role="success">
                <b>Η εγγραφή ολοκληρώθηκε επιτυχώς.</b> 
            </div>

            <br>
            <br>
    			
			<div class="text-center">
				<a href="profileCl_fastgifting.jsp">
					<button type="button" class="btn btn-info"><span class="glyphicon glyphicon-user"></span> Προφίλ</button>
				</a>										
			</div>

			
		</div>

		<%
	    }
		%>
	</div>
		<!-- /container -->
		

		<!-- footer -->
		<%@ include file="footer_fastgifting.jsp"%>
</html>