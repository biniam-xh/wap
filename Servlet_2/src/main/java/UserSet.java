import java.util.ArrayList;
import java.util.List;


public class UserSet {
    private static List<User> users = new ArrayList<User>();

    public static void loadUsers(){
        User user1 = new User("ben@gmail.com", "pass");
        User user2 = new User("kol@gmail.com", "pass2");
        User user3 = new User("sol@gmail.com", "pass3");

        UserSet.users.add(user1);
        UserSet.users.add(user2);
        UserSet.users.add(user3);

    }

    public static List<User> getUsers() {
        if(UserSet.users.isEmpty()){
            loadUsers();
        }
        return UserSet.users;
    }

    public static void setUsers(List<User> users) {
        UserSet.users = users;
    }
}
