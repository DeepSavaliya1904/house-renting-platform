<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
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
					try{
						String login_id=request.getParameter("login");
						Class.forName("com.mysql.jdbc.Driver");
						Connection con1=DriverManager.getConnection("jdbc:mysql://localhost/house_renting","root","");
						PreparedStatement p1=con1.prepareStatement("select *from login_details where login_id=?");
						p1.setString(1,login_id);
						ResultSet r1=p1.executeQuery();
						while(r1.next()){
							Class.forName("com.mysql.jdbc.Driver");
							Connection con3=DriverManager.getConnection("jdbc:mysql://localhost/house_renting","root","");
							PreparedStatement p3=con3.prepareStatement("delete from track_activity where Username=?");
							p3.setString(1,r1.getString("username"));
							p3.executeUpdate();
						}
						response.sendRedirect("showProfile.jsp");
					}catch(Exception e){
						out.println(e);
					}
				%>
</body>
</html>