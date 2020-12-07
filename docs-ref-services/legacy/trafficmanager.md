---
title: Azure Traffic Manager libraries for Java
description: Reference documentation for the Java Traffic Manager management libraries 
keywords: Azure, Java, SDK, API, load balancing, load distribution, network, Traffic Manager
author: rloutlaw
ms.author: routlaw
manager: douge
ms.date: 07/11/2017
ms.topic: reference
ms.prod: azure
ms.technology: azure
ms.devlang: java
ms.service: traffic-manager
---

# Azure Traffic Manager libraries for Java

## Overview

Control the distribution of user traffic for service endpoints in different datacenters with [Azure Traffic Manager](/azure/traffic-manager/traffic-manager-overview).

To get started with Azure Traffic Manager, see [Create a Traffic Manager profile](/azure/traffic-manager/traffic-manager-create-profile).

## Management API

Create Traffic Manager profiles, define endpoints, and change the routing method with the management API. 

[Add a dependency](https://maven.apache.org/guides/getting-started/index.html#How_do_I_use_external_dependencies) to your Maven `pom.xml` file to use the management API in your project.  

```XML
<dependency>
    <groupId>com.microsoft.azure</groupId>
    <artifactId>azure-mgmt-trafficmanager</artifactId>
    <version>1.3.0</version>
</dependency>
```   

## Example

Create a Traffic Manager profile and assign a single endpoint.

```java
TrafficManagerProfile tmProfile = azure.trafficManagerProfiles().define("testTMProfile")
        .withNewResourceGroup(Region.US_EAST)
        .withLeafDomainLabel("testTMProfile")
        .withPriorityBasedRouting()
        .defineAzureTargetEndpoint("endpoint")
        .toResourceId(webAppId)
        .withRoutingPriority(1)
        .attach()
        .create();
```

> [!div class="nextstepaction"]
> [Explore the Management APIs](/java/api/overview/azure/trafficmanager/management)

## Samples

[Balance web app traffic across multiple regions](https://github.com/Azure-Samples/traffic-manager-java-manage-profiles)

Explore more [sample Java code for Azure Traffic Manager](https://azure.microsoft.com/resources/samples/?platform=java&term=traffic) you can use in your apps.
