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

Create, update, and manage Windows and Linux virtual machines and virtual machine scale sets with the Azure management libraries for Java. 

## Import the libraries

Add a dependency to your Maven project's `pom.xml` file to use the libraries in your own project.

```XML
<dependency>
    <groupId>com.microsoft.azure</groupId>
    <artifactId>azure-mgmt-compute</artifactId>
    <version>1.0.0</version>
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

| | |
|--|--|
| [Manage virtual machines](java-sdk-manage-virtual-machines.md) | Create, update, and delete a Linux or Windows virtual machine. Stop and start virtual machines and add and remove disks to new and existing virtual machines. | 
| [Manage virtual machine scale sets](java-sdk-manage-vm-scalesets.md) | Create a Linux virtual machine scale set, set up a load balancer, and get SSH connection strings to each of the scale set VMs. |
| [Create a virtual machine from a custom image](https://azure.microsoft.com/resources/samples/managed-disk-java-create-virtual-machine-using-custom-image) | Create a generalized Linux image from an existing VM and use it to create a new virtual machine. | 


Explore more [sample Java code](https://azure.microsoft.com/resources/samples/?platform=java) you can use in your apps.