<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.Date" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Feedback</title>
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

        body{
            background-color: #f2f2f2;
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
            left : 705px;
            border-top-left-radius: 5px;
            border-top-right-radius: 5px;
            transition: 0.3s;
        }

        ul li:nth-child(2):hover ~ .bottom{
            left: 138px;
        }

        ul li:nth-child(3):hover ~ .bottom{
            left: 320px;
        }
        
        ul li:nth-child(4):hover ~ .bottom{
            left: 520px;
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

        input[type=text], select, textarea {
            width: 100%;
            padding: 12px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
            margin-top: 6px;
            margin-bottom: 16px;
            resize: vertical;
        }

        .container {
        border-radius: 5px;
        background-color: #f2f2f2;
        /* padding: 20px; */
        margin-top: 50px;
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
        <ul class="navlink" style="width:120%">
            <li><a href="tenant_dashboard.jsp">Home</a></li>
            <li><a href="properties.jsp">Properties</a></li>
            <li><a href="Request.jsp">Rental Requests</a></li>
            <li><a href="Request.jsp">Approved Requests</a></li>	
            <li><a href="Feedback.jsp">Feedback</a></li>
            <div class="bottom"></div>
        </ul>
        <button onclick="redirectPage()" class="btn btn-success">Log out</button>
    </div>
 	
    <div class="container" style="margin-top:30px;">
    	<h2>Feedback Form</h2>
        <form action="Feedback.jsp" method="POST">
          <label for="fname">Name</label>
          <input type="text" id="name" name="name" placeholder="Enter Your Name">
      
          <label for="lname">Email</label>
          <input type="text" id="lname" name="email" placeholder="Enter Your Email ID">
      
          <label for="lname">Contact</label>
          <input type="text" id="lname" name="contact" placeholder="Enter Your Contact number">
      
          <label for="subject">Subject</label>
          <textarea id="subject" name="subject" placeholder="Write something.." style="height:140px"></textarea>
      
          <input type="submit" class="btn btn-primary" value="Submit" style="height: 45px; width: 120px;">
        </form>
      </div>      
      <%
      		try{
      			Date currentDate = new Date();
      	      	String id = (String) session.getAttribute("id");
      			String name=request.getParameter("name");
      			String email=request.getParameter("email");
      			String contact=request.getParameter("contact");
      			String subject=request.getParameter("subject");
      	      	Class.forName("com.mysql.jdbc.Driver");
      	      	Connection con=DriverManager.getConnection("jdbc:mysql://localhost/house_renting","root","");
      	      	PreparedStatement p=con.prepareStatement("insert into feedback_details(tenant_id,name,email,contact,subject,date) values(?,?,?,?,?,?)");
      	      	p.setString(1, id);
      	      	p.setString(2,name);
      	      	p.setString(3,email);
      	      	p.setString(4,contact);
      	      	p.setString(5,subject);
      	        p.setString(6, new java.text.SimpleDateFormat("dd-MM-yyyy").format(currentDate));
      	        p.execute();
      	%>
      	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
			        <!-- sweetalert for alert message -->
			        <script type="text/javascript">
			            Swal.fire({
			                icon: 'success',
			                title: 'Feedback successfull',
			                text: 'Feedback submited Successfully..!!',
			                confirmButtonColor: '#3085d6',
			                confirmButtonText: 'OK'
			              });
			        </script>
			       	<script>
			        			setTimeout(function() {
						            window.location.href = "Feedback.jsp";
						        }, 2000); // 2000 milliseconds (2 seconds) delay
					</script>
      	<%
      		}catch(Exception e){
      			System.out.println(e);
      		}
      %>
      
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
		    				p4.setString(5,"show feedback page");
		    				p4.executeUpdate();
		    			}
		    		}catch(Exception e){
		    			e.printStackTrace();
		    		}

            	%>
</body>
</html>