package controllers;

import data.DataAccess;
import models.Product;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Date;
import java.util.Optional;

@WebServlet("/product")
public class ProductDetails extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            int id = Integer.parseInt(request.getParameter("product_id"));

            boolean myProducts = request.getParameter("myProducts") != null;
            String username = request.getSession().getAttribute("username").toString() ;

            Optional<Product> product = null;
            if(myProducts){
                product = DataAccess.getProductList(username).stream().filter(p->p.getId() == id).findFirst();
            }
            else{
                product = DataAccess.getProductList("").stream().filter(p->p.getId() == id).findFirst();
            }

            if(product.isPresent()){
                Date date1 = new Date();
                Date date2 = product.get().getExpiration_date();
                if((date1.getTime() - date2.getTime()) > 0){
                    product.get().setExpired(true);
                }
                request.setAttribute("product", product.get());
                request.getRequestDispatcher("/views/ProductDetails.jsp").forward(request, response);
            }
            else{
                response.sendRedirect(request.getContextPath() + "/home");
            }


        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/home");
        }
    }
}
