<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.Date" %>
<%@ page import="org.json.JSONArray, org.json.JSONObject" %>

<%! String id = null; %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tenant Login Page</title>
    <link rel="stylesheet" href="tenant_style.css">
    <!-- Box-Icons -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">
</head>
<body>
	<%
		if(session.getAttribute("tenant")!=null){
			response.sendRedirect("tenant_dashboard.jsp");
		}
	%>
    <header>
        <div class="nav container">
            <!-- Logo -->
            <a href="../home.jsp" class="logo"><i class='bx bx-home-heart'></i>House <br> Rental</a>

            <!-- Login Button -->
            <a href="tenant_registration.jsp" class="btn">Sign Up</a>
        </div>
    </header>
    <div class="login container">
        <div class="login-container">
            <h2>Tenant Login To Continue</h2>
            <p>Log in with your data that you entered during your registration</p>
            <!-- Login form -->
            <form action="tenant_login.jsp" method="POST">
                <span>Enter your username</span>
                <input type="text" name="username" placeholder="Enter username" title="Only letters and numbers are allowed" required>
                <span>Enter your password</span>
                <input type="password" name="password" placeholder="Enter password" title="please enter valid pattern" required>
                <input type="submit" value="Log in" class="button">
                <center>OR</center>
            </form>
            <a href="tenant_registration.jsp" class="btn">Sign up now</a>
        </div>
        <img src="img/tenant_login.jpg" height="63%" width="93%" style="margin-left:60px; margin-top:50px;">
    </div>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
    <%
        String username=request.getParameter("username");
        String password=request.getParameter("password");
        
        if(username==null && password==null){
        }
        
        else{
            try{
            	Class.forName("com.mysql.jdbc.Driver");
                Connection con=DriverManager.getConnection("jdbc:mysql://localhost/house_renting","root","");
                String query = "select *from tenant_details where name='"+ username +"' AND password='" + password + "'";
               // PreparedStatement p=con.prepareStatement("select *from tenant_details where name=? AND password=?");
                //p.setString(1,username);
                //p.setString(2,password);
                Statement s=con.createStatement();
                ResultSet r=s.executeQuery(query);
                JSONArray array = new JSONArray();
                JSONObject obj = new JSONObject();
                 if(r.next()){
                    id = r.getString("tenant_id");
		            session.setAttribute("id", id);
		            session.setAttribute("tenant", "tenant");
		            try {
		            	obj.put("tenant_id",r.getString("tenant_id"));
		            	obj.put("tenant_name",r.getString("name"));
		            	obj.put("password",r.getString("password"));
		            	obj.put("contact_no",r.getString("contact_no"));
		            	obj.put("email_id",r.getString("email_id"));
		            	obj.put("gender",r.getString("cast"));
		            	obj.put("adharno",r.getString("adharno"));
		                array.put(obj);
		                request.setAttribute("jsonData", array.toString());
						System.out.println(array.toString());
		                Date currentDate = new Date();
		                Class.forName("com.mysql.jdbc.Driver");
		                Connection con1 = DriverManager.getConnection("jdbc:mysql://localhost/house_renting", "root", "");
		                PreparedStatement p1 = con1.prepareStatement("insert into login_details(login_as,username,password, date, time) values(?,?,?,?,?)");
		                p1.setString(1, "tenant");
		                p1.setString(2, username);
		                p1.setString(3,password);
		                p1.setString(4, new java.text.SimpleDateFormat("dd-MM-yyyy").format(currentDate));
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
                text: 'Welcome to the House Renting Platform',
                confirmButtonColor: '#3085d6',
                confirmButtonText: 'OK'
              });
        </script>
       	<script>
        			setTimeout(function() {
			            window.location.href = "tenant_dashboard.jsp";
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
                  text: 'Please enter valid username and password...!!!',
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