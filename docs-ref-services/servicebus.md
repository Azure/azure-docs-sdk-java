---
title: Service Bus libraries for Java
description: Reference documentation for the Java client and management libraries for Service Bus
keywords: Azure, Java, SDK, API, messaging, amqp, qpid, JMS, pubsub, pub-sub, message broker
author: rloutlaw
ms.author: routlaw
manager: douge
ms.date: 07/11/2017
ms.topic: reference
ms.prod: azure
ms.technology: azure
ms.devlang: java
ms.service: service-bus
---

# Service Bus libraries for Java

## Overview

Service Bus is an enterprise-class, transactional messaging platform service that provides highly reliable queues 
and publish/subscribe topics with deep feature capabilities such as ordered delivery, sessions, partitioning, 
scheduling, complex subscriptions, as well as workflow and transaction handling.

The Service Bus feature capabilities are comparable and often exceed those of high-end, on-premises legacy message 
brokers. The Service Bus features are available via standards-based protocols like AMQP 1.0 and HTTPS and all 
protocol gestures are fully documented, allowing for broad interoperability. 

Focusing on highly available and reliable durable messaging, the Service Bus Premium provides competitive throughput 
performance even with substantial local datacenter deployments, but without hardware selection and acquisition 
processes, deployment planning and execution, and endless performance optimization sessions. 

Service Bus Premium is a fully managed offering with dedicated capacity reserved for each tenant that yields 
predictable performance with a simple, capacity-oriented pricing model and at extremely lower overall cost than 
commercial on-premises brokers. For many customers, Service Bus Premium can replace dedicated on-premises messaging 
clusters today, even if the attached workloads do not run in the cloud. 

Learn more about Service Bus concepts [in the messaging documentation section](https://docs.microsoft.com/en-us/azure/service-bus-messaging/) 

For Java developers, Service Bus provides a Microsoft supported native API and Service Bus can also be used with 
AMQP 1.0 compliant libraries such as Apache Qpid Proton's JMS provider.

The official Service Bus client is available in [source code form on GitHub](https://github.com/azure/azure-service-bus-java) and 
binaries and packaged sources [are available on Maven Central](http://search.maven.org/#search%7Cga%7C1%7Ca%3A%22azure-servicebus%22). 


## Client library


Add a dependency to your Maven project's `pom.xml` file to use the library in your own project. Specify the version as desired.

[Add a dependency](https://maven.apache.org/guides/getting-started/index.html#How_do_I_use_external_dependencies) to your Maven `pom.xml` file to use the client library in your project.   

```XML
<dependency>
    <groupId>com.microsoft.azure</groupId>
    <artifactId>azure-servicebus</artifactId>
    <version>1.0.0</version>
</dependency>
```

## Example

Send a random number in a message to a queue.

```java
// Configure JNDI environment using a properties file in the classpath
Hashtable<String, String> env = new Hashtable<String, String>();
env.put(Context.INITIAL_CONTEXT_FACTORY, 
            "org.apache.qpid.amqp_1_0.jms.jndi.PropertiesFileInitialContextFactory");
env.put(Context.PROVIDER_URL, "servicebus.properties");
Context context = new InitialContext(env);

// create the connection
ConnectionFactory cf = (ConnectionFactory) context.lookup("servicebus");
connection = cf.createConnection();
sendSession = connection.createSession(false, Session.AUTO_ACKNOWLEDGE);
sender = sendSession.createProducer(queue);

// send a random message
TextMessage message = sendSession.createTextMessage();
message.setText("Test AMQP message from JMS");
long randomMessageID = randomGenerator.nextLong() >>>1;
message.setJMSMessageID("ID:" + randomMessageID);
sender.send(message);
```

> [!div class="nextstepaction"]
> [Explore the Client APIs](/java/api/overview/azure/servicebus/clientlibrary)

## Management API

Create and manage namespaces, topics, queues, and subscriptions with the management API.

[Add a dependency](https://maven.apache.org/guides/getting-started/index.html#How_do_I_use_external_dependencies) to your Maven `pom.xml` file to use the management API in your project.  

```XML
<dependency>
    <groupId>com.microsoft.azure</groupId>
    <artifactId>azure-mgmt-servicebus</artifactId>
    <version>1.1.2</version>
</dependency>

## Examples

The sample code repository contains two samples for how to [QueueClient](https://github.com/Azure/azure-service-bus/blob/master/samples/Java/src/com/microsoft/azure/servicebus/samples/BasicSendReceiveWithQueueClient.java) and [TopicClient and SubscriptionClient](https://github.com/Azure/azure-service-bus/blob/master/samples/Java/src/com/microsoft/azure/servicebus/samples/BasicSendReceiveWithTopicSubscriptionClient.java) and [MessageSender and MessageReceiver](https://github.com/Azure/azure-service-bus/blob/master/samples/Java/src/com/microsoft/azure/servicebus/samples/SendReceiveWithMessageSenderReceiver.java) messages from Service Bus.

> [!div class="nextstepaction"]
> [Explore the Management APIs](/java/api/overview/azure/servicebus/managementapi)


## Samples

[Manage Service Bus queues](https://github.com/Azure-Samples/service-bus-java-manage-queue-with-basic-features)
[Create and subscribe to Service Bus topics](https://github.com/Azure-Samples/service-bus-java-manage-publish-subscribe-with-basic-features)

Explore more [sample Java code for Azure Service Bus](https://azure.microsoft.com/resources/samples/?platform=java&term=bus) you can use in your apps.