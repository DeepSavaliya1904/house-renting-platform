<%@ page import="java.sql.*" %>
<%@ page import="java.util.Date" %>
<%@ page import="house_renting_platform.DbConnection" %>
<%! String id = null; %>
<!DOCTYPE html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'>
	<link rel="stylesheet" href="viewProfile.css">
	<title>View Profile</title>
</head>
<!-- Body start -->
<body>
	<%
		//check owner already login or not
		if(session.getAttribute("owner")==null){
			response.sendRedirect("error.jsp");
		}
	%>
	<%
		Connection con=null; 
		try{
			String id = (String) session.getAttribute("id");
			con=DbConnection.getConnection();
			PreparedStatement p=con.prepareStatement("select *from owner_details where owner_id=?");
			p.setString(1,id);
			ResultSet r=p.executeQuery();
			if(r.next()){
				//track activity
		    	Date currentDate = new Date();
		    	Class.forName("com.mysql.jdbc.Driver");
				Connection con4=DriverManager.getConnection("jdbc:mysql://localhost/house_renting","root","");
				PreparedStatement p4=con4.prepareStatement("insert into track_activity(Username,Role,Date,Time,Activity) values(?,?,?,?,?)");
				p4.setString(1,r.getString("name"));
				p4.setString(2,"owner");
				p4.setString(3,new java.text.SimpleDateFormat("YYYY-MM-dd").format(currentDate));
				p4.setString(4,new java.text.SimpleDateFormat("HH:mm:ss").format(currentDate));
				p4.setString(5,"View Profile Details");
				p4.executeUpdate();
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			//close connection
			con.close();
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
			<h4>
				<%
					//create connection
					String id = request.getParameter("id");
					Connection con2=DbConnection.getConnection();
					PreparedStatement p5=con2.prepareStatement("select *from owner_details where owner_id=?");
					p5.setString(1,id);
					ResultSet r5=p5.executeQuery();
					if(r5.next()){
						out.println(r5.getString("name"));
					}
					//close connection
					con2.close();
				%>
			</h4>
			<a href="#" class="profile">
				<img src="image.png">
			</a>
			<form action="viewProfile.jsp" method="POST" style="margin-right:-300px;">	
					<input type="hidden" value="<%= id %>" name="id">
					<input type="submit" value="view Profile" name="view Profile" style="
						padding:10px;
						font-size:17px;
						background-color:#3C91E6;
						color:#fff;
						border:0px solid #3C91E6;
						border-radius:10px;
					">
			</form>
		</nav>
		
		<main>
			<div class="head-title">
				<div class="left">
					<h1>Owner Dashboard</h1>
					<ul class="breadcrumb">
						<li>
							<a href="#">View Profile</a>
						</li>
						</ul>
				</div>
			</div>
			
			<%
				Connection con1=null;
				try {
						con1=DbConnection.getConnection();
						PreparedStatement p=con1.prepareStatement("select *from owner_details where owner_id=?");
						p.setString(1, id);
						ResultSet r=p.executeQuery();
						if(r.next()) {
			%>					
			<div class="table-data">
				<div class="order">
					<div class="head">
						<h3>Owner Profile</h3>
					</div>
					<table class="text">
						<thead>
							<tr>
								<td>Owner ID</td>
								<td><%= r.getString("owner_id") %></td>
								<td></td>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>Owner Name</td>
								<td><%= r.getString("name") %></td>
							</tr>
							<tr>
								<td>Password</td>
								<td><%= r.getString("password") %></td>
							</tr>
							<tr>
								<td>Contact No</td>
								<td><%= r.getString("contact_no") %></td>
							</tr>
							<tr>
								<td>Email</td>
								<td><%= r.getString("email_id") %></td>
							</tr>
							<tr>
								<td>Age</td>
								<td><%= r.getString("age") %></td>
							</tr>
							<tr>
								<td>
									<form action="update_owner.jsp" method="POST">
										<input type="hidden" value="<%= id %>" name="id">
										<input type="submit" value="Update" name="Update" style="
										padding:10px;
										font-size:17px;
										background-color:#3C91E6;
										color:#fff;
										border:0px solid #3C91E6;
										border-radius:10px;">
									</form>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			<%			}
					}catch(Exception e) {
						out.println(e);
					}finally{
						//close connection
						con1.close();
					}
	 		%>
		</main>
	</section>
	<script src="script.js"></script>
</body>
</html>