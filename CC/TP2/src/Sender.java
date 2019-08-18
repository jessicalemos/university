import java.io.FileInputStream;
import java.net.DatagramPacket;
import java.net.DatagramSocket;
import java.net.InetAddress;
import java.net.UnknownHostException;
import java.sql.Time;
import java.util.ArrayList;
import java.util.Timer;
import java.util.TimerTask;
import java.util.concurrent.Semaphore;

public class Sender implements Runnable{
    private InetAddress serverIp;
    private String fileName;
    private String diretoria;
    private DatagramSocket socket;
    private int port;
    private int proxNumSeq;
    private int waiting;
    private Semaphore semaforo;
    private Timer timer;
    private int windowSize;

    public Sender(String fileName, String diretoria,DatagramSocket socket, int port, InetAddress serverIp, int proxNumSeq) throws UnknownHostException {
        this.fileName = fileName;
        this.diretoria = diretoria;
        this.serverIp = serverIp;
        this.port = port;
        this.socket = socket;
        this.proxNumSeq = proxNumSeq;
        this.waiting = 3;
        this.semaforo = new Semaphore(1);
        this.windowSize = 10;
    }

    public void run(){

        try{
            byte[] sendData = new byte[1024];
            byte[] receiveData = new byte[1024];
            int j = 0, i = 0;
            ArrayList<Integer> al = new ArrayList<Integer>();

            FileInputStream in = new FileInputStream(diretoria + fileName);
            int c;
            while((c = in.read())!=-1){
                al.add(c);j++;
            }

            DatagramPacket receive = new DatagramPacket(receiveData, receiveData.length);
            socket.receive(receive);
            Packet packet = new Packet(receive.getData()); System.out.println(packet.getInfo());
            if(packet.getInfo().contains("OK")){
                System.out.println("Uploading...");
                while(true){
                    if(i<j){
                            sendData = al.get(i).toString().getBytes();
                            Packet p = new Packet("DATA", proxNumSeq, sendData);
                            sendData = p.toBytes();
                            DatagramPacket sendPacket = new DatagramPacket(sendData, sendData.length, serverIp, port);
                            socket.send(sendPacket);
                            proxNumSeq++;

                            DatagramPacket receivePacket = new DatagramPacket(receiveData, receiveData.length);
                            socket.receive(receivePacket);
                            packet = new Packet(receive.getData());
                            String ack = new String(packet.getData());
                            System.out.println("Send" + ack);
                            i++;

                            if (packet.getInfo().contains("DATA")) {
                                String[] s = ack.split(" ");
                                int numSeq = Integer.parseInt(s[1]);


                                System.out.println("incrrrr" + numSeq);
                            }
                    }
                    else{
                        sendData = "end".getBytes();
                        Packet p = new Packet("END",proxNumSeq,sendData);
                        sendData = p.toBytes();
                        DatagramPacket sendPacket = new DatagramPacket(sendData,sendData.length,serverIp,port);
                        socket.send(sendPacket);
                        proxNumSeq++;
                        break;
                    }
                }
            }

            System.out.println("\nUpload finished!\nFilename: "+fileName);
        }catch(Exception e){System.out.println(e.getMessage());}

    }

}
