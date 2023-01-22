<%@ page import="java.io.*,java.util.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ page errorPage="error_fastgifting.jsp"%>
<%@ page import="java_fastgifting.*"%>

<!-- Fixed navbar -->
		<nav class="navbar navbar-inverse navbar-fixed-top">
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

						<li class="<%= (request.getRequestURI().replace(request.getContextPath() + "/","").equals("index_fastgifting.jsp") ? "active" : "") %>">
							<a href="<%=request.getContextPath() %>/index_fastgifting.jsp">Αρχική</a>
						</li>							
							
						<% if (session.getAttribute("clientfastgifting") != null) {%>
							<li class="<%= (request.getRequestURI().replace(request.getContextPath() + "/","").equals("createShipment_fastgifting.jsp") ? "active" : "") %>">
								<a href="<%=request.getContextPath() %>/createShipment_fastgifting.jsp">Δημιουργία Αποστολής</a>
							</li>

							<li class="<%= (request.getRequestURI().replace(request.getContextPath() + "/","").equals("profileCl_fastgifting.jsp") ? "active" : "") %>">
								<a href="<%=request.getContextPath() %>/profileCl_fastgifting.jsp">Προφίλ</a>
							</li>	
						<%}%>	
						
						<% if (session.getAttribute("courierfastgifting") != null) {%>
							
							<li class="<%= (request.getRequestURI().replace(request.getContextPath() + "/","").equals("profileCo_fastgifting.jsp") ? "active" : "") %>">
								<a href="<%=request.getContextPath() %>/profileCo_fastgifting.jsp">Προφίλ</a>
							</li>	
						<%}%>	
					</ul>

					<ul class="nav navbar-nav navbar-right">
					<% if (session.getAttribute("clientfastgifting") != null) {%>
							<li><p class="navbar-text">Συνδεδεμένος χρήστης: <%=(session.getAttribute("clientfastgifting")).getUsername()%></p></li>
							<li><a href="<%=request.getContextPath() %>/logout_fastgifting.jsp"><span class="glyphicon glyphicon-log-out"></span> Αποσύνδεση</a></li>	
					<%}else if((session.getAttribute("courierfastgifting") != null){%>
							<li><p class="navbar-text">Συνδεδεμένος χρήστης: <%=((Courier)session.getAttribute("courierfastgifting")).getUsername()%></p></li>
							<li><a href="<%=request.getContextPath() %>/logout_fastgifting.jsp"><span class="glyphicon glyphicon-log-out"></span> Αποσύνδεση</a></li>
					<%} else{%>
					   
					    <li class="<%= (request.getRequestURI().replace(request.getContextPath() + "/","").equals("register_fastgifting.jsp") ? "active" : "") %>">
							<a href="<%=request.getContextPath() %>/register_fastgifting.jsp">Εγγραφή</a>
						</li>							
						<li class="<%= (request.getRequestURI().replace(request.getContextPath() + "/","").equals("login_fastgifting.jsp") ? "active" : "") %>">
							<a href="<%=request.getContextPath() %>/login_fastgifting.jsp">Σύνδεση</a>
						</li>
					<%}%>
					</ul>		
		
				</div>
				<!--/.nav-collapse -->
			</div>
		</nav> 