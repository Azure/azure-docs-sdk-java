---
title: Azure management libraries for Java virtual machine samples
description: Get sample code for creating and updating Azure virtual machines using the Azure management libraries for Java
keywords: Azure, Java, SDK, API, Maven, Gradle, virtual machines
author: rloutlaw
ms.author: routlaw
manager: douge
ms.date: 04/16/2017
ms.topic: article
ms.prod: azure
ms.technology: azure
ms.devlang: java
ms.service: multiple
ms.assetid: 1eeb166f-8253-4fde-82d2-43997fda7819
---

# Azure management libraries for Java samples for virtual machines

The following table links to Java source you can use to create and configure Azure virtual machines.

| **Create virtual machines** || 
|---|---|
| [Manage virtual machines][1] | Create, modify, start, stop, and delete virtual machines. |
| [Create a virtual machine from a custom image][2] | Create a custom virtual machine image and use it to create new virtual machines. | 
| [Create a virtual machine using specialized VHD from a snapshot][3] | Create snapshot from the virtual machine's OS and data disks, create managed disks from the snapshots, and then create a virtual machine by attaching the managed disks. |  
| [Create virtual machines in parallel in the same network][4] | Create virtual machines in the same region on the same virtual network with two subnets in parallel. |
| [Create virtual machines across regions in parallel][5] | Create and load-balance a set of virtual machines across multiple Azure regions. |
| **Network virtual machines** || 
| [Manage virtual networks][6] | Set up a virtual network with two subnets and restrict Internet access to them. |
| **Create scale sets** ||
| [Create a virtual machine scale set with a load balancer][7] | Create a VM scale set, set up a load balancer, and get SSH connection strings to the scale set VMs. |

[1]: java-sdk-manage-virtual-machines.md
[2]: https://azure.microsoft.com/resources/samples/managed-disk-java-create-virtual-machine-using-custom-image/
[3]: https://azure.microsoft.com/resources/samples/managed-disk-java-create-virtual-machine-using-specialized-disk-from-vhd/
[4]: https://azure.microsoft.com/resources/samples/compute-java-manage-virtual-machines-in-parallel/
[5]: java-sdk-virtual-machines-in-parallel.md
[6]: java-sdk-manage-virtual-networks.md
[7]: java-sdk-manage-vm-scalesets.md