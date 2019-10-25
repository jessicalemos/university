public class ClientMain {

    public static void main(String[] args) {
        int clientPort = 6973;
        int serverPort = 9999;
        Menu menu = new Menu();
        try {
            Cliente p = new Cliente(menu, clientPort, serverPort);
        }catch (Exception e){
            System.out.println(e.getMessage());
        }
        }
}
