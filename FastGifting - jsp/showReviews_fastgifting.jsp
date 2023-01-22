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

if (from == null && to == null && postalcode == null && date == null && strweight == null && strvolume == null && shipid == null && usernamecourier == null) {

		throw new Exception("You are not authorized to access this resource, please visit <a href='login_fastgifting.jsp'>sign in form</a>");
}
CourierDAO courierdao = new CourierDAO();

Courier courier = courierdao.findCourier(usernamecourier);

ReviewDAO() reviewdao = new ReviewDAO();

List<Review> reviews = reviewdao.getReviews();

%>

<!DOCTYPE html>
<html lang="en">
	<head>
	   <%@ include file="header_fastgifting.jsp"%>
	
	<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
	<meta name="description" content="Lab exercise template 2019-2020">
	<meta name="author" content="ismgroup76">
	<link rel="icon" href="<%=request.getContextPath() %>/images/favicon.ico">

	<title>showReviews page</title>

	
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
				<h1>Κριτικές Διανομέα: <code><%=courier.getName()%> <%=courier.getSurname()%></code></h1>
			</div>

            <div class="table-responsive">

                <table class="table table-bordered table-condensed table-hover">
                    <tr class="info">
                        <th>A/A</th>
                        <th>Επώνυμο</th>
                        <th>Όνομα</th>
                        <th>Ημερομηνία</th>
                        <th>Λετομέρειες</th>
                    </tr>

					<%
					int i = 0;
					int j = 0;
					for (Review review: reviews) {
			
						i++;
						if (review.getUsernamecourier() == courier.getUsername()) {

							j++;
							client = clientdao.findClient(review.getUsernameclient());
					%>
                            <tr>
                                <td><%= j %></td>
                                <td><%= client.getSurname() %></td>
                                <td><%= client.getName() %></td>
                                <td><%= review.getReviewDate() %></td>
                                <td><a href="showReviewDetails_fastgifting.jsp?linkfrom = from & linkto = to & linkpostalcode = postalcode & linkdate = date & linkstrweight = strweight & linkstrvolume = strvolume & linkshipid = shipid & usernamecourier = <%=courier.getUsername()%> & usernameclient = <%=client.getUsername()%>">[Details]</a></td>
                           </tr>
					<%  }
					}
					%>	

                    	
                </table>
            </div>
            <div>
            <a href="profileCourier.jsp?linkfrom = from & linkto = to & linkpostalcode = postalcode & linkdate = date & linkstrweight = strweight & linkstrvolume = strvolume & linkshipid = shipid & usernamecourier = <%=courier.getUsername()%>">
                <button type="button" class="btn btn-primary"><span class="glyphicon glyphicon-chevron-left"></span> Πίσω στο προφίλ</button>
            </a>											
            </div>
		</div>
		<!-- /container -->
		

		<!-- footer -->
		<%@ include file="footer_fastgifting.jsp"%>
	</body>
</html>