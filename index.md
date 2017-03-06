---
title: Azure for Java developers | Microsoft Docs
description: Import dependencies into your Java projects to manage Azure resources and integrate Azure services in your applications
services: ''
documentationcenter: java
author: routlaw
manager: douge
editor: ''

ms.assetid: 4b8f8fe6-1b26-4bb4-9be9-6ae757a59e66
ms.service: multiple
ms.workload: na
ms.tgt_pltfrm: multiple
ms.devlang: Java
ms.topic: article
ms.date: 3/06/2016
ms.author: routlaw;asirveda

---

# Azure libraries for Java

Use Azure libraries in your Java projects to [manage resources](#management) and integrate services in your applications.  

| | | | |
|:-------------:|:----------:|:----:|:---:|
| [Azure Storage](#azure-storage) | [Azure Active Directory](#azuread) | [Manage Azure resources](#management) | [Redis Cache](#redis-cache)   | 
| [SQL Database](#sql-database) | [DocumentDB](#documentdb) | [Service Bus](#servicebus) | [Data Lake](#datalake) | 
| [IoT Service](#iotservice) |  [IoT Device](#iotdevice) | [AppInsights](#appinsights) | [Key Vault](#keyvault) |

## Install with Maven

Add a dependency entry in your `pom.xml` to import a library into your [Maven](https://maven.apache.org) project.

For example, to include the latest version of the [Azure management libraries](#management):

```XML
<dependency>
    <groupId>com.microsoft.azure</groupId>
    <artifactId>azure</artifactId>
    <version>1.0.0-beta5</version>
</dependency>
```

## Azure services

Consume Azure services in your applications using these libraries.

<a name="azure-storage"></a>

### [Azure Storage](https://docs.microsoft.com/azure/storage/storage-introduction)  

Data storage and messaging for your applications.

```XML
<dependency>
    <groupId>com.microsoft.azure</groupId>
    <artifactId>azure-storage</artifactId>
    <version>5.0.0</version>
</dependency>
```   

[Reference](http://azure.github.io/azure-storage-java/) | [Samples](https://github.com/Azure/azure-storage-java/tree/master/microsoft-azure-storage-samples/src/com/microsoft/azure/storage) | [GitHub](https://github.com/Azure/azure-storage-java)  

<a name="sql-database"></a>

### [SQL Database](https://docs.microsoft.com/en-us/azure/sql-database/sql-database-technical-overview)

JDBC driver for Azure SQL Database.

```XML
<dependency>
    <groupId>com.microsoft.sqlserver</groupId>
    <artifactId>mssql-jdbc</artifactId>
    <version>6.1.0.jre8</version>
</dependency>
```

[Reference](https://docs.microsoft.com/en-us/sql/connect/jdbc/reference/jdbc-driver-api-reference) | [Samples](https://docs.microsoft.com/en-us/sql/connect/jdbc/step-3-proof-of-concept-connecting-to-sql-using-java) | [GitHub](https://github.com/Microsoft/mssql-jdbc)  

<a name="redis-cache"></a>

### [Redis Cache](https://azure.microsoft.com/en-us/services/cache/)

Low-latency, high-performance distributed key-value store.

```XML
<dependency>
    <groupId>redis.clients</groupId>
    <artifactId>jedis</artifactId>
    <version>2.9.0</version>
    <type>jar</type>
    <scope>compile</scope>
</dependency>
```   

[Reference](http://xetorthio.github.io/jedis) | [Sample](https://docs.microsoft.com/en-us/azure/redis-cache/cache-java-get-started) | [GitHub](https://github.com/xetorthio/jedis)    

<a name="documentdb"></a>

### [DocumentDB](https://docs.microsoft.com/azure/documentdb/documentdb-introduction)

Scalable NoSQL database with JSON documents and SQL or JavaScript query syntax.   

```XML
<dependency>
    <groupId>com.microsoft.azure</groupId>
    <artifactId>azure-documentdb</artifactId>
    <version>1.9.3</version>
</dependency>
```

[Reference](http://azure.github.io/azure-documentdb-java/) | [Samples](https://docs.microsoft.com/en-us/azure/documentdb/documentdb-java-application) | [GitHub](https://github.com/Azure/azure-documentdb-java)   

<a name="servicebus"></a>

### [Service Bus](https://docs.microsoft.com/en-us/azure/service-bus-messaging/service-bus-fundamentals-hybrid-solutions)

Java Message Service (JMS) support through [AMQP](https://en.wikipedia.org/wiki/Advanced_Message_Queuing_Protocol) to connect your applications.

```XML
<dependency>
  <groupId>org.apache.qpid</groupId>
  <artifactId>qpid-jms-client</artifactId>
  <version>0.11.1</version>
</dependency>
```

[Reference](http://docs.oracle.com/javaee/7/api/javax/jms/package-summary.html) | [Sample](https://github.com/apache/qpid-jms/tree/0.20.0/qpid-jms-examples) | [GitHub](https://github.com/apache/qpid-jms)    
<a name="azuread"></a>

### [Azure Active Directory](https://docs.microsoft.com/azure/active-directory/active-directory-whatis)   

Identity management and secure sign-in for your applications.

```XML
<dependency>
    <groupId>com.microsoft.azure</groupId>
    <artifactId>adal4j</artifactId>
    <version>1.1.3</version>
</dependency>
```
   
[Reference](https://github.com/AzureAD/azure-activedirectory-library-for-java) | [Samples](https://github.com/Azure-Samples?utf8=%E2%9C%93&q=active%20directory%20&type=&language=java) | [GitHub](https://github.com/AzureAD/azure-activedirectory-library-for-java) 
 
<a name="keyvault"></a>

### [Key Vault](https://docs.microsoft.com/azure/key-vault) 

Encrypt secrets and safely access them from your applications. 

```XML
<dependency>
    <groupId>com.microsoft.azure</groupId>
    <artifactId>azure-keyvault</artifactId>
    <version>1.0.0-beta3</version>
</dependency>
```

[Reference](https://docs.microsoft.com/en-us/java/api/com.microsoft.azure.keyvault) | [Samples](https://github.com/Azure-Samples/key-vault-java-manage-key-vaults) | [GitHub](https://github.com/Azure/azure-sdk-for-java)  

<a name="eventhub"></a>

### [Event Hub](https://docs.microsoft.com/en-us/azure/event-hubs/event-hubs-what-is-event-hubs) 
   
High throughput event and telemetry handling for your instrumentation or IoT scenarios.

```XML
<dependency> 
    <groupId>com.microsoft.azure</groupId> 
    <artifactId>azure-eventhubs</artifactId> 
    <version>0.10.0</version> 
</dependency>   
```

[Reference](https://docs.microsoft.com/en-us/java/api/com.microsoft.azure.eventhubs) | [Samples](https://github.com/azure/azure-event-hubs-java#publishing-events) | [GitHub](https://github.com/azure/azure-event-hubs-java)  

<a name="iotservice"></a> 

### [IoT Service](https://docs.microsoft.com/azure/iot-hub/)

Manage identities, send messages, and get feedback from devices in your IoT hub.

```XML
<dependency>
    <groupId>com.microsoft.azure.sdk.iot</groupId>
    <artifactId>iot-service-client</artifactId>
    <version>1.0.13</version>
</dependency>
```   
   
[Reference](http://azure.github.io/azure-iot-sdks/java/service/api_reference/index.html) | [Samples](https://github.com/Azure/azure-iot-sdk-java/tree/master/service/iot-service-samples) | [GitHub](https://github.com/Azure/azure-iot-sdk-java) 

<a name="iotdevice"></a> 

### [IoT Device](https://docs.microsoft.com/azure/iot-hub/iot-hub-devguide)

Send a message to an IoT hub from your device.  

```XML
<dependency>
    <groupId>com.microsoft.azure.sdk.iot</groupId>
    <artifactId>iot-service-client</artifactId>
    <version>1.0.18</version>
</dependency>
```  

[Reference](http://azure.github.io/azure-iot-sdks/java/device/api_reference/index.html) | [Samples](https://github.com/Azure/azure-iot-sdk-java/tree/master/device/iot-device-samples) | [GitHub](https://github.com/Azure/azure-iot-sdk-java) 

<a name="datalake"></a> 

### [Data Lake Store](https://docs.microsoft.com/azure/data-lake-store/data-lake-store-overview)   
   
Capture data of any size and shape into a single location for performing analytics.    

```XML
<dependency>
   <groupId>com.microsoft.azure</groupId>
   <artifactId>azure-data-lake-store-sdk</artifactId>
   <version>2.1.4</version>
</dependency>
```   

[Reference](https://azure.github.io/azure-data-lake-store-java/javadoc/) | [Samples](https://github.com/Azure-Samples/data-lake-store-java-upload-download-get-started) | [GitHub](https://github.com/Azure/azure-data-lake-store-java) 

<a name="appinsights"></a> 

### [AppInsights](https://docs.microsoft.com/azure/application-insights/app-insights-overview)

- Track usage of web applications
- Capture logs and correlate events with page views and requests
- Add custom telemetry
- Monitor application availability

```XML
<dependency>
    <groupId>com.microsoft.azure</groupId>
    <artifactId>applicationinsights-web</artifactId>
    <version>1.0.7</version>
</dependency>
```

[Reference](https://docs.microsoft.com/en-us/java/api/com.microsoft.applicationinsights) | [Samples](https://docs.microsoft.com/en-us/azure/application-insights/app-insights-java-get-started) | [GitHub](https://github.com/Microsoft/ApplicationInsights-Java) 


<a name="management"></a> 

## Azure management 

Create, update, and delete Azure resources from your application code.

```XML
<dependency>
    <groupId>com.microsoft.azure</groupId>
    <artifactId>azure</artifactId>
    <version>1.0.0-beta5</version>
</dependency>
```

[Reference](http://azure.github.io/azure-sdk-for-java) | [Samples](https://github.com/Azure/azure-sdk-for-java#sample-code) | [GitHub](https://github.com/Azure/azure-sdk-for-java) 
