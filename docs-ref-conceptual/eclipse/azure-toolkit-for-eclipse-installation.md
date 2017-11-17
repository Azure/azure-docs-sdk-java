---
title: Installing the Azure Toolkit for Eclipse
description: Learn how to install the Azure Toolkit for Eclipse.
services: ''
documentationcenter: java
author: rmcmurray
manager: routlaw
editor: ''

ms.assetid: 9e93ff6a-f42b-4d99-b55b-624136b4a730
ms.service: multiple
ms.workload: na
ms.tgt_pltfrm: multiple
ms.devlang: Java
ms.topic: article
ms.date: 11/01/2017
ms.author: robmcm

---

# Installing the Azure Toolkit for Eclipse

The Azure Toolkit for Eclipse provides templates and functionality that allow you to easily create, develop, test, and deploy Azure applications using the Eclipse development environment.

> [!NOTE] 
> 
> The Azure Toolkit for Eclipse is an Open Source project, whose source code is available under the MIT License from the project's site on GitHub at the following URL: 
> 
> <https://github.com/microsoft/azure-tools-for-java> 
> 

The following steps show you how to install the Azure Toolkit for Eclipse.

[!INCLUDE [azure-toolkit-for-eclipse-prerequisites](../includes/azure-toolkit-for-eclipse-prerequisites.md)]

## To install the Azure Toolkit for Eclipse

1. Start Eclipse.

1. Click the **Help** menu, and then click **Install New Software**, as shown in the following illustration.
   
   ![Installing the Azure Toolkit for Eclipse][01]

1. In the **Available Software** dialog, within the **Work with** text box, type `http://dl.microsoft.com/eclipse/` followed by the **Enter** key.

1. In the **Name** pane, check **Azure Toolkit for Eclipse**, and uncheck **Contact all update sites during install to find required software**. Your screen should appear similar to the following:
   
   ![Installing the Azure Toolkit for Eclipse][02]

1. If you expand the **Azure Toolkit for Eclipse**, you will see a list of components like following examples:

   | Feature | Description | 
   |---|---| 
   | **Application Insights Plugin for Java** | Allows you to use Azure's telemetry logging and analysis services for your applications and server instances. | 
   | **Azure Common Plugin** | provides the common functionality needed by other toolkit components. | 
   | **Azure Container Tools for Eclipse** | Enables you to build and deploy a .WAR as a Docker container to a docker machine. | 
   | **Azure Containers for Eclipse** | Enables you to deploy a .WAR or .JAR artifact as a Docker container to an Azure virtual machine. | 
   | **Azure Explorer for Eclipse** | Provides an explorer-style interface for managing your Azure resources. | 
   | **Microsoft JDBC Driver 6.1 for SQL Server** | Provides JDBC API for SQL Server and Microsoft Azure SQL Database for Java Platform Enterprise Edition 8. | 
   | **Package for Microsoft Azure Libraries for Java** | Provides APIs for accessing Microsoft Azure services, such as storage, service bus, service runtime, etc. | 

1. Click **Next**. (If you experience unusual delays when installing the toolkit, ensure that **Contact all update sites during install to find required software** is unchecked.)

1. In the **Install Details** dialog, click **Next**.
   
   ![Review Installation Details][03]

1. In the **Review Licenses** dialog, review the terms of the license agreements. If you accept the terms of the license agreements, click **I accept the terms of the license agreements** and then click **Finish**. (The remaining steps assume you do accept the terms of the license agreements. If you do not accept the terms of the license agreements, exit the installation process.)
   
   ![Review Licenses][04]
   
   Eclipse will download and install the requisite packages.
   
   ![Installation Progress][05]

1. If prompted to restart Eclipse to complete installation, click **Yes**.
   
   ![Restart Prompt][06]

## Next steps

[!INCLUDE [azure-toolkit-for-eclipse-additional-resources](../includes/azure-toolkit-for-eclipse-additional-resources.md)]

<!-- URL List -->

<!-- Legacy MSDN URL = https://msdn.microsoft.com/library/azure/hh690946.aspx -->

<!-- IMG List -->

[01]: media/azure-toolkit-for-eclipse-installation/eclipse-installation-01.png
[02]: media/azure-toolkit-for-eclipse-installation/eclipse-installation-02.png
[03]: media/azure-toolkit-for-eclipse-installation/eclipse-installation-03.png
[04]: media/azure-toolkit-for-eclipse-installation/eclipse-installation-04.png
[05]: media/azure-toolkit-for-eclipse-installation/eclipse-installation-05.png
[06]: media/azure-toolkit-for-eclipse-installation/eclipse-installation-06.png
