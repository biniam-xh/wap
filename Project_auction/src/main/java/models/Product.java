package models;

import java.util.Date;

public class Product implements java.io.Serializable {
    private int id;
    private String productName;
    private String imageURL;
    private String description;
    private double bid_amount;
    private String current_bidder;
    private Date expiration_date;


    public Product(){}

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getImageURL() {
        return imageURL;
    }

    public void setImageURL(String imageURL) {
        this.imageURL = imageURL;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public double getBid_ammount() {
        return bid_amount;
    }

    public void setBid_amount(double bid_amount) {
        this.bid_amount = bid_amount;
    }

    public String getCurrent_bidder() {
        return current_bidder;
    }

    public void setCurrent_bidder(String current_bidder) {
        this.current_bidder = current_bidder;
    }

    public Date getExpiration_date() {
        return expiration_date;
    }

    public void setExpiration_date(Date expiration_date) {
        this.expiration_date = expiration_date;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
}
