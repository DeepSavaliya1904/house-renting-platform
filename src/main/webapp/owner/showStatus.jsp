<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.Date" %>
<%@ page import="house_renting_platform.DbConnection" %>
<%! int id = 0; %>
<!DOCTYPE html>

<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">

	<link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'>
	<link rel="stylesheet" href="manageHouse.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
	<title>Show the status</title>
    <style>
        a{
            text-decoration: none;
        }
    </style>
</head>
<!-- body start -->
<body>
		<%
			//check owner already login or not
	    	String id = (String) session.getAttribute("id");
			if(session.getAttribute("owner")==null){
				response.sendRedirect("error.jsp");
			}
		%>
		<%
			Connection con=null; 
			try{
				con=DbConnection.getConnection();
				PreparedStatement p=con.prepareStatement("select *from owner_details where owner_id=?");
				p.setString(1,id);
				ResultSet r=p.executeQuery();
				if(r.next()){
					//track activity
		    		Date currentDate = new Date();
		    		PreparedStatement p4=con.prepareStatement("insert into track_activity(Username,Role,Date,Time,Activity) values(?,?,?,?,?)");
					p4.setString(1,r.getString("name"));
					p4.setString(2,"owner");
					p4.setString(3,new java.text.SimpleDateFormat("YYYY-MM-dd").format(currentDate));
					p4.setString(4,new java.text.SimpleDateFormat("HH:mm:ss").format(currentDate));
					p4.setString(5,"check the status of the house");
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
				<li style="margin-left: -20px;">
					<a href="manageHouse.jsp">
						<i class='bx bxs-doughnut-chart' ></i>
						<span class="text">Update/Delete House Details</span>
					</a>
				</li>
				<li style="margin-left: -20px;" class="active">
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
				<h5>
					<%
						Connection con1=DbConnection.getConnection();
						PreparedStatement p=con1.prepareStatement("select *from owner_details where owner_id=?");
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
				<form action="/house_renting_platform/Main" method="GET" style="margin-right:-300px;">	
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
		
			<main style="background-color: #eee; height: 100vh;">
				<div class="head-title">
					<div class="left">
						<h1>Owner Dashboard</h1>
						<ul class="breadcrumb">
							<li>
								<a href="#">Show Status</a>
							</li>
							</ul>
					</div>
				</div>
				<table class="table" style="margin-top: 60px;">
            		<thead class="table-dark">
			              <tr>
			                <th>Address</th>
			                <th>Area</th>
			                <th>Bathrooms</th>
			                <th>Bedrooms</th>
			                <th>Tenant Name</th>
			                <th>Date</th>
			                <th>Rent_price</th>
			                <th>Request</th>
			              </tr>
            		</thead>
		            <tbody>
						<%
							Connection con2=null;
							try{
								//create connection
								con2=DbConnection.getConnection();
								PreparedStatement p1=con2.prepareStatement("select *from renting_details where owner_id=?");
								p1.setString(1,id);
								ResultSet r1=p1.executeQuery();
								while(r1.next()){
									//fetch renting detaisl
							        if (!("accept".equals(r1.getString("request")) || "reject".equals(r1.getString("request")))) {
							        	//fetch house details
							        	PreparedStatement p2=con2.prepareStatement("select *from house_details where house_id=?");
							        	p2.setString(1,r1.getString(1));
							        	ResultSet r2=p2.executeQuery();
							        	if(r2.next()){
							        		//fetch tenant details
							        		PreparedStatement p3=con2.prepareStatement("select *from tenant_details where tenant_id=?");
							        		p3.setString(1,r1.getString("tenant_id"));
							        		ResultSet r3=p3.executeQuery();
							        		if(r3.next()){
							%>
							<tr>
								<td><%out.println(r2.getString("address")); %></td>
								<td><%out.println(r2.getString("area")); %></td>
								<td><%out.println(r2.getString("num_of_bedrooms")); %></td>
								<td><%out.println(r2.getString("num_of_bathrooms")); %></td>
								<td><%out.println(r3.getString("name")); %></td>
								<td><%out.println(r1.getString(5)); %></td>
								<td><%out.println(r1.getString(6)); %></td>	
								<td style="display:flex;">
				                    <form action="acceptReq.jsp" method="POST">
				                        <input type="hidden" name="house_id" value="<%= r1.getString(1) %>">
				                        <input type="hidden" name="tenant_id" value="<%= r1.getString(2) %>">
				                        <button type="submit" class="btn btn-primary" style="margin-right:20px;">Accept</button>
				                    </form>
				                    <form action="rejectReq.jsp" method="POST">
				                        <input type="hidden" name="house_id" value="<%= r1.getString(1) %>">
				                        <input type="hidden" name="tenant_id" value="<%= r1.getString(2) %>">
				                        <button type="submit" class="btn btn-danger" style="margin-right:-50px;" name="delete">Reject</button>
				                    </form>
				                </td>		
							</tr>
							<%		}
								        }
								        	}
									}
									}catch(Exception e){
										out.println(e);
									}finally{
										//close connection
										con2.close();	
									}
							%>              
            </tbody>
          </table>
				
		</main>
	</section>
	<script src="script.js"></script>
</body>
</html>