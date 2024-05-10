<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.Date" %>
<%! int id = 0; %>
<!DOCTYPE html>

<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">

	<link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'>
	<link rel="stylesheet" href="manageHouse.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
	<title>Add House Details</title>
    <style>
        a{
            text-decoration: none;
        }
    </style>
</head>

<body>
	<%
    	String id = (String) session.getAttribute("id");
		if(session.getAttribute("owner")==null){
			response.sendRedirect("error.jsp");
		}
	%>
	<%
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost/house_renting","root","");
			PreparedStatement p=con.prepareStatement("select *from owner_details where owner_id=?");
			p.setString(1,id);
			ResultSet r=p.executeQuery();
			if(r.next()){
				
		    	Date currentDate = new Date();
		    	Class.forName("com.mysql.jdbc.Driver");
				Connection con4=DriverManager.getConnection("jdbc:mysql://localhost/house_renting","root","");
				PreparedStatement p4=con4.prepareStatement("insert into track_activity(Username,Role,Date,Time,Activity) values(?,?,?,?,?)");
				p4.setString(1,r.getString("name"));
				p4.setString(2,"owner");
				p4.setString(3,new java.text.SimpleDateFormat("YYYY-MM-dd").format(currentDate));
				p4.setString(4,new java.text.SimpleDateFormat("HH:mm:ss").format(currentDate));
				p4.setString(5,"open Manage House Details page");
				p4.executeUpdate();
			}
		}catch(Exception e){
			e.printStackTrace();
		}
	%>
	<section id="sidebar">
		<a href="owner_dashboard.jsp" class="brand">
			<i class='bx bxs-home'></i>
			<span class="text">Owner Dashboard</span>
		</a>
		<ul class="side-menu top">
			<li style="margin-left: -20px;">
				<a href="owner_dashboard.jsp">
					<i class='bx bxs-dashboard' ></i>
					<span class="text">Dashboard</span>
				</a>
			</li>
			<li style="margin-left: -20px;">
				<a href="addHouseDetails.jsp">
					<i class='bx bxs-shopping-bag-alt' ></i>
					<span class="text">Add House Details</span>
				</a>
			</li>
			<li style="margin-left: -20px;" class="active">
				<a href="manageHouse.jsp">
					<i class='bx bxs-doughnut-chart' ></i>
					<span class="text">Update/Delete House Details</span>
				</a>
			</li>
			<li style="margin-left: -20px;">
				<a href="showStatus.jsp">
					<i class='bx bxs-message-dots' ></i>
					<span class="text">Show Status</span>
				</a>
			</li>
			</ul>
		<ul class="side-menu">
			<li style="margin-left: -20px;">
				<a href="owner_logout.jsp" class="logout">
					<i class='bx bxs-log-out-circle' ></i>
					<span class="text">Logout</span>
				</a>
			</li>
			</ul>
	</section>
	
	<section id="content">
		<nav>
			<i class='bx bx-menu' ></i>
			<form action="#">
				<div class="form-input">
					<input type="search" placeholder="Search...">
					<button type="submit" class="search-btn"><i class='bx bx-search' ></i></button>
				</div>
			</form>
			<input type="checkbox" id="switch-mode" hidden>
			<label for="switch-mode" class="switch-mode"></label>
			<h5>
				<%
					Class.forName("com.mysql.jdbc.Driver");
					Connection con=DriverManager.getConnection("jdbc:mysql://localhost/house_renting","root","");
					PreparedStatement p=con.prepareStatement("select *from owner_details where owner_id=?");
					p.setString(1,id);
					ResultSet r=p.executeQuery();
					if(r.next()){
						out.println(r.getString("name"));
					}
				%>
			</h5>
			<a href="#" class="profile">
				<img src="image.png">
			</a>
		</nav>
		
		<main style="background-color: #eee; height: 100vh;">
			<div class="head-title">
				<div class="left">
					<h1>Owner Dashboard</h1>
					<ul class="breadcrumb">
						<li>
							<a href="#">Update/Delete House Details</a>
						</li>
						</ul>
				</div>
			</div><table class="table" style="margin-top: 10px;">
                <thead class="table-dark">
                  <tr>
                    <th>House ID</th>
                    <th>Address</th>
                    <th>Square Feet</th>
                    <th>Bathrooms</th>
                    <th>Bedrooms</th>
                    <th>Rent</th>
                    <th>House Type</th>
                    <th>Status</th>
                    <th>Request</th>
                    <th>Manage</th>
                  </tr>
                </thead>
              <tbody>
				    <%
				        Class.forName("com.mysql.jdbc.Driver");
				        Connection con1=DriverManager.getConnection("jdbc:mysql://localhost/house_renting","root","");
				        PreparedStatement p1=con1.prepareStatement("select * from house_details where owner_id=?");
				        p1.setString(1, id);
				        ResultSet r1=p1.executeQuery();
				        while(r1.next()){
				    %>
				    <tr>
				        <td><%= r1.getString("house_id") %></td>		
				        <td><%= r1.getString("address") %></td>
				        <td><%= r1.getString("square_footage") %></td>
				        <td><%= r1.getString("num_of_bathrooms") %></td>
				        <td><%= r1.getString("num_of_bedrooms") %></td>
				        <td><%= r1.getString("rent_of_house") %></td>
				        <td><%= r1.getString("house_type") %></td>				
				        <td><%= r1.getString("status") %></td>
				        <td><%= r1.getString("request") %></td>
				        <td style="display:flex;">
				            <form action="updateHouse.jsp" method="POST">
				                <input type="hidden" name="id" value="<%= r1.getString("house_id") %>">
				                <button type="submit" class="btn btn-primary" style="margin-right:20px;">Update</button>
				            </form>
				            <form action="../DeleteHouse" method="POST">
				                <input type="hidden" name="id" value="<%= r1.getString("house_id") %>">
				                <button type="submit" class="btn btn-danger" style="margin-right:-50px;" name="delete">Delete</button>
				            </form>
				        </td>		
				    </tr>
				    <% } %>
				</tbody>
              </table>
			
		</main>
	</section>
	<script src="script.js"></script>
</body>
</html>