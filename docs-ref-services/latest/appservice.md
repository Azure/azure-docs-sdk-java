---
title: Azure App Service libraries for Java
description: Automat deployment of web apps on Azure App Service using the Azure management APIs.
keywords: Azure, Java, SDK, API, web apps , mobile , App Service
author: rloutlaw
ms.author: routlaw
manager: douge
ms.date: 10/09/2021
ms.topic: reference
ms.prod: azure
ms.technology: azure
ms.devlang: java
ms.service: appservice
---

# Azure App Service libraries for Java

## Overview

Deploy and manage websites, web applications, and REST APIs with [Azure App Service](/azure/app-service).

To get started with Azure App Service, see [Create your first Java web app in Azure](/azure/app-service-web/app-service-web-get-started-java).

## Management API

Deploy, scale, and configure applications in Azure App Service with the management API.

[Add a dependency](https://maven.apache.org/guides/getting-started/index.html#How_do_I_use_external_dependencies) to your Maven `pom.xml` file to use the management API in your project.

```XML
<dependency>
  <groupId>com.azure.resourcemanager</groupId>
  <artifactId>azure-resourcemanager-appservice</artifactId>
  <version>2.8.0</version>
</dependency>
```   

> [!div class="nextstepaction"]
> [Explore the Management APIs](/java/api/com.azure.resourcemanager.appservice)

For more information of using Azure App Service Management API, please refer (here)[https://docs.microsoft.com/java/api/overview/azure/resourcemanager-appservice-readme]. 

### Example

Deploy a webapp from a Docker image into an Azure Web App running on Linux.

```java
WebApp app = azure.webApps().define("newLinuxWebApp")
    .withExistingLinuxPlan(myLinuxAppServicePlan)
    .withExistingResourceGroup("myResourceGroup")
    .withPrivateDockerHubImage("username/my-java-app")
    .withCredentials("dockerHubUser","dockerHubPassword")
    .withAppSetting("PORT","8080")
    .create();
```

## Samples

Explore more [sample Java code for Azure App Service](https://github.com/Azure/azure-sdk-for-java/blob/main/sdk/resourcemanager/docs/SAMPLE.md#application-services) you can use in your apps.
