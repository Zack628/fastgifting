<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isErrorPage="true" %>


<!DOCTYPE html>
<html lang="en">
	<head>        
	
		<%@ include file="header_fastgifting.jsp" %>
		
		<meta name="description" content="3η Ατομική Άσκηση - error page">
		<meta name="author" content="your email">
		

		<title> error page</title>

		
	
	<body>

		<!-- Fixed navbar -->
		<nav class="navbar navbar-inverse navbar-fixed-top bg-secondary">
			<div class="container">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
						<span class="sr-only">Toggle navigation</span>
						<span class="icon-bar"></span> <span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="#">FastGifting</a>
				</div>
				<div id="navbar" class="navbar-collapse collapse">
					<ul class="nav navbar-nav">
						<li class="active"><a href="index_fastgifting.jsp">Αρχική</a></li>					
					</ul>	
						
		
				</div>
				<!--/.nav-collapse -->
			</div>
		</nav>

		<div class="container theme-showcase" role="main">

			<!-- Main jumbotron for a primary marketing message or call to action -->
			<div class="jumbotron" style="background-color:#eda736;">
				<h1>FastGifting</h1>
			</div>

			<!-- Page Title -->
			<div class="page-header">
				<h1>Σφάλμα</h1>
			</div>
            
            <div class="alert alert-danger" role="alert">
				<p>
					<b>Message: </b> <%= exception.getMessage() %>
				</p>
			</div> 
			
		</div>
		<!-- /container -->

        <!-- footer -->
		<%@ include file = "footer_fastgifting.jsp" %>
	</body>
</html>