package controllers;

import data.DataAccess;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/MyProducts")
public class MyProducts extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {

            String username = request.getSession().getAttribute("username").toString() ;
            System.out.println(username);

            request.setAttribute("products", DataAccess.getProductList(username));

        } catch (Exception e) {
            e.printStackTrace();
        }
        request.getRequestDispatcher("views/myproducts.jsp").forward(request,response);
    }
}
