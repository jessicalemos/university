public abstract class User {
    
    private SocialMedia mediator;
    private String userId;
    private String name;
    
    public User(SocialMedia mediator, String id, String name){
        this.mediator = mediator;
        this.name = name;
        this.userId = id;
    }
    
    public abstract void send(String msg, String userId);

    public abstract void receive(String msg);

    public SocialMedia getMediator() {
        return mediator;
    }

    public String getId() {
        return this.userId;
    }

    public String getName() {
        return this.name;
    }
}