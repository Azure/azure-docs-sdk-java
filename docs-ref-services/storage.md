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

# Azure Storage libraries for Java

## Overview

Read and write files, blob (object) data, key-value pairs, and messages from your Java applications with [Azure Storage](/azure/storage/storage-introduction).

[Add a dependency](https://maven.apache.org/guides/getting-started/index.html#How_do_I_use_external_dependencies) to your Maven `pom.xml` file to use the Azure Storage library in your project.   

```XML
<dependency>
    <groupId>com.microsoft.azure</groupId>
    <artifactId>azure-storage</artifactId>
    <version>6.1.0</version>
</dependency>
```   

To get started with Azure Storage, see [Transfer objects to/from Azure Blob storage](/azure/storage/blobs/storage-quickstart-blobs-java) or [view all Azure Storage samples](https://azure.microsoft.com/resources/samples/?platform=java&term=storage).

## Connect to Blob Storage 

Use [connection strings](/azure/storage/storage-create-storage-account#manage-your-storage-account) to connect to an Azure Blob Storage account.

```java
import com.microsoft.azure.storage.CloudStorageAccount;
import com.microsoft.azure.storage.blob.CloudBlobClient;


final String storageConnectionString =
	    "DefaultEndpointsProtocol=https;" +
	    "AccountName=<account-name>;" +
	    "AccountKey=<account-key>";

CloudStorageAccount account = CloudStorageAccount.parse(storageConnectionString);
CloudBlobClient blobClient = storageAccount.createCloudBlobClient();
```

## Create a new blob storage container

Create a new blob storage container with anonymous read access to blob resources, container metadata, and the list of blobs in the container.

```java
import com.microsoft.azure.storage.blob.CloudBlobContainer;
import com.microsoft.azure.storage.blob.BlobContainerPublicAccessType;
import com.microsoft.azure.storage.blob.BlobRequestOptions;
import com.microsoft.azure.storage.OperationsContext;

container.createIfNotExists(BlobContainerPublicAccessType.CONTAINER, new BlobRequestOptions(), new OperationContext());
```

## List blobs in a container

List all blobs in a Blob Storage container.

```java
import com.microsoft.azure.storage.blob.ListBlobItem;

for (ListBlobItem blobItem : container.listBlobs()) {
    System.out.println("URI of blob is: " + blobItem.getUri());
}
```

## Create a new blob 

Write text to a new file `uploadedFile.txt` and upload to a new blob.

```java
import java.util.File;
import java.io.Writer;
import java.io.FileWriter;
import java.io.BufferedWriter;

File sourceFile = File.createTempFile("sampleFile", ".txt");
System.out.println("Creating a sample file at: " + sourceFile.toString());
Writer output = new BufferedWriter(new FileWriter(sourceFile));
output.write("Hello Azure!");
output.close();

CloudBlockBlob blob = container.getBlockBlobReference(sourceFile.getName());
blob.uploadFromFile(sourceFile.getAbsolutePath());
```

## Download a blob 

Download a file `uploadedFile.txt` from Blob Storage to the local file `downloadedFile.txt`.

```java

import java.util.File;
import com.microsoft.azure.storage.blob.CloudBlockBlob;

CloudBlockBlob blob = container.getBlockBlobReference("uploadedFile.txt");

File downloadedFile = null;
downloadedFile = new File("downloadedFile.txt");
blob.downloadToFile(downloadedFile.getAbsolutePath());
```

## Delete a blob

Delete the blob `uploadedFile.txt` from a blob storage container `mycontainer`.

```java
import com.microsoft.azure.storage.blob.CloudBlobContainer;
import com.microsoft.azure.storage.blob.CloudBlockBlob;

CloudBlobContainer container = blobClient.getContainerReference("mycontainer");
CloudBlockBlob blob = container.getBlockBlobReference("uploadedFile.txt");
blob.deleteIfExists();
```

> [!div class="nextstepaction"]
> [Find more sample code](https://azure.microsoft.com/resources/samples/?platform=java&term=storage)

## Management API

Crete and manage Azure Storage accounts and connection keys with the management API.

[Add a dependency](https://maven.apache.org/guides/getting-started/index.html#How_do_I_use_external_dependencies) to your Maven `pom.xml` file to use the management API in your project.  

```XML
<dependency>
    <groupId>com.microsoft.azure</groupId>
    <artifactId>azure-mgmt-storage</artifactId>
    <version>1.3.0</version>
</dependency
```   

### Example

Create a new Azure Storage account in your subscription and retrieve its access keys.

```java
StorageAccount storageAccount = azure.storageAccounts().define(storageAccountName)
        .withRegion(Region.US_EAST)
        .withNewResourceGroup(rgName)
        .create();

// get a list of storage account keys related to the account
List<StorageAccountKey> storageAccountKeys = storageAccount.getKeys();
for(StorageAccountKey key : storageAccountKeys)    {
    System.out.println("Key name: " + key.keyName() + " with value "+ key.value());
}
```

> [!div class="nextstepaction"]
> [Explore the Management samples](https://azure.microsoft.com/en-us/resources/samples/?platform=java&term=storage+manage)

## Spring integration

Autowire an Azure Storage account through your app's `application.properties` file using the [Azure Storage starter for Spring Boot](https://docs.microsoft.com/java/azure/spring-framework/configure-spring-boot-starter-java-app-with-azure-storage). 

## Samples

[Manage Azure Storage accounts](../docs-ref-conceptual/java-sdk-manage-storage-accounts.md)    
[Read and write objects to blob storage](https://github.com/Azure-Samples/storage-blob-java-getting-started)   
[Read and write messages with queues](https://github.com/Azure-Samples/storage-queue-java-getting-started)   
[Read files from blob storage in a web app](https://github.com/Azure-Samples/app-service-java-manage-storage-connections-for-web-apps-on-linux)
