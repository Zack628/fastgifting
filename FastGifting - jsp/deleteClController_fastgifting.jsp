<%@ page import="java.io.*,java.util.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ page errorPage="error_fastgifting.jsp"%>
<%@ page import="java_fastgifting.*"%>

<%

if (request.getAttribute("clientfastgifting") == null) {

    throw new Exception("You are not authorized to access this resource, please visit <a href='loginCl_fastgifting.jsp'>sign in form</a>");
} 

Client client =(Client)session.getAttribute("clientfastgifting");

ClientDAO() dao = new ClientDAO();

dao.deleteprofile(client.getUsername());

%>

<!DOCTYPE html>
<html lang="en">
	<head>
		<%@ include file="header_fastgifting.jsp"%>
	
	<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
	<meta name="description" content="Lab exercise template 2019-2020">
	<meta name="author" content="ismgroup76">
	<link rel="icon" href="<%=request.getContextPath() %>/images/favicon.ico">

	<title>DeleteClController page</title>

	
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
				<h1>Ολοκλήρωση Διαγραφής</h1>
			</div>				
		</div>
		
		<!-- /container -->
		<div class="container">
		    
			<div style="text-align: center;" class="alert alert-success" role="success">
                <b>Η διαγραφή ολοκληρώθηκε επιτυχώς</b> 
            </div>

            <br>
            <br>
            <br>
            <br>
            
				
			<div class="text-center">
				<a href="index_fastgifting.jsp">
					<button type="button" class="btn btn-primary"><span class="glyphicon glyphicon-home"></span> Επιστροφή στην αρχική</button>
				</a>										
			</div>
		</div>

			

		<!-- /container -->
		

		<!-- footer -->
		<%@ include file="footer_fastgifting.jsp"%>
	</body>
</html>