---
title: Azure Virtual Machine libraries for Java
description: 
keywords: Azure, Java, SDK, API, Compute , Virtual Machines
author: douge
ms.author: douge
manager: douge
ms.date: 05/17/2017
ms.topic: article
ms.prod: azure
ms.technology: azure
ms.devlang: java
ms.service: compute
---

# Azure virtual machine libraries

## Overview

Define, configure, and deploy new Windows and Linux virtual machines and virtual machine scale sets from your code with the Azure management libraries for Java. The libraries also let start and stop existing virtual machines and attach or detach disks to stopped VMs in your subscription.

## Import the libraries

Add a dependency to your Maven project's `pom.xml` file to use the libraries in your own project.

```XML
<dependency>
    <groupId>com.microsoft.azure</groupId>
    <artifactId>azure-mgmt-compute</artifactId>
    <version>1.1.2</version>
</dependency>
```   

## Example

Create a new Linux virtual machine from a marketplace image in an existing Azure resource group.

```java
VirtualMachine newLinuxVm = azure.virtualMachines().define(linuxVmName)
            .withRegion(Region.US_EAST)
            .withNewResourceGroup("myResourceGroup")
            .withNewPrimaryNetwork("10.0.0.0/28")
            .withPrimaryPrivateIpAddressDynamic()
            .withoutPrimaryPublicIpAddress()
            .withPopularWindowsImage(KnownLinuxVirtualMachineImage.UBUNTU_SERVER_16_04_LTS)
            .withRootUsername(userName)
            .withSshKey(key)
            .withSize(VirtualMachineSizeTypes.STANDARD_D3_V2)
            .create();
```

## Samples

[!INCLUDE [java-vm-samples](../docs-ref-conceptual/includes/java-vm-samples.md)]

Explore more [sample Java code](https://azure.microsoft.com/resources/samples/?platform=java) you can use in your apps.