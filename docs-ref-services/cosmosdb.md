---
title: Azure CosmosDB libraries for Java
description: Reference documentation for the Java client libraries for CosmosDB
keywords: Azure, Java, SDK, API, SQL, database, PostGres,CosmosDB, NoSQL 
author: rloutlaw
ms.author: routlaw
manager: douge
ms.date: 05/17/2017
ms.topic: article
ms.prod: azure
ms.technology: azure
ms.devlang: java
ms.service: cosmosdb
---

# Azure CosmosDB libraries for Java

## Overview

Use CosmosDB in your Java applications to store and query JSON documents in a NoSQL data store.

Learn more about [Azure CosmnosDB](https://docs.microsoft.com/en-us/azure/cosmos-db/introduction)

## Import the libraries

Add a dependency to your Maven project's `pom.xml` file to use the libraries in your own project.

### Client library

```XML
<dependency>
	<groupId>com.microsoft.azure</groupId>
	<artifactId>azure-documentdb</artifactId>
	<version>1.11.0</version>
</dependency>
```   

## Example

Find matching documents in CosmosDB using a SQL-like query interface:

```java
        List<Document> results = documentClient
                .queryDocuments(
                        "dbs/" + DATABASE_ID + "/colls/" + COLLECTION_ID,
                        "SELECT * FROM myCollection WHERE myCollection.email = 'allen [at] contoso.com'",
                        null).getQueryIterable().toList();

```

## Samples

| **Cosmos DB** ||
| [Develop a Java app using Azure Cosmos DB's MongoDB API][2] | Sample Java application that connects to Azure Cosmos DB with the MongoDB API |
| [Develop a Java app using Azure Cosmos DB's Graph API][3] |  Store and access data from a Java application using the Graph API in Cosmos DB |
| [Develop a Java app using Azure Cosmos DB's DocumentDB API][4] | Use  Azure Cosmos DB with the DocumentDB API to store and access data from a Java application | 

Explore more [sample Java code](https://azure.microsoft.com/resources/samples/?platform=java) you can use in your apps.

[2]: https://azure.microsoft.com/resources/samples/azure-cosmos-db-mongodb-java-getting-started/
[3]: https://azure.microsoft.com/resources/samples/azure-cosmos-db-graph-java-getting-started/
[4]: https://azure.microsoft.com/resources/samples/azure-cosmos-db-documentdb-java-getting-started/