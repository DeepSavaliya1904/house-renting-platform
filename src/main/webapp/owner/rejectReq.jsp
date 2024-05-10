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
		if(session.getAttribute("owner")==null){
			response.sendRedirect("error.jsp");
		}
	%>
	<%
		String house_id=request.getParameter("house_id");
		String tenant_id=request.getParameter("tenant_id");
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost/house_renting","root","");
		PreparedStatement p=con.prepareStatement("update renting_details set request=? where tenant_id=? AND house_id=?");
		p.setString(1,"reject");
		p.setString(2,tenant_id);
		p.setString(3,house_id);
		p.executeUpdate();
		response.sendRedirect("showStatus.jsp");
	%>
</body>
</html>