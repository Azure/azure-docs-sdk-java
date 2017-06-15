---
title: Azure tools for Java developers | Microsoft Docs
description: IDE integrations, emulators, resource explorers, and command-line interfaces for Java developers working on Azure.
author: rloutlaw
manager: douge
ms.assetid: b55923b7-d60a-460d-b77c-af5fac67f1cc
ms.devlang: java
ms.topic: article
ms.service: Azure
ms.technology: Azure
ms.date: 4/10/2017
ms.author: routlaw;asirveda
---

# Azure tools for Java developers

## Client and management libraries

Connect to services and manage Azure resources from your applications with the Azure libraries for Java. Import the management libraries into your Maven projects by adding this dependency to your project *pom.xml*.

```XML
<dependency>
    <groupId>com.microsoft.azure</groupId>
    <artifactId>azure</artifactId>
    <version>1.1.0</version>
</dependency>
```

View the [complete list of install dependencies](java-sdk-azure-install.md) for the Azure libraries for Java.

[Get started with Azure libraries for Java](java-sdk-azure-get-started.md).

## Eclipse and IntelliJ plugins

The Azure toolkits for [Eclipse](https://eclipse.org/downloads/packages/eclipse-ide-java-developers/lunar) and [IntelliJ](https://www.jetbrains.com/idea/) provide project templates, samples, and functionality for Java developers working in Azure. The toolkits let you:
 
- Manage resources in your subscription with Azure Explorer.
- Deploy applications as Docker images to Azure virtual machines.
- Publish WAR packaged web apps to Azure App Service.

[Get started with Azure Toolkit for Eclipse](https://docs.microsoft.com/azure/app-service-web/app-service-web-eclipse-create-hello-world-web-app). 
[Get started with Azure Toolkit for IntelliJ](https://docs.microsoft.com/azure/app-service-web/app-service-web-intellij-create-hello-world-web-app).

## Azure CLI 2.0

The Azure 2.0 CLI provides a command-line experience to manage Azure resources. You can use it in your browser with [Azure Cloud Shell](https://docs.microsoft.com/azure/cloud-shell/overview), or you can [install](https://docs.microsoft.com/cli/azure/install-azure-cli) it on macOS, Linux, and Windows and run it from the command line.

[Get started with Azure CLI 2.0](https://docs.microsoft.com/cli/azure/get-started-with-azure-cli).

## Manage resources 

### Azure Storage Explorer 

Manage Azure storage accounts, containers, and blobs/files from your desktop. Azure Storage Explorer is currently in Preview and works on Windows, macOS, and Linux.

[Get started with Azure Storage Explorer](../vs-azure-tools-storage-manage-with-storage-explorer.md)

### SQL Server Management Studio (SSMS)

SSMS provides an integrated environment to create and manage your Azure SQL Databases. SSMS provides tools to create, update, monitor your databases and build queries to work with your data in your application. SSMS is available on Windows.

[Use SQL Server Management Studio to connect and query data](../sql-database/sql-database-connect-query-ssms.md)

## Local development

### Azure Storage Emulator

Develop and test your apps using Azure storage locally without incurring any charges or modifying the resources in your Azure subscription. When you're satisfied with your code running in the emulator, you simply switch some connection strings in your app to enable the workload with an Azure Storage account in the cloud.

[Develop and test your code with Azure Storage Emulator](../storage/storage-use-emulator.md)

The storage emulator currently only runs on Windows.

### DocumentDB Emulator

The DocumentDB emulator provides a local environment that emulates the  DocumentDB NoSQL database service for development purposes. When you're satisfied with how your application is working in the DocumentDB Emulator, you can switch to using a DocumentDB account in your Azure cloud subscription.

[Get started with the Azure DocumentDB Emulator](../documentdb/documentdb-nosql-local-emulator.md)

The DocumentDB emulator runs on Windows Server 2012 R2, Windows Server 2016, or Windows 10.