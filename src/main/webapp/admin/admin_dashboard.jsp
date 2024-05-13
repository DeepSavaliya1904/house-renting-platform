<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="house_renting_platform.DbConnection" %>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="UTF-8"/>
		<title>Dashboard Design</title>
		<link rel="stylesheet" href="style.css"/>
		<link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'>
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
	</head>
	<body>
		<%
			//check admin already login or not
			if(session.getAttribute("admin") == null)									
			{
				response.sendRedirect("error.jsp");							
			}
		%>
		<div class="sidebar">
			<div class="logo"></div>
			<ul class="menu">
				<li class="active">
					<a href="#">
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
				<li>
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
					<span>Admin</span>
					<h2>Dashboard</h2>
				</div>
				<div class="user--info">
					<div class="search--box">
					<i class="fa-solid fa-search"></i>
					<input type="text" placeholder="Search"/>
				</div>
				<img src="image.png" alt="">
				</div>
			</div>

			<div class="card--container">
				<h3 class="main--title">Today's data</h3>
				<div class="card--wrapper">
					<!-- Total owners -->
					<div class="payment--card light-red">
						<div class="card--header">
							<div class="amount">
								<span class="title">Total Owners
								</span>
								<span class="amount--value">
								<%
									Connection con=DbConnection.getConnection();
									PreparedStatement p=con.prepareStatement("select count(*) as ans from owner_details");
									ResultSet r=p.executeQuery();
									while(r.next()){
										out.println(r.getString("ans"));
									}
									con.close();
								%>
								</span>
							</div>
							<i class="fas fa-user icon"></i>
						</div>
					</div>
					<!-- Total Tenants -->
					<div class="payment--card light-purple">
						<div class="card--header">
							<div class="amount">
								<span class="title">Total Tenants
								</span>
								<span class="amount--value">
								<%
									Connection con1=DbConnection.getConnection();
									PreparedStatement p1=con1.prepareStatement("select count(*) as ans from tenant_details");
									ResultSet r1=p1.executeQuery();
									while(r1.next()){
										out.println(r1.getString("ans"));
									}
									con1.close();
								%>
								</span>
							</div>
							<i class="fas fa-users icon dark-green"></i>
						</div>
					</div>
					<!-- Total house request -->
					<div class="payment--card light-green">
						<div class="card--header">
							<div class="amount">
								<span class="title">Total House Request
								</span>
								<span class="amount--value">
								<%
									Connection con2=DbConnection.getConnection();
									PreparedStatement p2=con2.prepareStatement("select count(*) as ans from house_details");
									ResultSet r2=p2.executeQuery();
									while(r2.next()){
										out.println(r2.getString("ans"));
									}
									con2.close();
								%>
								</span>
							</div>
							
							<i class="fas fa-home icon dark-green"></i>
						</div>
					</div>
					<!-- Total login -->
					<div class="payment--card light-blue">
						<div class="card--header">
							<div class="amount">
								<span class="title">Total Login
								</span>
								<span class="amount--value">
								<%
									Connection con4=DbConnection.getConnection();
									PreparedStatement p4=con4.prepareStatement("select count(*) as ans from login_details");
									ResultSet r4=p4.executeQuery();
									while(r4.next()){
										out.println(r4.getString("ans"));
									}
									con4.close();
								%>
								</span>
							</div>
							<i class="fas fa-list icon dark-purple"></i>
						</div>
					</div>

				</div>
			</div>
			<!-- House Data -->
			<div class="tabular--wrapper">
				<h3 class="main--title">House data</h3>
				<div class="table-container">
					<table>
						<thead>
							<tr>
								<th>House ID</th>
								<th>Owner ID</th> 
								<th>Address</th>
								<th>Sqft</th>
								<th>Bathrooms</th>
								<th>Rent</th>
								<th>Bedrooms</th>
								<th>House Type</th>
							</tr>
						</thead>
						<tbody>
							<%
								Connection con5=null; 
								try{
									con5=DriverManager.getConnection("jdbc:mysql://localhost/house_renting","root","");
									PreparedStatement p5=con5.prepareStatement("select *from house_details");
									ResultSet r5=p5.executeQuery();
									while(r5.next()){
										if (!("accept".equals(r5.getString("request")) || "reject".equals(r5.getString("request")))) {
							%>
								<tr>
									<td>
										<%= r5.getString("house_id") %>
									</td>
									<td><%= r5.getString("owner_id") %></td>
									<td><%= r5.getString("address") %></td>
									<td><%= r5.getString("square_footage") %></td>
									<td><%= r5.getString("num_of_bathrooms") %></td>
									<td><%= r5.getString("rent_of_house") %></td>
									<td><%= r5.getString("num_of_bedrooms") %></td>
									<td><%= r5.getString("house_type") %></td>
								</tr>
							</tbody>
							<%
									        }
										}
										}catch(Exception e){
											out.println(e);
										}finally{
											//close connection
											con5.close();
										}
							%>
							<!-- show total request in footer -->
							<tfoot>
								<tr>
									<td colspan="9">Total Request: 
										<%
											Connection con6=DbConnection.getConnection();
											PreparedStatement p6=con6.prepareStatement("select count(*) as ans from house_details where request=?");
											p6.setString(1,"pending");
											ResultSet r6=p6.executeQuery();
											while(r6.next()){
												out.println(r6.getString("ans"));
											}
											con6.close();
										%>
									</td>
								</tr>
							</tfoot>
					</table>
				</div>
			</div>

		</div>

	</body>
</html>