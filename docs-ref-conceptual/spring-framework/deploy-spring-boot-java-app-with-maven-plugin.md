---
title: Deploy a Spring Boot JAR file app to the cloud with Maven and Azure
description: Learn how to deploy a Spring Boot app to the cloud using the Maven Plugin for Azure Web App for Linux.
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

1. Sign into your Azure account by using the Azure CLI:
   
   ```azurecli
   az login
   ```
   
   Follow the instructions to complete the sign-in process.

1. If you have more than one account, you can specify which account to use by using the following command:

   ```azurecli
   az account list --output table
   ```
   
   The above command will list your accounts like the following example:
   
   ```shell
   Name          CloudName    SubscriptionId                        State    IsDefault
   ------------  -----------  ------------------------------------  -------  -----------
   Account 1     AzureCloud   12345678-1234-1234-1234-123456789abc  Enabled  True
   Account 2     AzureCloud   87654321-4321-4321-4321-cba987654321  Enabled  False
   ```

   Specify the account by using the account `Name` or `SubscriptionId`; for example:

   ```azurecli
   az account set --subscription "Account 1"
   ```
   -- or --
   ```azurecli
   az account set --subscription 12345678-1234-1234-1234-123456789abc
   ```

## Clone the sample app

In this section, you will clone a completed Spring Boot application and test it locally.

