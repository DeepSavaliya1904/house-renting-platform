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
	<link rel="stylesheet" href="addHouseDetails.css">
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
				p4.setString(5,"open add house details page");
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
			<li class="active" style="margin-left: -20px;">
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
							<a href="#">Add House Details</a>
						</li>
						</ul>
				</div>
			</div>
			
			
			<form action="../FileUploadServlet" enctype="multipart/form-data" method="POST">
	            <div class="form-floating mb-3" style="width: 147vh;">
	                <input type="text" class="form-control" id="address" name="address" placeholder="Enter your address">
	                <label for="address">address</label>
	            </div>
	            <input type="hidden" name="owner_id" value="<%=(String) session.getAttribute("id")%>">
	            <div class="form-floating mb-3" style="width: 147vh;">
	                <input type="text" class="form-control" id="Sqft" name="Sqft" placeholder="Enter house Sqft">
	                <label for="Sqft">Sqft</label>
	            </div>
	            <div class="temp" style="display: flex;">
	                <div class="form-floating mb-3" style=" width: 70vh;">
	                    <input type="number" class="form-control" id="bathrooms" name="bathrooms" placeholder="Enter Number of Bathrooms">
	                    <label for="bathrooms">No of Bathrooms</label>
	                </div>
	                <div class="form-floating mb-3" style=" width: 70vh; margin-left: 50px;">
	                    <input type="number" class="form-control" id="bedrooms" name="bedrooms" placeholder="Enter Number of Bedrooms">
	                    <label for="bedrooms">No of Bedrooms</label>
	                </div>
	            </div>
	            <div style="margin-top: 0px;">
	                <input class="form-control form-control-lg" id="formFileLg" type="file" style="width: 147vh; height: 47px;" name="file">
	            </div>
	            <div class="form-floating mb-3" style="width: 147vh; margin-top: 20px;">
	                <input type="text" class="form-control" id="rent" name="rent" placeholder="Enter Rent of House">
	                <label for="rent">Rent Of House</label>
	            </div>
	            
	            <div class="temp1" style="display:flex;">
	            <select class="form-select" aria-label="Type Of House" style="height: 55px; width: 70vh;" name="type">
	                <option selected>Type of House</option>
	                <option value="Flat">Flat</option>
	                <option value="Duplex">Duplex</option>
	                <option value="Bungalow">Bungalow</option>
	            </select>  
	             <div class="form-floating mb-3" style=" width: 70vh; margin-left: 50px;">
	                 <input type="text" class="form-control" id="area" name="area" placeholder="Enter Area">
	                 <label for="area">Area</label>
	             </div>
	             </div>
	            <input type="submit" name="submit" class="btn btn-outline-primary me-3" style="width: 150px; height: 45px; margin-top: 10px;" value="Send Request">
            </form>
		</main>
	</section>
	<script src="script.js"></script>
</body>
</html>