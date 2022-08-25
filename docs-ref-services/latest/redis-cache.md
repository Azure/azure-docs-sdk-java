---
author: joshfree
description: Reference for Azure Redis Cache SDK for Java
title: Azure Redis Cache SDK for Java
ms.devlang: java
ms.topic: reference
ms.service: rediscache
ms.author: jfree
ms.data: 08/25/2022
ms.date: 07/08/2022
---
# Redis Cache libraries for Java

## Overview

Azure Redis Cache is a secure, distributed key-value store based on the popular open source [Redis](https://redis.io/) cache. 

To get started with Azure Redis Cache, see [How to use Azure Redis Cache with Java](/azure/redis-cache/cache-java-get-started).

## Client library

Connect to Azure Redis Cache and store and retrieve values from the cache using the open-source [Jedis](https://github.com/xetorthio/jedis) client.  

[Add a dependency](https://maven.apache.org/guides/getting-started/index.html#How_do_I_use_external_dependencies) to your Maven `pom.xml` file to use the client library in your project.   

```XML
<dependency>
    <groupId>redis.clients</groupId>
    <artifactId>jedis</artifactId>
    <version>2.9.0</version>
    <type>jar</type>
</dependency>
```

## Example

Connect to Azure Redis and insert a string into the cache.

```java
JedisShardInfo shardInfo = new JedisShardInfo("<name>.redis.cache.windows.net", 6380, useSsl);
    shardInfo.setPassword("<key>"); /* Use your access key. */
    Jedis jedis = new Jedis(shardInfo);
    jedis.set("foo", "bar");
```

## Management API

Create and scale Azure Redis resources and manage access keys to with the management API.

[Add a dependency](https://maven.apache.org/guides/getting-started/index.html#How_do_I_use_external_dependencies) to your Maven `pom.xml` file to use the resource management libraries in your project.

```XML
<dependency>
   <groupId>com.azure.resourcemanager</groupId>
   <artifactId>azure-resourcemanager</artifactId>
   <version>2.1.0</version>
</dependency>
```
For detailed information on how to use the Java resource management libraries, please refer to [this doc](https://aka.ms/azsdk/java/mgmt)

## Example

Create a new Azure Redis Cache in the [two-node standard tier](https://azure.microsoft.com/services/cache/). 

```java
RedisCache cache = azure.redisCaches().define(redisCacheName)
    .withRegion(Region.US_CENTRAL)
    .withNewResourceGroup(rgName)
    .withStandardSku();
```

> [!div class="nextstepaction"]
> [Explore the Management APIs](/java/api/overview/azure/rediscache/management)

## Samples

[Manage Azure Redis Cache](https://github.com/Azure-Samples/redis-java-manage-cache)   

Explore more [sample Java code for Azure Redis Cache](https://azure.microsoft.com/resources/samples/?platform=java&term=redis) you can use in your apps.