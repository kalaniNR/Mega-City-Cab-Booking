package com.datapackage.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.datapackage.dao.CarDao;
import com.datapackage.model.Car;


@WebServlet("/CartServlet")
public class CartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int carId = Integer.parseInt(request.getParameter("carId"));
	    CarDao carDao = new CarDao();
	    Car selectedCar = carDao.getCarById(carId);

	    if (selectedCar != null) {
	        HttpSession session = request.getSession();
	        session.setAttribute("selectedCar", selectedCar);
	    }
	    
	    response.sendRedirect("Views/summary.jsp");
    }
	

}
