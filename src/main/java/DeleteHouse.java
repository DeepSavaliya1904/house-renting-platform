
import java.sql.*;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class DeleteHouse
 */
@WebServlet("/DeleteHouse")
public class DeleteHouse extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteHouse() {
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
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		int id=Integer.parseInt(request.getParameter("id"));
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost/house_renting","root","");
			PreparedStatement p=con.prepareStatement("delete from house_details where house_id=?");
			p.setInt(1, id);
			p.execute();
			out.println("<script src=\"https://cdn.jsdelivr.net/npm/sweetalert2@10\"></script>\r\n");
			out.println("<script type=\"text/javascript\">\r\n");
			out.println("                Swal.fire({\r\n"
					+ "                    icon: 'success',\r\n"
					+ "                    title: 'House Details Deleted',\r\n"
					+ "                    text: 'House Details successfully deleted',\r\n"
					+ "                    confirmButtonColor: '#3085d6',\r\n"
					+ "                    confirmButtonText: 'OK'\r\n"
					+ "                  });\r\n");
			out.println("</script>");
			out.println("<script>");
			out.println("    window.location.href = \"owner/manageHouse.jsp\";\r\n");
			out.println("</script>");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
