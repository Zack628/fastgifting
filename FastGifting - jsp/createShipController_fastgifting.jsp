<%@ page import="java.io.*,java.util.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ page errorPage="error_fastgifting.jsp"%>
<%@ page import="java_fastgifting.*"%>

<%
String from = request.getParameter("from");
String to = request.getParameter("to");
String postalcode = request.getParameter("postalcode");
String date = request.getParameter("date");
String strweight = request.getParameter("weight");
String strvolume = request.getParameter("volume");
String shipid = request.getParameter("shipid");

if ( from == null && to == null && postalcode == null && date == null && weight == null && volume == null && shipid == null) {
	throw new Exception("No parameters specified, please visit <a href="createShipment_fastgifting.jsp"> shipment registration form </a>)
} 

    int statusofcompletion = 0;

	// convert to UTF-8 to support Greek characters
	if (from != null) {
		from = new String(from.getBytes("ISO-8859-1"), "UTF-8");
	}
	
	if (to != null) {
		to = new String(to.getBytes("ISO-8859-1"), "UTF-8");
	}

    int CountErrors = 0;

	boolean empty = false;
	boolean w = false;
	boolean v = false;

	if ( from == null || to == null || postalcode == null || date == null || weight == null || volume == null || shipid == null) {
		empty = true;
		CountErrors++;
	} 



	try {
		Float weight = parseFloat(strweight);
	} catch (Exception e) {
		CountErrors++;
		w = true;
	}
    
	try {
	    Float volume = parseFloat(strvolume);
	} catch (Exception e) {
		CountErrors++;
		v = true;
	}

	ShipmentDAO dao = new ShipmentDAO();
	boolean exists = false;

	if (dao.findShip(shipid) != null) {
		CountErrors++;
		exists = true;

	}



	if (from != null && from.length() < 6 ) {
		CountErrors++;
	}
	if (to != null && to.length() < 6) {
		CountErrors++;
	}
	if (postalcode != null && postalcode.length() != 5) {
		CountErrors++;
	}
	
	
	




<!DOCTYPE html>
<html lang="en">
	<head>
		<%@ include file="header_fastgifting.jsp"%>
	
	<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
	<meta name="description" content="Lab exercise template 2019-2020">
	<meta name="author" content="ismgroup76">
	<link rel="icon" href="<%=request.getContextPath() %>/images/favicon.ico">

	<title>CreateShipController page</title>

	
	</head>
	
	<body>

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

				<h1>Η αποστολή παρουσίασε σφάλματα:</h1>

			<div class="alert alert-danger" role="alert">
				<ol>
                    <%
                    if (from.length() < 6 ) {
                    %>

					<li>Η διεύθυνση αναχώρησης πρέπει να έχει τουλάχιστον 6 χαρακτήρες.</li>

                    <%
					}
					%>

                    <%
                    if (to.length() < 6) {
                    %>

					<li>Η διεύθυνση αποστολής πρέπει να έχει τουλάχιστον 6 χαρακτήρες.</li>

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
					if (v == true) {
					%>

                    <li>Ο όγκος που δώσατε δεν είναι σε μορφή δεκαδικού αριθμού.</li>

					<%
					}
					%>


                    <%
					if (w == true) {
					%>

                    <li>Το βάρος που δώσατε δεν είναι σε μορφή δεκαδικού αριθμού.</li>

					<%
					}
					%>


					<%
                    if (empty == true) {
                    %>

					<li>Ένα ή παραπάνω πεδία έχουν μείνει κενά.</li>

					<%
					}
					%>



					<%
                    if (exists == true) {
                    %>

					<li>Το  id της παραγγελίας που δώσατε υπάρχει είδη.</li>

					<%
					}
					%>

				</ol> 
            </div>

			<br>

			<div>
				<a href="createShipment_fastgifting.jsp">
					<button type="button" class="btn btn-primary"><span class="glyphicon glyphicon-chevron-left"></span> Πίσω στη φόρμα</button>
				</a>										
			</div>


			<%

		}
	} else {
		%>


		<div class="page-header">
			<h1>Επεξεργασία Αποστολής</h1>
		</div>				
	</div>

		<!-- /container -->
		<div class="container">
		    
			<div style="text-align: center;" class="alert alert-success" role="success">
                <b>Τα στοιχεία της αποστολής είναι έγκυρα.</b> 
            </div>

            <br>
            <br>
    			
			<div class="text-center">
				<a href="list_fastgifting.jsp?linkfrom = from & linkto = to & linkpostalcode = postalcode & linkdate = date & linkstrweight = strweight & linkstrvolume = strvolume & linkshipid = shipid">
					<button type="button" class="btn btn-info"><span class="glyphicon glyphicon-search"></span> Διαθέσιμοι Διανομείς</button>
				</a>										
			</div>

		</div>


		<!-- /container -->
		

		<!-- footer -->
		<%@ include file="footer_fastgifting.jsp"%>
	</body>
</html>