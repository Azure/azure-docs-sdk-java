---
title: Redis Cache libraries for Java
description: Reference documentation for the Java client and management libraries for Redis Cache
keywords: Azure, Java, SDK, API, cache, redis, web cache, key-value, in-memory
author: rloutlaw
ms.author: routlaw
manager: douge
ms.date: 07/11/2017
ms.topic: reference
ms.prod: azure
ms.technology: azure
ms.devlang: java
ms.service: redis-cache
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

```XML
<dependency>
    <groupId>com.microsoft.azure</groupId>
    <artifactId>azure-mgmt-redis</artifactId>
    <version>1.3.0</version>
</dependency>
```

## Example

Create a new Azure Redis Cache in the [two-node standard tier](https://azure.microsoft.com/services/cache/). 

```java
RedisCache cache = azure.redisCaches().define(redisCacheName1)
    .withRegion(Region.US_CENTRAL)
    .withNewResourceGroup(rgName)
    .withStandardSku();
```

> [!div class="nextstepaction"]
> [Explore the Management APIs](/java/api/overview/azure/rediscache/managementapi)

## Samples

[Manage Azure Redis Cache](https://github.com/Azure-Samples/redis-java-manage-cache)   

Explore more [sample Java code for Azure Redis Cache](https://azure.microsoft.com/resources/samples/?platform=java&term=redis) you can use in your apps.
