---
title: Deploy a Spring Boot JAR file app to the cloud with Maven and Azure
description: Learn how to deploy a Spring Boot app to the cloud using the Maven Plugin for Azure Web App for Linux.
keywords: azure app service, web app, java, linux, maven, spring boot, jar
services: app-service
documentationcenter: java
author: rmcmurray
manager: mbaldwin
editor: brborges
ms.author: robmcm
ms.date: 12/19/2018
ms.devlang: java
ms.service: app-service
ms.topic: article
#Customer intent: As a Java and Spring developer, I want to deploy apps to Azure as JAR files so that I don't have to deal with app server configuration and management.
---

# Deploy a Spring Boot JAR file web app to Azure App Service on Linux

This article demonstrates using the [Maven Plugin for Azure App Service Web Apps](/java/api/overview/azure/maven/azure-webapp-maven-plugin/readme) to deploy a Spring Boot application packaged as a Java SE JAR to [Azure App Service on Linux](/azure/app-service/containers/). Choose Java SE deployment over [Tomcat and WAR files](/azure/app-service/containers/quickstart-java) when you want to consolidate your app's dependencies, runtime, and configuration into a single deployable artifact.


If you don’t have an Azure subscription, create a [free account](https://azure.microsoft.com/free/?WT.mc_id=A261C142F) before you begin.

## Prerequisites

To complete the steps in this tutorial, you'll need to have the following installed and configured:

* The [Azure CLI](/cli/azure/), either locally or through [Azure Cloud Shell](https://shell.azure.com).
* A supported Java Development Kit (JDK). For more information about the JDKs available for use when developing on Azure, see <https://aka.ms/azure-jdks>.
* Apache's [Maven](https://maven.apache.org/), Version 3).
* A [Git](https://git-scm.com/downloads) client.

## Install and sign in to Azure CLI

The simplest and easiest way to get the Maven Plugin deploying your Spring Boot application is by using [Azure CLI](/cli/azure/).

Sign into your Azure account by using the Azure CLI:
   
   ```shell
   az login
   ```
   
Follow the instructions to complete the sign-in process.

## Clone the sample app

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

## Configure Maven Plugin for Azure App Service

In this section, you will configure the Spring Boot project `pom.xml` so that Maven can deploy the app to Azure App Service on Linux.

1. Open `pom.xml` in a code editor.

2. In the `<build>` section of the pom.xml, add the following `<plugin>` entry inside the `<plugins>` tag.

   ```xml
   <plugin>
      <groupId>com.microsoft.azure</groupId>
      <artifactId>azure-webapp-maven-plugin</artifactId>
      <version>1.6.0</version>
      <configuration>
         <schemaVersion>V2</schemaVersion>
         <subscriptionId>${SUBSCRIPTION_ID}</subscriptionId>
         <resourceGroup>${RESOURCEGROUP_NAME}</resourceGroup>
         <appName>${WEBAPP_NAME}</appName>
         <region>${REGION}</region>
         <pricingTier>P1V2</pricingTier>
         <runtime>
         <os>linux</os>
         <javaVersion>jre8</javaVersion>
         </runtime>
         <deployment>
         <resources>
            <resource>
               <directory>${project.basedir}/target</directory>
               <includes>
               <include>${project.build.finalName}.jar</include>
               </includes>
            </resource>
         </resources>
         </deployment>
      </configuration>
   </plugin>
   ```
> [!NOTE]
>
> There is an environment variable named `PORT` that will indicate which port should be used by the app, which by default is 8080 or 80. If your web app uses other port, please declare it by adding a property named `PORT` to `AppSettings` and set the value to the port you use.
>

3. Update the following placeholders in the plugin configuration:

| Placeholder | Description |
| ----------- | ----------- |
| `SUBSCRIPTION_ID` | The unique ID of the subscription you want to deploy your app to. Default subscription's ID can be found from the Cloud Shell or CLI using the `az account show` command. For all the available subscriptions, use the `az account list` command.|
| `RESOURCEGROUP_NAME` | Name for the new resource group in which to create your web app. By putting all the resources for an app in a group, you can manage them together. For example, deleting the resource group would delete all resources associated with the app. Update this value with a unique new resource group name, for example, *TestResources*. You will use this resource group name to clean up all Azure resources in a later section. |
| `WEBAPP_NAME` | The app name will be part the host name for the web app when deployed to Azure (WEBAPP_NAME.azurewebsites.net). Update this value with a unique name for the new Azure web app, which will host your Java app, for example *contoso*. |
| `REGION` | An Azure region where the web app is hosted, for example `westus2`. You can get a list of regions from the Cloud Shell or CLI using the `az account list-locations` command. |

A full list of configuration options can be found in the [Maven plugin reference on GitHub](https://github.com/Microsoft/azure-maven-plugins/tree/develop/azure-webapp-maven-plugin).

## Deploy the app to Azure

Once you have configured all of the settings in the preceding sections of this article, you are ready to deploy your web app to Azure. To do so, use the following steps:

1. From the command prompt or terminal window that you were using earlier, rebuild the JAR file using Maven if you made any changes to the *pom.xml* file; for example:
   ```shell
   mvn clean package
   ```

1. Deploy your web app to Azure by using Maven; for example:
   ```shell
   mvn azure-webapp:deploy
   ```

Maven will deploy your web app to Azure; if the web app or web app plan does not already exist, it will be created for you.

When your web has been deployed, you will be able to manage it through the [Azure portal].

* Your web app will be listed in **App Services**:

   ![Web app listed in Azure portal App Services][AP01]

* And the URL for your web app will be listed in the **Overview** for your web app:

   ![Determining the URL for your web app][AP02]

Be aware that Azure App Service will map the service port to `80`, you can now verify the deployment by accessing your web app with the URL from the Portal. You should see the following message displayed: **Greetings from Spring Boot!** 

## Clean up resources

In the preceding steps, you created Azure resources in a resource group. If you don't expect to need these resources in the future, delete the resource group by running the following command in the Cloud Shell:

```azurecli-interactive
az group delete --name myResourceGroup
```

This command may take a minute to run.

## Next steps

To learn more about Spring and Azure, continue to the Spring on Azure documentation center.

> [!div class="nextstepaction"]
> [Spring on Azure](/java/azure/spring-framework)

### Additional Resources

For more information about the various technologies discussed in this article, see the following articles:

* [Maven Plugin for Azure Web Apps]

* [How to use the Maven Plugin for Azure Web Apps to deploy a containerized Spring Boot app to Azure](deploy-containerized-spring-boot-java-app-with-maven-plugin.md)

* [Create an Azure service principal with Azure CLI 2.0](/cli/azure/create-an-azure-service-principal-azure-cli)

* [Maven Settings Reference](https://maven.apache.org/settings.html)

<!-- URL List -->

[Azure Command-Line Interface (CLI)]: /cli/azure/overview
[Azure for Java Developers]: /java/azure/
[Azure portal]: https://portal.azure.com/
[free Azure account]: https://azure.microsoft.com/pricing/free-trial/
[Git]: https://github.com/
[Working with Azure DevOps and Java]: /azure/devops/
[Maven]: http://maven.apache.org/
[MSDN subscriber benefits]: https://azure.microsoft.com/pricing/member-offers/msdn-benefits-details/
[Spring Boot]: http://projects.spring.io/spring-boot/
[Spring Boot Getting Started]: https://github.com/spring-guides/gs-spring-boot
[Spring Framework]: https://spring.io/
[Maven Plugin for Azure Web Apps]: /java/api/overview/azure/maven/azure-webapp-maven-plugin/readme

[Java Development Kit (JDK)]: https://aka.ms/azure-jdks
<!-- http://www.oracle.com/technetwork/java/javase/downloads/ -->

<!-- IMG List -->

[AP01]: ./media/deploy-spring-boot-java-app-with-maven-plugin/AP01.png
[AP02]: ./media/deploy-spring-boot-java-app-with-maven-plugin/AP02.png
