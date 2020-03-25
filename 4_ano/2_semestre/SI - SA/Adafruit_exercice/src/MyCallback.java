import org.eclipse.paho.client.mqttv3.IMqttDeliveryToken;
import org.eclipse.paho.client.mqttv3.MqttCallback;
import org.eclipse.paho.client.mqttv3.MqttMessage;

public class MyCallback implements MqttCallback {
    public void connectionLost(Throwable throwable) {
    }

    public void messageArrived(String topic, MqttMessage msg) {
        System.out.println(String.format("Message received: [%s] %s", topic, new String(msg.getPayload())));
    }

    public void deliveryComplete(IMqttDeliveryToken iMqttDeliveryToken) {
    }
}
