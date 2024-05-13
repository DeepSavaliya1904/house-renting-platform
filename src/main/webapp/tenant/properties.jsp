<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.Date" %>
<%@ page import="house_renting_platform.DbConnection" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tenant Properties</title>
    <link rel="stylesheet" href="Style.css">
    <!-- Box-Icons -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
	<style type="text/css">
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
			
			.navbar ul{
			    position: absolute;
			    left: 25%;
			    right: 50%;
			    margin-top: 10px;
			    border-radius: 10px;
			    display: flex;
			}
			
			.navbar ul li{
			    list-style: none;
			    margin-top: 15px;
			}
			.navbar ul li a{
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
			
			.navbar ul li a:hover{
			    color: #2288ff;
			}
			
			.bottom{
			    position: absolute;
			    width: 100px;
			    height: 7px;
			    background: #2288ff;
			    bottom: -20px;
			    left : 138px;
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
			
			.navbar ul li:nth-child(4):hover ~ .bottom{
			    left: 530px;
			}
			
			.navbar ul li:nth-child(5):hover ~ .bottom{
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
				
		
			.properties{
			    height: 245vh;
			    width: 100%;
			    /* background-color: #000;  */
			}
			.properties .menu{
			    width: 100%;
			    padding: 70px 0;
			}
			
			.properties .menu h1{
			    font-size:40px;
			    display: flex;
			    align-items: center;
			    justify-content: center;
			    margin-bottom: 30px;
			    margin-top: -110px;
			}
			
			.properties .menu h1 span{
			    color: var(--main-color);
			    margin-left: 15px;
			    font-family: mv boli;
			}
			
			/*.menu h1 span::after{
			    content: '';
			    width: 100%;
			    height: 2px;
			    background: var(--main-color);
			    display: block;
			    position: relative;
			    bottom: 15px;
			}*/
			
			.properties	.menu .menu_box{
			    width: 98%;
			    margin: 0 auto;
			    display: grid;
			    grid-template-columns: 1fr 1fr 1fr 1fr;
			    grid-gap: 10px;
			}
			
			.properties .menu .menu_box .menu_card{
			    width: 325px;
			    height: 580px;
			    padding-top: 10px;
			    margin-bottom: 20px;
			    box-shadow: 0 0 10px rgba(0,0,0,0.2);
			}
			
			.properties .menu .menu_box .menu_card:hover{
			    box-shadow: 0 0 20px #000;
			    transition: 1s;
			}
			
			.properties .menu .menu_box .menu_card .menu_info ul{
			    display: flex;
			}
			
			.properties .menu .menu_box .menu_card .menu_info ul li{
			    margin-left: 10px;
			    color: #a09c9c;
			    list-style:none; 
			}
			
			.properties .menu .menu_box .menu_card .menu_image{
			    width: 300px;
			    height: 245px;
			    margin: 0 auto;
			    overflow: hidden;
			}
			
			.properties .menu .menu_box .menu_card .menu_image img{
			    width: 100%;
			    height: 100%;
			    object-fit: cover;
			    object-position: center;
			    transition: 0.3s;
			}
			.properties .menu .menu_box .menu_card .menu_image:hover img{
			    transform: scale(1.1);
			}
			
			.properties .menu .menu_box .menu_card .small_card{
			    height: 45px;
			    width: 45px;
			    float: right;
			    position: relative;
			    top: -240px;
			    right: -8px;
			    opacity: 0;
			    border-radius: 7px;
			    transition: 0.3s;
			}
			
			
			.properties .menu .menu_box .menu_card:hover .small_card{
			    position: relative;
			    top: -240px;
			    right: 20px;
			    opacity: 1;
			}
			
			.properties .menu .menu_box .menu_card .small_card i{
			    font-size: 25px;
			    display: flex;
			    align-items: center;
			    justify-content: center;
			    line-height: 50px;
			    columns: #000;
			    cursor: pointer;
			    text-shadow: 0 0 6px #000;
			    transition: 0.2s;
			}
			
			.properties .menu .menu_box .menu_card .small_card i:hover{
			    color: #DE3163;
			}
			
			.properties .menu .menu_box .menu_info h2{
			    text-align: center;
			    justify-content: center;
			    padding: 10px 10px;
			    color: var(--main-color);
			}
			
			.properties .menu .menu_box .menu_info p{
			    text-align: center;
			    justify-content: center;
			    text-align: center;
			    margin-top: 8px;
			}
			
			.properties .menu .menu_box .menu_info h3{
			    text-align: center;
			    justify-content: center;    
			    margin-top: 18px;
			    font-size: 20px;
			}
			
			.properties .menu .menu_box .menu_info .menu_icon{
			    text-align: center;
			    margin-top: 9px;
			    color: #fac031;
			}
			
			.properties .menu .menu_box .menu_info .menu_btn{
			    display: flex;
			    align-items: center;
			    justify-content: center;
			    text-decoration: none;
			    height: 32px;
			    width: 130px;
			    background-color: black;
			    color: white;
			    margin-top: 15px;
			    margin-left: 100px;
			}
			
			.properties .menu .menu_box .menu_info .menu_btn:hover{
			    box-shadow: 0 0 10px #000;
			    border-radius: 5px;
			    transition: 0.6s;
			}				
	</style>
</head>
<body>
	<%
		//check that tenant already login or not
		if(session.getAttribute("tenant")==null){
			response.sendRedirect("error.jsp");
		}
	%>
	<!-- Script for page redirection -->
	<script>
	    function redirectPage() {
	        window.location.href = 'tenant_logout.jsp';
	    }
	</script>
    <!-- Homepage -->
    <div class="navbar">
        <a href="Index.html" class="logo"><i class='bx bx-home-heart'></i>House <br> Rental</a>
        <ul class="navlink" style="width:120%">
            <li><a href="tenant_dashboard.jsp">Home</a></li>
            <li><a href="properties.jsp">Properties</a></li>
            <li><a href="Request.jsp">Rental Request</a></li>
            <li><a href="Request.jsp">Approved Request</a></li>
            <li><a href="Feedback.jsp">Feedback</a></li>
            <div class="bottom"></div>
        </ul>
        <button onclick="redirectPage()" class="btn btn-primary">Log out</button>
    </div>
	<section class="properties" id="properties">
        <div style="display:flex; margin-left:60vh; margin-top:20px;" class="search-item">
	        <form class="d-flex" action="#" method="POST">
	        	<input type="search" placeholder="search your nearest area" id="searchInput" class="form-control me-2 border-success" style="width:600px;" name="search">
	        </form>
        </div>
		
		 <!-- menu -->
		<div class="menu" id="Menu" style="margin-top:-30px">
			<div class="menu_box">
                <%
                	Connection con=null;
					try {
						//create jdbc connection
						con = DbConnection.getConnection();
						PreparedStatement p;
						p = con.prepareStatement("select * from house_details where request=? and status=?");
						p.setString(1, "accept");
						p.setString(2, "available");
						ResultSet r = p.executeQuery();
						while (r.next()) {
							//print details
				%>
					<div class="menu_card" data-area="<%= r.getString("area") %>">
						<div class="menu_image">
							<img src="../uploads/<%= r.getString("img")%>">
						</div>
						<div class="small_card">
							<i class="fa-solid fa-heart"></i>
						</div>
						<div class="menu_info">
							<h2 style="margin-left:40px;">Type: <%= r.getString("house_type") %></h2>
							<ul>
								<li><%= r.getString("num_of_bedrooms") %> Bedrooms</li>
								<li><%= r.getString("num_of_bathrooms") %> Bathrooms</li>
								<li><%= r.getString("square_footage") %> sqft</li>
							</ul>
							<p>
								<%= r.getString("address") %>
							</p>
							<h3>$<%= r.getString("rent_of_house") %>/month</h3>
							<form action="propertiesDetails.jsp" method="get">
								<input type="hidden" name="house_id" value="<%= r.getString("house_id") %>">
								<input type="hidden" name="owner_id" value="<%= r.getString("owner_id") %>">
								<input type="hidden" name="image" value="<%= r.getString("img") %>">
								<input type="submit" value="Take On Rent" class="menu_btn">
							</form>
						</div>
					</div>
					<%
					        }
						} catch (Exception e) {
							e.printStackTrace();
					    }finally{
					    	//close connection
					    	con.close();
					    }
					%>
					
					<!-- script for search house according to nearest area -->
					<script>
    					document.getElementById("searchInput").addEventListener("input", function () {
        				searchProducts();
    				});
							
    				function searchProducts() {
        				const searchQuery = document.getElementById("searchInput").value.toLowerCase();
        				const products = document.querySelectorAll(".menu_card");
				        products.forEach(function(product) {
            				const area = product.getAttribute("data-area").toLowerCase();

				            if (area.includes(searchQuery)) {
				                product.style.display = "block";
            				} else {
                				product.style.display = "none";
            				}
	        				});
	    				}
					</script>
				</div>
			</div>        
                <%
                	Connection con1=null;
		    		try{
		    			//create connection
		    			String id = (String) session.getAttribute("id");
		    			con1=DbConnection.getConnection();
		    			
		    			//fetch tenant details from tenant_details table
		    			PreparedStatement p=con.prepareStatement("select *from tenant_details where tenant_id=?");
		    			p.setString(1,id);
		    			ResultSet r=p.executeQuery();
		    			if(r.next()){
		    				//track activity
		    		    	Date currentDate = new Date();
		    		    	PreparedStatement p4=con1.prepareStatement("insert into track_activity(Username,Role,Date,Time,Activity) values(?,?,?,?,?)");
		    				p4.setString(1,r.getString("name"));
		    				p4.setString(2,"tenant");
		    				p4.setString(3,new java.text.SimpleDateFormat("YYYY-MM-dd").format(currentDate));
		    				p4.setString(4,new java.text.SimpleDateFormat("HH:mm:ss").format(currentDate));
		    				p4.setString(5,"Visit Properties page");
		    				p4.executeUpdate();
		    			}
		    		}catch(Exception e){
		    			e.printStackTrace();
		    		}finally{
		    			//close connection
		    			con1.close();
		    		}
            	%>				                
    </section>
</body>
</html>