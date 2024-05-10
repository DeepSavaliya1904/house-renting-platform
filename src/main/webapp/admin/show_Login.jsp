<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%! int id = 0; %>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="UTF-8"/>
		<title>Show Login Report</title>
		<link rel="stylesheet" href="style.css"/>
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
	</head>
	<body>
	        <%
					if(session.getAttribute("admin") == null)									
					{
						response.sendRedirect("error.jsp");							
					}
			%>
		<div class="sidebar">
			<div class="logo"></div>
			<ul class="menu">
				<li>
					<a href="admin_dashboard.jsp">
						<i class="fas fa-tachometer-alt"></i>
						<span>Dashboard</span>
					</a>
				</li>
				<li>
					<a href="manage_tenant.jsp">
						<i class="fas fa-user"></i>
						<span>Manage Tenant</span>
					</a>
				</li>
				<li>
					<a href="manageRequest.jsp">
						<i class="fas fa-chart-bar"></i>
						<span>Manage Request</span>
					</a>
				</li>
				<li>
					<a href="manage_owner.jsp">
						<i class="fas fa-briefcase"></i>
						<span>Manage Owner</span>
					</a>
				</li>
				<li class="active">
					<a href="show_Login.jsp">
						<i class='bx bxs-report' style="font-size:20px;"></i>
						<span>Show Login Report</span>
					</a>
				</li>
				<li class="logout">
					<a href="admin_logout.jsp">
						<i class="fas fa-sign-out-alt"></i>
						<span>Logout</span>
					</a>
				</li>
			</ul>
		</div>

		<div class="main--content">
			<div class="header--wrapper">
				<div class="header--title">
					<span>Login</span>
					<h2>Reports</h2>
				</div>
				<div class="user--info">
					<div class="search--box">
					<i class="fa-solid fa-search"></i>
					<input type="text" placeholder="Search"/>
				</div>
				<img src="image.png" alt="">
				</div>
			</div>
		<form action="clearLoginData.jsp" method="POST">
			<%String login_id1=request.getParameter("id");%>		
			<input type="hidden" name="login" value="<%= login_id1 %>">
			<input type="submit" value="Clear All" class="btn btn-success" style="height:45px; width:130px; margin-left:162vh; margin-top:19px;"> 
		</form>
        <table class="table" style="margin-top:10px;">
            <thead class="table-dark">
              <tr>
              	<th>Login ID</th>
                <th>Username</th>
                <th>Password</th>
                <th>Login As</th>
                <th>Date</th>
                <th>Time</th>
                <th>More</th>
              </tr>
            </thead>
            <tbody>
				<%
					try{
						Class.forName("com.mysql.jdbc.Driver");
						Connection con=DriverManager.getConnection("jdbc:mysql://localhost/house_renting","root","");
						PreparedStatement p=con.prepareStatement("select *from login_details");
						ResultSet r=p.executeQuery();
						while(r.next()){
					%>
				<tr>
					<td><%out.println(r.getString("login_id")); %></td>		
					<td><%out.println(r.getString("username")); %></td>		
					<td><%out.println(r.getString("password")); %></td>
					<td><%out.println(r.getString("login_as")); %></td>
					<td><%out.println(r.getString("date")); %></td>
					<td><%out.println(r.getString("time")); %></td>				
					<td style="display:flex;">
	                    <form action="showProfile.jsp" method="POST">
	                        <input type="hidden" name="id" value="<%= r.getString(1) %>">
	                        <button type="submit" class="btn btn-primary" style="margin-right:-70px;">View Activity</button>
	                    </form>
	                </td>		
				</tr>
				<%		
						}
						}catch(Exception e){
							out.println(e);
						}
					%>              
            </tbody>
          </table>
		</div>

	</body>
</html>