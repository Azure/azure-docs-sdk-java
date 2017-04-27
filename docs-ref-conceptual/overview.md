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

Use services such as SQL Database, Azure Storage, Active Directory, and DocumentDB in your Java applications with native APIs. View the [complete list of service libraries](java-sdk-azure-install.md) and check out the [tutorials](java-tutorials-services.md) to learn more about adding features to your app with Azure services.

## Manage Azure resources

Create and manage Azure resources from your Java applications using the [Azure Management libraries for Java](https://review.docs.microsoft.com/en-us/java/api/docs-ref-conceptual/java-sdk-azure-get-started?branch=java-sdk-experience). 
Use these libraries to build your own Azure automation tools and services. 

For example, the following code creates a new Ubuntu Linux VM with name `linuxVmName` in an existing Azure resource group `rgName`. 

```java
VirtualMachine linuxVM = azure.virtualMachines().define(linuxVmName)
           .withRegion(region)
           .withExistingResourceGroup(rgName)
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

Review the [install instructions](java-sdk-azure-install.md) to start using the libraries immediately with your Java projects. Set up authentication and run sample code against your own Azure subscription in the [get started article](java-sdk-azure-get-started.md). The [concepts article](java-sdk-azure-concepts.md) article goes into the conventions the libraries use and how to leverage them to simplify your application code. New features, breaking changes, and migration instructions are available in the [release notes](java-sdk-release-notes.md).

The following samples cover common automation tasks with the Azure Management libraries for Java and have code ready to use in your own apps:

- [Virtual machines](java-sdk-azure-virtual-machine-samples.md)
- [Web apps](java-sdk-azure-web-apps-samples.md)
- [SQL Database](java-sdk-azure-sql-database-samples.md)

A complete [reference](java-sdk-reference.md) is available for all packages and classes in the Azure libraries for Java.