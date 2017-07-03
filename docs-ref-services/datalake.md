---
title: Azure Data Lake Store libraries for Java
description: Reference documentation for the Java Data Lake Store libraries 
keywords: Azure, Java, SDK, API, big data, data lake
author: rloutlaw
ms.author: routlaw
manager: douge
ms.date: 06/21/2017
ms.topic: article
ms.prod: azure
ms.technology: azure
ms.devlang: java
ms.service: data-lake-store
---

# Azure Data Lake Store libraries for Java

## Overview

Read and write to files stored in Data Lake Store with buffered streams, get and set file permissions and metadata, and create, delete, and rename files or directories in a Data Lake Store.

Use the Azure Data Lake Store management libraries to manage accounts, firewall rules, and trusted identity providers.

## Import the libraries

Add a dependency to your Maven project's `pom.xml` file to use the libraries in your own project.

### Client library

```XML
<dependency>
   <groupId>com.microsoft.azure</groupId>
   <artifactId>azure-data-lake-store-sdk</artifactId>
   <version>2.1.5</version>
</dependency>
```   

### Management 

```XML
<dependency>
    <groupId>com.microsoft.azure</groupId>
    <artifactId>azure-mgmt-datalake-store</artifactId>
    <version>1.1.0</version>
</dependency>
```

## Example

Create a Data Lake client from a fully qualified domain name and OAuth2 access token, then create a new file and write to it.

```java
// 
AccessTokenProvider provider = new ClientCredsTokenProvider(authTokenEndpoint, clientId, clientKey);
ADLStoreClient client = ADLStoreClient.createClient(accountFQDN, provider);

// create directory
client.createDirectory("/a/b/w");
        
// create file and write some content
String filename = "/a/b/c.txt";
OutputStream stream = client.createFile(filename, IfExists.OVERWRITE  );
PrintStream out = new PrintStream(stream);
for (int i = 1; i <= 10; i++) {
    out.println("This is line #" + i);
    out.format("This is the same line (%d), but using formatted output. %n", i);
}
out.close();
```

## Samples

[!INCLUDE [java-datalake-samples](../docs-ref-conceptual/includes/datalake.md)]


Explore more [sample Java code](https://azure.microsoft.com/resources/samples/?platform=java) you can use in your apps.
