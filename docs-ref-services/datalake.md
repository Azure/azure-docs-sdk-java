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

Capture data of any size, type, and ingestion speed in a single place for analytics with [Azure Data Lake Store](/azure/data-lake-store/data-lake-store-overview).

To get started with Data Lake Store, see [Get started with Azure Data Lake Store using Java](/azure/data-lake-store/data-lake-store-get-started-java-sdk).


## Client library

Read and write files, set permissions and metadata, and manage files and directories in Data Lake Store with the client library.

[Add a dependency](https://maven.apache.org/guides/getting-started/index.html#How_do_I_use_external_dependencies) to your Maven `pom.xml` file to use the client library in your project.

```XML
<dependency>
   <groupId>com.microsoft.azure</groupId>
   <artifactId>azure-data-lake-store-sdk</artifactId>
   <version>2.1.5</version>
</dependency>
```   

## Example

Create a Data Lake client from a fully qualified domain name and OAuth2 access token, then create a file in Data Lake and write to it.

```java
// AccessTokenProvider provider = new ClientCredsTokenProvider(authTokenEndpoint, clientId, clientKey);
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

> [!div class="nextstepaction"]
> [Explore the Client APIs](/java/api/overview/azure/datalakestore/client)


## Management API

Use the management API to manage Data Lake Store accounts, firewall rules, and trusted identity providers.

[Add a dependency](https://maven.apache.org/guides/getting-started/index.html#How_do_I_use_external_dependencies) to your Maven `pom.xml` file to use the management API in your project.


```XML
<dependency>
    <groupId>com.microsoft.azure</groupId>
    <artifactId>azure-mgmt-datalake-store</artifactId>
    <version>1.0.0-beta1.3</version>
</dependency>
```

> [!div class="nextstepaction"]
> [Explore the Management APIs](/java/api/overview/azure/datalakestore/management)

## Samples

[Azure Data Lake Get Started][1] 

[1]: https://github.com/Azure-Samples/data-lake-store-java-upload-download-get-started

Explore more [sample Java code for Azure Data Lake Store](https://azure.microsoft.com/resources/samples/?platform=java&term=lake) you can use in your apps.
