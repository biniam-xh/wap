package controllers;

import data.DataAccess;
import models.Product;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Optional;

@WebServlet("/UpdatePayment")
public class UpdatePayment extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int product_id = Integer.parseInt(request.getParameter("product_id"));
        System.out.println(request.getParameter("product_id"));

        Optional<Product> product = DataAccess.getProductList(request.getSession().getAttribute("username").toString()).stream().filter(p->p.getId() == product_id).findFirst();
        if(product.isPresent()){
            Product pro = product.get();
            pro.setPaid(true);
            if(DataAccess.updateProduct(pro)){
                response.setContentType("text/plain");  // Set content type of the response so that jQuery knows what it can expect.
                response.setCharacterEncoding("UTF-8"); // You want world domination, huh?
                response.getWriter().write("Payment successful! ");
            }
            else{
                response.setContentType("text/plain");  // Set content type of the response so that jQuery knows what it can expect.
                response.setCharacterEncoding("UTF-8"); // You want world domination, huh?
                response.getWriter().write("Payment not successful! ");
            }

        }
        else{
            response.setContentType("text/plain");  // Set content type of the response so that jQuery knows what it can expect.
            response.setCharacterEncoding("UTF-8"); // You want world domination, huh?
            response.getWriter().write("Payment not successful! ");
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
