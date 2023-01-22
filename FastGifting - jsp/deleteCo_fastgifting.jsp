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

	<title>DeleteCo page</title>

	
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
				<h1>Προφίλ: <code> <%=courier.getName() %> <%=courier.getSurname() %></code></h1>
			</div>				
		</div>
		
		<!-- /container -->
		<div class="container">
           
			<div class="col-sm-10">
				<blockquote>
                    <div class ="alert alert-warning" role="alert">
					<h4>Μόλις ολοκληρωθεί η διαγραφή δεν θα υπάρχει τρόπος ανάκτησης του προφίλ σας.</h4>
					<h4>Είστε σίγουρος ότι θέλετε να προχωρήσετε με την διαγραφή;</h4>
                    </div>
				</blockquote>
            </div>
            
			<div class="text-center">
				<a href="deleteCoController_fastgifting.jsp">
					<button type="button" class="btn btn-danger"><span class="glyphicon glyphicon-trash"></span> Επιβεβαίωση Διαγραφής Προφίλ</button>
				</a>										
			</div>
		</div>

			

		<!-- /container -->
		

		<!-- footer -->
		<%@ include file="footer_fastgifting.jsp"%>
	</body>
</html>