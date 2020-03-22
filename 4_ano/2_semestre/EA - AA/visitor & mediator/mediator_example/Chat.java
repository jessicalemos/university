import java.util.HashMap;
import java.util.Map;

public class Chat implements SocialMedia {

    private Map<String, User> users = new HashMap<>();

    @Override
    public void sendMessage(String msg, String userId) 
    {
        User user = users.get(userId);
        user.receive(msg);
    }

    @Override
    public void addUser(User user) {
        this.users.put(user.getId(), user);
    }
}