<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.Date" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Rental Requests</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Box-Icons -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap');

        *{
            margin: 0;
            padding: 0;
            text-decoration: none;
            font-family: 'Poppins', sans-serif;
            list-style: none;
        }

        /* Navbar */
        .navbar{
            background-color: black;
            display: flex;
            padding: 15px 55px;
            height: 80px;
        }

        .navbar a{
            text-decoration: none;
        }
        .logo{
            display: flex;
            align-items: center;
            column-gap: 0.5rem;
            font-size: 1rem;
            font-weight: 700;
            color: white;
            text-transform: uppercase;
            margin-left: -27px;
            margin-top: 5px;
        }
        .logo .bx{
            font-size: 40px;
            color: white;
        }

        .logo i{
            font-size: 46px;
        }

        ul{
            position: absolute;
            left: 25%;
            right: 50%;
            margin-top: 10px;
            border-radius: 10px;
            display: flex;
        }

        ul li{
            list-style: none;
            margin-top: 15px;
        }


        ul li a{
            text-decoration: none;
            margin-right: 70px;
            width: 100px;
            color: white;
            text-transform: capitalize;
            font-family: Arial, Helvetica, sans-serif;
            list-style-type: none;
            text-align: center;
            font-size: 18px;
            transition: 0.3s;
            cursor: pointer;
        }

        ul li a:hover{
            color: #2288ff;
        }

        .bottom{
            position: absolute;
            width: 100px;
            height: 7px;
            background: #2288ff;
            bottom: -20px;
            left : 315px;
            border-top-left-radius: 5px;
            border-top-right-radius: 5px;
            transition: 0.3s;
        }

        ul li:nth-child(2):hover ~ .bottom{
            left: 138px;
        }

        ul li:nth-child(4):hover ~ .bottom{
            left: 520px;
        }
        
        ul li:nth-child(5):hover ~ .bottom{
            left: 703px;
        }

        ul li:nth-child(1):hover ~ .bottom{
            left: 5px;
        }

        button{
            padding: 9px 25px;
            margin-left: 900px;
            margin-top: -28px;
            background-color: white;
            border: none;
            border-radius: 50px;
            cursor: pointer;
            transition: all 0.3s ease 0s;
            font-size: 16px;
            font-weight: 600;
        }

        button:hover{
            background : #3492fd;
            transition: .4s;
            transform: scale(110%);
        }


        
        /* Feedback Form */
        .container{
            max-width: 800px;
            height: 20%;
            width: 70%;
        }
        body{
            background: #eee;
        }

        .feedback-form{
            background: white;
            margin-top: 2%;
            margin-bottom: 20px;
            border-radius: 30px;
        }

        .feedback-form .form-control{
            border-radius: 1rem;
        }

        .feedback-img{
            text-align: center;
        }

        .feedback-img img{
            border-radius: 10px;
            width: 11%;
            margin-top: 1%;
            font-size: 20px;
        }

        .feedback-form form{
            padding: 7%;
        }

        .feedback-form form .row{
            margin-bottom: -7%;
        }

        .feedback-form h3{
            margin-bottom: 8%;
            margin-top: -40px;
            text-align: center;
            color: #2288ff;
            font-weight: bolder;
        }

        .feedback-form .btnFeedback{
            width: 50%;
            border: none;
            border-radius: 1rem;
            padding: 1.5%;
            background: #dcdccd;
            cursor: pointer;
        }

        .feedback-form p{
            margin-top: 10px;
            margin-bottom: 10px;
            color: gray;
        }
    </style>
