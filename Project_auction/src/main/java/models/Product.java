package models;

import java.util.Date;
import java.util.List;

public class Product implements java.io.Serializable {
    private int id;
    private String productName;
    private String imageURL;
    private String description;
    private double bid_amount;
    private String current_bidder;
    private Date expiration_date;
    private String elapsed_time;
    private boolean expired;
    private boolean paid;


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

    public double getBid_amount() {
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

    public String getTimeDifference(Date startDate, Date endDate){

        //milliseconds
        long different = endDate.getTime() - startDate.getTime();

        System.out.println("startDate : " + startDate);
        System.out.println("endDate : "+ endDate);
        System.out.println("different : " + different);

        long secondsInMilli = 1000;
        long minutesInMilli = secondsInMilli * 60;
        long hoursInMilli = minutesInMilli * 60;
        long daysInMilli = hoursInMilli * 24;

        long elapsedDays = different / daysInMilli;
        different = different % daysInMilli;

        long elapsedHours = different / hoursInMilli;
        different = different % hoursInMilli;

        long elapsedMinutes = different / minutesInMilli;
        different = different % minutesInMilli;

        long elapsedSeconds = different / secondsInMilli;

        String timeLeft = "";

        if(elapsedDays == 1){
            timeLeft += elapsedDays + " day left";
        }
        else if(elapsedDays > 1){
            timeLeft += elapsedDays + " days left";
        }
        else{
            if(elapsedHours>0){
                timeLeft += elapsedHours + " hours left";
            }
            else{
                if(elapsedMinutes < 0){
                    return "expired";
                }
                timeLeft += elapsedMinutes + " minutes left";
            }
        }

        return timeLeft;

    }

    public String getElapsed_time() {
        return elapsed_time;
    }

    public void setElapsed_time(String elapsed_time) {
        this.elapsed_time = elapsed_time;
    }

    public boolean isExpired() {
        return expired;
    }

    public void setExpired(boolean expired) {
        this.expired = expired;
    }

    public boolean isPaid() {
        return paid;
    }

    public void setPaid(boolean paid) {
        this.paid = paid;
    }
}
