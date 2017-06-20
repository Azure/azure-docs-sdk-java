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

Build great Java apps on Azure.

<ul class="cardsY panelContent">
    <li>
        <a href="java-azure-tools.md">
            <div class="cardSize">
                <div class="cardPadding">
                    <div class="card" style="height: 84px">
                        <div class="cardImageOuter" style="margin-top: 12px">
                            <div class="cardImage">
                                <img src="/media/common/i_tools.svg" alt="" />
                            </div>
                        </div>
                        <div class="cardText">
                            <h3 style="margin-bottom: 0; font-size: 24px">Tools</h3>
                            <p style="font-size: 1rem">Download Azure tools and plugins.</p>
                        </div>
                    </div>
                </div>
            </div>
        </a>
    </li>
    <li>
        <a href="java-sdk-azure-install.md">
            <div class="cardSize">
                <div class="cardPadding">
                    <div class="card" style="height: 84px">
                        <div class="cardImageOuter" style="margin-top: 12px">
                            <div class="cardImage">
                                <img src="/media/common/i_reference.svg" alt="" />
                            </div>
                        </div>
                        <div class="cardText">
                            <h3 style="margin-bottom: 0; font-size: 24px">Libraries</h3>
                            <p style="font-size: 1rem">Use services and manage Azure resources.</p>
                        </div>
                    </div>
                </div>
            </div>
        </a>
    </li>
    <li>
        <a href="/azure/virtual-machines/linux/tutorial-jenkins-github-docker-cicd">
            <div class="cardSize">
                <div class="cardPadding">
                    <div class="card" style="height: 84px">
                        <div class="cardImageOuter" style="margin-top: 12px">
                            <div class="cardImage">
                                <img src="/media/common/i_deploy.svg" alt="" />
                            </div>
                        </div>
                        <div class="cardText">
                            <h3 style="margin-bottom: 0; font-size: 24px">Jenkins CI/CD</h3>
                            <p style="font-size: 1rem">Use Jenkins to deploy apps to Azure.</p>
                        </div>
                    </div>
                </div>
            </div>
        </a>
    </li>
</ul>

## Five-minute quickstarts
Create and deploy a sample app in five minutes.
<ul class="noBullet">
   <li><a href="https://docs.microsoft.com/azure/app-service-web/app-service-web-get-started-java">Web Apps</a></li>
   <li><a href="https://docs.microsoft.com/azure/sql-database/sql-database-connect-query-java">SQL Database</a></li>
   <li><a href="https://docs.microsoft.com/azure/cosmos-db/create-documentdb-java">CosmosDB</a></li>
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

## Tutorials

Learn how to use Azure services in your Java apps.

<ul class="noBullet">
    <li><a href="https://docs.microsoft.com/azure/app-service-web/app-service-web-tutorial-java-mysql">Create an app with Spring Boot and MySQL</a></li>
</ul>