package uminho.di.aa;

public class Main {
    public static void createUser(String name, String email, String password){
        User user = new User();
        user.setEmai(email);
        user.setName(name);
        user.setPassword(password);

        try{
            UserDAO.save(user);
        }catch(Exception e){
            System.out.println("Fail saving");
        }
    }

    public static void createGame(String name, int year, double price, String description){
        Game game = new Game();
        game.setName(name);
        game.setYear(year);
        game.setPrice(price);
        game.setDescription(description);

        try{
            GameDAO.save(game);
        }catch(Exception e){
            System.out.println("Fail saving");
        }
    }

    public static void createPlaform(String name, int year, String description, String manufacturer){
        Platform plat = new Platform();
        plat.setName(name);
        plat.setYear(year);
        plat.setDescription(description);
        plat.setManufacturer(manufacturer);

        try{
            PlatformDAO.save(plat);
        }catch(Exception e){
            System.out.println("Fail saving");
        }
    }

    public static void loadUser(){
        try{
            User u  = UserDAO.getUserByORMID(1);
            System.out.println("Loaded user " + u.getName());
        }catch (Exception e){
            System.out.println("Fail loading");
        }
    }

    public static void loadGame(){
        try{
            Game u  = GameDAO.getGameByORMID(1);
            System.out.println("Loaded game " + u.getName());
        }catch (Exception e){
            System.out.println("Fail loading");
        }
    }

    public static void loadPlatform(){
        try{
            Platform u  = PlatformDAO.getPlatformByORMID(1);
            System.out.println("Loaded platform " + u.getName());
        }catch (Exception e){
            System.out.println("Fail loading");
        }
    }

    public static void listUsers(){
        try{
            User[] users = UserDAO.listUserByQuery("ID>0", "ID");
            System.out.println("Retrieved " + users.length + " entries");
        }catch(Exception e){
            System.out.println("Fail");
        }
    }

    public static void listGames(){
        try{
            Game[] games = GameDAO.listGameByQuery("ID>0", "ID");
            System.out.println("Retrieved " + games.length + " entries");
        }catch(Exception e){
            System.out.println("Fail");
        }
    }


    public static void main(String args[]){
        createUser("João Matos", "joao@gmail.com", "123");
        loadUser();
        createGame("CSS", 2002, 25.5, "Game CSS");
        loadGame();
        createPlaform("XBox", 2006, "platform", "manufacturer");
        loadPlatform();
        listGames();
        //listUsers();
    }
}
