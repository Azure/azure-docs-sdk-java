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

## Azure CLI 2.0

The Azure 2.0 CLI provides a command line interface to create and configure Azure resources in your subscriptions. The Azure CLI 2.0 is cross-platform and has query and filtering features so you can pipe output directly to your favorite command line tools. 

[Install the Azure CLI 2.0](https://docs.microsoft.com/cli/azure/install-azure-cli)

## Eclipse and IntelliJ

The Azure toolkits for [Eclipse](https://eclipse.org/downloads/packages/eclipse-ide-java-developers/lunar) and [IntelliJ](https://www.jetbrains.com/idea/) provide project templates, samples, and functionality for Java developers working in Azure. The toolkits let you:
 
- Manage resources in your subscription with Azure Explorer.
- Deploy applications as Docker images to Azure virtual machines.
- Publish WAR packaged web apps to Azure App Service.

[Install the Azure Toolkit for Eclipse](../azure-toolkit-for-eclipse-installation.md)   
[Install the Azure Toolkit for IntelliJ](../azure-toolkit-for-intellij.md)

## Manage resources 

### Azure Storage Explorer 

Manage Azure storage accounts, containers, and blobs/files from your desktop. Azure Storage Explorer is currently in Preview and works on Windows, macOS, and Linux.

[Get started with Azure Storage Explorer](../vs-azure-tools-storage-manage-with-storage-explorer.md)

### SQL Server Management Studio (SSMS)

SSMS provides an integrated environment to create and manage your Azure SQL Databases. SSMS provides tools to create, update, monitor your databases and build queries to work with your data in your application. SSMS is available on Windows.

[Use SQL Server Management Studio to connect and query data](../sql-database/sql-database-connect-query-ssms.md)

### Visual Studio 2017

Cloud Explorer lets you view and manage Azure resources from within Visual Studio. Resources are organized into a searchable tree view, and you interact with the from Cloud Explorer or bring them up in the Azure Portal with a single click.

Visual Studio 2017 supports Azure resource group projects, which let you customize and deploy infrastructure using a single, repeatable operation. Deployments are generated from templates you create or import and customize [from the community](https://azure.microsoft.com/resources/templates/).

[Visual Studio 2017 Cloud Explorer](../vs-azure-tools-resources-managing-with-cloud-explorer.md)    
[Get started with Azure resource groups and Visual Studio](../azure-resource-manager/vs-azure-tools-resource-groups-deployment-projects-create-deploy.md)

The Cloud Explorer and Azure resource group projects are available in Visual Studio 2015 and 2017 on Windows.

## Local development

### Azure Storage Emulator

Develop and test your apps using Azure storage locally without incurring any charges or modifying the resources in your Azure subscription. When you're satisfied with your code running in the emulator, you simply switch some connection strings in your app to enable the workload with an Azure Storage account in the cloud.

[Develop and test your code with Azure Storage Emulator](../storage/storage-use-emulator.md)

The storage emulator currently only runs on Windows.

### DocumentDB Emulator

The DocumentDB emulator provides a local environment that emulates the  DocumentDB NoSQL database service for development purposes. When you're satisfied with how your application is working in the DocumentDB Emulator, you can switch to using a DocumentDB account in your Azure cloud subscription.

[Get started with the Azure DocumentDB Emulator](../documentdb/documentdb-nosql-local-emulator.md)

The DocumentDB emulator runs on Windows Server 2012 R2, Windows Server 2016, or Windows 10.