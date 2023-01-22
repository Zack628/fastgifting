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

	<title>index page</title>

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
				<h1>Καλωσήρθατε</h1>
			</div>

            <div class="container">
				<div class="col-sm-10">
					<blockquote>
						<h4>Θέλεις να πραγματοποιήσεις εύκολα μία αποστολή;</h4>
						<h4>Είσαι διανομέας και θες να βρεις εύκολο τρόπο να σε προσεγγίζουν οι πελάτες σου;</h4>
						<h4>Χρησιμοποίησε τώρα την εφαρμογή FastGifting μέσω της οποίας μπορείς εύκολα να πραγματοποιείς αποστολές ή να βρίσκεις συνεχώς νέους πελάτες.</h4>
					</blockquote>
			    </div>

				<img class="media-object" src="images/Capture - Courier1.PNG">
			</div>
		</div>
		<!-- /container -->
		

		<!-- footer -->
		<%@ include file="footer_fastgifting.jsp"%>
	</body>
</html>