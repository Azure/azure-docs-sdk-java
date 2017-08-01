---
title: Azure Network libraries for Java
description: Reference documentation for the Java Azure Network management libraries 
keywords: Azure, Java, SDK, API, networking, load balancing, vnet , subnet
author: rloutlaw
ms.author: routlaw
manager: douge
ms.date: 07/20/2017
ms.topic: reference
ms.prod: azure
ms.technology: azure
ms.devlang: java
ms.service: networking
---

# Azure Network libraries for Java

## Overview

Connect Azure resources, filter and balance traffic, and manage routing with [Azure Networking](/azure/networking/networking-overview).

To get started with Azure Networking, see [Create your first virtual network](/azure/virtual-network/virtual-network-get-started-vnet-subnet).

## Management API

Create and manage Azure [virtual networks](/azure/virtual-network/virtual-networks-overview) , [ExpressRoutes](/azure/expressroute/) , and [Application Gateways](/azure/application-gateway/) with the management API.

[Add a dependency](https://maven.apache.org/guides/getting-started/index.html#How_do_I_use_external_dependencies) to your Maven `pom.xml` file to use the management API in your project.  

```XML
<dependency>
    <groupId>com.microsoft.azure</groupId>
    <artifactId>azure-mgmt-network</artifactId>
    <version>1.1.2</version>
</dependency>
```   

### Example

Create a new virtual network with a single subnet.

```java
Network virtualNetwork1 = azure.networks().define(vnetName1)
        .withRegion(Region.US_EAST)
        .withExistingResourceGroup("myResourceGroup")
        .withAddressSpace("192.168.0.0/16")
        .defineSubnet("myVirtualNetwork")
            .withAddressPrefix("192.168.2.0/24")
            .attach()
        .create();
```

> [!div class="nextstepaction"]
> [Explore the Management APIs](/java/api/overview/azure/networking/managementapi)

## Samples

[Manage virtual networks](https://github.com/Azure-Samples/network-java-manage-virtual-network)   
[Manage network interfaces](https://github.com/Azure-Samples/network-java-manage-network-interface)   
[Manage Application Gateways](https://github.com/Azure-Samples/application-gateway-java-manage-simple-application-gateways)   
[Manage internet facing load balancers](https://github.com/Azure-Samples/network-java-manage-internet-facing-load-balancers)   

Explore more [sample Java code for Azure Networking](https://azure.microsoft.com/resources/samples/?platform=java&term=network) you can use in your apps.
