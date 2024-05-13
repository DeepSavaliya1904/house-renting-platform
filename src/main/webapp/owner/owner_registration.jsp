<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="house_renting_platform.DbConnection" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Owner Registration</title>
    <link rel="stylesheet" href="owner_style.css">
    <!-- Box-Icons -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">
</head>
<body>
    <header>
        <div class="nav container">
            <!-- Logo -->
            <a href="../home.jsp" class="logo"><i class='bx bx-home-heart'></i>House <br> Rental</a>

            <!-- Login Button -->
            <a href="owner_login.jsp" class="btn">Log In</a>
        </div>
    </header>
    <div class="login container">
        <div class="login-container">
            <h2>Welcome Owner,Let's get started</h2>
            <!-- Registartion form -->
            <form action="owner_registration.jsp" method="POST">
                <span>Username</span>
                <input type="text" name="username" pattern="[A-Za-z0-9]+" title="Only letters and numbers are allowed" placeholder="Enter your username" required>
                <span>Password</span>
                <input type="password" name="password" pattern="{5,12}" title="please create valid password" placeholder="Enter your password" required>
                <span>Contact no</span>
                <input type="text" name="contact_no" pattern="[0-9]{10}" placeholder="Enter your contact no" title="please enter valid mobile no" required>
                <span>Email address</span>
                <input type="email" name="email_id"  placeholder="youremail@gmail.com" required>
                <span>Age</span>
                <input type="text" name="age" placeholder="Enter your age" required>
                <input type="submit" value="Register" class="button">
                <p>Already have account? <a href="owner_login.jsp">Login</a></p>
            </form>
        </div>
	<div class="login-image">
		<img src="img/owner_login.png" width="500" height="450" style="margin-top:2px;">
	</div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
		<% 
			String username=request.getParameter("username");
			String password=request.getParameter("password");
			String contact=request.getParameter("contact_no");
			String email=request.getParameter("email_id");
			String age=request.getParameter("age");
			Connection con=null;
				try{
					con=DbConnection.getConnection();
					PreparedStatement p=con.prepareStatement("insert into owner_details(name,password,contact_no,email_id,age) values(?,?,?,?,?)");
					p.setString(1,username);
					p.setString(2,password);
					p.setString(3,contact);
					p.setString(4,email);
					p.setString(5,age);
					p.execute();%>
				
				<script type="text/javascript">
				    Swal.fire({
				        icon: 'success',
				        title: 'Validation success',
				        text: 'Owner successfull register',
				        confirmButtonColor: '#3085d6',
				        confirmButtonText: 'OK'
				      });
				</script>
				
				<!-- js script for page redirection -->
				<script>
        			setTimeout(function() {
			            window.location.href = "owner_login.jsp";
			        }, 2000); // 2000 milliseconds (2 seconds) delay
			    </script>
					
			<%	
				}catch(Exception e){
					System.out.println(e);
				}finally{
					//close connection
					con.close();
				}
			%>
</body>
</html>