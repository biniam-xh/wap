package controllers;

import data.DataAccess;
import data.DataSet;
import models.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;


@WebServlet("/login")
public class Login extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<User> users = DataSet.getUsers();


        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String remember_me = request.getParameter("remember_me");


//        Optional<User> loggedUser = users.stream().filter(x-> x.getUsername().equals(username) && x.getPassword().equals(password)).findFirst();
//        if(loggedUser.isPresent()){
        if(DataAccess.checkLogin(username,password)){
            User user = DataAccess.getUser(username);
            HttpSession session = request.getSession();
            session.setAttribute("username", user.getUsername());
            session.setAttribute("address", user.getAddress());

            if(remember_me != null){
                Cookie ck = new Cookie("remember_me", username);
                ck.setMaxAge(60*60*24*30);
                response.addCookie(ck);
            }
            else{
                Cookie cookie = null;
                Cookie[] cookies = null;

                cookies = request.getCookies();

                if( cookies != null ) {
                    for (int i = 0; i < cookies.length; i++) {
                        cookie = cookies[i];
                        if(cookie.getName().equals("remember_me")){
                            cookie.setMaxAge(0);
                            response.addCookie(cookie);
                        }
                    }
                }
            }


            response.sendRedirect(request.getContextPath() + "/home");
        }
        else{
            request.setAttribute("error", true);
            request.getRequestDispatcher("/views/login.jsp").forward(request,response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


        Cookie cookie = null;
        Cookie[] cookies = null;
        // Get an array of Cookies associated with this domain
        cookies = request.getCookies();



        if( cookies != null ) {
            for (int i = 0; i < cookies.length; i++) {
                System.out.println(cookies[i].getName());
                cookie = cookies[i];
                if(cookie.getName().equals("remember_me")){
                    request.setAttribute("username", cookie.getValue());
                    request.setAttribute("remember_me", "checked");
                }
            }
        }
        request.getRequestDispatcher("views/login.jsp").forward(request,response);
    }
}
