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

The management libraries provide an interface to create, manage, and scale Azure SQL Database deployments from your Java code. Set up and manage databases in [elastic pools](https://docs.microsoft.com/en-us/azure/sql-database/sql-database-elastic-pool) to share resources and configure databases across multiple regions from your code.

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

[!INCLUDE [java-sql-samples](../docs-ref-conceptual/includes/java-sql-samples.md)]

Explore more [sample Java code](https://azure.microsoft.com/resources/samples/?platform=java) you can use in your apps.