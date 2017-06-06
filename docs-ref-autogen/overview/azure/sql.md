---
title: Azure SQL Database libraries for Java
description: 
keywords: Azure, Java, SDK, API, SQL, database , JDBC
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

# Azure SQL Database libraries for Java

## Overview

Work with data stored in  [Azure SQL Database](https://docs.microsoft.com/azure/sql-database/sql-database-technical-overview)  from Java with the Azure SQL database JDBC driver. The driver can be used to issue SQL queries directly from your code through JDBC or through data access frameworks like [Spring Data JPA](http://projects.spring.io/spring-data-jpa/) and [Hibernate](http://hibernate.org/orm/).

The management libraries provide an interface to create, manage, and scale Azure SQL Database deployments from your Java code. Set up and manage databases in [elastic pools](https://docs.microsoft.com/en-us/azure/sql-database/sql-database-elastic-pool) to share resources and configure databases across multiple regions from your Java code.

## Import the libraries

Add a dependency to your Maven project's `pom.xml` file to use the libraries in your own project.

### JDBC driver

```XML
<dependency>
    <groupId>com.microsoft.sqlserver</groupId>
    <artifactId>mssql-jdbc</artifactId>
    <version>6.1.0.jre8</version>
</dependency>
```   

### Management

```XML
<dependency>
    <groupId>com.microsoft.azure</groupId>
    <artifactId>azure-mgmt-sql</artifactId>
    <version>1.0.0</version>
</dependency>
```

## Example

Connect to a Azure SQL database and select all records in the sales table.

```java

String url = String.format("jdbc:sqlserver://%s.database.windows.net:1433;database=%s;user=%s;password=%s;encrypt=true;hostNameInCertificate=*.database.windows.net;loginTimeout=30;", hostName, dbName, user, password);
Connection connection = null;
try {
    connection = DriverManager.getConnection(url);
    String selectSql = "SELECT * FROM SALES";
    Statement statement = connection.createStatement();
    ResultSet resultSet = statement.executeQuery(selectSql);
}
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