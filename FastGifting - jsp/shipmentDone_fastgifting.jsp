<%@ page import="java.io.*,java.util.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ page errorPage="error_fastgifting.jsp"%>
<%@ page import="java_fastgifting.*"%>

<%

if (request.getAttribute("clientfastgifting") == null) {

    throw new Exception("You are not authorized to access this resource, please visit <a href='loginCl_fastgifting.jsp'>sign in form</a>");
} 

String from = request.getParameter("linkfrom");
String to = request.getParameter("linkto");
String postalcode = request.getParameter("linkpostalcode");
String date = request.getParameter("linkdate");
String strweight = request.getParameter("linkstrweight");
String strvolume = request.getParameter("linkstrvolume");
String shipid = request.getParameter("linkshipid");

String usernamecourier = request.getParameter("usernamecourier");

Client client =(Client)session.getAttribute("clientfastgifting");


String usernameclient = client.getUsername();

int statusofcompletion = 0;

Float weight = parseFloat(strweight);
Float volume = parseFloat(strvolume);

try {
	ShipmentDAO dao = ShipmentDAO();
	Shipment shipment = new Shipment(from, postalcode, to, date, weight, volume, usernameclient, usernamecourier, statusofcompletion);
	dao.register(shipment);

} catch (Exception e) {
	request.setAttribute("message", e.getMessage());
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

	<title>ShipmentDone page</title>

	
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

			if (message == null) {
			
			%>

			<!-- Page Title -->
			<div class="page-header">
				<h1>Ολοκλήρωση Αποστολής</h1>
			</div>				
		</div>
		
		<!-- /container -->
		<div class="container">
		    
			<div style="text-align: center;" class="alert alert-success" role="success">
                <b>Η αποστολή ολοκληρώθηκε και καταγράφηκε στο σύστημα επιτυχώς.</b> 
            </div>

            <br>
            <br>
            <br>
            <br>
            
				
			<div class="text-center">
				<a href="createShipment_fastgifting.jsp">
					<button type="button" class="btn btn-primary"><span class="glyphicon glyphicon-envelope"></span> Νέα αποστολή</button>
				</a>
                <a href="profileCl_fastgifting.jsp">
					<button type="button" class="btn btn-primary"><span class="glyphicon glyphicon-user"></span> Πίσω στο προφίλ</button>
				</a>											
			</div>
		</div>

		<% } else {
		%>
		
		<!-- Page Title -->
		<div class="page-header">
			<h1>Πρόβλημα με την αποστολή</h1>
		</div>				
	</div>
	
	<!-- /container -->
	<div class="container">
		
		<div class="alert alert-danger text-center" role="alert"><%=(String)request.getAttribute("message") %></div>
		
			
		<div class="text-center">
			<a href="profileCl_fastgifting.jsp">
				<button type="button" class="btn btn-primary"><span class="glyphicon glyphicon-user"></span> Πίσω στο προφίλ</button>
			</a>											
		</div>
	</div>

	<% } 
	%>

		<!-- /container -->
		

		<!-- footer -->
		<%@ include file="footer_fastgifting.jsp"%>
	</body>
</html>

