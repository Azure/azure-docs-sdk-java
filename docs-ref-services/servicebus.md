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

Learn more about Service Bus concepts [in the messaging documentation section](https://docs.microsoft.com/azure/service-bus-messaging/) 

For Java developers, Service Bus provides a Microsoft supported native API and Service Bus can also be used with
AMQP 1.0 compliant libraries such as Apache Qpid Proton's JMS provider.

## Client library

The official Service Bus client is available in [source code form on GitHub](https://github.com/Azure/azure-sdk-for-java/tree/master/sdk/servicebus/) and
binaries and packaged sources [are available on Maven Central](http://search.maven.org/#search%7Cga%7C1%7Ca%3A%22azure-messaging-servicebus%22).

**The [sample code repository](https://github.com/Azure/azure-sdk-for-java/tree/master/sdk/servicebus/azure-messaging-servicebus/src/samples/java/com/azure/messaging/servicebus) contains samples for:**
* How to use the [SendMessage](https://github.com/Azure/azure-sdk-for-java/blob/master/sdk/servicebus/azure-messaging-servicebus/src/samples/java/com/azure/messaging/servicebus/SendMessageAsyncSample.java)
* How to use the [Processor to receive](https://github.com/Azure/azure-sdk-for-java/blob/master/sdk/servicebus/azure-messaging-servicebus/src/samples/java/com/azure/messaging/servicebus/ServiceBusProcessorSample.java)

[Add a dependency](https://maven.apache.org/guides/getting-started/index.html#How_do_I_use_external_dependencies) to your Maven `pom.xml` file to use the client library in your project. Specify the version as desired.

```XML
<dependency>
    <groupId>com.azure</groupId>
    <artifactId>azure-messaging-servicebus</artifactId>
    <version>7.0.0</version>
</dependency>
```
Sending Messages:

```java
public class SendMessageSample {
    /**
     * Main method to invoke this demo on how to send an {@link ServiceBusMessage} to an Azure Service Bus.
     *
     */
    public static void main(String[] args) {
        // The connection string value can be obtained by:
        // 1. Going to your Service Bus namespace in Azure Portal.
        // 2. Go to "Shared access policies"
        // 3. Copy the connection string for the "RootManageSharedAccessKey" policy.
        String connectionString = "Endpoint={fully-qualified-namespace};SharedAccessKeyName={policy-name};"
            + "SharedAccessKey={key}";

        // Create a Queue in that Service Bus namespace.
        String queueName = "queueName";

        // Instantiate a client that will be used to call the service.
        ServiceBusSenderClient sender = new ServiceBusClientBuilder()
            .connectionString(connectionString)
            .sender()
            .queueName(queueName)
            .buildClient();

        // Create a message to send.
        ServiceBusMessage message = new ServiceBusMessage("Hello world!");

        // sending one message.
        sender.sendMessage(message);
        
        // Close the sender.
        sender.close();
    }
}
```
Receiving Message using Processor:

```java
public class ServiceBusProcessorSample {

    /**
     * Main method to start the sample application.
     *
     * @param args Ignored args.
     * @throws InterruptedException If the application is interrupted.
     */
    public static void main(String[] args) throws InterruptedException {
        CountDownLatch countdownLatch = new CountDownLatch(1);

        // Create a Queue in that Service Bus namespace.
        String queueName = "queueName";
        
        // Create an instance of the processor through the ServiceBusClientBuilder
        ServiceBusProcessorClient processorClient = new ServiceBusClientBuilder()
            .connectionString("<< connection-string >>")
            .processor()
            .queueName(queueName)
            .processMessage(ServiceBusProcessorSample::processMessage)
            .processError(context -> processError(context, countdownLatch))
            .buildProcessorClient();

        System.out.println("Starting the processor");
        processorClient.start();

        System.out.println("Listening for 10 seconds...");
        if (countdownLatch.await(10, TimeUnit.SECONDS)) {
            System.out.println("Closing processor due to unretriable error");
        } else {
            System.out.println("Closing processor.");
        }

        processorClient.close();
    }

    /**
     * Processes each message from the Service Bus entity.
     *
     * @param context Received message context.
     */
    private static void processMessage(ServiceBusReceivedMessageContext context) {
        ServiceBusReceivedMessage message = context.getMessage();
        System.out.printf("Processing message. Session: %s, Sequence #: %s. Contents: %s%n", message.getMessageId(),
            message.getSequenceNumber(), message.getBody());

        // When this message function completes, the message is automatically completed. If an exception is
        // thrown in here, the message is abandoned.
        // To disable this behaviour, toggle ServiceBusSessionProcessorClientBuilder.disableAutoComplete()
        // when building the session receiver.
    }

    /**
     * Processes an exception that occurred in the Service Bus Processor.
     *
     * @param context Context around the exception that occurred.
     */
    private static void processError(ServiceBusErrorContext context, CountDownLatch countdownLatch) {
        System.out.printf("Error when receiving messages from namespace: '%s'. Entity: '%s'%n",
            context.getFullyQualifiedNamespace(), context.getEntityPath());

        if (!(context.getException() instanceof ServiceBusException)) {
            System.out.printf("Non-ServiceBusException occurred: %s%n", context.getException());
            return;
        }

        ServiceBusException exception = (ServiceBusException) context.getException();
        ServiceBusFailureReason reason = exception.getReason();

        if (reason == ServiceBusFailureReason.MESSAGING_ENTITY_DISABLED
            || reason == ServiceBusFailureReason.MESSAGING_ENTITY_NOT_FOUND
            || reason == ServiceBusFailureReason.UNAUTHORIZED) {
            System.out.printf("An unrecoverable error occurred. Stopping processing with reason %s: %s%n",
                reason, exception.getMessage());

            countdownLatch.countDown();
        } else if (reason == ServiceBusFailureReason.MESSAGE_LOCK_LOST) {
            System.out.printf("Message lock lost for message: %s%n", context.getException());
        } else if (reason == ServiceBusFailureReason.SERVICE_BUSY) {
            try {
                // Choosing an arbitrary amount of time to wait until trying again.
                TimeUnit.SECONDS.sleep(1);
            } catch (InterruptedException e) {
                System.err.println("Unable to sleep for period of time");
            }
        } else {
            System.out.printf("Error source %s, reason %s, message: %s%n", context.getErrorSource(),
                reason, context.getException());
        }
    }
}
```

> [!div class="nextstepaction"]
> [Explore the Client APIs](/java/api/overview/azure/servicebus/client)
> [Find more examples here (See also above for more details)](https://github.com/Azure/azure-service-bus/blob/master/samples/Java/)

## Management API

Create and manage namespaces, topics, queues, and subscriptions with the management API.

**Please find some examples here:**
* [Manage Service Bus queues](https://github.com/Azure-Samples/service-bus-java-manage-queue-with-basic-features)
* [Create and subscribe to Service Bus topics](https://github.com/Azure-Samples/service-bus-java-manage-publish-subscribe-with-basic-features)

**Use the Management API in your project:**
\
[Add a dependency](https://maven.apache.org/guides/getting-started/index.html#How_do_I_use_external_dependencies) to your Maven `pom.xml` file to use the management API in your project.  

```XML
<dependency>
    <groupId>com.azure</groupId>
    <artifactId>azure-messaging-servicebus</artifactId>
    <version>7.0.0</version>
</dependency>
```

'ServiceBusAdministrationClientBuilder' provides a fluent builder API to help aid the configuration and instantiation of 'ServiceBusAdministrationClient' and 'ServiceBusAdministrationAsyncClient'. You can use these clients to manage Service Bus resources.

> [!div class="nextstepaction"]
> [Explore the Management APIs](/java/api/overview/azure/servicebus/management)

Explore more [sample Java code for Azure Service Bus](https://azure.microsoft.com/resources/samples/?platform=java&term=bus) you can use in your apps.
