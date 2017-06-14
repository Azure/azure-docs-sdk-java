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
                    <div class="cardImageOuter">
                    </div>
                    <div class="cardText">
                        <h2>Tools</h2>
                        <a href="java-azure-tools.md">Download Azure tools, libraries, and plugins.</a>
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
                        <h2>Reference</h2>
                        <a href="java-azure-tools.md">Use Java libraries to connect to services and manage Azure resources.</a>
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
                        <a href="java-azure-tools.md">Deploy with Jenkins with your own deployment or with Visual Studio Team Services.</a>
                    </div>
                </div>
            </div>
        </div>
    </li>
</ul>

The Azure libraries for Java help you manage Azure resources and connect to services from your application code. The libraries are available as [Maven imports](java-sdk-azure-install.md) for use in your Java projects. 

## Management APIs

Create and manage Azure resources from your Java applications using the [Azure management libraries for Java](java-sdk-azure-get-started.md). The fluent interface of the API makes it easy to define and create resources from your code.

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

[Get started with the management API](java-sdk-azure-get-started.md)

## Five-minute quickstarts
<div class="ico48Case">
   <div class="ico48Link">
        <a href="java-quickstart-maven-webapps.md">
            <img src="../media/index/Maven.svg" alt="">
            <span>Maven</span>
        </a>
    </div>
    <div class="ico48Link">
        <a href="/azure/app-service-web/app-service-web-intellij-create-hello-world-web-app">
            <img src="../media/index/IntelliJ.svg" alt="">
            <span>IntelliJ</span>
        </a>
    </div>
    <div class="ico48Link">
        <a href="/azure/app-service-web/app-service-web-eclipse-create-hello-world-web-app">
            <img src="../media/index/Eclipse.svg" alt="">
            <span>Eclipse</span>
        </a>
    </div>
        <div class="ico48Link">
        <a href="/azure/app-service/app-service-deploy-spring-boot-web-app-on-azure">
            <img src="../media/index/spring.svg" alt="">
            <span>Spring Boot</span>
        </a>
    </div>
    <div class="ico48Link">
        <a href="/azure/container-service/container-service-deploy-spring-boot-app-on-kubernetes">
            <img src="../media/index/azure_dev-10.svg" alt="">
            <span>Docker</span>
        </a>
    </div>
</div>

## Tutorials and samples

<p>Create, deploy, monitor, and secure Java apps running in Azure.</p>
<ol>
    <li>Create a Java web app with <a href="/azure/app-service-web/app-service-web-tutorial-java-mysql">MySQL</a> or <a href="/azure/documentdb/documentdb-java-application">CosmosDB</a>.</li>
    <li>Set up a CI/CD pipeline for your apps with <a href="/azure/virtual-machines/linux/tutorial-jenkins-github-docker-cicd">Jenkins</a> or <a href="https://www.visualstudio.com/docs/build/apps/java/maven-to-azure">Visual Studio Team Services</a>.</li>
    <li>Monitor your apps with <a href="/azure/monitoring-and-diagnostics/monitoring-get-started">Azure Monitor</a> or <a href="/azure/application-insights/app-insights-java-get-started">Application Insights</a>.
</ol>