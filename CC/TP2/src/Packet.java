import java.io.*;
import java.nio.ByteBuffer;

public class Packet implements Serializable{
    private String info;
    private int numSeq;
    private byte[] data;

    public Packet(String info, int numSeq, byte[] data) {
        this.numSeq = numSeq;
        this.data = data;
        this.info = info;
    }


    public Packet (byte[] data) throws IOException, ClassNotFoundException {
        ByteArrayInputStream in = new ByteArrayInputStream(data);
        ObjectInputStream ois = new ObjectInputStream(in);
        Packet p = (Packet) ois.readObject();
        this.info = p.getInfo();
        this.numSeq = p.getNumSeq();
        this.data = p.getData();
    }


    public byte[] toBytes() throws IOException {
        ByteArrayOutputStream bos = new ByteArrayOutputStream();
        ObjectOutputStream oos = new ObjectOutputStream(bos);
        oos.writeObject(this);
        oos.flush();
        return bos.toByteArray();
    }

    public String getInfo() {
        return info;
    }

    public void setInfo(String info) {
        this.info = info;
    }

    public int getNumSeq() {
        return numSeq;
    }

    public void setNumSeq(int numSeq) {
        this.numSeq = numSeq;
    }

    public byte[] getData() {
        return data;
    }

    public void setData(byte[] data) {
        this.data = data;
    }
}
