---
title: Azure Storage libraries for Java
description: 
keywords: Azure, Java, SDK, API, Storage
author: douge
ms.author: douge
manager: douge
ms.date: 05/17/2017
ms.topic: article
ms.prod: azure
ms.technology: azure
ms.devlang: java
ms.service: storage
---

# Azure Storage libraries

## Overview

Read and write objects and send messages between your Java apps with the [Azure Storage](https://docs.microsoft.com/azure/storage/) client libraries. Create, update, and manage Azure Storage accounts from Java code with the management libraries.

## Import the libraries

Add a dependency to your Maven project's `pom.xml` file to use the libraries in your own project.

### Client 

```XML
<dependency>
    <groupId>com.microsoft.azure</groupId>
    <artifactId>azure-storage</artifactId>
    <version>5.0.0</version>
</dependency>
```   

### Management

```XML
dependency>
    <groupId>com.microsoft.azure</groupId>
    <artifactId>azure-mgmt-storage</artifactId>
    <version>1.0.0</version>
</dependency
```   

## Example

Write a new blob to an existing storage container using a provided [storage account connection string](https://docs.microsoft.com/en-us/azure/storage/storage-configure-connection-string).

```java
    // create a CloudBlobClient to interact with 
	//the blob storage in this Azure Storage account
    CloudStorageAccount account = CloudStorageAccount.parse(storageConnection);
    CloudBlobClient serviceClient = account.createCloudBlobClient();

    // Container name must be lower case.
    CloudBlobContainer container = serviceClient.getContainerReference("testcontainer");

    // write a blob to the container
    CloudBlockBlob blob = container.getBlockBlobReference("newlogo.png");
    blob.uploadFromFile("/Users/raisa/fabrikam.png");
```

## Samples

| | |
|--|--|
| [Get started with Azure Blob Storage in Java](https://azure.microsoft.com/en-us/resources/samples/storage-blob-java-getting-started/) | Create, read, update, restrict access, and delete files and objects in Azure Storage. |
| [Get started with Azure Queue Storage in Java](https://azure.microsoft.com/en-us/resources/samples/storage-queue-java-getting-started/) | Insert, peek, retrieve and delete messages from Azure Storage queues. | 
| [Manage Azure Storage accounts](java-sdk-manage-storage-accounts.md) | Create, update , and delete storage accounts. Retrieve and regenerate storage account access keys.

Explore more [sample Java code](https://azure.microsoft.com/resources/samples/?platform=java) you can use in your apps.