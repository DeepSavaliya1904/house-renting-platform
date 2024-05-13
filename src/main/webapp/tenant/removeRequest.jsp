<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="house_renting_platform.DbConnection" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Remove Request</title>
</head>
<body>
	<%
		if(session.getAttribute("tenant")==null){
			response.sendRedirect("error.jsp");
		}
	%>
	<%
		Connection con=null;
		String house_id=request.getParameter("house_id");
		//create jdbc connection
		con=DbConnection.getConnection();
		
		//delete data from renting_details
		PreparedStatement p=con.prepareStatement("delete from renting_details where house_id=?");
		p.setString(1,house_id);
		p.executeUpdate();
		
		//close connection
		con.close();
		
		//redirect to request.jsp
		response.sendRedirect("Request.jsp");
	%>
</body>
</html>