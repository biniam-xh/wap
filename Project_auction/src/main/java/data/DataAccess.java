package data;

import models.Product;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DataAccess {
    public static boolean updateProduct(Product product) throws IOException {
        try {
            // Initialize the database
            Connection con = DatabaseConnection.initializeDatabase();

            // create our java preparedstatement using a sql update query
            PreparedStatement ps = con.prepareStatement(
                    "UPDATE users SET bid_amount=?, current_bidder=? WHERE id = ?");

            // set the preparedstatement parameters
            ps.setDouble(1, product.getBid_ammount());
            ps.setString(2, product.getCurrent_bidder());
            ps.setInt(3, product.getId());

            // call executeUpdate to execute our sql update statement
            ps.executeUpdate();
            ps.close();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        return false;
    }

    public static List<Product> getProductList(){
        try {
            List<Product> products = new ArrayList<Product>();
            // Initialize the database
            Connection con = DatabaseConnection.initializeDatabase();

            PreparedStatement ps = con.prepareStatement(
                    "SELECT * from products");

            ResultSet resultSet = ps.executeQuery();

            while (resultSet.next()) {

                Product product = new Product();
                product.setId(resultSet.getInt("id"));
                product.setProductName(resultSet.getString("productName"));
                product.setDescription(resultSet.getString("description"));
                product.setImageURL((resultSet.getString("imageURL")));
                product.setBid_amount(resultSet.getDouble("bid_amount"));
                product.setCurrent_bidder(resultSet.getString("current_bidder"));
                product.setExpiration_date(resultSet.getDate("expiration_date"));

                products.add(product);


            }

            return products;


        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        return null;


    }
}
