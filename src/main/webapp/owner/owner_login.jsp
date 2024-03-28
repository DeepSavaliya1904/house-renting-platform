<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.Date" %>
<%! String id = null; %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Owner Login Page</title>
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
            <a href="owner_registration.jsp" class="btn">Sign Up</a>
        </div>
    </header>
    <div class="login container">
        <div class="login-container">
            <h2>Owner Login To Continue</h2>
            <p>Log in with your data that you entered during your registration</p>
            <!-- Login form -->
            <form action="owner_login.jsp" method="POST">
                <span>Enter your username</span>
                <input type="text" name="username" placeholder="Enter username" pattern="[A-Za-z0-9]+" title="Only letters and numbers are allowed" required>
                <span>Enter your password</span>
                <input type="password" name="password" placeholder="Enter password" pattern="[a-z0-9A-Z@!#$%^&*]{5,8}" title="please enter valid pattern" required>
                <input type="submit" value="Log in" class="button">
                </form>
                <center>OR</center>
            </form>
            <a href="owner_registration.jsp" class="btn">Sign up now</a>
        </div>
        <img src="img/owner_login.png" height="450" width="500" style="margin-left:120px; margin-top:40px">
    </div>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
			<%
				String username=request.getParameter("username");
				String password=request.getParameter("password");
				
				if(username==null && password==null){
				}
				
				else {
				    try {
				        Class.forName("com.mysql.jdbc.Driver");
				        Connection con = DriverManager.getConnection("jdbc:mysql://localhost/house_renting", "root", "");
				        PreparedStatement p = con.prepareStatement("select * from owner_details where name=? AND password=?");
				        p.setString(1, username);
				        p.setString(2, password);
				        ResultSet r = p.executeQuery();
				        if (r.next()) {
				            id = r.getString("owner_id");
				            session.setAttribute("id", id);
				            try {
				                Date currentDate = new Date();
				                Class.forName("com.mysql.jdbc.Driver");
				                Connection con1 = DriverManager.getConnection("jdbc:mysql://localhost/house_renting", "root", "");
				                PreparedStatement p1 = con1.prepareStatement("insert into login_details(login_as,username,password, date, time) values(?,?,?,?,?)");
				                p1.setString(1, "owner");
				                p1.setString(2, username);
				                p1.setString(3,password);
				                p1.setString(4, new java.text.SimpleDateFormat("YYYY-MM-dd").format(currentDate));
				                p1.setString(5, new java.text.SimpleDateFormat("HH:mm:ss").format(currentDate));

				                // Execute the update to insert login details
				                p1.executeUpdate();
				            } catch (Exception e) {
				                e.printStackTrace();
				            }
			%>
				
				<!-- sweetalert for alert message -->
				<script type="text/javascript">
				    Swal.fire({
				        icon: 'success',
				        title: 'Login successfull',
				        text: 'welcome to the House renting platform Owner dashboard',
				        confirmButtonColor: '#3085d6',
				        confirmButtonText: 'OK'
				      });
				</script>
				
				<!-- js script for page redirection -->
				<script>
        			setTimeout(function() {
			            window.location.href = "owner_dashboard.jsp";
			        }, 2000); // 2000 milliseconds (2 seconds) delay
			    </script>		
			<%		
					}
					else{
			%>
					<script type="text/javascript">
					 Swal.fire({
					      icon: 'error',
					      title: 'Login Failed',
					      text: 'Please enter valid username and password',
					      confirmButtonColor: '#3085d6',
					      confirmButtonText: 'OK'
					    });
					</script>
			<%      }
				}catch(Exception e){
					out.println(e);
				}
			}
			%>
</body>
</html>