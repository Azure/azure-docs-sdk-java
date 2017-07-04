---
title: Azure management libraries for Java release notes | Microsoft Docs
description: See what's new and watch for breaking changes in the Azure management libraries for Java
keywords: Azure,  Java, API, reference,  notes,  updates, deprecate
author: routlaw
manager: douge
ms.assetid: 1f128cf9-f747-4344-84e1-f9964709deb8
ms.service: Azure
ms.devlang: java
ms.topic: reference
ms.technology: Azure
ms.date: 3/06/2016
---

# Release Notes 

## June 30, 2017 - 1.1.0 

V1.1 is backwards compatible with V1.0 in the APIs intended for public use that reached the general availability (stable) stage in V1.0.

Some breaking changes were introduced in APIs marked with the @Beta annotation in V.0

If you are migrating your code to 1.1.0, you can use [these notes](https://github.com/Azure/azure-sdk-for-java/blob/master/notes/prepare-for-1.1.0.md) for preparing your code for 1.1.0 from 1.0.0.

### Generally availabile in V1.1

Some of the APIs that were still in Beta in V1.0 are now GA in V1.1, in particular:

- async methods
- all methods in CDN that were previously in Beta
- all methods and interfaces in Application Gateways that were previously in Beta

 Some parts of the library are still in Preview. Refer to the table below for the current state of the libraries:

Service or feature | Available as GA | Available as Preview  | Coming soon |
---------|---------|---------|---------|
Compute  | Virtual machines and VM extensions, Virtual machine scale sets, managed disks   | Azure container service, Azure container registry |    |
Storage   |  Storage accounts       |         |   Encryption      |
SQL Database  | Databases, firewalls, elastic pools        |         |   More features      |
Networking    |  Virtual networks , network interfaces , IP addresses ,routing tables, network security groups , DNS, Traffic managers, Application gateways  |    Load balancers     |   VPN, Network watchers   |
More services    |  Resource Manager, Key Vault, Redis,  CDN, Batch       |  Web apps, Function apps, Service Bus, Graph RBAC, DocumentDB   | Monitor ,Scheduler, Functions management, Search, more Graph RBAC features        |
Fundamentals     |   Authentication - core , Async methods       |      |         |

### Import with Maven

```XML
<dependency>
    <groupId>com.microsoft.azure</groupId>
    <artifactId>azure</artifactId>
    <version>1.1.0</version>
</dependency>
```

### Get help and give feedback

Check out the [Stack Overflow](http://stackoverflow.com/questions/tagged/azure-java-sdk) community for help using the libraries in your own code. If you encounter any bugs or have suggestions to improve these libraries, please file issues via [GitHub](https://github.com/Azure/azure-sdk-for-java/issues).

### Migrate from previous releases

[Migrate from 1.0.0-beta5](https://github.com/Azure/azure-sdk-for-java/blob/master/notes/prepare-for-1.0.0.md)  [Migrate from 1.1.0](https://github.com/Azure/azure-sdk-for-java/blob/master/notes/prepare-for-1.1.0.md)


