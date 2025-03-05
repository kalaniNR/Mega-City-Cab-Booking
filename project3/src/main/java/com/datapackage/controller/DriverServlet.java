package com.datapackage.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import java.sql.Connection;
import java.sql.SQLException;

import com.datapackage.dao.DriverDao;
import com.datapackage.model.Driver;
import db.DatabaseConnection;

@WebServlet("/DriverServlet")
@MultipartConfig(
    fileSizeThreshold = 2 * 1024 * 1024, // 2MB
    maxFileSize = 10 * 1024 * 1024,      // 10MB
    maxRequestSize = 50 * 1024 * 1024    // 50MB
)
public class DriverServlet extends HttpServlet {
    private Connection con;
    private DriverDao driverDao;

    public void init() {
        con = DatabaseConnection.getConnection();
        driverDao = new DriverDao(con);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if ("add".equals(action)) {
            addDriver(request, response);
        } else if ("update".equals(action)) {
        	updateDriver(request, response);
        } else if ("delete".equals(action)) {
            deleteDriver(request, response);
        }
    }

    private void addDriver(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        try {
            String name = request.getParameter("name");
            String phone = request.getParameter("phone");
            String email = request.getParameter("email");
            String license = request.getParameter("licenseNumber");

            Part filePart = request.getPart("imagePath");
            String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
            String uploadPath = getServletContext().getRealPath("/images") + File.separator + fileName;
            filePart.write(uploadPath);
            String imagePath = "images/" + fileName;

            Driver driver = new Driver(0, name, phone, email, license, "Available", imagePath);
            driverDao.addDriver(driver);

            request.getSession().setAttribute("message", "Driver added successfully!");
            request.getSession().setAttribute("messageType", "success");
        } catch (SQLException e) {
            e.printStackTrace();
            request.getSession().setAttribute("message", "Error adding driver.");
            request.getSession().setAttribute("messageType", "error");
        }
        response.sendRedirect("admin/manageDrivers.jsp");
    }

//update driver
    private void updateDriver(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            String name = request.getParameter("name");
            String phone = request.getParameter("phone");
            String email = request.getParameter("email");
            String license = request.getParameter("licenseNumber");
            String status = request.getParameter("status");

            Part filePart = request.getPart("imagePath");
            String fileName = filePart.getSubmittedFileName();
            String imagePath = request.getParameter("existingImage");

            // If a new image is uploaded, replace the old one
            if (fileName != null && !fileName.isEmpty()) {
                String uploadPath = getServletContext().getRealPath("/images") + File.separator + fileName;
                filePart.write(uploadPath);
                imagePath = "images/" + fileName;
            }

            Driver driver = new Driver(id, name, phone, email, license, status, imagePath);
            driverDao.updateDriver(driver);

            request.getSession().setAttribute("message", "Driver updated successfully!");
            request.getSession().setAttribute("messageType", "success");
        } catch (SQLException e) {
            e.printStackTrace();
            request.getSession().setAttribute("message", "Error updating driver.");
            request.getSession().setAttribute("messageType", "error");
        }
        response.sendRedirect("admin/manageDrivers.jsp");
    }



    private void deleteDriver(HttpServletRequest request, HttpServletResponse response) throws IOException {
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            boolean success = driverDao.deleteDriver(id);

            if (success) {
                request.getSession().setAttribute("message", "Driver deleted successfully!");
                request.getSession().setAttribute("messageType", "success");
            } else {
                request.getSession().setAttribute("message", "Error deleting driver.");
                request.getSession().setAttribute("messageType", "error");
            }
        } catch (SQLException | NumberFormatException e) {
            e.printStackTrace();
            request.getSession().setAttribute("message", "Invalid Driver ID.");
            request.getSession().setAttribute("messageType", "error");
        }
        response.sendRedirect("admin/manageDrivers.jsp");
    }

}