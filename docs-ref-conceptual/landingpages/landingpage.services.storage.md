---
title: Azure Storage SDK for Java
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

Read and write objects and table data to [Azure Storage](https://docs.microsoft.com/azure/storage/) from your Java applications. Define and send messages with queues and mount shared  filesystems to share data between applications.

## Import the libraries

Add the following dependency to your Maven project's `pom.xml` file. 

```XML
<dependency>
    <groupId>com.microsoft.azure</groupId>
    <artifactId>azure-storage</artifactId>
    <version>5.0.0</version>
</dependency>
```   

## Example usage

The following code writes a new file to an existing blob storage container using a provided [storage connection string](https://docs.microsoft.com/en-us/azure/storage/storage-configure-connection-string).

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

<h2 class="accented">Packages</h2>
		<table class="nameValue">
			<tr id="com_microsoft_azure_management_storage" data-moniker=" 0 ">
				<td>
					<span class="lang-java"><a class="xref" href="../../com.microsoft.azure.management.storage" data-linktype="relative-path">com.microsoft.azure.management.storage</a></span>
				</td>
				<td>
				<p>This package contains the classes for StorageManagementClient. The Storage Management Client. </p>
				</td>
			</tr>
			<tr id="com_microsoft_azure_storage" data-moniker=" 0 ">
				<td colspan="2">
					<span class="lang-java"><a class="xref" href="../../com.microsoft.azure.storage" data-linktype="relative-path">com.microsoft.azure.storage</a></span>
				</td>
			</tr>
			<tr id="com_microsoft_azure_storage_analytics" data-moniker=" 0 ">
				<td colspan="2">
					<span class="lang-java"><a class="xref" href="../../com.microsoft.azure.storage.analytics" data-linktype="relative-path">com.microsoft.azure.storage.analytics</a></span>
				</td>
			</tr>
			<tr id="com_microsoft_azure_storage_blob" data-moniker=" 0 ">
				<td colspan="2">
					<span class="lang-java"><a class="xref" href="../../com.microsoft.azure.storage.blob" data-linktype="relative-path">com.microsoft.azure.storage.blob</a></span>
				</td>
			</tr>
			<tr id="com_microsoft_azure_storage_core" data-moniker=" 0 ">
				<td colspan="2">
					<span class="lang-java"><a class="xref" href="../../com.microsoft.azure.storage.core" data-linktype="relative-path">com.microsoft.azure.storage.core</a></span>
				</td>
			</tr>
			<tr id="com_microsoft_azure_storage_file" data-moniker=" 0 ">
				<td colspan="2">
					<span class="lang-java"><a class="xref" href="../../com.microsoft.azure.storage.file" data-linktype="relative-path">com.microsoft.azure.storage.file</a></span>
				</td>
			</tr>
			<tr id="com_microsoft_azure_storage_queue" data-moniker=" 0 ">
				<td colspan="2">
					<span class="lang-java"><a class="xref" href="../../com.microsoft.azure.storage.queue" data-linktype="relative-path">com.microsoft.azure.storage.queue</a></span>
				</td>
			</tr>
			<tr id="com_microsoft_azure_storage_table" data-moniker=" 0 ">
				<td colspan="2">
					<span class="lang-java"><a class="xref" href="../../com.microsoft.azure.storage.table" data-linktype="relative-path">com.microsoft.azure.storage.table</a></span>
				</td>
			</tr>
		</table>
