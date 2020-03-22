public class ChatUser extends User {

    public ChatUser(SocialMedia mediator, String id, String name) {
        super(mediator, id, name);
    }

    @Override
    public void send(String msg, String userId) {
        System.out.println(this.getName() + " send: " + msg);
        getMediator().sendMessage(msg, userId);
    }

    @Override
    public void receive(String msg) {
        System.out.println(this.getName() + " received: " + msg);
    }
}