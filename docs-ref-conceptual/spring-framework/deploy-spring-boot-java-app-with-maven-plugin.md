---
title: Deploy a Spring Boot app to the cloud with Maven and Azure
description: Learn how to deploy a Spring Boot app to the cloud using the Maven Plugin for Azure Web Apps.
services: app-service
documentationcenter: java
author: rmcmurray
manager: routlaw
editor: brborges

ms.assetid:
ms.author: robmcm;kevinzha;brborges
ms.date: 06/01/2018
ms.devlang: java
ms.service: app-service
ms.tgt_pltfrm: multiple
ms.topic: article
ms.workload: web
---

# Deploy a Spring Boot app to the cloud using the Maven Plugin for Azure App Service

This article demonstrates using the Maven Plugin for Azure App Service Web Apps to deploy a sample Spring Boot application.

> [!NOTE]
> 
> The [Maven Plugin for Azure App Service Web Apps](https://docs.microsoft.com/en-us/java/api/overview/azure/maven/azure-webapp-maven-plugin/readme) for [Apache Maven](http://maven.apache.org/) provides seamless integration of Azure App Service into Maven projects, and streamlines the process for developers to deploy web apps to Azure App Service.

Before using the Maven plugin, check on Maven Central for the latest available version of the plugin: [![Maven Central](https://img.shields.io/maven-central/v/com.microsoft.azure/azure-webapp-maven-plugin.svg)](http://search.maven.org/#search%7Cga%7C1%7Cg%3A%22com.microsoft.azure%22%20AND%20a%3A%22azure-webapp-maven-plugin%22) 

## Prerequisites

In order to complete the steps in this tutorial, you will need to have the following prerequisites:

* An Azure subscription; if you don't already have an Azure subscription, you can sign up for a [free Azure account].
* The [Azure Command-Line Interface (CLI)].
* An up-to-date [Java Development Kit (JDK)], version 1.7 or later.
* Apache's [Maven] build tool (Version 3).
* A [Git] client.

## Clone the sample Spring Boot web app

In this section, you will clone a completed Spring Boot application and test it locally.

1. Open a command prompt or terminal window and create a local directory to hold your Spring Boot application, and change to that directory; for example:
   ```shell
   md C:\SpringBoot
   cd C:\SpringBoot
   ```
   -- or --
   ```shell
   md ~/SpringBoot
   cd ~/SpringBoot
   ```

1. Clone the [Spring Boot Getting Started] sample project into the directory you created; for example:
   ```shell
   git clone https://github.com/spring-guides/gs-spring-boot
   ```

1. Change directory to the completed project; for example:
   ```shell
   cd gs-spring-boot/complete
   ```

1. Build the JAR file using Maven; for example:
   ```shell
   mvn clean package
   ```

1. When the web app has been created, start the web app using Maven; for example:
   ```shell
   mvn spring-boot:run
   ```

1. Test the web app by browsing to it locally using a web browser. For example, you could use the following command if you have curl available:
   ```shell
   curl http://localhost:8080
   ```

1. You should see the following message displayed: **Greetings from Spring Boot!**

## Adjust project for WAR-based deployment on Azure App Service

In this section we will quickly adjust the Spring Boot project to be deployed as a WAR file on Azure App Service, which provides Tomcat as the runtime by default. For this to work, there are two files to be modified:

- The Maven `pom.xml` file
- The `Application` Java class

Let's start with the Maven settings:

1. Open `pom.xml`

1. Add `<packaging>war</packaging>` right after the `<artifactId>` definition at the top:
   ```xml
    <modelVersion>4.0.0</modelVersion>
    <groupId>org.springframework</groupId>
    <artifactId>gs-spring-boot</artifactId>

    <packaging>war</packaging>
   ```

1. Add the following dependency:
   ```xml
        <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-starter-tomcat</artifactId>
            <scope>provided</scope>
        </dependency>
   ```

Now open the class `Application`, hopefully after your IDE has already picked up the new dependencies, and proceed with the following modifications:

1. Make class Application a subclass of `SpringBootServletInitializer`:
   ```java
   @SpringBootApplication
   public class Application extends SpringBootServletInitializer {
     // ...
   }
   ```

1. Add the following method to the Application class:
   ```java
	   @Override
	   protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
		   return application.sources(Application.class);
	   }
   ```

Your application is now ready to be deployed to Tomcat and any other Servlet runtime (e.g. Jetty).

## Add the Maven Plugin for Azure App Service Web Apps

In this section, we will add a Maven plugin that will automate the entire deployment of this application into Azure App Service Web Apps.

1. Open `pom.xml` once again.

1. Inside `<properties>`, set a custom timestamp format with the property `maven.build.timestamp.format`. Because Azure App Service creates a public URL for your application, this setting will be used to generate the name of your deployment, and avoid conflict with other users' live deployments.
   ```xml
    <properties>
        <java.version>1.8</java.version>
        <maven.build.timestamp.format>yyyyMMddHHmmssSSS</maven.build.timestamp.format>
    </properties>
   ```

1. In the `<plugins>` element, add the following:
   ```xml
    <plugin>
      <groupId>com.microsoft.azure</groupId>
      <artifactId>azure-webapp-maven-plugin</artifactId>
      <!-- Check latest version on Maven Central -->
      <version>1.1.0</version>
    </plugin>
   ```

With these settings, your Maven project is now ready for live deployment to Azure App Service Web App.

## Install and log in to Azure CLI

The simplest and easiest way to get the Maven Plugin deploying your Spring Boot application is by using [Azure CLI](https://docs.microsoft.com/cli/azure/). Make sure you have it installed.

1. Sign into your Azure account by using the Azure CLI:
   ```shell
   az login
   ```
   Follow the instructions to complete the sign-in process.

## Optionally, customize pom.xml before deploying

Open the `pom.xml` file for your Spring Boot application in a text editor, and then locate the `<plugin>` element for `azure-webapp-maven-plugin`. This element should resemble the following example:

   ```xml
  <plugins>
    <plugin>
      <groupId>com.microsoft.azure</groupId>
      <artifactId>azure-webapp-maven-plugin</artifactId>
      <!-- Check latest version on Maven Central -->
      <version>1.1.0</version>
      <configuration>
         <resourceGroup>maven-projects</resourceGroup>
         <appName>${project.artifactId}-${maven.build.timestamp}</appName>
         <region>westus</region>
         <javaVersion>1.8</javaVersion>
         <deploymentType>war</deploymentType>
      </configuration>
    </plugin>
  </plugins>
   ```

There are several values that you can modify for the Maven plugin, and a detailed description for each of these elements is available in the [Maven Plugin for Azure Web Apps] documentation. That being said, there are several values that are worth highlighting in this article:

| Element | Description |
|---|---|
| `<version>` | Specifies the version of the [Maven Plugin for Azure Web Apps]. Verify the version listed in the [Maven Central Respository](http://search.maven.org/#search%7Cga%7C1%7Ca%3A%22azure-webapp-maven-plugin%22) to ensure that you are using the latest version. |
| `<resourceGroup>` | Specifies the target resource group, which is `maven-plugin` in this example. The resource group is created during deployment if it does not already exist. |
| `<appName>` | Specifies the target name for your web app. In this example, the target name is `maven-web-app-${maven.build.timestamp}`, where the `${maven.build.timestamp}` suffix is appended in this example to avoid conflict. (The timestamp is optional; you can specify any unique string for the app name.) |
| `<region>` | Specifies the target region, which in this example is `westus`. (A full list is in the [Maven Plugin for Azure Web Apps] documentation.) |
| `<javaVersion>` | Specifies the Java runtime version for your web app. (A full list is in the [Maven Plugin for Azure Web Apps] documentation.) |
| `<deploymentType>` | Specifies deployment type for your web app. Default is `war`. |

## Build and deploy your web app to Azure

Once you have configured all of the settings in the preceding sections of this article, you are ready to deploy your web app to Azure. To do so, use the following steps:

1. From the command prompt or terminal window that you were using earlier, rebuild the JAR file using Maven if you made any changes to the *pom.xml* file; for example:
   ```shell
   mvn clean package
   ```

1. Deploy your web app to Azure by using Maven; for example:
   ```shell
   mvn azure-webapp:deploy
   ```

Maven will deploy your web app to Azure; if the web app does not already exist, it will be created.

When your web has been deployed, you will be able to manage it by using the [Azure portal].

* Your web app will be listed in **App Services**:

   ![Web app listed in Azure portal App Services][AP01]

* And the URL for your web app will be listed in the **Overview** for your web app:

   ![Determining the URL for your web app][AP02]

<!--
##  OPTIONAL: Configure the embedded Tomcat server to run on a different port

The embedded Tomcat server in the sample Spring Boot application is configured to run on port 8080 by default. However, if you want to run the embedded Tomcat server to run on a different port, such as port 80 for local testing, you can configure the port by using the following steps.

1. Go to the *resources* directory (or create the directory if it does not exist); for example:
   ```shell
   cd src/main/resources
   ```

1. Open the *application.yml* file in a text editor if it exists, or create a new YAML file if it does not exist.

1. Modify the **server** setting so that the server runs on port 80; for example:
   ```yaml
   server:
      port: 80
   ```

1. Save and close the *application.yml* file.
-->

## Next steps

For more information about the various technologies discussed in this article, see the following articles:

* [Maven Plugin for Azure Web Apps]

* [Log in to Azure from the Azure CLI](/azure/xplat-cli-connect)

* [How to use the Maven Plugin for Azure Web Apps to deploy a containerized Spring Boot app to Azure](deploy-containerized-spring-boot-java-app-with-maven-plugin.md)

* [Create an Azure service principal with Azure CLI 2.0](/cli/azure/create-an-azure-service-principal-azure-cli)

* [Maven Settings Reference](https://maven.apache.org/settings.html)

<!-- URL List -->

[Azure Command-Line Interface (CLI)]: /cli/azure/overview
[Azure for Java Developers]: https://docs.microsoft.com/java/azure/
[Azure portal]: https://portal.azure.com/
[free Azure account]: https://azure.microsoft.com/pricing/free-trial/
[Git]: https://github.com/
[Java Developer Kit (JDK)]: http://www.oracle.com/technetwork/java/javase/downloads/
[Java Tools for Visual Studio Team Services]: https://java.visualstudio.com/
[Maven]: http://maven.apache.org/
[MSDN subscriber benefits]: https://azure.microsoft.com/pricing/member-offers/msdn-benefits-details/
[Spring Boot]: http://projects.spring.io/spring-boot/
[Spring Boot Getting Started]: https://github.com/spring-guides/gs-spring-boot
[Spring Framework]: https://spring.io/
[Maven Plugin for Azure Web Apps]: https://docs.microsoft.com/en-us/java/api/overview/azure/maven/azure-webapp-maven-plugin/readme

<!-- IMG List -->

[AP01]: ./media/deploy-spring-boot-java-app-with-maven-plugin/AP01.png
[AP02]: ./media/deploy-spring-boot-java-app-with-maven-plugin/AP02.png
