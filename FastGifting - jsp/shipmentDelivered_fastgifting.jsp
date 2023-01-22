<%@ page import="java.io.*,java.util.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ page errorPage="error_fastgifting.jsp"%>
<%@ page import="java_fastgifting.*"%>

<%
String shipid = request.getParameter("shipid");

if (shipid == null)  {

    throw new Exception("You are not authorized to access this resource, please visit <a href='loginCo_fastgifting.jsp'>sign in form</a>");
}

ShipmentDAO shipmentdao = new ShipmentDAO();
Shipment shipment = shipmentdao.findShip(shipid);

ClientDAO clientdao = new ClientDAO();
Client client = clientdao.findClient(shipment.getUsernameclient());

%>


<!DOCTYPE html>
<html lang="en">
	<head>
	
		<%@ include file="header_fastgifting.jsp"%>
	<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
	<meta name="description" content="Lab exercise template 2019-2020">
	<meta name="author" content="ismgroup76">
	<link rel="icon" href="<%=request.getContextPath() %>/images/favicon.ico">

	<title>ShipmentDelivered page</title>

	
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
			<div class="page-header">
				<h1>Στοιχεία Αποστολής</h1>
			</div>				
		</div>
		
		<!-- /container -->
		<div class="container">
		    
			<ul class="list-unstyled">
				<li><b>Από:</b> <%=shipment.getFrom()  %> </li>
				<li><b>Προς:</b> <%=shipment.getTo()  %></li>
				<li><b>Ταχυδρομικός Κώδικας:</b> <%=shipment.getPostalcode()  %> </li>
				<li><b>Περιοχή:</b> <%=client.getCity() %> </li>
				<li><b>Πελάτης:</b> <%=client.getName() %> <%=client.getSurname() %> </li>
				<li><b>Ημερομηνία:</b> <%=shipment.getShipDate()  %> </li>
				<li><b>Βάρος:</b> <%=shipment.getWeight()  %> kg </li>
                <li><b>Όγκος:</b> <%=shipment.getVolume() %>  m3</li>
                <li><b>Status:</b> <%=shipment.getStatusofcompletion()  %> </li>
			</ul>

            <h1>Έχετε ολοκληρώσει αυτή την αποστολή;</h1>
			
			<div>
                <a href="shipmentDeliveredController_fastgifting.jsp?shipid = <%=shipment.getShipId()%>">
                    <button type="button" class="btn btn-success"><span class="glyphicon glyphicon-ok" ></span> Επιβεβαίωση</button>
                  </a>
                  <a href="shipmentCo_fastgifting.jsp">
                    <button type="button" class="btn btn-danger"><span class="glyphicon glyphicon-remove" ></span> Ακύρωση</button>
                  </a>										
			</div>
		</div>

			

		<!-- /container -->
		

		<!-- footer -->
		<%@ include file="footer_fastgifting.jsp"%>
	</body>
</html>