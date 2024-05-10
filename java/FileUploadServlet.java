import java.io.FileOutputStream;
import java.util.*;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.sql.*;
import java.sql.Date;
@WebServlet("/FileUploadServlet")
@MultipartConfig
public class FileUploadServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String method = request.getMethod();
        if (method.equals("POST")) {
            doPost(request, response);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Multi-part configuration is provided by the @MultipartConfig annotation


        int owner_id=Integer.parseInt(request.getParameter("owner_id"));
        String address=request.getParameter("address");
        String Sqft=request.getParameter("Sqft");
        String bathrooms=request.getParameter("bathrooms");
        String bedrooms=request.getParameter("bedrooms");
        String rent=request.getParameter("rent");
        String type=request.getParameter("type");
        String area=request.getParameter("area");
        Part file = request.getPart("file");
        String imgName = file.getSubmittedFileName();
        System.out.println("choose file: " + imgName);
        
        String uploadPath="D:/Eclipse_workspace/house_renting_platform/src/main/webapp/uploads/"+imgName;
        System.out.println("upload path: "+uploadPath);
        
        try {
        	FileOutputStream f=new FileOutputStream(uploadPath);
        	InputStream is=file.getInputStream();
        	
        	byte[] data=new byte[is.available()];
        	is.read(data);
        	f.write(data);
        	is.close();
        	
        	File tempFile = new File("D:/Eclipse_workspace/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/work/Catalina/localhost/house_renting_platform/upload_bb30cf2c_6f9d_4296_acf7_517051f46847_00000005.tmp");

        	if (tempFile.exists()) {
        	    boolean deleted = tempFile.delete();
        	    if (!deleted) {
        	        System.out.println("Warning: Unable to delete temporary file.");
        	    }
        	} else {
        	    System.out.println("Temporary file does not exist.");
        	}
        	
        	//insert data into db
        	Class.forName("com.mysql.jdbc.Driver");
        	Connection con=DriverManager.getConnection("jdbc:mysql://localhost/house_renting","root","");
        	PreparedStatement p=con.prepareStatement("insert into house_details(owner_id,address,square_footage,num_of_bedrooms,num_of_bathrooms,rent_of_house,house_type,status,img,request,area) values(?,?,?,?,?,?,?,?,?,?,?)");
        	p.setInt(1, owner_id);
        	p.setString(2, address);
        	p.setString(3, Sqft);
        	p.setString(4, bedrooms);
        	p.setString(5, bathrooms);
        	p.setString(6, rent);
        	p.setString(7, type);
        	p.setString(8, "available");
        	p.setString(9, imgName);
        	p.setString(10, "pending");
        	p.setString(11, area);
        	p.execute();
        	
        	Class.forName("com.mysql.jdbc.Driver");
			Connection con1=DriverManager.getConnection("jdbc:mysql://localhost/house_renting","root","");
			PreparedStatement p1=con.prepareStatement("select *from owner_details where owner_id=?");
			p1.setInt(1,owner_id);
			ResultSet r=p1.executeQuery();
			if(r.next()){
		    	Date currentDate = new Date(System.currentTimeMillis());
		    	Class.forName("com.mysql.jdbc.Driver");
				Connection con4=DriverManager.getConnection("jdbc:mysql://localhost/house_renting","root","");
				PreparedStatement p4=con4.prepareStatement("insert into track_activity(Username,Role,Date,Time,Activity) values(?,?,?,?,?)");
				p4.setString(1,r.getString("name"));
				p4.setString(2,"owner");
				p4.setString(3,new java.text.SimpleDateFormat("YYYY-MM-dd").format(currentDate));
				p4.setString(4,new java.text.SimpleDateFormat("HH:mm:ss").format(currentDate));
				p4.setString(5,"add House Details");
				p4.executeUpdate();
			}
        	
        	response.setContentType("text/html");
        	PrintWriter out=response.getWriter();
        	out.println("<script src=\"https://cdn.jsdelivr.net/npm/sweetalert2@10\"></script>\r\n");
			out.println("<script type=\"text/javascript\">\r\n");
			out.println("                Swal.fire({\r\n"
					+ "                    icon: 'success',\r\n"
					+ "                    title: 'Request sent',\r\n"
					+ "                    text: 'Request send successfully',\r\n"
					+ "                    confirmButtonColor: '#3085d6',\r\n"
					+ "                    confirmButtonText: 'OK'\r\n"
					+ "                  });\r\n");
			out.println("</script>");
			out.println("<script>");
			out.println("    window.location.href = 'owner/addHouseDetails.jsp';");
			out.println("</script>");
        }catch(Exception e) {
        	e.printStackTrace();
        }
    }
}
