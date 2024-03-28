<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.Date" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Take On Rent</title>
</head>
<body>
	<%
		Date currentDate = new Date();
		String id = (String) session.getAttribute("id");
		String house_id=request.getParameter("house_id");
		String owner_id=request.getParameter("owner_id");
		String rent=request.getParameter("rent");
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost/house_renting","root","");
		PreparedStatement p=con.prepareStatement("select *from tenant_details where tenant_id=?");
		p.setString(1,id);
		ResultSet r=p.executeQuery();
		if(r.next()){
			Class.forName("com.mysql.jdbc.Driver");
			Connection con1=DriverManager.getConnection("jdbc:mysql://localhost/house_renting","root","");
			PreparedStatement p1=con1.prepareStatement("insert into renting_details(house_id,tenant_id,owner_id,tenant_name,date,rent_price,request) values(?,?,?,?,?,?,?)");
			p1.setString(1,house_id);
			p1.setString(2,id);
			p1.setString(3,owner_id);
			p1.setString(4,r.getString("name"));
			p1.setString(5, new java.text.SimpleDateFormat("dd-MM-yyyy").format(currentDate));
			p1.setString(6,rent);
			p1.setString(7,"pending");
			p1.executeUpdate();%>
			
		
    	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
        <!-- sweetalert for alert message -->
        <script type="text/javascript">
            Swal.fire({
                icon: 'success',
                title: 'successfull',
                text: 'Request send Successfull',
                confirmButtonColor: '#3085d6',
                confirmButtonText: 'OK'
              });
        </script>
       	<script>
        			setTimeout(function() {
			            window.location.href = "properties.jsp";
			        }, 2000); // 2000 milliseconds (2 seconds) delay
		</script>
	<%
		}else{
	%>
		    <script type="text/javascript">
             Swal.fire({
                  icon: 'error',
                  title: 'Failed',
                  text: 'Ooppss..!!! Request not sent',
                  confirmButtonColor: '#3085d6',
                  confirmButtonText: 'OK'
                });
            </script>
	<%} %>
	

</body>
</html>