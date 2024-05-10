<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.Date" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tenant Dashboard</title>
    <!-- Box-Icons -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
	<style type="text/css">
		@charset "ISO-8859-1";
		@import url('https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap');
		
		*{
		    margin: 0;
		    padding: 0;
		    text-decoration: none;
		    font-family: 'Poppins', sans-serif;
		}
		
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
		    left : 5px;
		    border-top-left-radius: 5px;
		    border-top-right-radius: 5px;
		    transition: 0.3s;
		}
		
		ul li:nth-child(2):hover ~ .bottom{
		    left: 138px;
		}
		
		ul li:nth-child(3):hover ~ .bottom{
		    left: 315px;
		}
		
		ul li:nth-child(4):hover ~ .bottom{
		    left: 530px;
		}
		
		ul li:nth-child(5):hover ~ .bottom{
		    left: 720px;
		}
		
		button{
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
		
		button:hover{
		    color: white;
		    background-color: #3492fd;
		    transition: .3s;
		    transform: scale(110%);
		}
		
		section{
		    height: 90vh;
		    width: 100%;
		    background: url(img/Tenant_Dashboard.jpg);
		    background-size: cover;
		    background-repeat: no-repeat;
		}
		
		.text{
		    color: black;
		    width: 500px;
		    margin-left: 100px;
		    margin-bottom: 100px;
		}
		
		.text h1{
		    font-size: 40px;
		}
		
		.text .headtext{
		    color: #2288ff;
		    font-size: 40px;
		}
		
		.text p{
		    font-size: 18px;
		    text-align: justify;
		    /* margin-top: -20px; */
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
	        window.location.href = 'tenant_logout.jsp';
	    }
	</script>
    <!-- Homepage -->
    <div class="navbar">
        <a href="../home.jsp" class="logo"><i class='bx bx-home-heart'></i>House <br> Rental</a>
        <ul class="navlink" style="width:120%">
            <li><a href="tenant_dashboard.jsp">Home</a></li>
            <li><a href="properties.jsp">Properties</a></li>
            <li><a href="Request.jsp">Rental Requests</a></li>
            <li><a href="approvedRequest.jsp">Approved Requests</a></li>	
            <li><a href="Feedback.jsp">Feedback</a></li>
            <div class="bottom"></div>
        </ul>
        <button onclick="redirectPage()" class="btn btn-primary">Log out</button>
    </div>
    <section>
        <div class="text">
            <br><br><br><br><br><br><br><br>
            <h1>Welcome 
            	<%
    		try{
    			String id = (String) session.getAttribute("id");
    			Class.forName("com.mysql.jdbc.Driver");
    			Connection con=DriverManager.getConnection("jdbc:mysql://localhost/house_renting","root","");
    			//PreparedStatement p=con.prepareStatement("select *from tenant_details where tenant_id=?");
    			//p.setString(1,id);
    			Statement s=con.createStatement();
    			ResultSet r=s.executeQuery("select *from tenant_details where tenant_id='"+id+"'");
    			if(r.next()){
    				out.println(r.getString(2));
    				Date currentDate = new Date();
    		    	Class.forName("com.mysql.jdbc.Driver");
    				Connection con4=DriverManager.getConnection("jdbc:mysql://localhost/house_renting","root","");
    				PreparedStatement p4=con4.prepareStatement("insert into track_activity(Username,Role,Date,Time,Activity) values(?,?,?,?,?)");
    				p4.setString(1,r.getString("name"));
    				p4.setString(2,"tenant");
    				p4.setString(3,new java.text.SimpleDateFormat("YYYY-MM-dd").format(currentDate));
    				p4.setString(4,new java.text.SimpleDateFormat("HH:mm:ss").format(currentDate));
    				p4.setString(5,"Visit Tenant Homepage");
    				p4.executeUpdate();
    			}
    		}catch(Exception e){
    			e.printStackTrace();
    		}

            	%>
            
            ,</h1>
            <h1><div class="headtext">House Renting Platform </div><div class="text2">Find Home Easily</div></h1><br>
            <p>Discover your ideal home effortlessly with our online house rental platform. 
                Browse through a diverse range of listings, find the perfect space, and secure 
                your next living experience seamlessly.</p>
                
        <a class="btn btn-success" href="properties.jsp">View More</a>
            </div>
    </section>
</body>
</html>