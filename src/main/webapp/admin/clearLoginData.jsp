<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Clear Login Data</title>
</head>
<body>
				<%
					try{
	 					String login_id=request.getParameter("login");
						Class.forName("com.mysql.jdbc.Driver");
						Connection con1=DriverManager.getConnection("jdbc:mysql://localhost/house_renting","root","");
						PreparedStatement p1=con1.prepareStatement("truncate table login_details");
						p1.execute();
						response.sendRedirect("show_Login.jsp");
					}catch(Exception e){
						out.println(e);
					}
				%>
</body>
</html>