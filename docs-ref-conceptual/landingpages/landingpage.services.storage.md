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

## Samples

| [Get started with Azure Blob Storage in Java](https://azure.microsoft.com/en-us/resources/samples/storage-blob-java-getting-started/) | Create, read, update and delete blobs, lock and restrict access to containers in Azure Storage. |
| [Get started with Azure Queue Storage in Java](https://azure.microsoft.com/en-us/resources/samples/storage-queue-java-getting-started/) | Create and delete queues and insert, get, peek at, and delete messages from queues. | 

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
