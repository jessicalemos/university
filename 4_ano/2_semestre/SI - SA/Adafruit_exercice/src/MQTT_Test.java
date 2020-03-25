import java.util.Scanner;

import org.eclipse.paho.client.mqttv3.*;
import org.eclipse.paho.client.mqttv3.persist.MemoryPersistence;

public class MQTT_Test {
    private final static String ADAFRUIT_USERNAME = "jessicalemos";
    private final static String ADAFRUIT_AIO_KEY  = "aio_PvML11sWu6ggafMy2Tdl82hbTTsm";

    public static void main(String[] args) {
        String topic = ADAFRUIT_USERNAME + "/feeds/sensorfeed";
        int qos= 1;     //QoS: 0 -at most once, 1 -at least once, 2 -exactly once
        String broker = "tcp://io.adafruit.com:1883"; //Adafruit IO broker
        String client_id = "JavaSample";
        MemoryPersistence persistence = new MemoryPersistence();
        try{
            MqttClient mqtt_client = new MqttClient(broker, client_id, persistence);
            MqttConnectOptions connOpts = new MqttConnectOptions();
            connOpts.setCleanSession(true);
            connOpts.setUserName(ADAFRUIT_USERNAME);
            connOpts.setPassword(ADAFRUIT_AIO_KEY.toCharArray());
            System.out.println("Connection to broker: " + broker);
            MyCallback callback = new MyCallback();
            mqtt_client.setCallback(callback);
            mqtt_client.connect(connOpts);
            mqtt_client.subscribe(topic,qos);
            String text = "";
            Scanner sn = new Scanner(System.in);
            while(true) {
                text = sn.nextLine();
                if(text.equals("disconnect")){
                    mqtt_client.disconnect();
                    System.out.println("Disconnected");
                    System.exit(0);
                }
                System.out.println("Publishing message: " + text);
                MqttMessage message = new MqttMessage(text.getBytes());
                message.setQos(qos);
                mqtt_client.publish(topic, message);
                System.out.println("Message published");
            }
        }
        catch(MqttException me) {
            System.out.println("reason: " + me.getReasonCode());
            System.out.println("msg: " + me.getMessage());
            System.out.println("loc: " + me.getLocalizedMessage());
            System.out.println("cause: " + me.getCause());
            System.out.println("excep: " + me);
            me.printStackTrace();
        }
    }
}