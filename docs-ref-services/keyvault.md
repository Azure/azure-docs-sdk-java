---
title: Azure Key Vault libraries for Java
description: Overview of the Azure Key Vault libraries for Java 
keywords: Azure, Java, SDK, API, keyvault, secure, keys, secrets, vault
author: rloutlaw
ms.author: routlaw
manager: douge
ms.date: 06/22/2017
ms.topic: article
ms.prod: azure
ms.technology: azure
ms.devlang: java
ms.service: keyvault
---

# Azure Key Vault libraries for Java

## Overview

Create, update, and delete keys and secrets in Azure Key Vault with the client libraries.

Use the Azure Key Vault management libraries to create key vaults, authorize applications, and manage permissions. 

## Import the libraries

Add a dependency to your Maven project's `pom.xml` file to use the libraries in your own project.

### Client library

```XML
<dependency>
    <groupId>com.microsoft.azure</groupId>
    <artifactId>azure-keyvault</artifactId>
    <version>1.0.0</version>
</dependency>
```   

### Management 

```XML
<dependency>
    <groupId>com.microsoft.azure</groupId>
    <artifactId>azure-mgmt-keyvault</artifactId>
    <version>1.1.0</version>
</dependency>
```

## Example

Retrieve a [JSON web key](https://tools.ietf.org/html/draft-ietf-jose-json-web-key-18) from a Key Vault.

```java
KeyVaultClient kvc = new KeyVaultClient(credentials);
KeyBundle returnedKeyBundle = getKey(vaultUrl, keyName);
JsonWebKey jsonKey = returnedKeyBundle.key();
```

## Samples

[!INCLUDE [java-keyvault-samples](../docs-ref-conceptual/includes/keyvault.md)]


Explore more [sample Java code](https://azure.microsoft.com/resources/samples/?platform=java) you can use in your apps.
