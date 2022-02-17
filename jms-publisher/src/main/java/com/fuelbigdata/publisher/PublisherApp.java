package com.fuelbigdata.publisher;

import java.util.Properties;

import javax.jms.Connection;
import javax.jms.ConnectionFactory;
import javax.jms.Destination;
import javax.jms.JMSException;
import javax.jms.Message;
import javax.jms.MessageConsumer;
import javax.jms.MessageProducer;
import javax.jms.Session;
import javax.jms.TextMessage;

import io.confluent.kafka.jms.JMSClientConfig;
import io.confluent.kafka.jms.KafkaConnectionFactory;

public class PublisherApp {

    public static void main(String[] args) throws JMSException {

        Properties settings = new Properties();
        settings.put(JMSClientConfig.CLIENT_ID_CONFIG, "test-client-1");
        settings.put(JMSClientConfig.CONSUMER_GROUP_ID_CONFIG, "test-client-1");
        settings.put(JMSClientConfig.BOOTSTRAP_SERVERS_CONFIG, "localhost:9092");
        settings.put(JMSClientConfig.ZOOKEEPER_CONNECT_CONF, "localhost:2181");

        ConnectionFactory connectionFactory = new KafkaConnectionFactory(settings);
        Connection connection = connectionFactory.createConnection();
        Session session = connection.createSession(false, Session.AUTO_ACKNOWLEDGE);
        Destination testQueue = session.createQueue("test-queue");

        MessageProducer producer = session.createProducer(testQueue);
        for (int i=0; i<10; i++) {
            TextMessage message = session.createTextMessage();
            String trademessage = "{" + "\"header\":{\"message_id\":\"fpml_id\",\"message_count_id\":" + i + "},\"message_content\":{\"message_type\":\"new fpML message\",\"status\":\"started\",\"msg_id\":122274738,\"amount\":120202.01 }" + "}" ;
            message.setText(trademessage);
            producer.send(message);
        }

        MessageConsumer consumer = session.createConsumer(testQueue);
        while (true) {
            TextMessage message = (TextMessage)consumer.receive();
            System.out.println(message.getText());
        }
    }
}
