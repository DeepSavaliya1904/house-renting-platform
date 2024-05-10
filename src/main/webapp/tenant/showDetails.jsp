<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Make a Payment</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <!-- Box-Icons -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">
    <style>
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
            left : 530px;
            border-top-left-radius: 5px;
            border-top-right-radius: 5px;
            transition: 0.3s;
        }

		.navbar ul li:nth-child(1):hover ~ .bottom{
		    left: 5px;
		}
			
		.navbar ul li:nth-child(3):hover ~ .bottom{
		    left: 315px;
		}
			
		.navbar ul li:nth-child(2):hover ~ .bottom{
		    left: 138px;
		}
			
		.navbar ul li:nth-child(5):hover ~ .bottom{
		    left: 700px;
		}
			
        .btn1 button{
            padding: 9px 25px;
            margin-left: 970px;
            margin-top: 5px;
            background-color: white;
            color: #2288ff;
            border: none;
            border-radius: 50px;
            cursor: pointer;
            transition: all 0.3s ease 0s;
            font-size: 16px;
            font-weight: 600;
        }

        .btn1 button:hover{
            color: white;
            background-color: #3492fd;
            transition: .3s;
            transform: scale(110%);
        }

        /* Properites */
        body{
            background-color: #F0F0F0;
        }

        .heading{
            margin-top: 40px;
            margin-left: 45%;
            margin-bottom:-30px;
        }
        .properties{
            background-color: white;
            width: 80%;
            height: 490px;
            margin-left: 10%;
            border-radius:10px;
            margin-top:50px;
        }

        .text{
            margin-left: 600px;
            margin-top: -383px;
        }

        .rupees{
            color: #2288ff;
            font-size: 26px;
            font-weight: bolder;
        }

        .house-name{
            margin-top: 13px;
            font-size: 22px;
            font-weight: 600;
        }

        .bx{
            color: #2288ff;
            font-size: 20px;
        }

        .location{
            margin-top: 13px;
            font-size: 18px;
        }

        .info{
            background-color: #F0F0F0;
            height: 170px;
            width: 440px;
            margin-left: 590px;
            margin-top: 15px;
            border-radius: 10px;
        }

        .info-text{
            margin-left: 30px;
            color: #808080	;
            font-size: 17px;
        }

        .colum2{
            margin-left: 200px;
            margin-top: -100px;
        }

        .btn2{
            width: 440px;
            height: 40px;
            padding: 9px 25px;
            margin-left: 590px;
            margin-top: 20px;
            background-color: black;
            color: #2288ff;
            border: none;
            border-radius: 50px;
            cursor: pointer;
            transition: all 0.3s ease 0s;
            font-size: 16px;
            font-weight: 600;
        }

        .btn2:hover{
            color: white;
            background-color: #3492fd;
            transition: .3s;
            transform: scale(110%);
        }

		.image img:hover{
			transform:scale(110%);
			box-shadow:0 0 10px #000;
			transition:0.6s;
		}
    </style>
</head>
<body>
	<%
		if(session.getAttribute("tenant")==null){
			response.sendRedirect("error.jsp");
		}
	%>
	<script>
	    function redirectPage() {
	        // Replace 'destination_page.html' with the actual URL where you want to redirect
	        window.location.href = 'tenant_logout.jsp';
	    }
	</script>
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
    <div class="heading"><h1>House Details</h1></div>

    <div class="properties">
		<%
			try{
				String house_id=request.getParameter("house_id");
				String owner_id=request.getParameter("owner_id");
				Class.forName("com.mysql.jdbc.Driver");
				Connection con=DriverManager.getConnection("jdbc:mysql://localhost/house_renting","root","");
				//PreparedStatement p=con.prepareStatement("select *from house_details where house_id=");
				//p.setString(1,house_id);
				Statement s=con.createStatement();
				ResultSet r=s.executeQuery("select *from house_details where house_id='"+house_id+"'");
				if(r.next()){
		%>
        <div class="image"><img src="../uploads/<%= r.getString("img") %>" alt="HOUSE IMAGE" style="width: 500px ; height: 380px; margin-top: 50px; margin-left: 50px;"></div>

        <div class="text">
            <div class="rupees">Rent: <%= r.getString("rent_of_house")  %>$</div>

            <div class="house-name">Address: <%= r.getString("address") %><br></div>

            <div class="location">
                <i class='bx bxs-edit-location'></i> <%= r.getString("area") %>
            </div>
        </div>

        <div class="info">

            <div class="info-text" >
                <div class="colum1">
                    <br><i class='bx bxs-home'></i> <%= r.getString("house_type") %> <br><br>
                    <i class='bx bxs-bed'></i>Bedrooms: <%= r.getString("num_of_bedrooms") %> <br><br>
                    <i class='bx bxs-bath'></i>Bathrooms: <%= r.getString("num_of_bathrooms") %>
                </div>

				<%
					Class.forName("com.mysql.jdbc.Driver");
					Connection con1=DriverManager.getConnection("jdbc:mysql://localhost/house_renting","root","");
					//PreparedStatement p1=con1.prepareStatement("select *from owner_details where owner_id=?");
					//p1.setString(1,owner_id);
					Statement s1=con.createStatement();
					ResultSet r1=s1.executeQuery("select *from owner_details where owner_id='"+owner_id+"'");
					if(r1.next()){
				%>
                <div class="colum2">
                    <i class='bx bx-male'></i>Name: <%= r1.getString("name") %> <br><br>
                    <i class='bx bxs-contact'></i> <%= r1.getString("contact_no") %> 
                </div>
                <%} %>
            </div>
        </div>
		
	    
        <div>
        	<form action="approvedRequest.jsp" method="POST">
			    <% String tid = request.getParameter("tenant_id"); %>
			    <input type="hidden" name="house_id" value="<%= r.getString("house_id") %>">
			    <input type="hidden" name="owner_id" value="<%= r.getString("owner_id") %>">
			    <input type="hidden" name="tenant_id" value="<%= tid %>">
			    <input type="hidden" name="rent" value="<%= r.getString("rent_of_house") %>">
			    <input type="submit" value="Home page" class="btn2">
			</form>        
        </div>
    </div>
    <%}
			}catch(Exception e){
				out.println(e);
			}
		%>	
</body>
</html>