<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
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
		String house_id=request.getParameter("house_id");
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost/house_renting","root","");
		PreparedStatement p=con.prepareStatement("delete from renting_details where house_id=?");
		p.setString(1,house_id);
		p.executeUpdate();
		response.sendRedirect("Request.jsp");
	%>
</body>
</html>