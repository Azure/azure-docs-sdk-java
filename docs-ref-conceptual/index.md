---
title: Azure for Java developers - Tutorials, API Reference | Microsoft Docs
description: Tools, SDKs, tutorials, and samples to help you create and deploy Java apps to Azure.
keywords: Azure, Java, SDK, API
author: rloutlaw
ms.author: routlaw
manager: douge
layout: LandingPage
ms.date: 06/13/2017
ms.topic: article
ms.prod: azure
ms.technology: azure
ms.devlang: java
ms.service: multiple
---

# Azure for Java developers
<ul class="panelContent">
    <li>
        <a href="java-azure-tools.md">
        <div class="cardSize">
            <div class="cardPadding">
                <div class="card">
                    <div class="cardImageOuter">
                        <div class="cardImage">
                            <img src="media/index/data-lake-store.svg" alt="" />
                        </div>
                    </div>
                    <div class="cardText">
                        <h3>Tools</h3>
                        <p>Download tools, SDKs, and plugins for Java development.</p>
                    </div>
                </div>
            </div>
        </div>
        </a>
    </li>
</ul>

The Azure libraries for Java help you manage Azure resources and connect to services from your application code. The libraries are available as [Maven imports](java-sdk-azure-install.md) for use in your Java projects. 

## Manage Azure resources

Create and manage Azure resources from your Java applications using the [Azure management libraries for Java](java-sdk-azure-get-started.md). Use these libraries to build your own Azure automation tools and services. 

For example, to create a Linux VM you would write the following code:

```java
VirtualMachine linuxVM = azure.virtualMachines().define("myAzureVM")
           .withRegion(region)
           .withExistingResourceGroup("sampleResourceGroup")
           .withNewPrimaryNetwork("10.0.0.0/28")
           .withPrimaryPrivateIpAddressDynamic()
           .withoutPrimaryPublicIpAddress()
           .withPopularLinuxImage(KnownLinuxVirtualMachineImage.UBUNTU_SERVER_16_04_LTS)
           .withRootUsername(userName)
           .withSsh(key)
           .withUnmanagedStorage()
           .withSize(VirtualMachineSizeTypes.STANDARD_D3_V2)
           .create();
 ```

Review the [install instructions](java-sdk-azure-install.md) for a full list of the libraries and how to import them into your projects and then read the [get started article](java-sdk-azure-get-started.md) to set up your authentication and run sample code against your own Azure subscription. 

## Connect to Azure services

In addition to using Java libraries to create and manage resources within Azure, you can also use Java libraries to connect  and use those resources in your apps. For example, you might update a table SQL Database or store files in Azure Storage. Select the library you need for a particular service from the [complete list of libraries](java-sdk-azure-install.md) and visit the [Java developer center](https://azure.microsoft.com/develop/java/) for tutorials and sample code for help using them in your apps.

For example, to print out the contents of every blob in an Azure storage container:

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

## Sample code and reference

The following samples cover common automation tasks with the Azure management libraries for Java and have code ready to use in your own apps:

- [Virtual machines](java-sdk-azure-virtual-machine-samples.md)
- [Web apps](java-sdk-azure-web-apps-samples.md)
- [SQL Database](java-sdk-azure-sql-database-samples.md)
   
A [reference](https://docs.microsoft.com/java/api) is available for all packages in both the service and management libraries. New features, breaking changes, and migration instructions from previous versions are available in the [release notes](java-sdk-azure-release-notes.md).