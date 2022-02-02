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

public class ConsumerApp {

    public static void main(String[] args) throws JMSException {

        Properties settings = new Properties();
        settings.put(JMSClientConfig.CLIENT_ID_CONFIG, "test-client-1");
        settings.put(JMSClientConfig.CONSUMER_GROUP_ID_CONFIG, "test-client-1");
        settings.put(JMSClientConfig.BOOTSTRAP_SERVERS_CONFIG, "localhost:9092");
        settings.put(JMSClientConfig.ZOOKEEPER_CONNECT_CONF, "localhost:2181");
        settings.put("auto.offset.reset","earliest");

        ConnectionFactory connectionFactory = new KafkaConnectionFactory(settings);
        Connection connection = connectionFactory.createConnection();
        Session session = connection.createSession(false, Session.AUTO_ACKNOWLEDGE);
        Destination testQueue = session.createQueue("test-queue");

        MessageConsumer consumer = session.createConsumer(testQueue);
        while (true) {
            TextMessage message = (TextMessage)consumer.receive();
            System.out.println(message.getText());
        }
    }
}
