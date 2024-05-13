<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import = "java.io.*,java.util.*" %>
<%@ page import="house_renting_platform.DbConnection" %>
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
<!--Body start -->
<body>
	<%
		//check owner already login or not
    	String id = (String) session.getAttribute("id");
		if(session.getAttribute("owner")==null){
			response.sendRedirect("error.jsp");
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
	<script src="script.js"></script>
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
					Connection con=DbConnection.getConnection();
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
							<a href="#">Update House Details</a>
						</li>
						</ul>
				</div>
			</div>
			<form action="updateHouse.jsp" method="POST">
				<%
					try{
						String h_id=request.getParameter("id");
						PreparedStatement p1=con.prepareStatement("select *from house_details where house_id=?");
						p1.setString(1,h_id);
						ResultSet r1=p1.executeQuery();
						while(r1.next()){
				%>
				<input type="hidden" name="house_id" value="<%= r1.getString("house_id") %>">
	            <div class="form-floating mb-3" style="width: 147vh;">
	                <input type="text" class="form-control" id="address" name="address" placeholder="Enter your address" value="<%= r1.getString("address")%>">
	                <label for="address">address</label>
	            </div>
	            <input type="hidden" name="owner_id" value="<%=(String) session.getAttribute("id")%>">
	            <div class="form-floating mb-3" style="width: 147vh;">
	                <input type="text" class="form-control" id="Sqft" name="Sqft" placeholder="Enter house Sqft" value="<%= r1.getString("square_footage") %>">
	                <label for="Sqft">Sqft</label>
	            </div>
	            <div class="temp" style="display: flex;">
	                <div class="form-floating mb-3" style=" width: 70vh;">
	                    <input type="number" class="form-control" id="bathrooms" name="bathrooms" placeholder="Enter Number of Bathrooms" value="<%= r1.getString("num_of_bathrooms") %>">
	                    <label for="bathrooms">No of Bathrooms</label>
	                </div>
	                <div class="form-floating mb-3" style=" width: 70vh; margin-left: 50px;">
	                    <input type="number" class="form-control" id="bedrooms" name="bedrooms" placeholder="Enter Number of Bedrooms" value="<%= r1.getString("num_of_bedrooms") %>">
	                    <label for="bedrooms">No of Bedrooms</label>
	                </div>
	            </div>
	            <div class="form-floating mb-3" style="width: 147vh; margin-top: 0px;">
	                <input type="text" class="form-control" id="rent" name="rent" placeholder="Enter Rent of House"  value="<%= r1.getString("rent_of_house") %>">
	                <label for="rent">Rent Of House</label>
	            </div>
	            <select class="form-select" aria-label="Type Of House" style="height: 55px; width: 70vh;" name="type">
				    <option <%=r1.getString("house_type").equals("Flat") %> value="Flat">Flat</option>
				    <option <%=r1.getString("house_type").equals("Duplex") %> value="Duplex">Duplex</option>
				    <option <%=r1.getString("house_type").equals("Bungalow") %> value="Bungalow">Bungalow</option>
				</select>

	            <input type="submit" name="submit" class="btn btn-outline-primary me-3" style="width: 150px; height: 45px; margin-top: 20px;" value="Update">
	            <%} 
					}catch(Exception e){
						e.printStackTrace();
					}
	            %>
            </form>	
		</main>
	</section>
	 		<%
    			String house_id = request.getParameter("house_id");
    			String address = request.getParameter("address");
    			String Sqft = request.getParameter("Sqft");
    			String bathrooms = request.getParameter("bathrooms");
    			String bedrooms = request.getParameter("bedrooms");
    			String rent = request.getParameter("rent");
    			String type = request.getParameter("type");
    			try {
    				//update house details
    				PreparedStatement p3 = con.prepareStatement("update house_details set address=?,square_footage=?,num_of_bathrooms=?,num_of_bedrooms=?,rent_of_house=?,house_type=? where house_id=?");
    				p3.setString(1, address);
    				p3.setString(2, Sqft);
    				p3.setString(3, bathrooms);
    		        p3.setString(4, bedrooms);
    		        p3.setString(5, rent);
    				p3.setString(6, type);
    				p3.setString(7, house_id);
    				p3.executeUpdate();
    			} catch (Exception e) {
    				e.printStackTrace();
    			}finally{
    				//close connection
    			}
    			con.close();
    		%>	
</body>
</html>