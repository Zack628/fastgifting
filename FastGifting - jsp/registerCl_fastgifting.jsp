<%@ page import="java.io.*,java.util.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ page errorPage="error_fastgifting.jsp"%>
<%@ page import="java_fastgifting.*"%>

<!DOCTYPE html>
<html lang="en">
	<head>
		<%@ include file="header_fastgifting.jsp"%>
	
	<meta name="description" content="Lab exercise template 2019-2020">
	<meta name="author" content="ismgroup76">
	<link rel="icon" href="<%=request.getContextPath() %>/images/favicon.ico">

	<title>registerCl page</title>

	
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
				<h1>Συμπληρώστε τα στοιχεία σας</h1>
			</div>
			
		</div>
		<!-- /container -->
		<form action="registerClController_fastgifting.jsp" method="POST" class="form-horizontal">
            <div class="form-group">
                <label for="name" class="col-sm-2 control-label">Όνομα: </label>
                <div class="col-sm-6">
                  <input type="text" name="name" class="form-control" placeholder="Πληκτρολογείστε το όνομα σας">
                </div>
              </div>	

              <div class="form-group">
                <label for="surname" class="col-sm-2 control-label">Επώνυμο: </label>
                <div class="col-sm-6">
                  <input type="text" name="surname" class="form-control"  placeholder="Πληκτρολογείστε το επώνυμο σας">
                </div>
              </div>

              <div class="form-group">
                <label for="mail" class="col-sm-2 control-label">email: </label>
                <div class="col-sm-6">
                  <input type="email" name="mail" class="form-control" placeholder="Πληκτρολογείστε το mail σας">
                </div>
              </div>	

              <div class="form-group">
                <label for="username" class="col-sm-2 control-label">Username: </label>
                <div class="col-sm-6">
                  <input type="text" name="username" class="form-control" placeholder="Πληκτρολογείστε το username">
                </div>
              </div>	

              <div class="form-group">
                <label for="city" class="col-sm-2 control-label">Περιοχή: </label>
                <div class="col-sm-6">
                  <input type="text" name="city" class="form-control" placeholder="Πληκτρολογείστε την περιοχή κατοικίας σας">
                </div>
              </div>
              
              <div class="form-group">
                <label for="address" class="col-sm-2 control-label">Διεύθυνση: </label>
                <div class="col-sm-6">
                  <input type="text" name="address" class="form-control" placeholder="Πληκτρολογείστε την διεύθυνσή σας">
                </div>
              </div>
              
              <div class="form-group">
                <label for="postalcode" class="col-sm-2 control-label">Ταχυδρομικός Κώδικας: </label>
                <div class="col-sm-6">
                  <input type="text" name="postalcode" class="form-control" placeholder="Πληκτρολογείστε τον ταχυδρομικό σας κώδικα">
                </div>
              </div>

              <div class="form-group">
                <label for="phone" class="col-sm-2 control-label">Τηλέφωνο: </label>
                <div class="col-sm-6">
                  <input type="tel" name="phone" class="form-control" placeholder="Πληκτρολογείστε το τηλέφωνό σας">
                </div>
              </div>

              <div class="form-group">
                <label for="password" class="col-sm-2 control-label">Κωδικός: </label>
                <div class="col-sm-6">
                  <input type="password" name="password" class="form-control" placeholder="Πληκτρολογείστε τον κωδικό">
                </div>
              </div>

              <div class="form-group">
                <label for="confirm" class="col-sm-2 control-label">Επιβεβαίωση Κωδικού: </label>
                <div class="col-sm-6">
                  <input type="password" name="confirm" class="form-control" placeholder="Επιβεβαιώστε τον κωδικό σας">
                </div>
              </div>

              <div class="form-group">
				<div class="col-sm-offset-2 col-sm-9 ">
				  <div class="checkbox">
				<input type="checkbox" name="selected"> <span style="color:rgb(0, 140, 255);"><b>Συμφωνώ με τους όρους και προϋποθέσεις</b></span>
				   </div>
			 </div>
		    </div>

              
                <div class="form-group">
                  <div class="col-sm-offset-2 col-sm-6">
                    
                      <button type="submit" class="btn btn-success"><span class="glyphicon glyphicon-ok" ></span> Επιβεβαίωση</button>
                    
                      <button type="button" class="btn btn-danger"><span class="glyphicon glyphicon-remove" ></span> Ακύρωση</button>
                    
                  </div>
                </div>

                <div class="form-group"></div> 
                <div class="form-group"></div>
                <div class="form-group"></div>
              

                
			
		</form>

		<!-- footer -->
		<%@ include file="footer_fastgifting.jsp"%>
</html>