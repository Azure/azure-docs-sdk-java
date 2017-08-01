---
title: Service Bus libraries for Java
description: Reference documentation for the Java client and management libraries for Service Bus
keywords: Azure, Java, SDK, API, messaging, amqp, qpid, JMS, pubsub, pub-sub, message broker
author: rloutlaw
ms.author: routlaw
manager: douge
ms.date: 05/17/2017
ms.topic: article
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


## Import the libraries

Add a dependency to your Maven project's `pom.xml` file to use the library in your own project. Specify the version as desired.

### Client library

```XML
<dependency>
    <groupId>com.microsoft.azure</groupId>
    <artifactId>azure-servicebus</artifactId>
    <version>1.0.0</version>
</dependency>
```
### Management API

```XML
<dependency>
    <groupId>com.microsoft.azure</groupId>
    <artifactId>azure-mgmt-servicebus</artifactId>
    <version>1.1.2</version>
</dependency>

## Examples

The sample code repository contains two samples for how to [send](https://github.com/Azure/azure-service-bus/blob/master/samples/Java/src/main/java/com/microsoft/azure/servicebus/samples/SendSample.java) and [receive](https://github.com/Azure/azure-service-bus/blob/master/samples/Java/src/main/java/com/microsoft/azure/servicebus/samples/ReceiveSample.java) messages from Service Bus.
