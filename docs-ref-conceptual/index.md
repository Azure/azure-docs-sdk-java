---
title: Azure for Java developers - Tutorials, API Reference | Microsoft Docs
description: Tools, SDKs, tutorials, and samples to help you create and deploy Java apps to Azure.
keywords: Azure, Java, SDK, API
author: rloutlaw
ms.author: routlaw
manager: douge
layout: LandingPage
ms.date: 06/13/2017
ms.topic: article
ms.prod: azure
ms.technology: azure
ms.devlang: java
ms.service: multiple
---

# Azure for Java developers

Get started building great Java apps on Azure.

<ul class="panelContent">
    <li>
        <div class="cardSize">
            <div class="cardPadding">
                <div class="card">
                    <div class="cardText">
                        <h2>Tools</h2>
                        <a href="java-azure-tools.md">Download Azure tools and plugins.</a>
                    </div>
                </div>
            </div>
        </div>
    </li><li>
        <div class="cardSize">
            <div class="cardPadding">
                <div class="card">
                    <div class="cardImageOuter">
                    </div>
                    <div class="cardText">
                        <h2>Libraries</h2>
                        <a href="java-sdk-azure-install.md">Use services and manage Azure resources.</a>
                    </div>
                </div>
            </div>
        </div>
    </li><li>
        <div class="cardSize">
            <div class="cardPadding">
                <div class="card">
                    <div class="cardImageOuter">
                    </div>
                    <div class="cardText">
                        <h2>Jenkins CI/CD</h2>
                        <a href="">Use Jenkins to deploy apps to Azure.</a>
                    </div>
                </div>
            </div>
        </div>
    </li>
</ul>

## Management APIs

Install our easy-to-use fluent [Java APIs](java-sdk-azure-install.md#management) to manage Azure resources.

```java
VirtualMachine linuxVM = azure.virtualMachines().define("myAzureVM")
           .withRegion(region)
           .withExistingResourceGroup("sampleResourceGroup")
           .withNewPrimaryNetwork("10.0.0.0/28")
           .withPrimaryPrivateIpAddressDynamic()
           .withoutPrimaryPublicIpAddress()
           .withPopularLinuxImage(KnownLinuxVirtualMachineImage.UBUNTU_SERVER_16_04_LTS)
           .withRootUsername(userName)
           .withSsh(key)
           .create();
 ```

[Get started with the Azure management libraries for Java](java-sdk-azure-get-started.md)

## Five-minute quickstarts
Create and deploy a app with your favorite tools in five minutes.
<ul>
   <li><a href="java-quickstart-maven-webapps.md">Maven</a></li>
   <li><a href="https://docs.microsoft.com/azure/app-service/app-service-deploy-spring-boot-web-app-on-azure">Spring Boot</a></li>
   <li><a href="">Docker and Kubernetes</a></li>
</ul>

## Tutorials

Learn how to use Azure services in your Java apps.

<ul>
    <li><a href="https://docs.microsoft.com/azure/sql-database/sql-database-connect-query-java">Connect and query SQL Database</a></li>
    <li><a href="https://docs.microsoft.com/azure/app-service-web/app-service-web-tutorial-java-mysql">Create an app with Spring Boot and MySQL</a></li>
    <li><a href="https://docs.microsoft.com/azure/documentdb/documentdb-java-application">Create an app using a NoSQL database with CosmosDB</a></li>
    <li><a href="https://docs.microsoft.com/azure/storage/storage-java-how-to-use-blob-storage">Read and write blobs to Azure Storage</a></li>
</ul>