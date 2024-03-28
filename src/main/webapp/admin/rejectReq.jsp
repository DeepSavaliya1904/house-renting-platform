<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Reject Request</title>
</head>
<body>
	<%
		String id=request.getParameter("id");
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost/house_renting","root","");
		PreparedStatement p=con.prepareStatement("update house_details set request=? where house_id=?");
		p.setString(1,"reject");
		p.setString(2,id);
		p.execute();
		response.sendRedirect("manageRequest.jsp");
	%>
</body>
</html>