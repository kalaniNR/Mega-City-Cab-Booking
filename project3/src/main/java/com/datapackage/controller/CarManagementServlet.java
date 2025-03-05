package com.datapackage.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import java.util.List;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import com.datapackage.dao.CarDao;
import com.datapackage.model.Car;

@WebServlet("/CarManagementServlet")
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024 * 2, // 2MB
    maxFileSize = 1024 * 1024 * 10, // 10MB
    maxRequestSize = 1024 * 1024 * 50 // 50MB
)
public class CarManagementServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final String UPLOAD_DIRECTORY = "images";
    private CarDao carDao = new CarDao();
    
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Car> carList = carDao.getAllCars();
        
        // Debugging statement
        System.out.println("Car List Retrieved: " + carList);

        request.setAttribute("carList", carList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("booking.jsp");
        dispatcher.forward(request, response);
    }

    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("add".equals(action)) {
            Car car = new Car();
            car.setBrandName(request.getParameter("brandName"));
            car.setCapacity(Integer.parseInt(request.getParameter("capacity")));
            car.setPrice(Double.parseDouble(request.getParameter("price")));
            car.setLicensePlate(request.getParameter("licensePlate"));

            // Handling Image Upload
            Part filePart = request.getPart("imageFile");
            String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
            String uploadPath = getServletContext().getRealPath("") + File.separator + "images";

            
            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) {
                uploadDir.mkdir();
            }

            String filePath = UPLOAD_DIRECTORY + File.separator + fileName;
            filePart.write(uploadPath + File.separator + fileName);

            car.setImage(fileName); // Store only file name in the database

            boolean success = carDao.addCar(car);
            response.sendRedirect("admin/manageCars.jsp?success=" + (success ? "Car added!" : "Failed to add car"));
        } 
        
        else if ("update".equals(action)) {
            Car car = new Car();
            car.setId(Integer.parseInt(request.getParameter("id")));
            car.setBrandName(request.getParameter("brandName"));
            car.setCapacity(Integer.parseInt(request.getParameter("capacity")));
            car.setPrice(Double.parseDouble(request.getParameter("price")));
            car.setLicensePlate(request.getParameter("licensePlate"));

            // Handle Image Upload for Update
            Part filePart = request.getPart("imageFile");
            if (filePart != null && filePart.getSize() > 0) { 
                String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
                String uploadPath = getServletContext().getRealPath("") + File.separator + UPLOAD_DIRECTORY;
                filePart.write(uploadPath + File.separator + fileName);
                car.setImage(fileName);
            } else {
                car.setImage(request.getParameter("existingImage"));
            }

            boolean success = carDao.updateCar(car);
            response.sendRedirect("admin/manageCars.jsp?success=" + (success ? "Car updated!" : "Failed to update car"));

        }
        
        else if ("delete".equals(action)) {
            int id = Integer.parseInt(request.getParameter("id"));
            boolean success = carDao.deleteCar(id);
            response.sendRedirect("admin/manageCars.jsp?success=" + (success ? "Car deleted!" : "Failed to delete car"));
        }
    }
}
