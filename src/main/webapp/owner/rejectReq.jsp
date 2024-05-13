<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="house_renting_platform.DbConnection" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Reject Request</title>
</head>
<body>
	<%
		//check owner already login or not
		if(session.getAttribute("owner")==null){
			response.sendRedirect("error.jsp");
		}
	%>
	<%
		Connection con=null;
		String house_id=request.getParameter("house_id");
		String tenant_id=request.getParameter("tenant_id");
		con=DbConnection.getConnection();
		PreparedStatement p=con.prepareStatement("update renting_details set request=? where tenant_id=? AND house_id=?");
		p.setString(1,"reject");
		p.setString(2,tenant_id);
		p.setString(3,house_id);
		p.executeUpdate();
		con.close();
		response.sendRedirect("showStatus.jsp");
	%>
</body>
</html>