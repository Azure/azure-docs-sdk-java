---
title: Azure IoT Hub libraries for Java
description: Reference documentation for the Java Azure IoT Hub libraries 
keywords: Azure, Java, SDK, API, event, IoT, streams, devices, iot hub
author: rloutlaw
ms.author: routlaw
manager: douge
ms.date: 06/21/2017
ms.topic: article
ms.prod: azure
ms.technology: azure
ms.devlang: java
ms.service: iot-hub
---

# Azure IoT libraries for Java

## Overview

Register devices and send messages from the cloud to registered devices using the IoT Service library. Send messages to the cloud and receive messages on devices using the IoT Device library.

## Import the libraries

Add a dependency to your Maven project's `pom.xml` file to use the libraries in your own project.

### IoT Service library

```XML
<dependency>
    <groupId>com.microsoft.azure.sdk.iot</groupId>
    <artifactId>iot-service-client</artifactId>
    <version>1.4.20</version>
</dependency>
```   

### Iot Device library

```XML
<dependency>
    <groupId>com.microsoft.azure.sdk.iot</groupId>
    <artifactId>iot-device-client</artifactId>
    <version>1.1.27</version>
</dependency>
```

## Example

Send a message from Azure IoT Hub to a device.

```java
Message messageToSend = new Message(messageText);
messageToSend.setDeliveryAcknowledgement(DeliveryAcknowledgement.Full);
messageToSend.setMessageId(java.util.UUID.randomUUID().toString());

// set message properties
Map<String, String> propertiesToSend = new HashMap<String, String>();
propertiesToSend.put(messagePropertyKey,messagePropertyKey);
messageToSend.setProperties(propertiesToSend);

CompletableFuture<Void> future = serviceClient.sendAsync(deviceId, messageToSend);
try {
    future.get();
}
catch (ExecutionException e) {
    System.out.println("Exception : " + e.getMessage());
}
```

## Samples

[!INCLUDE [java-iot-samples](../docs-ref-conceptual/includes/iot.md)]


Explore more [sample Java code](https://azure.microsoft.com/resources/samples/?platform=java) you can use in your apps.
