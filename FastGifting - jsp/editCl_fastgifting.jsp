<%@ page import="java.io.*,java.util.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ page errorPage="error_fastgifting.jsp"%>
<%@ page import="java_fastgifting.*"%>

<%

if (request.getAttribute("clientfastgifting") == null) {

    throw new Exception("You are not authorized to access this resource, please visit <a href='loginCl_fastgifting.jsp'>sign in form</a>");
} 

Client client =(Client)session.getAttribute("clientfastgifting");

%>


<!DOCTYPE html>
<html lang="en">
	<head>
		<%@ include file="header_fastgifting.jsp"%>
	
	<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
	<meta name="description" content="Lab exercise template 2019-2020">
	<meta name="author" content="ismgroup76">
	<link rel="icon" href="<%=request.getContextPath() %>/images/favicon.ico">

	<title>EditCl page</title>

	
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
				<h1>Προφίλ: <code> <%=client.getName() %> <%=client.getSurname() %></code></h1>
			</div>
			
		</div>
		<!-- /container -->
		<form class="form-horizontal" method="post" action="editClController_fastgifting.jsp">
            <div style="text-align: center;" class="alert alert-warning" role="alert">
                <b> Παρακαλώ συμπληρώστε τα πεδία που θέλετε να αλλάξετε</b> 
             </div>

			<div class="form-group">
				<label for="password" class="col-sm-2 col-sm-offset-1 control-label">Κωδικός</label>
				<div class="col-sm-4">
			    <input type="password" class="form-control" name="password" placeholder="Νέος κωδικός">
				</div>
			</div>

			<div class="form-group">
				<label for="confirm" class="col-sm-2 col-sm-offset-1 control-label">Επιβεβαιωση</label>
				<div class="col-sm-4">
			    <input type="password" class="form-control" name="confirm" placeholder="Επιβεβαίωση νέου κωδικού">
				</div>
			</div>

            <div class="form-group"></div>
            <div class="form-group"></div>
            

			<div class="form-group">
				<label for="city" class="col-sm-2 col-sm-offset-1 control-label">Περιοχή</label>
				<div class="col-sm-4">
			    <input type="text" class="form-control" name="city" placeholder="Νέα περιοχή">
				</div>
			</div>

			<div class="form-group">
				<label for="postalcode" class="col-sm-2 col-sm-offset-1 control-label">Ταχυδρομικός Κώδικας</label>
				<div class="col-sm-4">
			    <input type="email" class="form-control" name="postalcode" placeholder="Νέος ταχυδρομικός κώδικας">
				</div>
			</div>

			<div class="form-group">
				<label for="address" class="col-sm-2 col-sm-offset-1 control-label">Διεύθυνση</label>
				<div class="col-sm-4">
			    <input type="tel" class="form-control" name="address" placeholder="Νέα διεύθυνση">
				</div>
			</div>

            <div class="form-group">
				<label for="phone" class="col-sm-2 col-sm-offset-1 control-label">Τηλέφωνο</label>
				<div class="col-sm-4">
			    <input type="tel" class="form-control" name="phone" placeholder="Νέο τηλέφωνο">
				</div>
			</div>

            


			<div class="form-group">
				<div class="col-sm-6 col-sm-offset-3">
                    
				    <button type="button" class="btn btn-success"><span class="glyphicon glyphicon-ok" aria-hidden="true"></span> Επιβεβαίωση</button>
                    

				    <button type="button" class="btn btn-danger"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span> Ακύρωση</button>
                    
				</div>
		
	    	</div>

                <div class="form-group"></div>
                <div class="form-group"></div>
                <div class="form-group"></div>
			
		</form>

		<!-- footer -->
		<%@ include file="footer_fastgifting.jsp"%>
	</body>
</html>