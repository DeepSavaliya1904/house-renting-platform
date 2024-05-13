<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="house_renting_platform.DbConnection" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Clear Activity Data</title>
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
			//create connection
			String login_id=request.getParameter("login");
			con=DbConnection.getConnection();
			PreparedStatement p1=con.prepareStatement("select *from login_details where login_id=?");
			p1.setString(1,login_id);
			ResultSet r1=p1.executeQuery();
			while(r1.next()){
				PreparedStatement p3=con.prepareStatement("delete from track_activity where Username=?");
				p3.setString(1,r1.getString("username"));
				p3.executeUpdate();
			}
			response.sendRedirect("showProfile.jsp");
		}catch(Exception e){
			out.println(e);
		}finally{
			//close connection
			con.close();
		}
	%>
</body>
</html>