---
title: Azure Storage libraries for Java
description: The Azure Storage libraries for Java provide classes for working with data in your your Azure storage account, and with the storage account itself.
author: tamram

ms.author: tamram
ms.date: 10/23/2019
ms.topic: conceptual
ms.devlang: java
ms.service: storage
---

# Azure Storage libraries for Java

The Azure Storage libraries for Java provide classes for working with data in your your Azure storage account, and with the storage account itself. For more information about Azure Storage, see [Introduction to Azure Storage](/azure/storage/storage-introduction).

## Client library for data access

Use the Azure Storage client library for Java to work with data in your storage account. The following table describes the recommended versions of the storage client library for Java.

| Library version | Supported services | Maven | Reference | Source, Readme, Examples |
|----------------------|------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|-----------------------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Version 12 (preview) | Blob, Queue, and File | [Blob](https://search.maven.org/artifact/com.azure/azure-storage-blob/)<br />[Queue](https://search.maven.org/artifact/com.azure/azure-storage-queue/)<br />[File](https://search.maven.org/artifact/com.azure/azure-storage-file/) | [Version 12 reference](https://docs.microsoft.com/java/api/overview/azure/storage?view=azure-java-preview) | [Blob](https://github.com/Azure/azure-sdk-for-java/tree/master/sdk/storage/azure-storage-blob)<br />[Queue](https://github.com/Azure/azure-sdk-for-java/tree/master/sdk/storage/azure-storage-queue)<br />[File](https://github.com/Azure/azure-sdk-for-java/tree/master/sdk/storage/azure-storage-file) |
| Version 8 | Blob, Queue, File, and Table | [All services](https://mvnrepository.com/artifact/com.microsoft.azure/azure-storage) | [Version 8 reference](https://docs.microsoft.com/java/api/overview/azure/storage/client?view=azure-java-stable) | [All services](https://github.com/azure/azure-storage-java/tree/legacy-master) |

To use the client library in your project, add a dependency to your Maven `pom.xml` file. To learn how to add the dependency, visit the source repository listed in the table above for the client library you wish to use. For more information about adding a dependency in Java, see [Add a dependency](https://maven.apache.org/guides/getting-started/index.html#How_do_I_use_external_dependencies).

For more information about using the Azure Storage client library for Java, see the following articles:

- [Quickstart: Azure Blob storage client library for Java SDK v8](/azure/storage/blobs/storage-quickstart-blobs-java)
- [Java on Azure](/develop/java/)

## Client library for resource management

Use the Azure Storage resource provider to manage storage accounts, account keys, access tiers, and more. To use the resource provider library, [add a dependency](https://maven.apache.org/guides/getting-started/index.html#How_do_I_use_external_dependencies) to your Maven `pom.xml` file. The latest version of the resource provider library is available on [Maven](https://mvnrepository.com/artifact/com.microsoft.azure/azure-mgmt-storage).  

For more information about the resource provider library, see the [Management](/java/api/overview/azure/storage/management) reference. The source code for the resource provider library is available in the [Azure Java SDK repository](https://github.com/Azure/azure-sdk-for-java/tree/master/storage/resource-manager).

The following example creates a new storage account in your subscription and retrieves its access keys.

```java
StorageAccount storageAccount = azure.storageAccounts().define(storageAccountName)
        .withRegion(Region.US_EAST)
        .withNewResourceGroup(rgName)
        .create();

// get a list of storage account keys related to the account
List<StorageAccountKey> storageAccountKeys = storageAccount.getKeys();
for(StorageAccountKey key : storageAccountKeys)    {
    System.out.println("Key name: " + key.keyName() + " with value "+ key.value());
}
```
