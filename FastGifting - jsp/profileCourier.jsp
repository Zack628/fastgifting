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

String usernamecourier = request.getParameter("usernamecourier");

CourierDAO dao = new CourierDAO();

Courier courier =(Courier)dao.findCourier(usernamecourier);

%>

<!DOCTYPE html>
<html lang="en">
	<head>
		<%@ include file="header_fastgifting.jsp"%>
	
	<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
	<meta name="description" content="Lab exercise template 2019-2020">
	<meta name="author" content="ismgroup76">
	<link rel="icon" href="<%=request.getContextPath() %>/images/favicon.ico">

	<title>ProfileCourier page</title>

	
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
				<h1>Προφίλ: <code><%=courier.getName()%> <%=courier.getSurname()%></code></h1>
			</div>
            
            <div class="row">

                <div class="col-xs-12">

					<div class="table-responsive">

						<ul>
                            <li><b>Όνομα:</b> <%=courier.getName()%>
                            </li>
                            <li><b>Επώνυμο:</b> <%=courier.getSurname()%>
                            </li>
                            <li><b>Email:</b> <%=courier.getEmail()%>
                            </li>
                            <li><b>Τηλέφωνο:</b> <%=courier.getPhone()%>
                            </li>
                            <li><b>Περιοχή:</b> <%=courier.getCity()%>
                            </li>    
                        </ul>	
					</div>
                </div>
            </div>

            <br>

            <div>
            <a href="showReviews_fastgifting.jsp?linkfrom = from & linkto = to & linkpostalcode = postalcode & linkdate = date & linkstrweight = strweight & linkstrvolume = strvolume & linkshipid = shipid & usernamecourier = <%=courier.getUsername()%>">
					<button type="button" class="btn btn-info"><span class="glyphicon glyphicon-thumbs-up"></span> Κριτικές</button>
            </a>
            </div>

            <br>
			<br>
            
            <div class="text-center">
														
		

        
				<a href="shipmentCheck_fastgifting.jsp?linkfrom = from & linkto = to & linkpostalcode = postalcode & linkdate = date & linkstrweight = strweight & linkstrvolume = strvolume & linkshipid = shipid & usernamecourier = <%=courier.getUsername()%>">
					<button type="button" class="btn btn-success"><span class="glyphicon glyphicon-ok"></span> Επιλογή</button>
				</a>										
		

            
				<a href="list_fastgifting.jsp?linkfrom = from & linkto = to & linkpostalcode = postalcode & linkdate = date & linkstrweight = strweight & linkstrvolume = strvolume & linkshipid = shipid">
					<button type="button" class="btn btn-primary"><span class="glyphicon glyphicon-chevron-left"></span> Πίσω στη λίστα</button>
				</a>										
			</div>
           

        
		</div>
		<!-- /container -->
		

		<!-- footer -->
		<%@ include file="footer_fastgifting.jsp"%>
	</body>
</html>