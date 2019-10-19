import java.io.File;
import java.io.IOException;
import java.net.DatagramPacket;
import java.net.DatagramSocket;
import java.net.InetAddress;

public class ServerMain {

    public static void main(String[] args) throws IOException {
        int numSeq = 0;
        int clientPort = 6973;
        int serverPort = 9999;
        InetAddress serverIp = InetAddress.getByName("127.0.0.1");
        DatagramSocket socket = new DatagramSocket(serverPort);
        String diretoria = "/home/jessica/files/";
        File dir = new File(diretoria);
        dir.mkdir();

        try { System.out.println("INICIO");
            String msg;
            byte[] receiveData = new byte[1024];
            DatagramPacket receive = new DatagramPacket(receiveData, receiveData.length);
            socket.receive(receive);
            Packet packet = new Packet(receive.getData());
            if(packet.getInfo().contains("CONNECT")){
                msg = "ACCEPT";
                Packet ack = new Packet("ACCEPT",numSeq,msg.getBytes());
                byte[] data = ack.toBytes();
                DatagramPacket sendPacket = new DatagramPacket(data,data.length, serverIp,clientPort);
                socket.send(sendPacket);
                numSeq++;
            }
            receiveData = new byte[1024];
            receive = new DatagramPacket(receiveData, receiveData.length);
            socket.receive(receive);
            packet = new Packet(receive.getData());
            if(packet.getInfo().contains("ACKC")){
                msg = "Conectado!";
                Packet ack = new Packet("ACK",numSeq,msg.getBytes());
                byte[] data = ack.toBytes();
                DatagramPacket sendPacket = new DatagramPacket(data,data.length, serverIp,clientPort);
                socket.send(sendPacket);
                numSeq++;
            }
            System.out.println("CONNECTADO");
            receiveData = new byte[1024];
            receive = new DatagramPacket(receiveData, receiveData.length);
            socket.receive(receive);
            packet = new Packet(receive.getData()); System.out.println(packet.getInfo());
            if(packet.getInfo().contains("Upload")){  System.out.println("ENTREI NO CERTO");
                String answer = packet.getInfo(); System.out.println(answer);
                String[] mensagem = answer.split(" ");
                String nome = mensagem[1]; System.out.println("Receiver");
                Receiver r = new Receiver(nome,diretoria,socket, clientPort,serverIp, numSeq);
                new Thread(r).start();
            }
            else if(packet.getInfo().contains("Download")){
                String answer = new String(receive.getData(),0,receive.getLength());
                String[] mensagem = answer.split(" ");
                String nome = mensagem[1]; System.out.println("Sender");
                Sender s = new Sender(nome, diretoria,socket, clientPort, serverIp, numSeq);
                new Thread(s).start();
            }
            else if(packet.getInfo().contains("CLOSECONNECT")){
                msg = "ACCEPTCLOSE";
                Packet ack = new Packet("ACCEPTCLOSE",numSeq,msg.getBytes());
                byte[] data = ack.toBytes();
                DatagramPacket sendPacket = new DatagramPacket(data,data.length, serverIp,clientPort);
                socket.send(sendPacket);
                numSeq++;
                msg = "SERVERCLOSECONNECT";
                ack = new Packet("SERVERCLOSECONNECT",numSeq,msg.getBytes());
                data = ack.toBytes();
                sendPacket = new DatagramPacket(data,data.length, serverIp,clientPort);
                socket.send(sendPacket);
                numSeq++;
            }


        } catch (Exception e){
            System.out.println(e.getMessage());
        }

    }
}
