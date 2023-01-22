<%@ page import="java.io.*,java.util.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ page errorPage="error_fastgifting.jsp"%>
<%@ page import="java_fastgifting.*"%>

<%

if (request.getAttribute("courierfastgifting") == null) {

    throw new Exception("You are not authorized to access this resource, please visit <a href='loginCo_fastgifting.jsp'>sign in form</a>");
} 

Courier courier =(Courier)session.getAttribute("courierfastgifting");

%>

<!DOCTYPE html>
<html lang="en">
	<head>
		<%@ include file="header_fastgifting.jsp"%>
	
	<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
	<meta name="description" content="Lab exercise template 2019-2020">
	<meta name="author" content="ismgroup76">
	<link rel="icon" href="<%=request.getContextPath() %>/images/favicon.ico">

	<title>ProfileCo page</title>

	
	</head>
	
	<body>

		
		<!-- Fixed navbar -->
		<nav class="navbar navbar-inverse navbar-fixed-top bg-secondary">
			<div class="container">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
						<span class="sr-only">Toggle navigation</span>
						<span class="icon-bar"></span> <span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="#">FastGifting</a>
				</div>
				<div id="navbar" class="navbar-collapse collapse">
					<ul class="nav navbar-nav">
						<li><a href="index_fastgifting.jsp">Αρχική</a></li>					
						<li class="active"><a href="profileCo_fastgifting.jsp">Προφίλ</a></li>					
					</ul>	
					
					<ul class="nav navbar-nav navbar-right">
                        <li>
							<li><a href="logout_fastgifting.jsp"><span class="glyphicon glyphicon-log-out"></span>Αποσύνδεση</a></li>	
						</li>
											        	
			        </ul>		
		
				</div>
				<!--/.nav-collapse -->
			</div>
		</nav>

		<div class="container theme-showcase" role="main">

			<!-- Main jumbotron for a primary marketing message or call to action -->
			<div class="jumbotron" style="background-color:#eda736;" >
				<h1>FastGifting</h1>
			</div>

			<!-- Page Title -->
			<div class="page-header">
				<h1>Προφίλ: <code> <%=courier.getName() %> <%=courier.getSurname() %></code></h1>
			</div>				
		</div>
		
		<!-- /container -->
		<div class="container">
		    
			<ul class="list-unstyled">
				<li><b>Ιδιότητα:</b> Διανομέας </li>
				<li><b>Όνομα χρήστη:</b> <%=courier.getUsername() %> </li>
				<li><b>Όνομα:</b> <%=courier.getName() %> </li>
				<li><b>Επώνυμο:</b> <%=courier.getSurname() %> </li>
				<li><b>Email:</b> <%=courier.getEmail() %> </li>
				<li><b>Περιοχή:</b> <%=courier.getCity() %> </li>
				<li><b>Τηλέφωνο:</b> <%=courier.getPhone() %> </li>


				<li><b>Μέγιστος Όγκος:</b> <%=courier.getMaxvolume() %> m3</li>
                <li><b>Μέγιστο Βάρος:</b> <%=courier.getMaxweight() %> kg </li>
				<%
				if (courier.getAvailability() < 1) {
				%>
                <li><b>Διαθεσιμότητα:</b>Μη Διαθέσιμος</li>
				<%
				} else {
				%>
				<li><b>Διαθεσιμότητα:</b> Διαθέσιμος</li>
				<%
				}
				%>
			</ul>
			<div>
				<a href="ShipmentsCo_fastgifting.jsp">
				<button type="button" class="btn btn-info"><span class="glyphicon glyphicon-search" aria-hidden="true"></span> Παραγγελίες</button>
				</a>
				<a href="ShowReviews_fastgifting.jsp?usernamecourier = <%=courier.getUsername()%>">
					<button type="button" class="btn btn-info"><span class="glyphicon glyphicon-search" aria-hidden="true"></span> Οι κριτικές μου</button>
					</a>
		    </div>	
			<div class="text-center">
				<a href="editCo_fastgifting.jsp">
					<button type="button" class="btn btn-warning"><span class="glyphicon glyphicon-edit"></span> Επεξεργασία Προφίλ</button>
				</a>
													
			</div>
		</div>

			

		<!-- /container -->
		

		<!-- footer -->
		<%@ include file="footer_fastgifting.jsp"%>
	</body>
</html>