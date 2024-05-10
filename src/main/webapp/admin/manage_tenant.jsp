<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>

<%! int id = 0; %>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="UTF-8"/>
		<title>Dashboard Design</title>
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
				<li class="active">
					<a href="#">
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
					<span>Manage</span>
					<h2>Tenant</h2>
				</div>
				<div class="user--info">
					<div class="search--box">
					<i class="fa-solid fa-search"></i>
					<input type="text" placeholder="Search"/>
				</div>
				<img src="image.png" alt="">
				</div>
			</div>
        
        <a href="addTenant.jsp" style="margin-top: 30px;" class="btn btn-success">Add Tenant</a>
        <table class="table" style="margin-top: 10px;">
            <thead class="table-dark">
              <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Password</th>
                <th>Contact No</th>
                <th>Email ID</th>
                <th>Gender</th>
                <th>Caste</th>
                <th>Adhar no</th>
                <th>Manage</th>
              </tr>
            </thead>
            <tbody>
				<%
					try{
						Class.forName("com.mysql.jdbc.Driver");
						Connection con=DriverManager.getConnection("jdbc:mysql://localhost/house_renting","root","");
						PreparedStatement p=con.prepareStatement("select *from tenant_details");
						ResultSet r=p.executeQuery();
						while(r.next()){
						id=Integer.parseInt(r.getString(1));		
				%>
				<tr>
					<td><%out.println(r.getString(1)); %></td>		
					<td><%out.println(r.getString(2)); %></td>
					<td><%out.println(r.getString(3)); %></td>
					<td><%out.println(r.getString(4)); %></td>
					<td><%out.println(r.getString(5)); %></td>
					<td><%out.println(r.getString(6)); %></td>
					<td><%out.println(r.getString(7)); %></td>
					<td><%out.println(	r.getString(8)); %></td>				
					 <td style="display:flex;">
	                    <form action="update_tenant.jsp" method="POST">
	                        <input type="hidden" name="id" value="<%= id %>">
	                        <button type="submit" class="btn btn-primary" style="margin-right:20px;">Update</button>
	                    </form>
	                    <form action="../TenantOperations" method="POST">
	                        <input type="hidden" name="id" value="<%= id %>">
	                        <button type="submit" class="btn btn-danger" style="margin-right:-50px;" name="delete">Delete</button>
	                    </form>
	                </td>		
				</tr>
				<%		}
						}catch(Exception e){
							out.println(e);
						}
					%>              
            </tbody>
          </table>
		</div>
	</body>
</html>