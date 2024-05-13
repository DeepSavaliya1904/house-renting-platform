<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="house_renting_platform.DbConnection" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Clear Login Data</title>
</head>
<body>
	<%
		if(session.getAttribute("admin") == null)									
		{
			response.sendRedirect("error.jsp");							
		}
	%>
	<%
		Connection con=null; 
		try{
	 		String login_id=request.getParameter("login");
	 		//create connection
			con=DbConnection.getConnection();
			PreparedStatement p1=con.prepareStatement("truncate table login_details");
			p1.execute();
			response.sendRedirect("show_Login.jsp");
		}catch(Exception e){
			out.println(e);
		}finally{
			//close connection
			con.close();
		}
	%>
</body>
</html>