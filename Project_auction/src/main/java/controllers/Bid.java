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

@WebServlet("/placeBid")
public class Bid extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        double bid_amount = Double.parseDouble(request.getParameter("bid_amount"));
        int product_id = Integer.parseInt(request.getParameter("product_id"));

        Optional<Product> product = DataAccess.getProductList("").stream().filter(p->p.getId() == product_id).findFirst();
        if(product.isPresent()){
            Product pro = product.get();
            pro.setBid_amount(bid_amount);
            String username = request.getSession().getAttribute("username").toString();
            System.out.println("username: "+ username);
            pro.setCurrent_bidder(username);
            DataAccess.updateProduct(product.get());
            response.setContentType("text/plain");  // Set content type of the response so that jQuery knows what it can expect.
            response.setCharacterEncoding("UTF-8"); // You want world domination, huh?
            response.getWriter().write(
                    "                    <div class=\"form-group\">\n" +
                    "                        <div class=\"alert alert-success\" role=\"alert\" >\n" +
                    "                            New bid amount placed!\n" +
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

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
