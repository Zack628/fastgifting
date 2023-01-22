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

	<title>register page</title>

	
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
				<h1>Εγγραφή ως:</h1>
			</div>

            <div class="text-center">
				<a href="registerCl_fastgifting.jsp">
					<button type="button" class="btn btn-primary">Πελάτης</button>
				</a>
				<a href="registerCo_fastgifting.jsp">
					<button type="button" class="btn btn-primary">Διανομέας</button>
				</a>										
			</div>
		</div>
		<!-- /container -->
		

		<!-- footer -->
		<%@ include file="footer_fastgifting.jsp"%>
	</body>
</html>