<<<<<<< Updated upstream:java/ImageServlet.java
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.nio.file.FileSystems;
import java.nio.file.Path;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/imageServlet")
public class ImageServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String filename = request.getParameter("filename");
        
        if (filename != null && !filename.isEmpty()) {
            response.setContentType("image/jpeg"); 
            
//            //filename="/uploads/"+filename;
//            String imagePath = getServletContext().getRealPath("/uploads/");
//            String filePath = imagePath + File.separator + filename;
//            File imageFile = new File(filename);
//            String physicalPath = imageFile.getAbsolutePath();
//            System.out.println(physicalPath);
            
            Path basePath = FileSystems.getDefault().getPath(getServletContext().getRealPath("house_renting_platform"));
            Path resolvedPath = basePath.getParent().resolve(filename); // use getParent() if basePath is a file (not a directory) 
            Path abolutePath = resolvedPath.normalize();
            File imageFile = abolutePath.toFile();
            
            if (imageFile.exists()) {
                try (FileInputStream fis = new FileInputStream(imageFile)) {
                    try (OutputStream out = response.getOutputStream()) {
                        byte[] buffer = new byte[4096];
                        int bytesRead;
                        while ((bytesRead = fis.read(buffer)) != -1) {
                            out.write(buffer, 0, bytesRead);
                        }
                    }
                }
            } else {
                response.sendError(HttpServletResponse.SC_NOT_FOUND);
            }
        } else {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST);
        }
    }
}
=======
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.nio.file.FileSystems;
import java.nio.file.Path;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/imageServlet")
public class ImageServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String filename = request.getParameter("filename");
        
        if (filename != null && !filename.isEmpty()) {
            response.setContentType("image/jpeg"); 
            
//            //filename="/uploads/"+filename;
//            String imagePath = getServletContext().getRealPath("/uploads/");
//            String filePath = imagePath + File.separator + filename;
//            File imageFile = new File(filename);
//            String physicalPath = imageFile.getAbsolutePath();
//            System.out.println(physicalPath);
            
            Path basePath = FileSystems.getDefault().getPath(getServletContext().getRealPath("house_renting_platform"));
            Path resolvedPath = basePath.getParent().resolve(filename); // use getParent() if basePath is a file (not a directory) 
            Path abolutePath = resolvedPath.normalize();
            File imageFile = abolutePath.toFile();
            
            if (imageFile.exists()) {
                try (FileInputStream fis = new FileInputStream(imageFile)) {
                    try (OutputStream out = response.getOutputStream()) {
                        byte[] buffer = new byte[4096];
                        int bytesRead;
                        while ((bytesRead = fis.read(buffer)) != -1) {
                            out.write(buffer, 0, bytesRead);
                        }
                    }
                }
            } else {
                response.sendError(HttpServletResponse.SC_NOT_FOUND);
            }
        } else {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST);
        }
    }
}
>>>>>>> Stashed changes:src/main/java/ImageServlet.java
