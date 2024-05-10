import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

@WebServlet("/api/showProfile")
public class OwnerProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public OwnerProfile() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		String id = request.getParameter("id");
		PrintWriter out=response.getWriter();
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost/house_renting","root","");
			PreparedStatement p=con.prepareStatement("select *from owner_details where owner_id=?");
			p.setString(1, id);
			ResultSet r=p.executeQuery();
			if(r.next()) {
				JSONObject jsonObject = new JSONObject();
                jsonObject.put("owner_id", r.getString("owner_id"));
                jsonObject.put("name", r.getString("name"));
                jsonObject.put("password", r.getString("password"));
                jsonObject.put("contact_no", r.getString("contact_no"));
                jsonObject.put("email_id", r.getString("email_id"));
                jsonObject.put("age", r.getString("age"));
                out.print(jsonObject.toString());
                request.setAttribute("jsonData", jsonObject.toString());
                request.getRequestDispatcher("../owner/temp.jsp").forward(request, response);
                //response.sendRedirect("../owner/showProfile.jsp");
			}
		}catch(Exception e) {
			out.println(e);
		}
	}
}
