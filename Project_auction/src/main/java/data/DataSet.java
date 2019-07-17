package controllers;

import models.User;


import java.util.ArrayList;
import java.util.List;


public class DataSet {
    private static List<User> users = new ArrayList<User>();





    public static void loadUsers(){
        User user1 = new User("ben@gmail.com", "pass");
        User user2 = new User("kol@gmail.com", "pass2");
        User user3 = new User("sol@gmail.com", "pass3");

        DataSet.users.add(user1);
        DataSet.users.add(user2);
        DataSet.users.add(user3);

    }

    public static List<User> getUsers() {
        if(DataSet.users.isEmpty()){
            loadUsers();
        }
        return DataSet.users;
    }

    public static void setUsers(List<User> users) {
        DataSet.users = users;
    }
}
