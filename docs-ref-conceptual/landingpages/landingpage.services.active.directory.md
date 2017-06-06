---
title: Azure Active directory libraries for Java
description: 
keywords: Azure, Java, SDK, API, SQL, authentication, AAD, Active Directory , JDBC
author: rloutlaw
ms.author: routlaw
manager: douge
ms.date: 05/17/2017
ms.topic: article
ms.prod: azure
ms.technology: azure
ms.devlang: java
ms.service: appservice
---

# Azure Active Directory libraries for Java

## Overview

Authenticate users and manage access controls to your applications with Azure Active Directory.

## Import the libraries

Add a dependency to your Maven project's `pom.xml` file to use the libraries in your own project.

### Client 

```XML
<dependency>
    <groupId>com.microsoft.azure</groupId>
    <artifactId>adal4j</artifactId>
    <version>1.2.0</version>
</dependency>
```   

### Management

```XML
<dependency>
    <groupId>com.microsoft.azure</groupId>
    <artifactId>azure-mgmt-graph-rbac</artifactId>
    <version>1.0.0</version>
</dependency>
```

## Example

Connect to a Azure SQL database and select all records in the sales table.

```java
ExecutorService service = Executors.newFixedThreadPool(1);
AuthenticationContext context = ew AuthenticationContext(AUTHORITY, false, service);

```

## Samples

| | |
|--|--|
| [Connect and query data from Azure SQL Database using JDBC][4] | Configure a sample database, then run select, insert, update, and delete commands. |
| [Create and manage SQL databases][1] | Create SQL databases, set performance levels, and configure firewalls.  | 
| [Manage SQL databases across multiple regions][2] | Create a master SQL database and read-only databases from the master in multiple regions. Connect VMs to their nearest SQL database instance with a virtual network and firewall rules. | 
| [Manage SQL databases in elastic pools][3] | Create, delete, and move SQL databases in and out of elastic pools. | 

[1]: https://azure.microsoft.com/resources/samples/sql-database-java-manage-db/
[2]: https://azure.microsoft.com/resources/samples/sql-database-java-manage-sql-databases-across-regions/
[3]: java-sdk-manage-sql-elastic-pools.md
[4]: https://docs.microsoft.com/azure/sql-database/sql-database-connect-query-java

Explore more [sample Java code](https://azure.microsoft.com/resources/samples/?platform=java) you can use in your apps.