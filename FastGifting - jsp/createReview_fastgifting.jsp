<%@ page import="java.io.*,java.util.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ page errorPage="error_fastgifting.jsp"%>
<%@ page import="java_fastgifting.*"%>

<%

if (request.getAttribute("clientfastgifting") == null) {

    throw new Exception("You are not authorized to access this resource, please visit <a href='loginCl_fastgifting.jsp'>sign in form</a>");
} 

Client client =(Client)session.getAttribute("clientfastgifting");

String courierusername = request.getParameter("courierusername");

CourierDAO() dao = new CourierDAO();

Courier courier = dao.findUser(courierusername);

session.setAttribute("usernamecourier", usernamecourier);

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

		<!-- Fixed navbar -->
		<%@ include file="navigationmenu_fastgifting.jsp"%>

		<div class="container theme-showcase" role="main">

			<!-- Main jumbotron for a primary marketing message or call to action -->
			<div class="jumbotron" style="background-color:#eda736;" >
				<h1>FastGifting</h1>
			</div>

			<!-- Page Title -->
			<div class="page-header">
				<h1><%=courier.getName() %> <%=courier.getSurname() %></h1>
			</div>
			
		</div>
		<!-- /container -->
		<form class="form-horizontal" method="POST" action="createReviewController_fastgifting.jsp">
             <div class="form-group">
                <label for="inputDate" class="col-sm-2 control-label">Ημερομηνία: </label>
                <div class="col-sm-6">
                  <input type="text" name="date" class="form-control" id="inputDate" placeholder="Πληκτρολογείστε την ημερομηνία αποστολής του δέματος, ημέρα/μήναςχρόνος πχ. 15/12/2022">
                </div>
              </div>
            <div class="form-group">
                <label for="inputSpeed" class="col-sm-2 control-label">Ταχύτητα: </label>
                <div class="col-sm-6">
                  <input type="text" name="speed" class="form-control" id="inputSpeed" placeholder="κλίμακα (1-5)">
                </div>
              </div>	

              <div class="form-group">
                <label for="inputProfessionalism" class="col-sm-2 control-label">Επαγγελματισμός: </label>
                <div class="col-sm-6">
                  <input type="text" name="professionalism" class="form-control" id="inputProfessionalism" placeholder="κλίμακα (1-5)">
                </div>
              </div>

              <div class="form-group">
                <label for="inputFriendliness" class="col-sm-2 control-label">Φιλικότητα: </label>
                <div class="col-sm-6">
                  <input type="text" name="friendliness" class="form-control" id="inputFriendliness" placeholder="κλίμακα (1-5)">
                </div>
              </div>
              
              <div class="form-group">
                <div class="col-md-4 inputGroupContainer">
                <div class="input-group">
                <span class="input-group-addon"><i class="fa fa-pencil"></i></span>
                <textarea class="form-control" name="comment" id="review" rows="3"> (Σχόλια του πελάτη)</textarea>
               
                </div>
                </div>
            </div>

             	

              	

              
                <div class="form-group">
                  <div class="col-sm-offset-2 col-sm-6">
                    
                      <button type="button" class="btn btn-success"><span class="glyphicon glyphicon-ok" ></span> Επιβεβαίωση</button>
                    
                    
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