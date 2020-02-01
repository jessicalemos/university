import java.io.IOException;
import java.net.DatagramPacket;
import java.net.DatagramSocket;
import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.HashMap;
import java.util.Map;
import java.util.Scanner;

public class Cliente {
    private Map<String,Utilizador> users;
    private Menu menu;
    private InetAddress serverIp;
    private int clientPort;
    private int serverPort;
    private DatagramSocket socket;
    private Scanner teclado;
    private int numSeq;

    public Cliente(Menu menu, int clientPort, int serverPort) throws UnknownHostException {
        this.menu = menu;
        this.clientPort = clientPort;
        this.serverPort = serverPort;
        this.serverIp = InetAddress.getByName("127.0.0.1");
        this.users = new HashMap<>();
        this.numSeq = 0;
        try {
            this.socket = new DatagramSocket(clientPort);
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        teclado = new Scanner(System.in);
        initConnection();
    }

    public void in() {
        int op;
        menu.showMenu();
        try {

            while ((op = menu.op()) != -1) {
                parse(op);
            }
            socket.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public void initConnection() {
        String msg = "WantConnect";
        byte[] receiveData = new byte[1024];
        Packet p = new Packet("CONNECT", numSeq, msg.getBytes());
        try {
            byte[] data = p.toBytes();
            DatagramPacket sendPacket = new DatagramPacket(data, data.length, serverIp, serverPort);
            socket.send(sendPacket);
            numSeq++;
            DatagramPacket receive = new DatagramPacket(receiveData, receiveData.length);
            socket.receive(receive);
            Packet packet = new Packet(receive.getData());
            if (packet.getInfo().contains("ACCEPT")) {
                msg = "AckConnection";
                Packet ack = new Packet("ACKC", numSeq, msg.getBytes());
                data = ack.toBytes();
                sendPacket = new DatagramPacket(data, data.length, serverIp, serverPort);
                socket.send(sendPacket);
                numSeq++;
            }
            receive = new DatagramPacket(receiveData, receiveData.length);
            socket.receive(receive);
            packet = new Packet(receive.getData());
            if (packet.getInfo().contains("ACK")) {
                in();
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }

    public void closeConnection() {
        String msg = "WantClose";
        byte[] receiveData = new byte[1024];
        Packet p = new Packet("CLOSECONNECT", numSeq, msg.getBytes());
        try {
            byte[] data = p.toBytes();
            DatagramPacket sendPacket = new DatagramPacket(data, data.length, serverIp, serverPort);
            socket.send(sendPacket);
            numSeq++;
            DatagramPacket receive = new DatagramPacket(receiveData, receiveData.length);
            socket.receive(receive);

            receive = new DatagramPacket(receiveData, receiveData.length);
            socket.receive(receive);

            Packet packet = new Packet(receive.getData());
            if (packet.getInfo().contains("SERVERCLOSECONNECT")) {
                msg = "ACCEPTCONNECTION";
                p = new Packet("ACCEPTCONNECTION", numSeq, msg.getBytes());
                data = p.toBytes();
                sendPacket = new DatagramPacket(data, data.length, serverIp, serverPort);
                socket.send(sendPacket);
                numSeq++;
                socket.close();
                menu.setOp(0);
                menu.showMenu();
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }

    /**
     * Método para fazer o parser da opção recebida.
     *
     * @param op Opção lida
     */
    private void parse(Integer op) throws IOException {
        InetAddress serverIp = InetAddress.getByName("127.0.0.1");
        String diretoria;
        String nome;
        String username, password;
        // initConnection();
        switch (menu.getOp()) {
            case 0:
                if (op == 1) {
                    System.out.println("Username:");
                    username = teclado.nextLine();
                    System.out.println("Password:");
                    password = teclado.nextLine();
                    iniciaSessao(username, password);

                }
                if (op == 2) {
                    //regitar();
                    System.out.println("Vou registar");
                    System.out.println("Username:");
                    username = teclado.nextLine();
                    System.out.println("Password:");
                    password = teclado.nextLine();
                    registar(username, password);

                }
                if (op == 0) {
                    System.exit(0);
                }
                break;
            case 1:
                if (op == 1) {
                    System.out.println("Digite a diretoria do arquivo.");
                    diretoria = teclado.nextLine();
                    System.out.println("Digite o nome do arquivo.");
                    nome = teclado.nextLine();
                    String msg = "upload" + nome;
                    Packet p = new Packet("Upload " + nome, numSeq, msg.getBytes());
                    byte[] data = p.toBytes();
                    DatagramPacket sendPacket = new DatagramPacket(data, data.length, serverIp, serverPort);
                    socket.send(sendPacket);
                    numSeq++;
                    Sender s = new Sender(nome, diretoria, socket, serverPort, serverIp, numSeq);
                    new Thread(s).start();
                } else if (op == 2) {
                    System.out.println("Digite a diretoria do arquivo.");
                    diretoria = teclado.nextLine();
                    System.out.println("Digite o nome do arquivo.");
                    nome = teclado.nextLine();
                    String msg = "download" + nome;
                    Packet p = new Packet("Download " + nome, numSeq, msg.getBytes());
                    byte[] data = p.toBytes();
                    DatagramPacket sendPacket = new DatagramPacket(data, data.length, serverIp, serverPort);
                    socket.send(sendPacket);
                    numSeq++;
                    Receiver r = new Receiver(nome, diretoria, socket, serverPort, serverIp, numSeq);
                    new Thread(r).start();
                } else if (op == 0) {
                    closeConnection();
                }
                break;

        }

    }

    synchronized void iniciaSessao(String username, String password){
        Utilizador u;
        u = users.get(username);
        if (u == null || !u.verificaPassword(password)) {
            System.out.println("Dados incorretos");
            menu.setOp(0);
            menu.showMenu();
        }
        else{
            menu.setOp(1);
            menu.showMenu();
        }
    }

    synchronized public void registar(String username, String password) {
        if (users.containsKey(username)){
            System.out.println("User Existente");
            menu.setOp(0);
            menu.showMenu();
        }
        else{
            users.put(username, new Utilizador(username, password));
            menu.setOp(0);
            menu.showMenu();
        }
    }
}
