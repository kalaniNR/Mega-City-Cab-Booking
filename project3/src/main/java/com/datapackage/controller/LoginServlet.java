package com.datapackage.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.datapackage.dao.RegisterDao;

@WebServlet("/loginServlet")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;  
    private RegisterDao registerDao;

    @Override
    public void init() throws ServletException {
        registerDao = new RegisterDao();
    }
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String rememberMe = request.getParameter("rememberMe");

        if (registerDao.validateUser(username, password)) {
            
            HttpSession session = request.getSession();
            session.setAttribute("username", username);

        
            if (rememberMe != null) {
                Cookie userCookie = new Cookie("savedUsername", username);
                userCookie.setMaxAge(60 * 60 * 24 * 7); 
                response.addCookie(userCookie);
            } else {
               
                Cookie userCookie = new Cookie("savedUsername", "");
                userCookie.setMaxAge(0);
                response.addCookie(userCookie);
            }

            response.sendRedirect("Views/home.jsp");
        } else {
            response.sendRedirect("Views/login.jsp?error=invalid");
        }
    }
}
