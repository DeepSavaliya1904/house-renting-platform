<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
	//destroy the session
	session.removeAttribute("tenant");
	response.sendRedirect("tenant_login.jsp");
%>