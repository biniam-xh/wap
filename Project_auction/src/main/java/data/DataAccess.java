package data;

import models.Product;
import models.User;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class DataAccess {
    // Initialize the database
    private static Connection con;

    static {
        try {
            con = DatabaseConnection.initializeDatabase();
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    public DataAccess() throws SQLException, ClassNotFoundException {
    }

    public static boolean updateProduct(Product product) throws IOException {
        try {


            // create our java preparedstatement using a sql update query
            PreparedStatement ps = con.prepareStatement(
                    "UPDATE products SET bid_amount=?, current_bidder=?, paid=? WHERE id = ?");

            // set the preparedstatement parameters
            ps.setDouble(1, product.getBid_amount());
            ps.setString(2, product.getCurrent_bidder());
            ps.setBoolean(3, product.isPaid());
            ps.setInt(4, product.getId());

            // call executeUpdate to execute our sql update statement
            ps.executeUpdate();
            ps.close();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
    public static boolean usernameExists(String username){
        try {
            Connection con = DatabaseConnection.initializeDatabase();
            PreparedStatement ps = con.prepareStatement(
                    "SELECT * from users where username=?");
            ps.setString(1,username);
            ResultSet resultSet = ps.executeQuery();
            if(resultSet.first()){
                return true;
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        return false;
    }

    public static boolean checkLogin(String username, String password){
        try {

            PreparedStatement ps = con.prepareStatement(
                    "SELECT * from users where username=? and password=?");
            ps.setString(1,username);
            ps.setString(2,password);
            ResultSet resultSet = ps.executeQuery();
            if(resultSet.first()){
                return true;
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return false;
    }

    public static User getUser(String username){
        try {

            PreparedStatement ps = con.prepareStatement(
                    "SELECT * from users where username=?");

            ps.setString(1,username);

            ResultSet resultSet = ps.executeQuery();
            if(resultSet.next()){
                User user = new User();
                user.setUsername(resultSet.getString("username"));
                user.setPassword(resultSet.getString("password"));
                user.setAddress(resultSet.getString("address"));

                return user;


            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return null;
    }




    public static boolean registerUser(User user){
        try {

            PreparedStatement ps = con.prepareStatement(
                    "INSERT into users (first_name, last_name, username, password, address ) values(?,?,?,?,?)");
            ps.setString(1,user.getFirst_name());
            ps.setString(2,user.getLast_name());
            ps.setString(3,user.getUsername());
            ps.setString(4,user.getPassword());
            ps.setString(5,user.getAddress());

            int update = ps.executeUpdate();
            if(update != -1){
                return true;
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return false;
    }

    public static List<Product> getProductList(String username){
        try {
            List<Product> products = new ArrayList<Product>();
            // Initialize the database
            Connection con = DatabaseConnection.initializeDatabase();

            PreparedStatement ps = null;
            if(username !=""){

                ps = con.prepareStatement(
                        "SELECT * from products where current_bidder=? and expiration_date<?");
                ps.setString(1,username);
                ps.setDate(2, convertUtilToSql(new Date()));
            }
            else{
                ps = con.prepareStatement(
                        "SELECT * from products where expiration_date>?");
                ps.setDate(1, convertUtilToSql(new Date()));
            }

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
                product.setPaid(resultSet.getBoolean("paid"));

                try {
                    String pattern = "yyyy-MM-dd";
                    SimpleDateFormat simpleDateFormat = new SimpleDateFormat(pattern);

                    Date date1 = new Date();
                    Date date2 = product.getExpiration_date();

                    product.setElapsed_time(product.getTimeDifference(date1, date2));

                } catch (Exception e) {
                    e.printStackTrace();
                }

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
    public static java.sql.Date convertUtilToSql(java.util.Date uDate) {
        java.sql.Date sDate = new java.sql.Date(uDate.getTime());
        return sDate;
    }



//    public static Product getProduct(int id){
//        try {
//
//            // Initialize the database
//            Connection con = DatabaseConnection.initializeDatabase();
//
//            PreparedStatement ps = con.prepareStatement(
//                    "SELECT * from products where id=?");
//            ps.setInt(1,id);
//
//            ResultSet resultSet = ps.executeQuery();
//
//            while (resultSet.next()) {
//                Product product = new Product();
//                product.setId(resultSet.getInt("id"));
//                product.setProductName(resultSet.getString("productName"));
//                product.setDescription(resultSet.getString("description"));
//                product.setImageURL((resultSet.getString("imageURL")));
//                product.setBid_amount(resultSet.getDouble("bid_amount"));
//                product.setCurrent_bidder(resultSet.getString("current_bidder"));
//                product.setExpiration_date(resultSet.getDate("expiration_date"));
//
//                try {
//                    String pattern = "yyyy-MM-dd";
//                    SimpleDateFormat simpleDateFormat = new SimpleDateFormat(pattern);
//
//                    Date date1 = new Date();
//                    Date date2 = product.getExpiration_date();
//
//                    product.setElapsed_time(product.getTimeDifference(date1, date2));
//
//                } catch (Exception e) {
//                    e.printStackTrace();
//                }
//
//                return product;
//
//
//            }
//
//
//
//        } catch (SQLException e) {
//            e.printStackTrace();
//        } catch (ClassNotFoundException e) {
//            e.printStackTrace();
//        }
//        return null;
//
//
//    }
}
