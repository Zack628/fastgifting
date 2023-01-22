<%@ page import="java.io.*,java.util.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ page errorPage="error_fastgifting.jsp"%>
<%@ page import="java_fastgifting.*"%>

<% 

String username = request.getParameter("username");
String password = request.getParameter("password");



if (username == null && password == null) {
    throw new Exception("No parameters specified, please visit <a href='loginCl_fastgifting.jsp'>sign in form</a>");
}

ClientDAO dao = new ClientDAO();

try {
    Client client = dao.authenticate(username, password);
    session.setAttribute("fastgifting", client);

%>

<jsp:forward page ="profileCl_fastgifting.jsp" />

<%
} catch (Exception e) {

    request.setAttribute("message", e.getMessage());
%>

<jsp:forward page ="loginCl_fastgifting.jsp" />

<%

}
%>