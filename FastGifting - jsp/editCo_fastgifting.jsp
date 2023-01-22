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

	<title>EditCo page</title>

	
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
		<form class="form-horizontal" method="post" action="editCoController_fastgifting.jsp">
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
				<label for="phone" class="col-sm-2 col-sm-offset-1 control-label">Τηλέφωνο</label>
				<div class="col-sm-4">
			    <input type="tel" class="form-control" name="phone" placeholder="Νέο τηλέφωνο">
				</div>
			</div>

            <div class="form-group"></div>
            <div class="form-group"></div>

            <div class="form-group">
                <label for="maxVolume" class="col-sm-2 col-sm-offset-1 control-label">Μέγιστος Όγκος: </label>
                <div class="col-sm-4">
                  <input type="text" name="maxVolume" class="form-control" placeholder="Νέος μέγιστος όγκος">
                </div>
              </div>

              <div class="form-group">
                <label for="maxWeight" class="col-sm-2 col-sm-offset-1 control-label">Μέγιστο Βάρος: </label>
                <div class="col-sm-4">
                  <input type="text" name="maxWeight" class="form-control" placeholder="Νέο μέγιστο βάρος">
                </div>
              </div>

              <div class="form-group">
                <label for="availability" class="col-sm-2 col-sm-offset-1 control-label">Διαθεσιμότητα: </label>
                <div class="col-sm-4">
                  <input type="text" name="availability" class="form-control" placeholder="Αλλαγή διαθεσιμότητας">
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
		
	</body>
</html>