package controllers;

import data.DataAccess;
import models.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.crypto.Data;
import java.io.IOException;

@WebServlet("/signup")
public class UserRegistration extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String first_name = request.getParameter("first_name");
        String last_name = request.getParameter("last_name");
        String username = request.getParameter("username");
        String address_line1 = request.getParameter("address1");
        String address_line2 = request.getParameter("address2");
        String zip = request.getParameter("zip");
        String password = request.getParameter("password");
        String address = address_line1 + " " + address_line2 + ", "  + " Fairfield Iowa, USA," +zip;


        User user = new User();
        user.setFirst_name(first_name);
        user.setLast_name(last_name);
        user.setUsername(username);
        user.setPassword(password);
        user.setAddress(address);

        if(DataAccess.usernameExists(user.getUsername())){
            response.setContentType("text/plain");  // Set content type of the response so that jQuery knows what it can expect.
            response.setCharacterEncoding("UTF-8"); // You want world domination, huh?
            response.setStatus(240);
            response.getWriter().write(
                    "                    <div class=\"form-group\">\n" +
                            "                        <div class=\"alert alert-danger\" role=\"alert\" >\n" +
                            "                            Username already exists. please enter a different username!\n" +
                            "                        </div>\n" +
                            "                    </div>");
        }
        else{
            if(DataAccess.registerUser(user)){
                response.setContentType("text/plain");  // Set content type of the response so that jQuery knows what it can expect.
                response.setCharacterEncoding("UTF-8"); // You want world domination, huh?
                response.getWriter().write(
                        "                    <div class=\"form-group\">\n" +
                                "                        <div class=\"alert alert-success\" role=\"alert\" >\n" +
                                "                            User registration successful!\n" +
                                "                        </div>\n" +
                                "                    </div>" +
                                "                ");
            }
            else{
                response.setContentType("text/plain");  // Set content type of the response so that jQuery knows what it can expect.
                response.setCharacterEncoding("UTF-8"); // You want world domination, huh?
                response.getWriter().write(
                        "                    <div class=\"form-group\">\n" +
                                "                        <div class=\"alert alert-danger\" role=\"alert\" >\n" +
                                "                            We are having troubles updating the bid status. please try again later!\n" +
                                "                        </div>\n" +
                                "                    </div>");
            }
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("views/registration.jsp").forward(request,response);
    }
}
