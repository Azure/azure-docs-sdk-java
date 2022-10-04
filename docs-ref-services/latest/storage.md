---
ms.service: storage
ms.author: rickle-msft
description: Reference for Azure Storage SDK for Java
ms.topic: reference
author: rickle-msft
ms.data: 10/03/2022
title: Azure Storage SDK for Java
ms.devlang: java
ms.date: 07/08/2022
---
# Azure Storage libraries for Java

The Azure Storage libraries for Java provide classes for working with data in your Azure storage account, and with the storage account itself. For more information about Azure Storage, see [Introduction to Azure Storage](/azure/storage/storage-introduction).

## Client library for data access

The Azure Storage client library for Java supports Blob storage, Queue storage, Azure Files, and Azure Data Lake Storage Gen2 (preview library).

### Add the package to your project

Add the following dependencies to your Maven `pom.xml` file as appropriate:

```xml
<dependency>
    <groupId>com.azure</groupId>
    <artifactId>azure-storage-blob</artifactId>
    <version>12.4.0</version>
</dependency>

<dependency>
  <groupId>com.azure</groupId>
  <artifactId>azure-storage-queue</artifactId>
  <version>12.3.0</version>
</dependency>

<dependency>
  <groupId>com.azure</groupId>
  <artifactId>azure-storage-file-share</artifactId>
  <version>12.2.0</version>
</dependency>

<dependency>
  <groupId>com.azure</groupId>
  <artifactId>azure-storage-file-datalake</artifactId>
  <version>12.0.0-preview.6</version>
</dependency>
```

