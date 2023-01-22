<%@ page import="java.io.*,java.util.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ page errorPage="error_fastgifting.jsp"%>
<%@ page import="java_fastgifting.*"%>

<% 

String username = request.getParameter("username");
String password = request.getParameter("password");



if (username == null && password == null) {
    throw new Exception("No parameters specified, please visit <a href='loginCo_fastgifting.jsp'>sign in form</a>");
}

CourierDAO dao = new CourierDAO();

try {
    Courier courier = dao.authenticate(username, password);
    session.setAttribute("courierfastgifting", courier);

%>

<jsp:forward page ="profileCo_fastgifting.jsp" />

<%
} catch (Exception e) {

    request.setAttribute("message", e.getMessage());
%>

<jsp:forward page ="loginCo_fastgifting.jsp" />

<%

}
%>