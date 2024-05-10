
import java.sql.*;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ManageOwner_U
 */
@WebServlet("/ManageOwner_U")
public class ManageOwner_U extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ManageOwner_U() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String method=request.getMethod();
		if(method.equals("POST")) {
			doPost(request,response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String t_name = request.getParameter("name");
	    String password = request.getParameter("password");
	    String contactNo = request.getParameter("contactNo");
	    String email = request.getParameter("email");
	    String age = request.getParameter("age");

	    try {
	        Class.forName("com.mysql.jdbc.Driver");
	        Connection con = DriverManager.getConnection("jdbc:mysql://localhost/house_renting", "root", "");
	        PreparedStatement p = con.prepareStatement("update owner_details set name=?, password=?, contact_no=?, email_id=?, age=? where owner_id=?");
	        p.setString(1, t_name);
	        p.setString(2, password);
	        p.setString(3, contactNo);
	        p.setString(4, email);
	        p.setString(5, age);
	        p.setString(6, request.getParameter("o_id"));
	        p.executeUpdate();
			
	        response.sendRedirect("admin/manage_owner.jsp");
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	}

}
