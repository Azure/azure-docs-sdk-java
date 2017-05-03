---
title: Azure libraries for Java
description: Overview of the Azure management and service libraries for Java
keywords: Azure, Java, SDK, API
author: rloutlaw
ms.author: routlaw
manager: douge
ms.date: 04/16/2017
ms.topic: article
ms.prod: azure
ms.technology: azure
ms.devlang: java
ms.service: multiple
ms.assetid: 9aaf22a2-382a-4b13-a8e3-0e467d607207
---

# Azure libraries for Java

The Azure libraries for Java let you use Azure services and manage Azure resources from your application code. The libraries are available as [Maven imports](java-sdk-azure-install.md) for use in your Java projects. 

## Consume Azure services

Use services such as SQL Database, Azure Storage, Active Directory, and DocumentDB in your Java applications with native interfaces. Import the libraries for the services you want to use from [the complete list](java-sdk-azure-install.md) and check out [Java developer center](https://azure.microsoft.com/develop/java/) to learn more about adding features to your apps with Azure services.

For example, to print out the contents of all blobs in an Azure storage container:

```java
            // get the container from the blob client
			CloudBlobContainer container = blobClient.getContainerReference("blobcontainer");

			// For each item in the container
			for (ListBlobItem blobItem : container.listBlobs()) {
			    // If the item is a blob, not a virtual directory
			    if (blobItem instanceof CloudBlockBlob) {
			        // Download the text
			    	CloudBlockBlob retrievedBlob = (CloudBlockBlob) blobItem;
			    	System.out.println(retrievedBlob.downloadText());
			    }
			}
```

## Manage Azure resources

Create and manage Azure resources from your Java applications using the [Azure management libraries for Java](java-sdk-azure-get-started.md). Use these libraries to build your own Azure automation tools and services. 

For example, the to create a Linux VM in an existing Azure resource group:

```java
VirtualMachine linuxVM = azure.virtualMachines().define("myAzureVM")
           .withRegion(region)
           .withExistingResourceGroup("sampleResourceGroup")
           .withNewPrimaryNetwork("10.0.0.0/28")
           .withPrimaryPrivateIpAddressDynamic()
           .withoutPrimaryPublicIpAddress()
           .withPopularLinuxImage(KnownLinuxVirtualMachineImage.UBUNTU_SERVER_16_04_LTS)
           .withRootUsername(userName)
           .withRootPassword(password)
           .withUnmanagedStorage()
           .withSize(VirtualMachineSizeTypes.STANDARD_D3_V2)
           .create();
 ```

Review the [install instructions](java-sdk-azure-install.md) for a full list of the libraries and how to import them into your projects the and [get started article](java-sdk-azure-get-started.md) to set up your environment and run some example code in your own subscription. 

## Sample code and reference

The following samples cover common automation tasks with the Azure management libraries for Java and have code ready to use in your own apps:

- [Virtual machines](java-sdk-azure-virtual-machine-samples.md)
- [Web apps](java-sdk-azure-web-apps-samples.md)
- [SQL Database](java-sdk-azure-sql-database-samples.md)
   
A unified [reference](https://docs.microsoft.com/java/api) is available for all packages in both the service and management libraries. New features, breaking changes, and migration instructions from previous versions are available in the [release notes](java-sdk-azure-release-notes.md).