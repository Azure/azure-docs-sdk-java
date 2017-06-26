---
title: Azure Event Hub libraries for Java
description: Reference documentation for the Java Event Hub libraries 
keywords: Azure, Java, SDK, API, event hub, IoT, stream processing
author: rloutlaw
ms.author: routlaw
manager: douge
ms.date: 06/21/2017
ms.topic: article
ms.prod: azure
ms.technology: azure
ms.devlang: java
ms.service: data-lake-store
---

# Azure Event Hub libraries for Java

## Overview

Send events to an Azure Event Hub and consume and process events from an Event Hub using the Event Hub client library.

## Import the libraries

Add a dependency to your Maven project's `pom.xml` file to use the libraries in your own project.

### Client library

```XML
<dependency>
    <groupId>com.microsoft.azure</groupId>
    <artifactId>azure-eventhubs</artifactId>
    <version>0.14.0</version>
</dependency>
```   

## Example

Send an event to an event hub.

```java
ConnectionStringBuilder connStr = new ConnectionStringBuilder(namespaceName, eventHubName,sasKeyName, sasKey);

byte[] payloadBytes = "Test AMQP message from JMS".getBytes("UTF-8");
EventData sendEvent = new EventData(payloadBytes);
EventHubClient ehClient = EventHubClient.createFromConnectionStringSync(connStr.toString());
ehClient.sendSync(sendEvent);
```

## Samples

[!INCLUDE [java-eventhub-samples](../docs-ref-conceptual/includes/eventhub.md)]


Explore more [sample Java code](https://azure.microsoft.com/resources/samples/?platform=java) you can use in your apps.
