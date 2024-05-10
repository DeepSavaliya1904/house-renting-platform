<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tenant Registration</title>
    <link rel="stylesheet" href="tenant_reg.css">
    <!-- Box-Icons -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">
</head>
<body>
    <header>
        <div class="nav container">
            <!-- Logo -->
            <a href="../home.jsp" class="logo"><i class='bx bx-home-heart'></i>House <br> Rental</a>

            <!-- Login Button -->
            <a href="tenant_login.jsp" class="btn">Log In</a>
        </div>
    </header>
    <div class="login container">
        <div class="login-container">
            <h2>Welcome Tenant , Let's get started</h2>
            <!-- Registartion form -->
            <form action="tenant_registration.jsp" method="POST">
                <span>Username</span>
                <input type="text" name="username" pattern="[A-Za-z0-9]+" placeholder="Enter your Username" title="Only letters and numbers are allowed" required>
                <span>Password</span>
                <input type="password" name="password" pattern="{5,12}" placeholder="Enter your password" title="please create valid password" required>
                <span>Contact no</span>
                <input type="text" name="contact_no" pattern="[0-9]{10}" placeholder="Enter your contact no" title="please enter valid mobile no" required>
                <span>Email address</span>
                <input type="email" name="email_id" placeholder="youremail@gmail.com" required>
                <span>Gender</span>
                <input type="text" name="gender" placeholder="Male/Female/Other" required>
                <span>Caste</span>
                <input type="text" name="caste" placeholder="Enter your caste" required>
                <span>Adharno</span>
                <input type="text" name="adharno" pattern="\d{4}-\d{4}-\d{4}" placeholder="XXXX-XXXX-XXXX" title="Enter a valid Aadhaar number (XXXX-XXXX-XXXX)" required>
                <input type="submit" value="Register" class="button">
                <p>
                	Already have account? <a href="tenant_login.jsp">Login</a>
                </p>
            </form>
        </div>
	<div class="login-image">
		<img src="img/tenant_login.jpg" width="600" height="400">
	</div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
    <% 
        String username=request.getParameter("username");
        String password=request.getParameter("password");
        String contact=request.getParameter("contact_no");
        String email=request.getParameter("email_id");
        String gender=request.getParameter("gender");
        String cast=request.getParameter("caste");
        String adharno=request.getParameter("adharno");
        
        if(username==null && password==null && contact==null && email==null && gender==null && cast==null && adharno==null){
            
        }
        
        else{
            try{
                Class.forName("com.mysql.jdbc.Driver");
                Connection con=DriverManager.getConnection("jdbc:mysql://localhost/house_renting","root","");
                PreparedStatement p=con.prepareStatement("insert into tenant_details(name,password,contact_no,email_id,gender,cast,adharno) values(?,?,?,?,?,?,?)");
                p.setString(1,username);
                p.setString(2,password);
                p.setString(3,contact);
                p.setString(4,email);
                p.setString(5,gender);
                p.setString(6,cast);
                p.setString(7,adharno);
                p.execute();%>
            
            <script type="text/javascript">
                Swal.fire({
                    icon: 'success',
                    title: 'Validation success',
                    text: 'Tenant successfull register',
                    confirmButtonColor: '#3085d6',
                    confirmButtonText: 'OK'
                  });
            </script>
            	<script>
        			setTimeout(function() {
			            window.location.href = "tenant_login.jsp";
			        }, 2000); // 2000 milliseconds (2 seconds) delay
			</script>
                
        <%	}catch(Exception e){
                out.println(e);
            }
        }
    %>
</body>
</html>