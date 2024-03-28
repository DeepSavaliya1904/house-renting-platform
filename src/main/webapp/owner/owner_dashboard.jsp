<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.Date" %>
<%! String id = null; %>
<!DOCTYPE html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">

	<link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'>
	<link rel="stylesheet" href="owner_dashboard.css">

	<title>Owner Dashboard</title>
</head>

<body>
	<%
		try{
			String id = (String) session.getAttribute("id");
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
				p4.setString(5,"Visit Owner Dashboard");
				p4.executeUpdate();
			}
		}catch(Exception e){
			e.printStackTrace();
		}
	%>
	<section id="sidebar">
		<a href="#" class="brand">
			<i class='bx bxs-home'></i>
			<span class="text">Owner Dashboard</span>
		</a>
		<ul class="side-menu top">
			<li class="active">
				<a href="owner_dashboard.jsp">
					<i class='bx bxs-dashboard' ></i>
					<span class="text">Dashboard</span>
				</a>
			</li>
			<li>
				<a href="addHouseDetails.jsp">
					<i class='bx bxs-shopping-bag-alt' ></i>
					<span class="text">Add House Details</span>
				</a>
			</li>
			<li>
				<a href="manageHouse.jsp">
					<i class='bx bxs-doughnut-chart' ></i>
					<span class="text">Update/Delete House Details</span>
				</a>
			</li>
			<li>
				<a href="showStatus.jsp">
					<i class='bx bxs-message-dots' ></i>
					<span class="text">Show Status</span>
				</a>
			</li>
			</ul>
		<ul class="side-menu">
			<li>
				<a href="owner_login.jsp" class="logout">
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
			<h4>
				<%
					String id = (String) session.getAttribute("id");
					Class.forName("com.mysql.jdbc.Driver");
					Connection con5=DriverManager.getConnection("jdbc:mysql://localhost/house_renting","root","");
					PreparedStatement p5=con5.prepareStatement("select *from owner_details where owner_id=?");
					p5.setString(1,id);
					ResultSet r5=p5.executeQuery();
					if(r5.next()){
						out.println(r5.getString("name"));
					}
				%>
			</h4>
			<a href="#" class="profile">
				<img src="image.png">
			</a>
		</nav>
		
		<main>
			<div class="head-title">
				<div class="left">
					<h1>Owner Dashboard</h1>
					<ul class="breadcrumb">
						<li>
							<a href="#">Dashboard</a>
						</li>
						</ul>
				</div>
			</div>

			<ul class="box-info">
				<li>
					<i class='bx bx-home-smile'></i>
					<span class="text">
						<h3>
							<%
								String ans;
								Class.forName("com.mysql.jdbc.Driver");
								Connection con1=DriverManager.getConnection("jdbc:mysql://localhost/house_renting","root","");
								PreparedStatement p1=con1.prepareStatement("select count(*) as ans from house_details where owner_id=?");
								p1.setString(1,id);
								ResultSet r1=p1.executeQuery();
								if(r1.next()){
									out.println(r1.getString("ans"));
								}
							%>
						</h3>
						<p>Total House</p>
					</span>
				</li>
				<li>
					<i class='bx bxs-institution' ></i>
					<span class="text">
						<h3>
							<%
								Class.forName("com.mysql.jdbc.Driver");
								Connection con2=DriverManager.getConnection("jdbc:mysql://localhost/house_renting","root","");
								PreparedStatement p2=con2.prepareStatement("select count(*) as ans from house_details where status=? and owner_id=?");
								p2.setString(1,"available");
								p2.setString(2,id);
								ResultSet r2=p2.executeQuery();
								if(r2.next()){
									out.println(r1.getString("ans"));
								}
							%>
						</h3>
						<p>Available House</p>
					</span>
				</li>
				<li>
					<i class='bx bx-git-pull-request' ></i>
					<span class="text">
						<h3><%
							try {
							    String ans1;
							    Class.forName("com.mysql.jdbc.Driver");
							    Connection con3 = DriverManager.getConnection("jdbc:mysql://localhost/house_renting", "root", "");
							    PreparedStatement p3 = con3.prepareStatement("select count(*) as ans1 from house_details where request=? and owner_id=?");
							    p3.setString(1, "pending");
							    p3.setString(2, id);
							    ResultSet r3 = p3.executeQuery();
							    if (r3.next()) {
							        out.println(r3.getString("ans1"));
							    }
							} catch (Exception e) {
							    out.println(e);
							}
							%>

						</h3>
						<p>Pending Requests</p>
					</span>
				</li>
				</ul>
			
			<div class="table-data">
				<div class="order">
					<div class="head">
						<h3>Recent Request</h3>
					</div>
					<table>
						<thead>
							<tr>
								<th>User</th>
								<th>Date</th>
								<th>Request Status</th>
							</tr>
						</thead>
						<tbody>
							<%
								String id1 = (String) session.getAttribute("id");
								Class.forName("com.mysql.jdbc.Driver");
								Connection con=DriverManager.getConnection("jdbc:mysql://localhost/house_renting","root","");
								PreparedStatement p=con.prepareStatement("select *from renting_details where owner_id=?");
								p.setString(1,id1);
							ResultSet r=p.executeQuery();
							while(r.next()){
								if(r.getString("request").equals("pending")){
							%>
								<tr>
									<td>
										<p><%= r.getString("tenant_name") %></p>
									</td>
									<td><%= r.getString("date") %></td>
									<td><span class="status completed"><%= r.getString("request") %></span></td>
								</tr>
							<%} 
							}
							%>
							</tbody>
					</table>
				</div>
			</div>
		</main>
	</section>
	<script src="script.js"></script>
</body>
</html>