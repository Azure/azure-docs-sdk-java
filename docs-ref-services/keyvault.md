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

The Azure Key Vault client libraries for Java offer a convenient interface for making calls to Azure Key Vault. For more information about Azure Key Vault, see [Introduction to Azure Key Vault](https://docs.microsoft.com/azure/key-vault/general/overview).

## Libraries for data access

The latest version of the Azure Key Vault libraries is version 4.x. Microsoft recommends using version 4.x for new applications.

If you cannot update existing applications to version 4.x, then Microsoft recommends using version 1.x.

### Version 4.x

The version 4.x client libraries for Java are part of the Azure SDK for Java. The source code for the Azure Key Vault client libraries for Java is available on [GitHub](https://github.com/Azure/azure-sdk-for-java/tree/master/sdk/keyvault).

Use the following version 4.x libraries to work with certificates, keys, and secrets:

| Library | Reference | Package | Source |
|----------------------------------------|-------------------------------------------------------------|-----------------------------------------------------------------------------|---------------------------------------------------------------------------------------------------------------------|
|    azure-security-keyvault-certificates   |    [Reference](https://azuresdkdocs.blob.core.windows.net/$web/java/azure-security-keyvault-certificates/4.1.0-beta.2/index.html)    |    [Maven](https://search.maven.org/artifact/com.azure/azure-security-keyvault-certificates)    |    [GitHub](https://github.com/Azure/azure-sdk-for-java/tree/master/sdk/keyvault/azure-security-keyvault-certificates) |
|    azure-security-keyvault-keys    |    [Reference](https://azuresdkdocs.blob.core.windows.net/$web/java/azure-security-keyvault-keys/4.2.0-beta.3/index.html)    |    [Maven](https://search.maven.org/artifact/com.azure/azure-security-keyvault-keys)    |    [GitHub](https://github.com/Azure/azure-sdk-for-java/tree/master/sdk/keyvault/azure-security-keyvault-keys)    |
|    azure-security-keyvault-secrets    |    [Reference](https://azuresdkdocs.blob.core.windows.net/$web/java/azure-security-keyvault-secrets/4.2.0-beta.2/index.html)    |    [Maven](https://search.maven.org/artifact/com.azure/azure-security-keyvault-secrets)    |    [GitHub](https://github.com/Azure/azure-sdk-for-java/tree/master/sdk/keyvault/azure-security-keyvault-secrets)    |

### Version 1.x

The source code for the Azure Key Vault client libraries for Java is available on [GitHub](https://github.com/Azure/azure-sdk-for-java/tree/master/sdk/keyvault).

Use the following version 1.x libraries to work with certificates, keys, and secrets:

| Library | Reference | Package | Source |
|--------------------------------------|---------------------------------------------------------------|-------------------------------------------------------------------------------|-------------------------------------------------------------------------------|
|    microsoft-azure-keyvault-core    |    [Reference](https://docs.microsoft.com/java/api/com.microsoft.azure.keyvault.core?view=azure-java-legacy&viewFallbackFrom=azure-java-stable)    |    [Maven](https://mvnrepository.com/artifact/com.microsoft.azure/azure-keyvault-core)    |    [GitHub](https://github.com/Azure/azure-sdk-for-java/tree/master/sdk/keyvault/microsoft-azure-keyvault-core)    |
|    microsoft-azure-keyvault-cryptography    |    [Reference](https://docs.microsoft.com/java/api/com.microsoft.azure.keyvault.cryptography?view=azure-java-legacy&viewFallbackFrom=azure-java-stable)    |    [Maven](https://mvnrepository.com/artifact/com.microsoft.azure/azure-keyvault-cryptography)    |    [GitHub](https://github.com/Azure/azure-sdk-for-java/tree/master/sdk/keyvault/microsoft-azure-keyvault-cryptography)    |
|    microsoft-azure-keyvault-extensions   |    [Reference](https://docs.microsoft.com/java/api/com.microsoft.azure.keyvault.extensions?view=azure-java-legacy&viewFallbackFrom=azure-java-stable)    |    [Maven](https://mvnrepository.com/artifact/com.microsoft.azure/azure-keyvault-extensions)    |    [GitHub](https://github.com/Azure/azure-sdk-for-java/tree/master/sdk/keyvault/microsoft-azure-keyvault-extensions) |
|    microsoft-azure-keyvault-webkey    |    [Reference](https://docs.microsoft.com/java/api/com.microsoft.azure.keyvault.webkey?view=azure-java-legacy&viewFallbackFrom=azure-java-stable)    |    [Maven](https://mvnrepository.com/artifact/com.microsoft.azure/azure-keyvault-webkey)    |    [GitHub](https://github.com/Azure/azure-sdk-for-java/tree/master/sdk/keyvault/microsoft-azure-keyvault-webkey)    |
|    microsoft-azure-keyvault   |    [Reference](https://docs.microsoft.com/java/api/com.microsoft.azure.keyvault?view=azure-java-legacy&viewFallbackFrom=azure-java-stable)    |    [Maven](https://mvnrepository.com/artifact/com.microsoft.azure/azure-keyvault)    |    [GitHub](https://github.com/Azure/azure-sdk-for-java/tree/master/sdk/keyvault/microsoft-azure-keyvault) |

## Libraries for resource management

Use the following library to work with the Azure Key Vault resource provider:

|    Library    |    Reference    |    Package    |    Source    |
|------------------------------------------|-------------------------------------------------------------------|-----------------------------------------------------------------------------------|-----------------------------------------------------------------------------------------------------------------------|
|    azure-mgmt-keyvault    |    [Reference](https://docs.microsoft.com/java/api/com.microsoft.azure.management.keyvault?view=azure-java-stable)    |    [Maven](https://mvnrepository.com/artifact/com.microsoft.azure/azure-mgmt-keyvault)    |    [GitHub](https://github.com/Azure/azure-sdk-for-java/tree/master/sdk/keyvault/mgmt)    |
