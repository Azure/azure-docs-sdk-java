---
title: Azure Batch libraries for Java
description: Reference documentation for the Java Batch libraries 
keywords: Azure, Java, SDK, API, Batch, processing, scheduling, long-running
author: rloutlaw
ms.author: routlaw
manager: douge
ms.date: 06/21/2017
ms.topic: article
ms.prod: azure
ms.technology: azure
ms.devlang: java
ms.service: batch
---

# Azure Batch libraries for Java

## Overview

The Azure Batch client libraries let you configure compute nodes and pools, define tasks and configure them to run in jobs, and set up a job manager to control and monitor job execution. [Learn more](https://docs.microsoft.com/en-us/azure/batch/batch-api-basics) about using these objects to run large-scale parallel compute solutions.

Use the Azure Batch management libraries to create and delete batch accounts, read and regenerate batch account keys, and manage batch account storage.

## Import the libraries

Add a dependency to your Maven project's `pom.xml` file to use the libraries in your own project.

### Client library

```XML
<dependency>
    <groupId>com.microsoft.azure</groupId>
    <artifactId>azure-batch</artifactId>
    <version>2.0.0</version>
</dependency>
```   

### Management 

```XML
<dependency>
    <groupId>com.microsoft.azure</groupId>
    <artifactId>azure-mgmt-batch</artifactId>
    <version>1.1.0</version>
</dependency>
```

## Example

Set up a pool of Linux compute nodes in a batch account:

```java
// create the batch client for an account using its URI and keys
BatchClient client = BatchClient.open(new BatchSharedKeyCredentials(batchUri, batchAccount, batchKey));

// configure a pool of VMs to use 
VirtualMachineConfiguration configuration = new VirtualMachineConfiguration();
configuration.withNodeAgentSKUId("batch.node.ubuntu 16.04");
client.poolOperations().createPool(poolId, poolVMSize, configuration, poolVMCount);
```

## Samples

[!INCLUDE [java-sql-samples](../docs-ref-conceptual/includes/batch.md)]


Explore more [sample Java code](https://azure.microsoft.com/resources/samples/?platform=java) you can use in your apps.
