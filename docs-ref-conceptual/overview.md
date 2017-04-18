---
title: Azure SDK for Java
description: Overview of the Azure SDK for Java
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

# Azure SDK for Java

The Java SDK for Azure lets you create and manage Azure resources from your Java applications.

The Azure SDK for Java has a [fluent](java-sdk-azure-concepts.md#fluent) interface to configure and update resources. For example, to add a Linux virtual machine in an existing Azure resource group:

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
           .withSize(VirtualMachineSizeTypes.STANDARD_D3_V2)
           .create();
 ```

Review the [Install instructions](java-sdk-azure-install.md) to get the SDK into your Maven or Gradle projects either on the command line . Then read the [Get started](java-sdk-azure-get-started.md) to set up authentication and run some sample code against your own Azure subscription. The more in depth [concepts article](java-sdk-azure-patterns.md) article goes into the patterns the SDK uses and how to leverage those to simplify your application code.

Use the code in the following samples to learn how to perform common tasks with the Azure SDK for Java:

- [Virtual machines](java-sdk-azure-virtual-machine-samples.md)
- [Resource groups](java-sdk-azure-resource-groups-samples.md)
- [Web apps](java-sdk-azure-web-apps-samples.md)
- [SQL Database](java-sdk-azure-sql-database-samples.md)

A detailed [reference](java-sdk-reference.md) is available for the SDK and latest changes to the SDK are available in the [release notes](java-sdk-release-notes.md).