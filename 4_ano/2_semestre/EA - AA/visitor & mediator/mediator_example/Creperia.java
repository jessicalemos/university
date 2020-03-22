public class Creperia {

    public static void main(String[] args) {
        
        Chat chat = new Chat();
        User user1 = new ChatUser(chat,"1", "Jessica");
        User user2 = new ChatUser(chat,"2", "Creperia");
        
        chat.addUser(user1);
        chat.addUser(user2);

        user1.send("Hello there, I wanted to place an order", "2");
        user2.send("Hey, what do you want?", "1");
    }
}