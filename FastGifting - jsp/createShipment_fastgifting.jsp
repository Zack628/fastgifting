<%@ page import="java.io.*,java.util.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ page errorPage="error_fastgifting.jsp"%>
<%@ page import="java_fastgifting.*"%>

<%

if (request.getAttribute("clientfastgifting") == null) {

    throw new Exception("You are not authorized to access this resource, please visit <a href='loginCl_fastgifting.jsp'>sign in form</a>");
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

	<title>Create shipment page</title>

	
	</head>
	
	<body>

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
		<form class="form-horizontal" method="post" action="createShipController_fastgifting.jsp">
            <div class="form-group">
                <label for="inputFrom" class="col-sm-2 control-label">Από: </label>
                <div class="col-sm-6">
                  <input type="text" name="from" class="form-control" id="inputFrom" placeholder="Πληκτρολογείστε την διεύθυνση αναχώρησης του δέματος">
                </div>
              </div>	

              <div class="form-group">
                <label for="inputPostalCode" class="col-sm-2 control-label">Ταχυδρομικός Κώδικας: </label>
                <div class="col-sm-6">
                  <input type="text" name="postalcode" class="form-control" id="inputPostalCode" placeholder="Πληκτρολογείστε τον ταχυδρομικό κώδικα της διεύθυνσης αποστολής">
                </div>
              </div>

              <div class="form-group">
                <label for="inputΤο" class="col-sm-2 control-label">Πρός: </label>
                <div class="col-sm-6">
                  <input type="text" name="to" class="form-control" id="inputTo" placeholder="Πληκτρολογείστε την διεύθυνση αποστολής του δέματος">
                </div>
              </div>
			  
			  <div class="form-group">
                <label for="inputShipid" class="col-sm-2 control-label">Id παραγγελίας: </label>
                <div class="col-sm-6">
                  <input type="text" name="shipid" class="form-control" id="inputShipid" placeholder="Πληκτρολογείστε μοναδικό id παραγγελίας (8 ψηφία)">
                </div>
              </div>	

              <div class="form-group">
                <label for="inputDate" class="col-sm-2 control-label">Ημερομηνία: </label>
                <div class="col-sm-6">
                  <input type="text" name="date" class="form-control" id="inputDate" placeholder="Πληκτρολογείστε την ημερομηνία αποστολής του δέματος, ημέρα/μήναςχρόνος πχ. 15/12/2022">
                </div>
              </div>	

              <div class="form-group">
                <label for="inputWeight" class="col-sm-2 control-label">Βάρος: </label>
                <div class="col-sm-6">
                  <input type="text" name="weight" class="form-control" id="inputWeight" placeholder="Πληκτρολογείστε το βάρος του δέματος">
                </div>
              </div>
              
              <div class="form-group">
                <label for="inputVolume" class="col-sm-2 control-label">Όγκος: </label>
                <div class="col-sm-6">
                  <input type="text" name="volume" class="form-control" id="inputVolume" placeholder="Πληκτρολογείστε τον όγκο του δέματος">
                </div>
              </div>	

              
                <div class="form-group">
                  <div class="col-sm-offset-2 col-sm-6">
                    
                      <button type="button" class="btn btn-success"><span class="glyphicon glyphicon-ok" ></span> Δημιουργία</button>
                    
                      <button type="button" class="btn btn-danger"><span class="glyphicon glyphicon-remove" ></span> Ακύρωση</button>
                    
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

