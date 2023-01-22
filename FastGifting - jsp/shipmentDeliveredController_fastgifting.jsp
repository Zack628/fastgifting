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
shipmentdao.completeShip(shipid);

%>

<!DOCTYPE html>
<html lang="en">
	<head>
	
		<%@ include file="header_fastgifting.jsp"%>
	<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
	<meta name="description" content="Lab exercise template 2019-2020">
	<meta name="author" content="ismgroup76">
	<link rel="icon" href="<%=request.getContextPath() %>/images/favicon.ico">

	<title>ShipmentDeliveredController page</title>

	
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
		    
			<div style="text-align: center;" class="alert alert-success" role="success">
                <b>Η αποστολή ολοκληρώθηκε με επιτυχία.</b> 
            </div>

            <div class="text-center">
				<a href="shipmentCo_fastgifting.jsp">
					<button type="button" class="btn btn-primary"><span class="glyphicon glyphicon-chevron-left"></span> Πίσω στις αποστολές</button>
				</a>										
			</div>
		</div>

			

		<!-- /container -->
		

		<!-- footer -->
		<%@ include file="footer_fastgifting.jsp"%>
	</body>
</html>