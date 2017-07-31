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

Connect applications through reliable messaging with [Azure Service Bus](https://docs.microsoft.com/en-us/azure/service-bus-messaging/service-bus-messaging-overview).

To get started with Azure Service Bus, see [How to use Service Bus queues](/azure/service-bus-messaging/service-bus-java-how-to-use-queue).

## Client library

Connect to Service Bus, send messages, and publish and subscribe to topics with the [Java Messaging Service API](https://docs.oracle.com/javaee/7/api/javax/jms/package-summary.html) using the open-source [Apache QPID JMS](https://qpid.apache.org/components/jms/index.html) library.

[Add a dependency](https://maven.apache.org/guides/getting-started/index.html#How_do_I_use_external_dependencies) to your Maven `pom.xml` file to use the client library in your project.   

```XML
<dependency>
    <groupId>com.microsoft.azure</groupId>
    <artifactId>azure-servicebus</artifactId>
    <version>0.9.7</version>
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
```

## Example

Create a topic in a new Service Bus namespace.

```java
ServiceBusNamespace serviceBusNamespace = azure.serviceBusNamespaces()
        .define("newSBNamespace")
        .withRegion(Region.US_EAST)
        .withNewResourceGroup("myResourceGroup")
        .withSku(NamespaceSku.PREMIUM_CAPACITY1)
        .create();
Topic topic = serviceBusNamespace.topics().define("mySBTopic")
        .withSizeInMB(2048)
        .create();
```

> [!div class="nextstepaction"]
> [Explore the Management APIs](/java/api/overview/azure/servicebus/managementapi)


## Samples

[Manage Service Bus queues](https://github.com/Azure-Samples/service-bus-java-manage-queue-with-basic-features)
[Create and subscribe to Service Bus topics](https://github.com/Azure-Samples/service-bus-java-manage-publish-subscribe-with-basic-features)

Explore more [sample Java code for Azure Service Bus](https://azure.microsoft.com/resources/samples/?platform=java&term=bus) you can use in your apps.