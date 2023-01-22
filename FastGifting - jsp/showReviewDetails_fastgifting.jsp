<%@ page import="java.io.*,java.util.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ page errorPage="error_fastgifting.jsp"%>
<%@ page import="java_fastgifting.*"%>

<%

String from = request.getParameter("linkfrom");
String to = request.getParameter("linkto");
String postalcode = request.getParameter("linkpostalcode");
String date = request.getParameter("linkdate");
String strweight = request.getParameter("linkstrweight");
String strvolume = request.getParameter("linkstrvolume");
String shipid = request.getParameter("linkshipid");

String usernamecourier = request.getParameter("usernamecourier");
String usernameclient = request.getParameter("usernameclient");

if (from == null && to == null && postalcode == null && date == null && strweight == null && strvolume == null && shipid == null && usernamecourier == null) {

	throw new Exception("You are not authorized to access this resource, please visit <a href='login_fastgifting.jsp'>sign in form</a>");
}

CourierDAO courierdao = new CourierDAO();

Courier courier = courierdao.findCourier(usernamecourier);

ReviewDAO() reviewdao = new ReviewDAO();

Review review = reviewdao.findReview(usernameclient, usernamecourier);

<!DOCTYPE html>
<html lang="en">
	<head>
		<%@ include file="header_fastgifting.jsp"%>
	
	<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
	<meta name="description" content="Lab exercise template 2019-2020">
	<meta name="author" content="ismgroup76">
	<link rel="icon" href="<%=request.getContextPath() %>/images/favicon.ico">

	<title>showReviewDetails page</title>

	
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
				<h1>Διανομέας: <code><%=courier.getName()%> <%=courier.getSurname()%></code></h1>
			</div>
            
            <div class="row">

                <div class="col-xs-12">

					<div class="table-responsive">

						<ul>
                            <li><b>Ημερομηνία:</b> <%= review.getReviewDate() %>
                            </li>
                            <li><b>Πελάτης:</b> <%=client.getName() %> <%=client.getSurname() %>
                            </li>
                        </ul>   
                        
                        <ul>
                            <li><b>Ταχύτητα:</b> <%= review.getSpeed() %> <span class="glyphicon glyphicon-thumbs-up"></span>
                            </li>
                            <li><b>Επαγγελματισμός:</b> <%= review.getProfessionalism() %> <span class="glyphicon glyphicon-thumbs-up"></span>
                            </li>
                            <li><b>Φιλικότητα:</b> <%= review.getFriendliness() %> <span class="glyphicon glyphicon-thumbs-up"></span> 
                            </li>
                        </ul>                    	
					</div>
                </div>
            </div>
            
            <br>
            <br>

            <div class="form-group">
                <div class="col-md-4 inputGroupContainer">
                <div class="input-group">
                <span class="input-group-addon"><i class="fa fa-pencil"></i></span>
                <textarea class="form-control" id="review" rows="3"><%= review.getComment() %> </textarea>
               
                </div>
                </div>
            </div>

            <div>
            <a href="showReviews_fastgifting.jsp?linkfrom = from & linkto = to & linkpostalcode = postalcode & linkdate = date & linkstrweight = strweight & linkstrvolume = strvolume & linkshipid = shipid & usernamecourier = <%=courier.getUsername()%>">
					<button type="button" class="btn btn-info"><span class="glyphicon glyphicon-chevron-left"></span>Πίσω στις κριτικές</button>
            </a>
            </div>
        
		</div>
		<!-- /container -->
		

		<!-- footer -->
		<%@ include file="footer_fastgifting.jsp"%>
	</body>
</html>