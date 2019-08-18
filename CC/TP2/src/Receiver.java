import java.io.FileOutputStream;
import java.net.*;

public class Receiver implements Runnable {
    private InetAddress serverIp;
    private String fileName;
    private String diretoria;
    private DatagramSocket socket;
    private int port;
    private int proxNumSeq;

    public Receiver(String fileName, String diretoria,DatagramSocket socket, int port, InetAddress serverIp, int proxNumSeq) {
        this.fileName = fileName;
        this.diretoria = diretoria;
        this.serverIp = serverIp;
        this.socket = socket;
        this.port = port;
        this.proxNumSeq = proxNumSeq;
    }

    public void run(){
        try{
            byte[] receiveData = new byte[1024];
            byte[] sendData = new byte[1024];
            FileOutputStream out = new FileOutputStream(diretoria + fileName);
            while(true){
                try{

                        System.out.println("Downloading...");

                        sendData = "ok".getBytes();
                        Packet p = new Packet("OK",proxNumSeq,sendData);
                        sendData = p.toBytes();
                        DatagramPacket sendPacket = new DatagramPacket(sendData,sendData.length,serverIp,port);
                        socket.send(sendPacket);
                        proxNumSeq++;


                        while(true){
                            DatagramPacket receivePacket = new DatagramPacket(receiveData,receiveData.length);
                            socket.receive(receivePacket);
                            Packet pa = new Packet(receivePacket.getData());
                            String sen = new String(pa.getData());
                            if(!pa.getInfo().contains("END")){ System.out.println("END");
                                int c = Integer.parseInt(sen.trim());
                                out.write(c);
                                out.flush();

                                String ackAnswer = "ack " + pa.getNumSeq();
                                sendData = ackAnswer.getBytes();
                                p = new Packet("DATA",proxNumSeq,sendData);
                                sendData = p.toBytes();
                                sendPacket = new DatagramPacket(sendData,sendData.length, serverIp,port);
                                socket.send(sendPacket);
                                proxNumSeq++;
                                System.out.println("FIm");
                            }
                            else break;
                        }
                        break;
                } catch (SocketTimeoutException e){
                    String timeOut = new String("timeout");
                    sendData = timeOut.getBytes();
                    Packet p = new Packet("END",proxNumSeq,sendData);
                    sendData = p.toBytes();
                    DatagramPacket sendPacket = new DatagramPacket(sendData, sendData.length, serverIp,port);
                    socket.send(sendPacket);
                }
            }System.out.println("Transferencia terminada!");
        }catch (Exception e){
            System.out.println(e.getMessage());
        }
    }
}
