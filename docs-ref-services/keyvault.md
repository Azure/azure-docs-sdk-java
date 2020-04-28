---
title: Azure Key Vault libraries for Java
description: Overview of the Azure Key Vault libraries for Java 
keywords: Azure, Java, SDK, API, keyvault, secure, keys, secrets, vault
author: rloutlaw
ms.author: routlaw
manager: douge
ms.date: 11/21/2019
ms.topic: article
ms.prod: azure
ms.technology: azure
ms.devlang: java
ms.service: key-vault
---

# Azure Key Vault libraries for Java

The Azure Key Vault client libraries for Java offer a convenient interface for making calls to Azure Key Vault. For more information about Azure Key Vault, see [Introduction to Azure Key Vault](https://docs.microsoft.com/en-us/azure/key-vault/general/overview).

## Libraries for data access

The latest version of the Azure Key Vault libraries is version 4.x. Microsoft recommends using version 4.x for new applications.

If you cannot update existing applications to version 4.x, then Microsoft recommends using version 1.x.

### Version 4.x

The version 4.x client libraries for Java are part of the Azure SDK for Java. The source code for the Azure Key Vault client libraries for Java is available on [GitHub](https://github.com/Azure/azure-sdk-for-java/tree/master/sdk/keyvault).

Use the following version 4.x libraries to work with keys, secrets, and certificates:

| Library | Reference | Package | Source |
|----------------------------------------|-------------------------------------------------------------|-----------------------------------------------------------------------------|---------------------------------------------------------------------------------------------------------------------|
|    azure-security-keyvault-keys    |    [Reference](https://azure.github.io/azure-sdk-for-java/)    |    [Maven](https://search.maven.org/artifact/com.azure/azure-security-keyvault-keys)    |    [GitHub](https://github.com/Azure/azure-sdk-for-java/tree/master/sdk/keyvault/azure-security-keyvault-keys)    |
|    azure-security-keyvault-secrets    |    [Reference](https://azure.github.io/azure-sdk-for-java/)    |    [Maven](https://search.maven.org/artifact/com.azure/azure-security-keyvault-secrets)    |    [GitHub](https://github.com/Azure/azure-sdk-for-java/tree/master/sdk/keyvault/azure-security-keyvault-secrets)    |
|    azure-security-keyvault-certificates   |    [Reference](https://azure.github.io/azure-sdk-for-java/)    |    [Maven](https://search.maven.org/artifact/com.azure/azure-security-keyvault-certificates)    |    [GitHub](https://github.com/Azure/azure-sdk-for-java/tree/master/sdk/keyvault/azure-security-keyvault-certificates) |

### Version 1.x

The source code for the Azure Key Vault client libraries for Java is available on [GitHub](https://github.com/Azure/azure-sdk-for-java/tree/master/sdk/keyvault).

Use the following version 1.x libraries to work with keys, secrets, and certificates:

| Library | Reference | Package | Source |
|--------------------------------------|---------------------------------------------------------------|-------------------------------------------------------------------------------|-------------------------------------------------------------------------------|
|    microsoft-azure-keyvault-core    |        |    [Maven](https://mvnrepository.com/artifact/com.microsoft.azure/azure-keyvault-core)    |    [GitHub](https://github.com/Azure/azure-sdk-for-java/tree/master/sdk/keyvault/microsoft-azure-keyvault-core)    |
|    microsoft-azure-keyvault-cryptography    |        |    [Maven](https://mvnrepository.com/artifact/com.microsoft.azure/azure-keyvault-cryptography)    |    [GitHub](https://github.com/Azure/azure-sdk-for-java/tree/master/sdk/keyvault/microsoft-azure-keyvault-cryptography)    |
|    microsoft-azure-keyvault-extensions   |        |    [Maven](https://mvnrepository.com/artifact/com.microsoft.azure/azure-keyvault-extensions)    |    [GitHub](https://github.com/Azure/azure-sdk-for-java/tree/master/sdk/keyvault/microsoft-azure-keyvault-extensions) |
|    microsoft-azure-keyvault-webkey    |        |    [Maven](https://mvnrepository.com/artifact/com.microsoft.azure/azure-keyvault-webkey)    |    [GitHub](https://github.com/Azure/azure-sdk-for-java/tree/master/sdk/keyvault/microsoft-azure-keyvault-webkey)    |
|    microsoft-azure-keyvault   |        |    [Maven](https://mvnrepository.com/artifact/com.microsoft.azure/azure-keyvault)    |    [GitHub](https://github.com/Azure/azure-sdk-for-java/tree/master/sdk/keyvault/microsoft-azure-keyvault) |

## Libraries for resource management

Use the following library to work with the Azure Key Vault resource provider:

|    Library    |    Reference    |    Package    |    Source    |
|------------------------------------------|-------------------------------------------------------------------|-----------------------------------------------------------------------------------|-----------------------------------------------------------------------------------------------------------------------|
|    azure-mgmt-keyvault    |        |    [Maven](https://mvnrepository.com/artifact/com.microsoft.azure/azure-mgmt-keyvault)    |    [GitHub](https://github.com/Azure/azure-sdk-for-java/tree/master/sdk/keyvault/mgmt)    |
