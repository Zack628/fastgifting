<%@ page import="java.io.*,java.util.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ page errorPage="error_fastgifting.jsp"%>
<%@ page import="java_fastgifting.*"%>

<%
session.invalidate();
%>

<!DOCTYPE html>
<html lang="en">
	<head>
       <%@ include file="header_fastgifting.jsp"%>
	
	<meta name="description" content="Lab exercise template 2019-2020">
	<meta name="author" content="ismgroup76">
	<link rel="icon" href="<%=request.getContextPath() %>/images/favicon.ico">

	<title>logout page</title>
    </head>
	
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
				<!--/.nav-collapse -->
			</div>
		</nav>
        <!-- /container -->
		<div class="container">
		    
			<div style="text-align: center;" class="alert alert-success" role="success">
                <b>Η έξοδος ολοκληρώθηκε  με επιτυχία.</b> 
            </div>

            <br>
            <br>
		<!-- /container -->
		<!-- footer -->
		<%@ include file="footer_fastgifting.jsp"%>
	</body>
</html>