</head>
<body>

	<script>
	    function redirectPage() {
	        // Replace 'destination_page.html' with the actual URL where you want to redirect
	        window.location.href = 'tenant_login.jsp';
	    }
	</script>
    <!-- Navbar -->
    <div class="navbar">
        <a href="../home.jsp" class="logo"><i class='bx bx-home-heart'></i>House <br> Rental</a>
        <ul class="navlink" style="width:120%;">
            <li><a href="tenant_dashboard.jsp">Home</a></li>
            <li><a href="properties.jsp">Properties</a></li>
            <li><a href="Request.jsp">Rental Request</a></li>
            <li><a href="approvedRequest.jsp">Approved Request</a></li>
            <li><a href="Feedback.jsp">Feedback</a></li>
            <div class="bottom"></div>
        </ul>
		<button onclick="redirectPage()" class="btn btn-primary">Log out</button>
    </div>
    <div class="body" style="padding-left: 55px; padding-right: 65px;">
        <table class="table" style="margin-top: 60px;">
            <thead class="table-dark">
              <tr>
                <th>House ID</th>
                <th>Owner Name</th>
                <th>Address</th>
                <th>Area</th>
                <th>Bedrooms</th>
                <th>Bathrooms</th>
                <th>Date</th>
                <th>Rent_price</th>
                <th>Request</th>
                <th>Manage</th>
              </tr>
            </thead>
            <tbody>
				<%
					try{
						String id = (String) session.getAttribute("id");
						Class.forName("com.mysql.jdbc.Driver");
						Connection con1=DriverManager.getConnection("jdbc:mysql://localhost/house_renting","root","");
						PreparedStatement p1=con1.prepareStatement("select *from renting_details where tenant_id=?");
						p1.setString(1,id);
						ResultSet r1=p1.executeQuery();
						while(r1.next()){
					        if (!("accept".equals(r1.getString("request")))) {
					        	PreparedStatement p2=con1.prepareStatement("select *from house_details where house_id=?");
					        	p2.setString(1,r1.getString("house_id"));
					        	ResultSet r2=p2.executeQuery();
					        	while(r2.next()){
					        		PreparedStatement p3=con1.prepareStatement("select *from owner_details where owner_id=?");
					        		p3.setString(1,r2.getString("owner_id"));
					        		ResultSet r3=p3.executeQuery();
					        		while(r3.next()){
					%>
				<tr>
					<td><%out.println(r1.getString(1)); %></td>		
					<td><%out.println(r3.getString("name")); %></td>
					<td><%out.println(r2.getString(3)); %></td>
					<td><%out.println(r2.getString("area")); %></td>
					<td><%out.println(r2.getString("num_of_bedrooms")); %></td>
					<td><%out.println(r2.getString("num_of_bathrooms")); %></td>			
					<td><%out.println(r1.getString("date")); %></td>
					<td><%out.println(r1.getString("rent_price")); %></td>
					<td><%out.println(r1.getString("request")); %></td>		
					<td>
						<form action="removeRequest.jsp" method="POST">
							<input type="hidden" name="house_id" value="<%= r1.getString(1) %>">
							<input type="submit" value="remove" class="btn btn-outline-danger me-3" style="margin-right:150px;">
						</form>
					</td>
				</tr>
				<%		
						}
							}
					        	}
			        				}
						}catch(Exception e){
							out.println(e);
						}
					%>              
            </tbody>
          </table>
          <%
		    		try{
		    			String id = (String) session.getAttribute("id");
		    			Class.forName("com.mysql.jdbc.Driver");
		    			Connection con=DriverManager.getConnection("jdbc:mysql://localhost/house_renting","root","");
		    			PreparedStatement p=con.prepareStatement("select *from tenant_details where tenant_id=?");
		    			p.setString(1,id);
		    			ResultSet r=p.executeQuery();
		    			if(r.next()){
		    				Date currentDate = new Date();
		    		    	Class.forName("com.mysql.jdbc.Driver");
		    				Connection con4=DriverManager.getConnection("jdbc:mysql://localhost/house_renting","root","");
		    				PreparedStatement p4=con4.prepareStatement("insert into track_activity(Username,Role,Date,Time,Activity) values(?,?,?,?,?)");
		    				p4.setString(1,r.getString("name"));
		    				p4.setString(2,"tenant");
		    				p4.setString(3,new java.text.SimpleDateFormat("YYYY-MM-dd").format(currentDate));
		    				p4.setString(4,new java.text.SimpleDateFormat("HH:mm:ss").format(currentDate));
		    				p4.setString(5,"show sent Request");
		    				p4.executeUpdate();
		    			}
		    		}catch(Exception e){
		    			e.printStackTrace();
		    		}

            	%>
    </div>
</body>
</html>