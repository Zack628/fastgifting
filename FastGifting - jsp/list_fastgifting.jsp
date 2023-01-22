<%@ page import="java.io.*,java.util.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ page errorPage="error_fastgifting.jsp"%>
<%@ page import="java_fastgifting.*"%>

<%

if (request.getAttribute("clientfastgifting") == null) {

    throw new Exception("You are not authorized to access this resource, please visit <a href='loginCl_fastgifting.jsp'>sign in form</a>");
} 


String from = request.getParameter("linkfrom");
String to = request.getParameter("linkto");
String postalcode = request.getParameter("linkpostalcode");
String date = request.getParameter("linkdate");
String strweight = request.getParameter("linkstrweight");
String strvolume = request.getParameter("linkstrvolume");
String shipid = request.getParameter("linkshipid");

	Float weight = parseFloat(strweight);
	Float volume = parseFloat(strvolume);


CourierDAO dao = new CourierDAO();

List<Courier> couriers = dao.getCouriers();

%>

<!DOCTYPE html>
<html lang="en">
	<head>
		<%@ include file="header_fastgifting.jsp"%>
	
	<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
	<meta name="description" content="Lab exercise template 2019-2020">
	<meta name="author" content="ismgroup76">
	<link rel="icon" href="<%=request.getContextPath() %>/images/favicon.ico">

	<title>List page</title>

	
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
				<h1>Επιλογή Διανομέα</h1>
			</div>
        
            <div class="row">

                <div class="col-xs-12">
                    <h2>Διαθέσιμοι Διανομείς</h2>
                </div>
            </div>

            <div class="table-responsive">

                <table class="table table-bordered table-condensed table-hover">
                    <tr class="info">
                        <th>A/A</th>
                        <th>Επώνυμο</th>
                        <th>Όνομα</th>
                        <th>Email</th>
                    </tr>

					<%
					int i = 0;
					int j = 0;
					for (Courier courier: couriers) {
			
						i++;
	
						if (courier.getMaxweight() <= weight && courier.getMaxvolume() <= volume && courier.getAvailability ==1) {
							j++;
			        %>	

                            <tr>
                            <td><% j %></td>
                            <td><%=courier.getSurname() %></td>
                            <td><%=courier.getName() %></td>
                            <td><a href="profileCourier.jsp?linkfrom = from & linkto = to & linkpostalcode = postalcode & linkdate = date & linkstrweight = strweight & linkstrvolume = strvolume & linkshipid = shipid & usernamecourier = <%=courier.getUsername()%>"><%=courier.getEmail() %></a></td>
                    </tr>	

					<%
			           } 
			        
			     	}
		            %>			

                    	
                </table>
            </div>
		</div>
		<!-- /container -->
		

		<!-- footer -->
		<%@ include file="footer_fastgifting.jsp"%>
	</body>
</html>