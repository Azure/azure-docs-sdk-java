---
title: Azure App Service libraries for Java
description: 
keywords: Azure, Java, SDK, API, web apps , mobile , App Service
author: rloutlaw
ms.author: routlaw
manager: douge
ms.date: 05/17/2017
ms.topic: article
ms.prod: azure
ms.technology: azure
ms.devlang: java
ms.service: appservice
---

# Azure App Service libraries for Java

## Overview

Deploy, manage, and scale web apps, APIs, and mobile apps running in [Azure App Service](https://docs.microsoft.com/azure/app-service) from your Java code using the management libraries. The management libraries also provide a Java interface for automating app configuration as an alternative to using the Azure Portal or [CLI](https://docs.microsoft.com/cli/azure/install-azure-cli).

## Import the libraries

Add a dependency to your Maven project's `pom.xml` file to use the libraries in your own project.

```XML
<dependency>
    <groupId>com.microsoft.azure</groupId>
    <artifactId>azure-mgmt-appservice</artifactId>
    <version>1.0.0</version>
</dependency>
```   

## Example

Deploy a webapp from a Docker Hub image into Azure Web App on Linux.

```java
WebApp app = azure.webApps().define("newLinuxWebApp")
    .withExistingLinuxPlan(myLinuxAppServicePlan)
    .withExistingResourceGroup("myResourceGroup")
    .withPrivateDockerHubImage("username/my-java-app")
    .withCredentials("dockerHubUser","dockerHubPassword")
    .withAppSetting("PORT","8080").
    create();
```

## Samples

| | |
| **Create an app** ||
|---|---|
| [Create a web app and deploy from FTP or GitHub][1] | Deploy web apps from local Git, FTP, and continuous integration from GitHub. |
| [Manage web app deployment slots][2] | Create a web app and deploy to staging slots, and then swap deployments between slots. |
| **Configure app** ||
| [Configure a custom domain][3] | Create a web app with a custom domain and self-signed SSL certificate. |
| **Scale apps** ||
| [Scale a web app across multiple regions][4] | Scale a web app in three different geographical regions and make them available through a single endpoint using Azure Traffic Manager. | 
| **Connect app to resources** ||
| [Connect to a storage account][5] | Create an Azure storage account and add the storage account connection string to the app settings. |
| [Connect to a SQL database][6] | Create a web app and SQL database, and then add the SQL database connection string to the app settings. |

[1]: java-sdk-configure-webapp-sources.md
[2]: https://azure.microsoft.com/resources/samples/app-service-java-manage-staging-and-production-slots-for-web-apps/
[3]: https://azure.microsoft.com/resources/samples/app-service-java-manage-web-apps-with-custom-domains/
[4]: https://azure.microsoft.com/resources/samples/app-service-java-scale-web-apps-on-linux/
[5]: https://azure.microsoft.com/resources/samples/app-service-java-manage-storage-connections-for-web-apps/
[6]: https://azure.microsoft.com/resources/samples/app-service-java-manage-data-connections-for-web-apps/

Explore more [sample Java code](https://azure.microsoft.com/resources/samples/?platform=java) you can use in your apps.