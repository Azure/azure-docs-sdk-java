---
title: Azure App Service libraries for Java
description: Automat deployment of web apps on Azure App Service using the Azure management APIs.
keywords: Azure, Java, SDK, API, web apps , mobile , App Service
author: rloutlaw
ms.author: routlaw
manager: douge
ms.date: 07/09/2017
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
    <groupId>com.microsoft.azure</groupId>
    <artifactId>azure-mgmt-appservice</artifactId>
    <version>1.3.0</version>
</dependency>
```   

> [!div class="nextstepaction"]
> [Explore the Management APIs](/java/api/overview/azure/appservice/management)

### Example

Deploy a webapp from a Docker image into an Azure Web App running on Linux.

```java
WebApp app = azure.webApps().define("newLinuxWebApp")
    .withExistingLinuxPlan(myLinuxAppServicePlan)
    .withExistingResourceGroup("myResourceGroup")
    .withPrivateDockerHubImage("username/my-java-app")
    .withCredentials("dockerHubUser","dockerHubPassword")
    .withAppSetting("PORT","8080").
    .create();
```

## Samples

[Deploy a web app from FTP or GitHub][1]  
[Swap between app versions with deployment slots][2]  
[Configure a custom domain][3]   
[Scale a web app across multiple regions][4]   

Explore more [sample Java code for Azure App Service](https://azure.microsoft.com/resources/samples/?platform=java&term=appservice) you can use in your apps.

[1]: ../docs-ref-conceptual/java-sdk-configure-webapp-sources.md
[2]: https://azure.microsoft.com/resources/samples/app-service-java-manage-staging-and-production-slots-for-web-apps/
[3]: https://azure.microsoft.com/resources/samples/app-service-java-manage-web-apps-with-custom-domains/
[4]: https://azure.microsoft.com/resources/samples/app-service-java-scale-web-apps-on-linux/
