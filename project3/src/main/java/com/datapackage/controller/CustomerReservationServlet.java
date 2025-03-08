package com.datapackage.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.datapackage.dao.CustomerReservationDao;
import com.datapackage.model.CustomerReservation;

/**
 * Servlet implementation class BookingServlet
 */
@WebServlet("/CustomerReservationServlet")
public class CustomerReservationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String JDBC_URL = null;
	private static final String JDBC_USER = null;
	private static final String JDBC_PASSWORD = null;
  
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 String name = request.getParameter("name");
	        String email = request.getParameter("email");
	        String phone = request.getParameter("phone");
	        String fromLocation = request.getParameter("fromLocation");
	        String toLocation = request.getParameter("toLocation");
	        String datetime = request.getParameter("datetime");
	        
	        HttpSession session = request.getSession();
	        session.setAttribute("name", name);
	        session.setAttribute("email", email);
	        session.setAttribute("phone", phone);
	        session.setAttribute("fromLocation", fromLocation);
	        session.setAttribute("toLocation", toLocation);
	        session.setAttribute("datetime", datetime);
	        
	       
	        
	        response.sendRedirect("Views/booking.jsp");
    }
	
	}
