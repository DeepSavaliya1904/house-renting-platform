<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Tenant</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <style>
        form {
            width: 600px;
            margin-left: 60vh;
        }

        .form-floating {
            margin-bottom: 15px;
        }

        input {
            height: 45px;
            width: 340px;
        }

        h5 {
            margin-left: 14vh;
            margin-bottom: 17px;
        }
    </style>
</head>
<body>
	        <%
					if(session.getAttribute("admin") == null)									
					{
						response.sendRedirect("error.jsp");							
					}
			%>
    <nav class="navbar navbar-expand-lg" style="background-color: #2288ff;">
        <div class="container-fluid">
            <a class="navbar-brand text-light" href="../home.html" style="margin-left: 20px;"><i class='bx bx-home-heart'></i> House Renting Platform</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="navbar">
                <form class="container-fluid justify-content-start">
                    <button class="btn btn-outline-dark me-2 text-light" type="button"><a href="../home.html" style="text-decoration:none; color:#fff;">Home</a></button>
                    <button class="btn btn-outline-dark me-2 text-light" type="button"><a href="admin_dashboard.jsp" style="text-decoration:none; color:#fff;">Admin</a></button>
                </form>
            </div>
        </div>
    </nav>
    <br><br>
    <form action="update_tenant.jsp" method="POST">
        <%
            int id = Integer.parseInt(request.getParameter("id"));
            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost/house_renting", "root", "");
                PreparedStatement p = con.prepareStatement("select * from tenant_details where tenant_id=?");
                p.setInt(1, id);
                ResultSet r = p.executeQuery();
                while (r.next()) {
        %>
        <div class="form-floating mb-3">
            <input type="text" class="form-control" id="id" name="id" placeholder="Enter your id" value="<%= r.getString("tenant_id") %>" readonly>
            <label for="id">ID</label>
        </div>
        <div class="form-floating mb-3">
            <input type="text" class="form-control" id="name" name="name" placeholder="Enter your name" value="<%= r.getString("name") %>">
            <label for="name">Name</label>
        </div>
        <div class="form-floating mb-3">
            <input type="password" class="form-control" id="password" name="password" placeholder="Enter your password" value="<%= r.getString("password") %>">
            <label for="password">Password</label>
        </div>
        <div class="form-floating mb-3">
            <input type="tel" class="form-control" id="contactNo" name="contactNo" placeholder="+91 9345854854" value="<%= r.getString("contact_no") %>">
            <label for="contactNo">Contact No</label>
        </div>
        <div class="form-floating mb-3">
            <input type="email" class="form-control" id="email" name="email" placeholder="name@example.com" value="<%= r.getString("email_id") %>">
            <label for="email">Email ID</label>
        </div>
        <div class="form-floating mb-3">
            <input type="text" class="form-control" id="gender" name="gender" placeholder="Enter gender" value="<%= r.getString("gender") %>">
            <label for="gender">Gender</label>
        </div>
        <div class="form-floating mb-3">
            <input type="text" class="form-control" id="caste" name="caste" placeholder="Enter caste" value="<%= r.getString("cast") %>">
            <label for="caste">Caste</label>
        </div>
        <div class="form-floating mb-3">
            <input type="text" class="form-control" id="adharno" name="adharno" placeholder="Enter your adhar no" value="<%= r.getString("adharno") %>">
            <label for="adharno">Adhar no</label>
        </div>
        <br>
        <%
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
    %>
    <input type="submit" name="submit" class="btn btn-outline-primary me-3" style="width: 100px; height: 45px; margin-top: -20px;" value="Update">
</form>
<br><br><br>
<%
    int t_id = Integer.parseInt(request.getParameter("id"));
    String t_name = request.getParameter("name");
    String password = request.getParameter("password");
    String contactNo = request.getParameter("contactNo");
    String email = request.getParameter("email");
    String gender = request.getParameter("gender");
    String caste = request.getParameter("caste");
    String adharno = request.getParameter("adharno");

    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost/house_renting", "root", "");
        PreparedStatement p = con.prepareStatement("update tenant_details set name=?, password=?, contact_no=?, email_id=?, gender=?, cast=?, adharno=? where tenant_id=?");
        p.setString(1, t_name);
        p.setString(2, password);
        p.setString(3, contactNo);
        p.setString(4, email);
        p.setString(5, gender);
        p.setString(6, caste);
        p.setString(7, adharno);
        p.setInt(8, t_id);
        p.executeUpdate();
		
        response.sendRedirect("manage_tenant.jsp");
    } catch (Exception e) {
        e.printStackTrace();
    }
%>
</body>
</html>
