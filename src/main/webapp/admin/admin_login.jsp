<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="house_renting_platform.DbConnection" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Login Page</title>
    <link rel="stylesheet" href="admin_style.css">
    <!-- Box-Icons -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">
</head>
<body>
    <header>
        <div class="nav container">
            <!-- Logo -->
            <a href="../home.jsp" class="logo"><i class='bx bx-home-heart'></i>House <br> Rental</a>

            <!-- Home page Button -->
            <a href="../home.jsp" class="btn">Home</a>
        </div>
    </header>
    <div class="login container">
        <div class="login-container">
            <h2>Admin Login To Continue</h2>
            <p>Log in with your data that you entered during your registration</p>
            <!-- Login form -->
            <form action="admin_login.jsp" method="POST">
            	<%
            		if(session.getAttribute("admin") != null)
					{
						response.sendRedirect("admin_dashboard.jsp");
					}
				%>
				
				<%
					if(session.getAttribute("AdminErrorLogin") != null)
					{
						out.println((String)session.getAttribute("AdminErrorLogin"));
					}
				%>
                <span>Enter your username</span>
                <input type="text" name="username" placeholder="Enter username" pattern="[A-Za-z0-9]+" title="Only letters and numbers are allowed" required>
                <span>Enter your password</span>
                <input type="password" name="password" placeholder="Enter password" pattern="[a-z0-9A-Z@!#$%^&*]{5,10}" title="please enter valid pattern" required>
                <input type="submit" value="Log in" class="button">
            </form>
        </div>
        <img src="img/admin_login.png" height="63%" width="73%">
    </div>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
    <%
		String username=request.getParameter("username");
		String password=request.getParameter("password");
            
		if(username==null && password==null){
		}
            
		else{
            Connection con=null;
			try{
				con=DbConnection.getConnection();
				PreparedStatement p=con.prepareStatement("select *from admin_details where name=? AND password=?");
				p.setString(1,username);
				p.setString(2,password);
				ResultSet r=p.executeQuery();
				if(r.next()){
                    session.setAttribute("admin","admin");
                    session.setAttribute("manage_owner","manage_owner");
        			response.sendRedirect("admin_dashboard.jsp");
	%>
            	<script type="text/javascript">
	                Swal.fire({
                    	icon: 'success',
                    	title: 'Login successfull',
                    	text: 'welcome to the Admin dashboard',
                    	confirmButtonColor: '#3085d6',
                    	confirmButtonText: 'OK'
                  	});
            	</script>		
            
				<!-- js script for page redirection -->
				<script>
	        		setTimeout(function() {
			           window.location.href = "admin_dashboard.jsp";
		        	}, 2000); // 2000 milliseconds (2 seconds) delay
				 </script>		
        <%		}
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
            }finally{
            	//close connection
            	con.close();
            }
        }
        %>
</body>
</html>