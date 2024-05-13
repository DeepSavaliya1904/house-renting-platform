<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="house_renting_platform.DbConnection" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Accept Request</title>
</head>
<body>
	<%
		//check admin already login or not
		if(session.getAttribute("admin") == null)									
		{
			response.sendRedirect("error.jsp");							
		}
	%>
	<%
		String id=request.getParameter("id");
		Connection con=DbConnection.getConnection();
		PreparedStatement p=con.prepareStatement("update house_details set request=? where house_id=?");
		p.setString(1,"accept");
		p.setString(2,id);
		p.execute();
		con.close();
		response.sendRedirect("manageRequest.jsp");
	%>
</body>
</html>