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

Service Bus provides highly reliable queues and publish/subscribe topics with deep feature capabilities such as 
ordered delivery, sessions, partitioning, scheduling, complex subscriptions, as well as workflow and transaction handling.

Learn more about Service Bus concepts [in the messaging documentation section](https://docs.microsoft.com/azure/service-bus-messaging/). 

For Java developers, Service Bus provides a Microsoft supported native API and Service Bus can also be used with
AMQP 1.0 compliant libraries such as Apache Qpid Proton's JMS provider.

## Libraries for resource management

Create and manage namespaces, topics, queues, and subscriptions with the management API.

**Please find some examples here:**
* [Manage Service Bus queues](https://github.com/Azure-Samples/service-bus-java-manage-queue-with-basic-features)
* [Create and subscribe to Service Bus topics](https://github.com/Azure-Samples/service-bus-java-manage-publish-subscribe-with-basic-features)

**Use the Management API in your project:**
\
[Add a dependency](https://maven.apache.org/guides/getting-started/index.html#How_do_I_use_external_dependencies) to your Maven `pom.xml` file to use the management API in your project.  

| Maven Package | Reference |
|--------------------------------------|---------------------------------------------------------------|
|    [azure-mgmt-servicebus](http://search.maven.org/#search%7Cga%7C1%7Ca%3A%22azure-mgmt-servicebus%22)    |    [API Reference](https://docs.microsoft.com/java/api/com.microsoft.azure.management.servicebus?view=azure-java-stable)    |

```XML
<dependency>
    <groupId>com.microsoft.azure</groupId>
    <artifactId>azure-mgmt-servicebus</artifactId>
    <version>1.38.0</version>
</dependency>
```

> [!div class="nextstepaction"]
> [Explore the Management APIs](/java/api/overview/azure/servicebus/management)

## Libraries for data access

The official Service Bus client is available in [source code form on GitHub](https://github.com/Azure/azure-sdk-for-java/tree/master/sdk/servicebus/) and
binaries and packaged sources [are available on Maven Central](http://search.maven.org/#search%7Cga%7C1%7Ca%3A%22azure-messaging-servicebus%22).

**The [sample code repository](https://github.com/Azure/azure-sdk-for-java/tree/master/sdk/servicebus/azure-messaging-servicebus/src/samples/java/com/azure/messaging/servicebus) contains samples for:**
* How to use the [SendMessage](https://github.com/Azure/azure-sdk-for-java/blob/master/sdk/servicebus/azure-messaging-servicebus/src/samples/java/com/azure/messaging/servicebus/SendMessageAsyncSample.java)
* How to use the [Processor to receive](https://github.com/Azure/azure-sdk-for-java/blob/master/sdk/servicebus/azure-messaging-servicebus/src/samples/java/com/azure/messaging/servicebus/ServiceBusProcessorSample.java)

[Add a dependency](https://maven.apache.org/guides/getting-started/index.html#How_do_I_use_external_dependencies) to your Maven `pom.xml` file to use the client library in your project. Specify the version as desired.

| Maven Package | Reference | Samples |
|--------------------------------------|---------------------------------------------------------------|-------------------------------------------------------------------------------|
|    [azure-messaging-servicebus](http://search.maven.org/#search%7Cga%7C1%7Ca%3A%22azure-messaging-servicebus%22)    |    [API Reference](https://azuresdkdocs.blob.core.windows.net/$web/java/azure-messaging-servicebus/7.0.0/index.html)    |    [Samples](https://github.com/Azure/azure-sdk-for-java/tree/master/sdk/servicebus/azure-messaging-servicebus/src/samples/java/com/azure/messaging/servicebus)    |
|    [microsoft-azure-servicebus](http://search.maven.org/#search%7Cga%7C1%7Ca%3A%22azure-servicebus%22)    |    [API Reference](https://docs.microsoft.com/java/api/overview/azure/servicebus/client?view=azure-java-stable)    |    [Samples](https://github.com/Azure/azure-service-bus/tree/master/samples/Java)    |

**azure-messaging-servicebus**
```XML
<dependency>
    <groupId>com.azure</groupId>
    <artifactId>azure-messaging-servicebus</artifactId>
    <version>7.0.0</version>
</dependency>
```

**microsoft-azure-servicebus**
```XML
<dependency>
  <groupId>com.microsoft.azure</groupId>
  <artifactId>azure-servicebus</artifactId>
  <version>3.5.1</version>
</dependency>
```

> [!div class="nextstepaction"]
> [Explore the Client APIs](/java/api/overview/azure/servicebus/client)
> [Find more examples here (See also above for more details)](https://github.com/Azure/azure-service-bus/blob/master/samples/Java/)

Explore more [sample Java code for Azure Service Bus](https://azure.microsoft.com/resources/samples/?platform=java&term=bus) you can use in your apps.