For more information about adding a dependency in Java, see [Add a dependency](https://maven.apache.org/guides/getting-started/index.html#How_do_I_use_external_dependencies).

### Example usage

The following example creates a storage container and uploads a local file to the storage container.

```java
String yourSasToken = "<insert-your-sas-token>";
/* Create a new BlobServiceClient with a SAS Token */
BlobServiceClient blobServiceClient = new BlobServiceClientBuilder()
    .endpoint("https://your-storage-account-url.storage.windows.net")
    .sasToken(yourSasToken)
    .buildClient();

/* Create a new container client */
try {
    containerClient = blobServiceClient.createBlobContainer("my-container-name");
} catch (BlobStorageException ex) {
    // The container may already exist, so don't throw an error
    if (!ex.getErrorCode().equals(BlobErrorCode.CONTAINER_ALREADY_EXISTS)) {
        throw ex;
    }
}

/* Upload the file to the container */
BlobClient blobClient = containerClient.getBlobClient("my-remote-file.jpg");
blobClient.uploadFromFile("my-local-file.jpg");
```

For more examples, review the [Client Library README](https://github.com/Azure/azure-sdk-for-java/blob/azure-storage-blob_12.0.0/sdk/storage/azure-storage-blob/README.md).

### Available packages

 The following table describes the recommended versions of the storage client library for Java.

| Library version | Supported services | Maven | Reference / Javadoc | Source, Readme, Examples |
|----------------------|------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|-----------------------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Version 12 | Blob, Queue, File, and Data Lake | [Blob](https://search.maven.org/artifact/com.azure/azure-storage-blob/)<br />[Queue](https://search.maven.org/artifact/com.azure/azure-storage-queue/)<br />[File](https://search.maven.org/artifact/com.azure/azure-storage-file-share/)<br />[Data Lake](https://search.maven.org/artifact/com.azure/azure-storage-file-datalake/) | [Blob](https://azuresdkdocs.blob.core.windows.net/$web/java/azure-storage-blob/12.4.0/index.html)<br/>[Queue](https://azuresdkdocs.blob.core.windows.net/$web/java/azure-storage-queue/12.3.0/index.html)<br />[File](https://azuresdkdocs.blob.core.windows.net/$web/java/azure-storage-file-share/12.2.0/index.html)<br />[Data Lake](https://azuresdkdocs.blob.core.windows.net/$web/java/azure-storage-file-datalake/12.0.0-preview.6/index.html)  | [Blob](https://github.com/Azure/azure-sdk-for-java/tree/azure-storage-blob_12.4.0/sdk/storage/azure-storage-blob) ([Quickstart](/azure/storage/blobs/storage-quickstart-blobs-java))<br />[Queue](https://github.com/Azure/azure-sdk-for-java/tree/azure-storage-blob_12.3.0/sdk/storage/azure-storage-queue)<br />[File](https://github.com/Azure/azure-sdk-for-java/tree/azure-storage-file-share_12.2.0/sdk/storage/azure-storage-queue)<br />[Data Lake](https://github.com/Azure/azure-sdk-for-java/tree/azure-storage-blob_12.0.0/sdk/storage/azure-storage-file-datalake) |
| Version 8 | Blob, Queue, File, and Table | [All services](https://mvnrepository.com/artifact/com.microsoft.azure/azure-storage) | [Version 8 reference](/java/api/overview/azure/storage/client?view=azure-java-stable) | [All services](https://github.com/azure/azure-storage-java/tree/legacy-master) ([Quickstart](/azure/storage/blobs/storage-quickstart-blobs-java-legacy)) |

Refer to the [Azure SDK Releases page](https://azure.github.io/azure-sdk/) for details on how to install and use the preview packages.

## Client library for resource management

Use the Azure Storage resource provider to manage storage accounts, account keys, access tiers, and more. To use the resource provider library, [add a dependency](https://maven.apache.org/guides/getting-started/index.html#How_do_I_use_external_dependencies) to your Maven `pom.xml` file. The latest version of the resource provider library is available on [Maven](https://mvnrepository.com/artifact/com.azure.resourcemanager/azure-resourcemanager-storage).

For more information about the resource provider library, see the [Management](/java/api/overview/azure/resourcemanager-storage-readme) reference. The source code for the resource provider library is available in the [Azure Java SDK repository](https://aka.ms/azsdk/java/mgmt).

The following example creates a new storage account in your subscription and retrieves its access keys.

```java
StorageAccount storageAccount = azureResourceManager.storageAccounts().define(storageAccountName)
    .withRegion(Region.US_EAST)
    .withNewResourceGroup(rgName)
    .create();

// get a list of storage account keys related to the account
List<StorageAccountKey> storageAccountKeys = storageAccount.getKeys();
for (StorageAccountKey key : storageAccountKeys) {
    System.out.println("Key name: " + key.keyName() + " with value "+ key.value());
}
```

## Known issues

The Azure Storage SDK for Java (v12) has several critical issues, which are detailed below. Please update the client libraries to the latest version.

| Client library | Versions affected | Issue fixed in version | Required action
| --- | --- | --- | --- |
| Azure Storage Blob | 12.0 to 12.10.0 | 12.10.1 | [Update to latest version](https://mvnrepository.com/artifact/com.azure/azure-storage-blob)
| Azure File Data Lake | 12.0 to 12.7.0 | 12.8.0 | [Update to latest version](https://mvnrepository.com/artifact/com.azure/azure-storage-file-datalake)
| Azure File Share | 12.0 to 12.4.1 | 12.5.0 | [Update to latest version](https://mvnrepository.com/artifact/com.azure/azure-storage-file-share)
| Azure Storage Queue | 12.0 to 12.6.0 | 12.7.0 | [Update to latest version](https://mvnrepository.com/artifact/com.azure/azure-storage-queue)

### Buffer overwrite issue with `BlobOutputStream`

#### Issue description

If a `BlobOutputStream` object is used to upload blobs, in some scenarios this usage may result in an invalid object being written to Azure Blob Storage. `BlobOutputStream` object can be obtained via `BlockBlobClient.getBlobOutputStream()`.

Uploading a file larger than the value of `MaxSingleUploadSize` using the `write()` method of the `BlobOutputStream` class results in an invalid object being written to Azure Blob Storage. The default value of `MaxSingleUploadSize` is 256 MiB. You can change this value by calling the `setMaxSingleUploadSizeLong()` method of the `ParallelTransferOptions` class.

After the input data size crosses the `MaxSingleUploadSize`, the `write()` method of BlobOutputStream returns before making a deep copy of the input data. If the invoking application overwrites the input data byte array with other data before the deep copy takes place, invalid data may be written to the blob.

Link to GitHub issue

#### Issue details

| Client library | Versions affected | Issue fixed in version | Required action |
| --- | --- | --- | --- |
Azure Storage Blob | 12.0 to 12.10.0 | 12.10.1 | [Update to latest version](https://mvnrepository.com/artifact/com.azure/azure-storage-blob) |

#### Recommended steps

1. Update client library versions according to the table above.
1. Check if your application code is calling `BlockBlobClient.getBlobOutputStream()`. If you find it, your application is impacted.

Additionally, you can identify any blobs which may be affected due to this issue in your Azure Storage account. Follow steps below to identify potentially affected blobs:

1. Check whether your application is using BlobOutputStream to upload blobs (obtained via `BlockBlobClient.getBlobOutputStream()`). If not, then this issue doesn't affect your application. However, we still recommend that you upgrade your application to use version 12.10.1 or later.
1. Get the `MaxSingleUploadSize` value for your application (256 MiB by default). Scan your code for `setMaxSingleUploadSizeLong()` method of the `ParallelTransferOptions` class and get value you provided for this property.
1. Identify the time window when your application used client library version with this issue (12.0 to 12.10.0)
1. Identify all the blobs uploaded in this time window. You can get a list of blobs by calling the List Blob operation with PowerShell [PowerShell](/azure/storage/blobs/blob-powershell#list-blobs), [Azure CLI](/azure/storage/blobs/blob-cli#list-blobs), or another tool. You can also leverage the [blob inventory feature](/azure/storage/blobs/blob-inventory).

Following these steps will indicate blobs that are potentially impacted by the critical issue and may be invalid. Inspect these blobs to determine which ones may be invalid.

### Invalid data uploaded during retry

#### Issue description

The client libraries listed below have a bug that can upload incorrect data during retries (for example, HTTP 500 errors).

Link to GitHub issue

#### Issue details

| Client library | Versions affected | Issue fixed in version | Required action |
| --- | --- | --- | --- |
Azure Storage Blob | 12.0 to 12.6.1 | 12.7.0 | [Update to latest version](https://mvnrepository.com/artifact/com.azure/azure-storage-blob) |
Azure File Data Lake | 12.0 to 12.1.2 | 12.2.0 | [Update to latest version](https://mvnrepository.com/artifact/com.azure/azure-storage-file-datalake) |
Azure File Share | 12.0 to 12.4.1 | 12.5.0 | [Update to latest version](https://mvnrepository.com/artifact/com.azure/azure-storage-file-share) |

#### Recommended steps

1. Update client library versions according to the table above.
1. Use AzBlobChecker to help identify if any of your stored objects have been impacted. The tool identifies objects by searching for a known signature. Once complete, you'll receive a list of potentially impacted objects in your storage account. Not all identified objects will necessarily contain incorrect data. Further manual verification is recommended. AzBlobChecker is designed to work with the largest possible number of storage accounts. This tool can be run by you directly within your existing Azure environment in a self-service deployment.
1. If you need to request additional documentation and deployment instructions for a self-service scan with AzBlobChecker, open a [support request](https://ms.portal.azure.com/#create/Microsoft.Support). Please use **#JavaSDKv12** and **#AzBlobChecker** in the title of your support request.

Note: Azure doesn't have the ability to recover incorrectly written objects. As any potential impact occurs before upload, Azure doesn't have a valid copy of any affected object. If you have the original file, it can be reuploaded to your storage account.

Please review the list of services and features that AzBlobChecker supports:

| Account feature | Self-scan supported |
| --- | --- |
| Blob (hot tier) | Yes |
| Blob (cool tier) | Yes |
| Blob (archive tier) | No - archive objects will be listed, but not checked |
| Blob encrypted with Microsoft Managed Key | Yes |
| Blob encrypted with Customer Managed Key | Yes |
| Blob encrypted with Customer Provided Key | No |
| Storage account has SAS Enabled | Yes |
| Storage account has Shared Key Disabled | No |
| Storage account requires Managed Identity | No |
| Storage account requires Service Principal Identity | No |
| Storage account in VNet | Yes |
| Classic (v1) storage accounts | Yes |
| Storage accounts GPv2 | Yes |
| Storage account in Public Cloud | Yes |
| Storage account in Community Clouds (US Gov/DoD, China, etc.)  | Yes - requires modification of deployment script, not all features supported
| Versioning | Yes – only the current version will be checked  |
| Snapshots | Yes – only the current snapshot will be checked |
| Soft delete  | Yes - only non-deleted files will be checked

### Upload function calls incorrectly return as successful when they should raise `IOException`

#### Issue description

All overloads of `void BlobClient.upload()` and `void BlobClient.uploadWithResponse()` would silently catch error responses from the storage service. The method should either return or throw as its success/error indicator. The exception, which should have been logged and propagated would instead be directly written to standard error and then swallowed, despite throwing being the only failure indicator for the API. The method therefore successfully returns, tricking the caller into thinking the operation completed. This results in the blob not having been written to storage, despite the library indicating success.

Link to GitHub issue

#### Issue details

| Client library | Versions affected | Issue fixed in version | Required action |
| --- | --- | --- | --- |
Azure Storage Blob | 12.0 to 12.4.0 | 12.5.0 | [Update to latest version](https://mvnrepository.com/artifact/com.azure/azure-storage-blob) |

#### Recommended steps

Update client library versions according to the table above.

### Incorrect data being downloaded with downloadToFile

#### Issue description

Asynchronous buffer writing had race condition where buffer between network stream and file stream could be reused for incoming data before being flushed to file. This results in the downloaded file being corrupted, where some data immediately repeats, overwriting the valid data in its place. Object in Storage is still correct.

Link to GitHub issue

#### Issue details

| Client library | Versions affected | Issue fixed in version | Required action |
| --- | --- | --- | --- |
Azure Storage Blob | 12.0 to 12.2.0 | 12.3.0 | [Update to latest version](https://mvnrepository.com/artifact/com.azure/azure-storage-blob) |

#### Recommended steps

Update client library versions according to the table above.

### Overwrite operation is reversed for overwrite parameter, resulting in incorrect outcome for overwrite attempts

#### Issue description

The overwrite flag interpreted and overwrite operation are reversed in `DataLakeFileClient.flush(long)` and `DataLakeFileClient.flush(long, bool)` functions. No other behaviors of the library call into these methods. This results in overwriting an object in Storage when the user did not intend to, and failing to overwrite when intended.

Issue in GitHub: link here

#### Issue details
| Client library | Versions affected | Issue fixed in version | Required action |
| --- | --- | --- | --- |
Azure File Data Lake | 12.0 to 12.7.0 | 12.8.0 | [Update to latest version](https://mvnrepository.com/artifact/com.azure/azure-storage-file-datalake) |

#### Recommended steps

Update client library versions according to the table above.

### Message content is incorrectly erased when only visibility timeout is set

#### Issue description

Queue message contents are erased in error when only the visibility timeout is set or updated.

Link to GitHub issue

#### Issue details

| Client library | Versions affected | Issue fixed in version | Required action |
| --- | --- | --- | --- |
Azure Storage Queue | 12.0 to 12.6.0 | 12.7.0 | [Update to latest version](https://mvnrepository.com/artifact/com.azure/azure-storage-queue) |

#### Recommended steps

Update client library versions according to the table above.
