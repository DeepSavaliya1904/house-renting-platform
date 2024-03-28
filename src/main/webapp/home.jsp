<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.Date" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Homepage</title>
    <link rel="stylesheet" href="Style.css">
    <!-- Box-Icons -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">
</head>
<body>
    <header>
        <div class="nav container">
            <!-- Logo -->
            <a href="Index.html" class="logo"><i class='bx bx-home-heart'></i>House <br> Rental</a>

            <!-- Menu-Icon -->
            <input type="checkbox" id="menu">
            <label for="menu"><i class='bx bx-menu' id="menu-icon"></i></label>

            <!-- Nav List -->
            <ul class="navbar">
                <li><a href="#home">Home</a></li>
                <li><a href="#about">About Us</a></li>
                <li><a href="#properties">Properties</a></li>
                <li><a href="#review">Reviews</a></li>
                <li><a href="#contact">Contact us</a></li>
            </ul>
            <!-- Login Button -->
                <a href="tenant/tenant_login.jsp" class="btn">Tenant</a>
                <a href="owner/owner_login.jsp" class="btn">Owner</a>
                <a href="admin/admin_login.jsp" class="btn">Admin</a>
        </div>
    </header>
    
    <!-- Home -->

    <section class="home container" id="home">
        <!-- <div class="homeimg"></div> -->
        <div class="home-text">
            <h1>Find Your Next <br>Perfect Place To <br>Live.</h1>
            <a href="tenant/tenant_registration.jsp" class="btn">Sign Up</a>
        </div>
    </section>
    
    <br><br><br>
    <br><br>
    <!-- about us -->
    <section class="about" id="about">
        <h2>About <span>Us</span></h2>
        <div class="about-box">
            <div class="box">
                <i class='bx bx-bullseye'></i>
                <h3>Our Mission</h3>
                <p>Our mission is to connect <br> renters with their ideal homes <br> while  making the entire process seamless, transparent, and enjoyable.</p>
            </div>
            
            <div class="box">
                <i class='bx bxs-group'></i>
                <h3>User-Friendly Platform</h3>
                <p>Our intuitive interface allows <br> you to filter search results based <br> on location, price range, amenities, and more.Finding your dream <br> home has never been this straightforward.</p>                
            </div>

            <div class="box">
                <i class='bx bx-transfer-alt' ></i>
                <h3>Transparent Information</h3>
                <p>Each property listing <br> provides detailed information <br> about the rental, including photos <br>and contact details.We believe <br> in giving you all the info <br> you need to make <br>decisions.</p>
            </div>

                <div class="box">
                    <i class="fa-solid fa-person-breastfeeding"></i>
                    <h3>Exceptional Customer Support</h3>
                    <p>Our support team is always <br> ready to assist you.Whether you have questions about a property, need guidance on the rental process, we're just a call <br> away.</p>
                </div>
                <div class="box">
                    <i class="fa-solid fa-teletype"></i>
                    <h3>Community Engagement</h3>
                    <p>
                        Community engagement in a <br> house renting platform plays a crucial role in fostering a sense of belonging, and collaboration among renters, landlords <br> and others.</p>
                </div>
                <div class="box">
                    <i class='bx bxs-home-smile'></i>
                    <h3>Sustainable Living</h3>
                    <p>We care about the environment. Discover eco-friendly and energy-efficient homes through our platform, contributing to a responsible way of <br> living.</p>   
                </div>
        </div>
    </section>

    <!-- Properties -->
    <section class="properties" id="properties">
                <!-- menu -->
                <div class="menu" id="Menu" style="margin-top:0px; height:150vh; ">
                	 <h1><span>Properties</span></h1>
                    <div class="menu_box">
                		<%
						    try {
						        Class.forName("com.mysql.jdbc.Driver");
						        Connection con = DriverManager.getConnection("jdbc:mysql://localhost/house_renting", "root", "");
						        PreparedStatement p;
						        p = con.prepareStatement("select * from house_details where request=? and status=?");
						        p.setString(1, "accept");
						        p.setString(2, "available");
						        ResultSet r = p.executeQuery();
						        while (r.next()) {
						%>
						    <div class="menu_card" data-area="<%= r.getString("area") %>">
						        <div class="menu_image">
						            <img src="uploads/<%= r.getString("img")%>">
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
						            <form action="tenant/tenant_login.jsp" method="POST">
						                <input type="submit" value="Take On Rent" class="menu_btn">
						            </form>
						        </div>
						    </div>
						<%
						        }
						    } catch (Exception e) {
						        e.printStackTrace();
						    }
						%>        
    </section>

    <!-- review -->
    <section class="review1" id="review">
        <div class="review" id="Review">
            <h1>Customer<span> Review</span></h1>
            <div class="review_box">
                <div class="review_card">
                    <div class="review_profile">
                        <img src="image/review_1.png">
                    </div>
                    <div class="review_text">
                        <h2 class="name">Emily Turner</h2>
                        <div class="review_icon">
                            <i class="fa-solid fa-star"></i>
                            <i class="fa-solid fa-star"></i>
                            <i class="fa-solid fa-star"></i>
                            <i class="fa-solid fa-star"></i>
                            <i class="fa-solid fa-star-half-stroke"></i>
                        </div>
                        <p>
                            "House Renting platform made finding my dream home a breeze! The user-friendly interface, and personalized recommendations exceeded my expectations. Highly recommended for a seamless and enjoyable house-hunting experience!"
                        </p>
                    </div>
                </div>

                <div class="review_card">
                    <div class="review_profile">
                        <img src="image/review_2.png">
                    </div>
                    <div class="review_text">
                        <h2 class="name">John Deo</h2>
                        <div class="review_icon">
                            <i class="fa-solid fa-star"></i>
                            <i class="fa-solid fa-star"></i>
                            <i class="fa-solid fa-star"></i>
                            <i class="fa-solid fa-star"></i>
                            <i class="fa-solid fa-star-half-stroke"></i>
                        </div>
                        <p>
                            "Discovering my ideal home was effortless with House Rentig Platform. The platform's simplicity, reliable listings, and personalized suggestions simplified the entire process.I highly recommend House Renting Platform for a smooth and enjoyable house-hunting journey!"
                        </p>
                    </div>
                </div>

                <div class="review_card">
                    <div class="review_profile">
                        <img src="image/review_3.png">
                    </div>
                    <div class="review_text">
                        <h2 class="name">Scarlett Harrison</h2>
                        <div class="review_icon">
                            <i class="fa-solid fa-star"></i>
                            <i class="fa-solid fa-star"></i>
                            <i class="fa-solid fa-star"></i>
                            <i class="fa-solid fa-star"></i>
                            <i class="fa-solid fa-star-half-stroke"></i>
                        </div>
                        <p>
                            "House Renting Platform is a game-changer in house hunting! The platform's sleek design and trustworthy listings streamlined <br> my search. The personalized recommendations were spot- <br>on, and the eco-friendly housing options aligned perfectly with my values.
                        </p>
                    </div>
                </div>
                <div class="review_card">
                    <div class="review_profile">
                        <img src="image/review_4.png">
                    </div>
                    <div class="review_text">
                        <h2 class="name">Noah Mitchell</h2>
                        <div class="review_icon">
                            <i class="fa-solid fa-star"></i>
                            <i class="fa-solid fa-star"></i>
                            <i class="fa-solid fa-star"></i>
                            <i class="fa-solid fa-star"></i>
                            <i class="fa-solid fa-star-half-stroke"></i>
                        </div>
                        <p>
                            "House Renting Platform exceeded my expectations for house hunting. The platform's intuitive interface, clear listings, and personalized suggestions made finding my perfect home effortless.The eco-friendly options and responsive customer support added a thoughtful touch"   
                        </p>
                    </div>
                </div>
            </div>
        </div>

    </section>

    <!-- footer -->
    <footer id="contact">
        <div class="footer_main">
            <div class="footer_tag">
                <h2>Location</h2>
                <p>India</p>
                <p>Sri Lanka</p>
                <p>USA</p>
                <p>Japan</p>
                <p>Italy</p>
            </div>

            
            <div class="footer_tag">
                <h2>Quick Link</h2>
                <p><a href="#home">Home</a></p>
                <p><a href="#about">About</a></p>
                <p><a href="#properties">Properties</a></p>
                <p><a href="#review">Reviews</a></p>
            </div>

            <div class="footer_tag">
                <h2>Contact</h2>
                <p>+94 12 2394 239</p>
                <p>+94 12 0384 474</p>
                <p>+94 12 2929 212</p>
                <p>abchd@gmail.com</p>
                <p>chsjf@gmail.com</p>
            </div>

            <div class="footer_tag">
                <h2>Our Services</h2>
                <p>fast delivery</p>
                <p>Easy payment</p>
                <p>24 x 7 Service</p>
            </div>

            <div class="footer_tag">
                <h3>Follow us</h3>
                <i class="fa-brands fa-facebook-f"></i>
                <i class="fa-brands fa-twitter"></i>
                <i class="fa-brands fa-instagram"></i>
            </div>
        </div>
    </footer>
</body>
</html>