1. Open a command prompt or terminal window and create a local directory to hold your Spring Boot application, and change to that directory; for example:

   ```shell
   md C:\SpringBoot
   cd C:\SpringBoot
   ```
   -- or --
   ```shell
   mkdir ~/SpringBoot
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

1. When the web app has been created, start the web app listening on port 9000 using Maven; for example:

   ```shell
   mvn spring-boot:run -Dserver.port=9000
   ```

1. Test the web app by browsing to it locally using a web browser. For example, you could use the following command if you have curl available:

   ```shell
   curl http://localhost:9000
   ```

1. You should see the following message displayed: **Greetings from Spring Boot!**

## Configure Maven Plugin for Azure App Service

In this section, you will configure the Spring Boot project's *pom.xml* file so that Maven can deploy the app to Azure App Service on Linux.

1. Open the *pom.xml* file in a code editor.

1. In the `<build>` section of the *pom.xml* file, add the following `<plugin>` entry inside the `<plugins>` tag.

   ```xml
   <plugin>
    <groupId>com.microsoft.azure</groupId>
    <artifactId>azure-webapp-maven-plugin</artifactId>
    <version>1.8.0</version>
   </plugin>
   ```

1. Save and close the *pom.xml* file.

1. Run the following maven command to configure the initial deployment options:

   ```bash
   mvn azure-webapp:config
   ```

   Choose the appropriate numbers to specify the following options when prompted:

   | Prompt |Description |
   |---|---|
   | **OS** | Linux |
   | **javaVersion** | Java 8 |   
   | **Confirm (Y/N)** | y |

   This interactive session should resemble the following example:

   ```shell
   [INFO] Scanning for projects...
   [INFO]
   [INFO] -----------------< org.springframework:gs-spring-boot >-----------------
   [INFO] Building gs-spring-boot 0.1.0
   [INFO] --------------------------------[ jar ]---------------------------------
   [INFO]
   [INFO] --- azure-webapp-maven-plugin:1.8.0:config (default-cli) @ gs-spring-boot ---
   [WARNING] The plugin may not work if you change the os of an existing webapp.
   Define value for OS(Default: Linux):
   1. linux [*]
   2. windows
   3. docker
   Enter index to use: 1
   Define value for javaVersion(Default: Java 8): 
   1. Java 11
   2. Java 8 [*]
   Enter index to use: 2
   Please confirm webapp properties
   AppName : gs-spring-boot-123456789
   ResourceGroup : gs-spring-boot-123456789-rg
   Region : westeurope
   PricingTier : Premium_P1V2
   OS : Linux
   RuntimeStack : JAVA 8-jre8
   Deploy to slot : false
   Confirm (Y/N)? : Y
   [INFO] Saving configuration to pom.
   [INFO] ------------------------------------------------------------------------
   [INFO] BUILD SUCCESS
   [INFO] ------------------------------------------------------------------------
   [INFO] Total time: 01:06 min
   [INFO] Finished at: 2019-09-25T06:14:06+00:00
   [INFO] Final Memory: 36M/152M
   [INFO] ------------------------------------------------------------------------
   ```

1. If you want to configure additional options, you can re-run the following maven command to reconfigure your deployment options:

   ```bash
   mvn azure-webapp:config
   ```

   You can hit enter to accept any of the defaults, or you can enter new values for any of the additional prompts. For example, the following interactive session changes the region and pricing tier:

   ```shell
   [INFO] Scanning for projects...
   [INFO]
   [INFO] ------------------------------------------------------------------------
   [INFO] Building gs-spring-boot 0.1.0
   [INFO] ------------------------------------------------------------------------
   [INFO]
   [INFO] --- azure-webapp-maven-plugin:1.8.0:config (default-cli) @ gs-spring-boot ---
   Please choose which part to config
   1. Application
   2. Runtime
   3. DeploymentSlot
   Enter index to use: 1
   Define value for appName(Default: gs-spring-boot-123456789):
   Define value for resourceGroup(Default: gs-spring-boot-123456789-rg):
   Define value for region(Default: westeurope): westus
   Define value for pricingTier(Default: P1V2):
   1. b1
   2. b2
   3. b3
   4. d1
   5. f1
   6. p1v2 [*]
   7. p2v2
   8. p3v2
   9. s1
   10. s2
   11. s3
   Enter index to use: 5
   Please confirm webapp properties
   AppName : gs-spring-boot-1569392029059
   ResourceGroup : gs-spring-boot-1569392029059-rg
   Region : westus
   PricingTier : Free_F1
   OS : Linux
   RuntimeStack : JAVA 8-jre8
   Deploy to slot : false
   Confirm (Y/N)? : y
   [INFO] Saving configuration to pom.
   [INFO] ------------------------------------------------------------------------
   [INFO] BUILD SUCCESS
   [INFO] ------------------------------------------------------------------------
   [INFO] Total time: 47.733 s
   [INFO] Finished at: 2019-09-25T06:15:10+00:00
   [INFO] Final Memory: 37M/227M
   [INFO] ------------------------------------------------------------------------
   ```

1. Reopen the *pom.xml* file in a code editor.

1. Add the `<appSettings>` section to the `<configuration>` section of `<azure-webapp-maven-plugin>` to listen on the *80* port.

    ```xml
   <plugin>
       <groupId>com.microsoft.azure</groupId>
       <artifactId>azure-webapp-maven-plugin</artifactId>
       <version>1.8.0</version>
       <configuration>
          <schemaVersion>V2</schemaVersion>
          <resourceGroup>gs-spring-boot-123456789-rg</resourceGroup>
          <appName>gs-spring-boot-123456789</appName>
          <region>westus</region>
          <pricingTier>F1</pricingTier>
          <runtime> 
            <os>linux</os>  
            <javaVersion>jre8</javaVersion>  
            <webContainer>jre8</webContainer> 
          </runtime> 
          <!-- Begin of App Settings  -->
          <appSettings>
             <property>
                   <name>JAVA_OPTS</name>
                   <value>-Dserver.port=80</value>
             </property>
          </appSettings>
          <!-- End of App Settings  -->
          ...
         </configuration>
   </plugin>
   ```

1. Save and close the *pom.xml* file.

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

If your deployment is successful, you should see a status like the following example, where the URL of your application is listed in the response:

```shell
[INFO] Scanning for projects...
[INFO]
[INFO] ------------------------------------------------------------------------
[INFO] Building gs-spring-boot 0.1.0
[INFO] ------------------------------------------------------------------------
[INFO]
[INFO] --- azure-webapp-maven-plugin:1.8.0:deploy (default-cli) @ gs-spring-boot ---
[INFO] In the Azure Cloud Shell, use MSI to authenticate.
[INFO] Target Web App doesn't exist. Creating a new one...
[INFO] Creating App Service Plan 'ServicePlan12345678-1234-1234'...
[INFO] Successfully created App Service Plan.
[INFO] Successfully created Web App.
[INFO] Using 'UTF-8' encoding to copy filtered resources.
[INFO] Copying 1 resource to /home/robert/SpringBoot/gs-spring-boot/complete/target/azure-webapp/gs-spring-boot-123456789-4ade6189-5ffe-48d5-a2c2-11acae363c00
[INFO] Trying to deploy artifact to gs-spring-boot-123456789...
[INFO] Renaming /home/robert/SpringBoot/gs-spring-boot/complete/target/azure-webapp/gs-spring-boot-123456789-4ade6189-5ffe-48d5-a2c2-11acae363c00/gs-spring-boot-0.1.0.jar to app.jar
[INFO] Deploying the zip package gs-spring-boot-123456789-4ade6189-5ffe-48d5-a2c2-11acae363c00935289188366298788.zip...
[INFO] Successfully deployed the artifact to https://gs-spring-boot-123456789.azurewebsites.net
[INFO] ------------------------------------------------------------------------
[INFO] BUILD SUCCESS
[INFO] ------------------------------------------------------------------------
[INFO] Total time: 02:47 min
[INFO] Finished at: 2019-09-25T06:26:57+00:00
[INFO] Final Memory: 43M/338M
[INFO] ------------------------------------------------------------------------
```

When your web app has been successfully deployed, it might take a few minutes before the web app is visible at the URL. You should see the following message displayed: **Greetings from Spring Boot!** 

   ![Viewing the web app in a browser][AP03]

After you have deployed your web app, you will be able to manage it through the [Azure portal].

* Your web app will be listed in **App Services**:

   ![Web app listed in Azure portal App Services][AP01]

* And the URL for your web app will be listed in the **Overview** for your web app:

   ![Determining the URL for your web app][AP02]

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
[AP03]: ./media/deploy-spring-boot-java-app-with-maven-plugin/AP03.png
