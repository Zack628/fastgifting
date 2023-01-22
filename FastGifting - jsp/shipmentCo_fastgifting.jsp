<%@ page import="java.io.*,java.util.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ page errorPage="error_fastgifting.jsp"%>
<%@ page import="java_fastgifting.*"%>

<%

if (request.getAttribute("courierfastgifting") == null) {

    throw new Exception("You are not authorized to access this resource, please visit <a href='loginCo_fastgifting.jsp'>sign in form</a>");
} 

Courier courier =(Courier)session.getAttribute("courierfastgifting");

ShipmentDAO shipmentdao = new ShipmentDAO();

List<Shipment> shipments = shipmentdao.showCourierHistory(courier.getUsername());

	ClientDAO clientdao = new ClientDAO();

Client client = new Client();

%>

<!DOCTYPE html>
<html lang="en">
	<head>
		<%@ include file="header_fastgifting.jsp"%>
	
	<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
	<meta name="description" content="Lab exercise template 2019-2020">
	<meta name="author" content="ismgroup76">
	<link rel="icon" href="<%=request.getContextPath() %>/images/favicon.ico">

	<title>ShipmentCo page</title>

	
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
						
		</div>
		
		<!-- /container -->
		<div class="container">
		    
			
                <h1>Αποστολές</h1>
            

            <div class="table-responsive">

                <table class="table table-bordered table-condensed table-hover">
                    <tr class="info">
                        <th>A/A</th>
                        <th>Ημερομηνία</th>
                        <th>Από</th>
                        <th>Προς</th>
                        <th>Όνομα</th>
                        <th>Επώνυμο</th>
                        <th>Status</th>
                    </tr>

					<%
					int i = 0;
					for (Shipment shipment: shipments) {
			
						i++;
						client = clientdao.findClient(shipment.getUsernameclient());
					
			        %>	

                    <tr>
                        <td><%= i %></td>
                        <td><%=shipment.getShipDate()  %></td>
                        <td><%=shipment.getFrom()  %></td>
                        <td><%=shipment.getTo()  %></td>
                        <td><%=courier.getName()  %></td>
                        <td>%=courier.getSurname()  %></td>
                        <td><a href="shipmentDelivered_fastgifting.jsp?shipid = <%=shipment.getShipId()%>"></a><%=shipment.getStatusofcompletion()  %></td>
                    </tr>	
                </table>
            </div>
		</div>

			

		<!-- /container -->
		

		<!-- footer -->
		<%@ include file="footer_fastgifting.jsp"%>
	</body>
</html>