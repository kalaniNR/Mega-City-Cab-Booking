package com.datapackage.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.datapackage.dao.RegisterDao;
import com.datapackage.model.Register;


@WebServlet("/registerServlet")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private RegisterDao registerDao;
	
	@Override
    public void init() throws ServletException {
        registerDao = new RegisterDao();
    }
       
  
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name");
        String address = request.getParameter("address");
        String contact = request.getParameter("contact");
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        Register user = new Register(name, address, contact, username, password);
        
        if (registerDao.userExists(username)) {
            response.sendRedirect("Views/Register.jsp?error=userExists");
        } else {
            boolean isRegistered = registerDao.registerUser(user);
            if (isRegistered) {
                response.sendRedirect("Views/login.jsp");
            } else {
                response.sendRedirect("Views/Register.jsp?error=registrationFailed");
            }
        }
	}

}
