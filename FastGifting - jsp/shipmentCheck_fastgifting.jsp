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

Courier courier =(Courier)dao.findCourier(usernamecourier);

%>

<!DOCTYPE html>
<html lang="en">
	<head>
		<%@ include file="header_fastgifting.jsp"%>
	
	<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
	<meta name="description" content="Lab exercise template 2019-2020">
	<meta name="author" content="ismgroup76">
	<link rel="icon" href="<%=request.getContextPath() %>/images/favicon.ico">

	<title>shipmentCheck page</title>

	
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
            
            <div class="row">

                <div class="col-xs-12">

					<div class="table-responsive">

						<ul>
                            <li><b>Από:</b> <%=from %>
                            </li>
                            <li><b>Προς:</b> <%=to %>
                            </li>
                            <li><b>Ημερομηνία:</b> <%=date %>
                            </li>
                            <li><b>Βάρος:</b> <%=strweight %> kg
                            </li>
                            <li><b>Όγκος:</b> <%=strvolume %> m3
                            </li>
                            <li><b>Ταχυδρομικός Κώδικας:</b> <%=postalcode %>
                            </li>
                            <li><b>Διανομέας:</b> <%=courier.getName()%> <%=courier.getSurname() %>
                            </li>      
                        </ul>	
					</div>
                </div>
            </div>

            <br>
			<br>
            
            <div class="text-center">
														
		

        
				<a href="shipmentDone_fastgifting.jsp?linkfrom = from & linkto = to & linkpostalcode = postalcode & linkdate = date & linkstrweight = strweight & linkstrvolume = strvolume & linkshipid = shipid & usernamecourier = <%=courier.getUsername()%>">
					<button type="button" class="btn btn-success"><span class="glyphicon glyphicon-ok"></span> Επιβεβαίωση</button>
				</a>										
		

            
				<a href="profileCourier.jsp?linkfrom = from & linkto = to & linkpostalcode = postalcode & linkdate = date & linkstrweight = strweight & linkstrvolume = strvolume & linkshipid = shipid & usernamecourier = <%=courier.getUsername()%>">
					<button type="button" class="btn btn-danger"><span class="glyphicon glyphicon-remove"></span> Ακύρωση</button>
				</a>										
			</div>
           

        
		</div>
		<!-- /container -->
		

		<!-- footer -->
		<%@ include file="footer_fastgifting.jsp"%>
	</body>
</html>