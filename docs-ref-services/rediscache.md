---
title: Redis Cache libraries for Java
description: Reference documentation for the Java client and management libraries for Redis Cache
keywords: Azure, Java, SDK, API, cache, redis, web cache, key-value, in-memory
author: rloutlaw
ms.author: routlaw
manager: douge
ms.date: 05/17/2017
ms.topic: article
ms.prod: azure
ms.technology: azure
ms.devlang: java
ms.service: redis-cache
---

# Redis Cache libraries for Java

## Overview

Azure Redis Cache is based on the popular open source [Redis](https://redis.io/) cache. It gives you access to a secure, dedicated Redis cache, managed by Microsoft and accessible from your Azure apps.

Redis is an advanced key-value store, where keys can contain data structures such as strings, hashes, lists, sets, and sorted sets. Redis supports a set of atomic operations on these data types.

- [Client library](http://xetorthio.github.io/jedis/ )
- [Management API](https://docs.microsoft.com/java/api/overview/azure/rediscache/managementapi)

## Import the libraries

Add a dependency to your Maven project's `pom.xml` file to use the libraries in your own project.

### Client 

```XML
<dependency>
    <groupId>redis.clients</groupId>
    <artifactId>jedis</artifactId>
    <version>2.9.0</version>
    <type>jar</type>
</dependency>
```

### Management

```XML
<dependency>
    <groupId>com.microsoft.azure</groupId>
    <artifactId>azure-mgmt-redis</artifactId>
    <version>1.1.0</version>
</dependency>
```

## Example

Add an item to a Redis cache and then retrieve it.

```java
JedisShardInfo shardInfo = new JedisShardInfo("<name>.redis.cache.windows.net", 6380, useSsl);
    shardInfo.setPassword("<key>"); /* Use your access key. */
    Jedis jedis = new Jedis(shardInfo);
    jedis.set("foo", "bar");
    String value = jedis.get("foo");
```

## Samples

Explore [sample Java code](https://azure.microsoft.com/resources/samples/?platform=java) you can use in your apps.