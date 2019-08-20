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

On-demand, scalable computing resources running Linux or Windows.

To get started with Azure virtual machines, see [Create a Linux virtual machine with the Azure portal](/azure/virtual-machines/linux/quick-create-portal).

## Management API

Create, configure, and scale out Windows and Linux virtual machines in Azure from your code with the management API.

[Add a dependency](https://maven.apache.org/guides/getting-started/index.html#How_do_I_use_external_dependencies) to your Maven `pom.xml` file to use the management API in your project.  

```XML
<dependency>
    <groupId>com.microsoft.azure</groupId>
    <artifactId>azure-mgmt-compute</artifactId>
    <version>1.3.0</version>
</dependency>
```   


## Example

Create a new Linux virtual machine in a new Azure resource group.

```java
VirtualMachine newLinuxVm = azure.virtualMachines().define(linuxVmName)
            .withRegion(Region.US_EAST)
            .withNewResourceGroup("myResourceGroup")
            .withNewPrimaryNetwork("10.0.0.0/28")
            .withPrimaryPrivateIpAddressDynamic()
            .withoutPrimaryPublicIpAddress()
            .withPopularLinuxImage(KnownLinuxVirtualMachineImage.UBUNTU_SERVER_16_04_LTS)
            .withRootUsername(userName)
            .withSshKey(key)
            .withSize(VirtualMachineSizeTypes.STANDARD_D3_V2)
            .create();
```

> [!div class="nextstepaction"]
> [Explore the Management APIs](/java/api/overview/azure/virtualmachines/management)


## Samples

[Manage virtual machines][1]   
[Manage virtual networks][6]   
[Create a virtual machine from a custom image][2]   
[Create virtual machines across regions in parallel][5]    
[Create a virtual machine scale set with a load balancer][7]    

[1]: /azure/java/java-sdk-manage-virtual-machines
[2]: https://azure.microsoft.com/resources/samples/managed-disk-java-create-virtual-machine-using-custom-image/
[5]: /azure/java/java-sdk-virtual-machines-in-parallel
[6]: /azure/java/java-sdk-manage-virtual-networks
[7]: /azure/java/java-sdk-manage-vm-scalesets

Explore more [sample Java code for Azure virtual machines](https://azure.microsoft.com/resources/samples/?platform=java&term=VM) you can use in your apps.
