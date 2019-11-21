---
title: Azure Key Vault libraries for Java
description: Overview of the Azure Key Vault libraries for Java 
keywords: Azure, Java, SDK, API, keyvault, secure, keys, secrets, vault
author: rloutlaw
ms.author: routlaw
manager: douge
ms.date: 21/11/2019
ms.topic: article
ms.prod: azure
ms.technology: azure
ms.devlang: java
ms.service: keyvault
---

# Azure Key Vault libraries for Java

## Overview

Safeguard and manage cryptographic keys and secrets used by cloud applications and services with [Azure Key Vault](/azure/key-vault/).

To get started with Azure Key Vault, see [Get started with Azure Key Vault](/azure/key-vault/key-vault-get-started).

## Client libraries

Create, update, and delete keys and secrets in Azure Key Vault with the client libraries.
We offer separate Client libraries to manage Secrets and Keys in your Key Vault. Azure Key Vault Secrets client library allows you to securely store and tightly control the access to tokens, passwords, API keys, and other secrets. 
Azure Key Vault Keys client supports RSA keys and elliptic curve keys, each with corresponding support in hardware security modules (HSM). Multiple keys, and multiple versions of the same key, can be kept in the Key Vault. Cryptographic keys in Key Vault are represented as JSON Web Key [JWK] objects. 


[Add a dependency](https://maven.apache.org/guides/getting-started/index.html#How_do_I_use_external_dependencies) to your Maven `pom.xml` file to use the client library in your project.  

```XML
<dependency>
    <groupId>com.azure</groupId>
    <artifactId>azure-security-keyvault-secrets</artifactId>
    <version>4.0.0</version>
</dependency>

<dependency>
    <groupId>com.azure</groupId>
    <artifactId>azure-security-keyvault-keys</artifactId>
    <version>4.0.0</version>
</dependency>
```   

## Example


Retrieve a [JSON web key](https://tools.ietf.org/html/draft-ietf-jose-json-web-key-18) and a secret from a Key Vault.

```java

KeyClient keyClient = new KeyClientBuilder()
        .vaultUrl(<your-vault-url>)
        .credential(<your-credentials>)
        .buildClient();
KeyVaultKey key = keyClient.getKey("key_name");

SecretClient secretClient = new SecretClientBuilder()
		 .vaultUrl(<your-vault-url>)
		 .credential(new DefaultAzureCredentialBuilder().build())
		 .buildClient();
KeyVaultSecret secret = secretClient.getSecret("secret_name");

```
| Service | Package | README | Samples | API Reference | Changelog |
| ------- | ------- | ------ | ------- | ------------- | --------- |
| Key Vault - Keys | [azure-security-keyvault-keys - 4.0.0](https://search.maven.org/artifact/com.azure/azure-security-keyvault-keys/4.0.0/jar/) | [README](https://github.com/Azure/azure-sdk-for-java/blob/azure-security-keyvault-keys_4.0.0/sdk/keyvault/azure-security-keyvault-keys/README.md) | [Samples](https://github.com/Azure/azure-sdk-for-java/blob/azure-security-keyvault-keys_4.0.0/sdk/keyvault/azure-security-keyvault-keys/src/samples) | [Api Reference](https://azuresdkdocs.blob.core.windows.net/$web/java/azure-security-keyvault-keys/4.0.0/index.html) | [ChangeLog](https://github.com/Azure/azure-sdk-for-java/blob/azure-security-keyvault-keys_4.0.0/sdk/keyvault/azure-security-keyvault-keys/CHANGELOG.md) |
| Key Vault - Secrets | [azure-security-keyvault-secrets - 4.0.0](https://search.maven.org/artifact/com.azure/azure-security-keyvault-secrets/4.0.0/jar/) | [README](https://github.com/Azure/azure-sdk-for-java/blob/azure-security-keyvault-secrets_4.0.0/sdk/keyvault/azure-security-keyvault-secrets/README.md) | [Samples](https://github.com/Azure/azure-sdk-for-java/blob/azure-security-keyvault-secrets_4.0.0/sdk/keyvault/azure-security-keyvault-secrets/src/samples) | [Api Reference](https://azuresdkdocs.blob.core.windows.net/$web/java/azure-security-keyvault-secrets/4.0.0/index.html) | [ChangeLog](https://github.com/Azure/azure-sdk-for-java/blob/azure-security-keyvault-secrets_4.0.0/sdk/keyvault/azure-security-keyvault-secrets/CHANGELOG.md) |

> [!div class="nextstepaction"]
> [Explore the Client APIs](/azure/key-vault/quick-create-java)

## Management API

Use the Azure Key Vault management libraries to create key vaults, authorize applications, and manage permissions. 

[Add a dependency](https://maven.apache.org/guides/getting-started/index.html#How_do_I_use_external_dependencies) to your Maven `pom.xml` file to use the management API in your project.  

```XML
<dependency>
    <groupId>com.microsoft.azure</groupId>
    <artifactId>azure-mgmt-keyvault</artifactId>
    <version>1.15.0</version>
</dependency>
```

## Example

Authorize and application running with [service principal](/azure/azure-resource-manager/resource-group-create-service-principal-portal) `clientId` to list and retrieve secrets from a key vault. 

```java
vault1 = vault1.update()
            .defineAccessPolicy()
                .forServicePrincipal(clientId)
                .allowKeyAllPermissions()
                .allowSecretPermissions(SecretPermissions.GET)
                .allowSecretPermissions(SecretPermissions.LIST)
                .attach()
            .apply();
```

> [!div class="nextstepaction"]
> [Explore the Management APIs](/java/api/overview/azure/keyvault/management)


## Samples

Explore more [sample Java code for Azure Key Vault](https://azure.microsoft.com/resources/samples/?platform=java&term=key+vault) you can use in your apps.
