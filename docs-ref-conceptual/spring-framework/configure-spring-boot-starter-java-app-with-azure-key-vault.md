---
title: How to use the Spring Boot Starter for Azure Key Vault
description: Learn how to configure a Spring Boot Initializer app with the Azure Key Vault starter.
services: key-vault
documentationcenter: java
author: rmcmurray
manager: routlaw
editor: ''

ms.assetid:
ms.service: key-vault
ms.workload: identity
ms.tgt_pltfrm: multiple
ms.devlang: java
ms.topic: article
ms.date: 11/29/2017
ms.author: robmcm
---

# How to use the Spring Boot Starter for Azure Key Vault

## Overview

This article demonstrates creating an app with the **[Spring Initializr]** which uses the Spring Boot Starter for Azure Key Vault to store secrets.

## Prerequisites

The following prerequisites are required in order to follow the steps in this article:

* An Azure subscription; if you don't already have an Azure subscription, you can activate your [MSDN subscriber benefits] or sign up for a [free Azure account].
* A [Java Development Kit (JDK)](http://www.oracle.com/technetwork/java/javase/downloads/), version 1.7 or later.
* [Apache Maven](http://maven.apache.org/), version 3.0 or later.

## Create an app using the Spring Initialzr

1. Browse to <https://start.spring.io/>.

1. Specify that you want to generate a **Maven** project with **Java**, enter the **Group** and **Aritifact** names for your application, and then click the link to **Switch to the full version** of the Spring Initializr.

   ![Specify Group and Aritifact names][secrets-01]

1. Scroll down to the **Azure** section and check the box for **Azure Key Vault**.

   ![Select Azure Key Vault starter][secrets-02]

1. Scroll to the bottom of the page and click the button to **Generate Project**.

   ![Generate Spring Boot project][secrets-03]

1. When prompted, download the project to a path on your local computer.

## Sign into Azure and select the subscription to use

1. Open a command prompt.

1. Sign into your Azure account by using the Azure CLI:

   ```azurecli
   az login
   ```
   Follow the instructions to complete the sign-in process.

1. List your subscriptions:

   ```azurecli
   az account list
   ```
   Azure will return a list of your subscriptions, and you will need to copy the GUID for the subscription that you want to use; for example:

   ```json
   [
     {
       "cloudName": "AzureCloud",
       "id": "11111111-1111-1111-1111-111111111111",
       "isDefault": true,
       "name": "Converted Windows Azure MSDN - Visual Studio Ultimate",
       "state": "Enabled",
       "tenantId": "tttttttt-tttt-tttt-tttt-tttttttttttt",
       "user": {
         "name": "contoso@microsoft.com",
         "type": "user"
       }
     }
   ]

1. Specify the GUID for the account you want to use with Azure; for example:

   ```azurecli
   az account set -s 11111111-1111-1111-1111-111111111111
   ```

## Create an Azure service principal

In this section, you create an Azure service principal that the Maven plugin uses when deploying your web app to Azure.

1. Create an Azure service principal:
   ```shell
   az ad sp create-for-rbac --name "uuuuuuuu" --password "pppppppp"
   ```
   Where `uuuuuuuu` is the user name and `pppppppp` is the password for the service principal.

1. Azure responds with JSON that resembles the following example:
   ```json
   {
      "appId": "aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa",
      "displayName": "uuuuuuuu",
      "name": "http://uuuuuuuu",
      "password": "pppppppp",
      "tenant": "tttttttt-tttt-tttt-tttt-tttttttttttt"
   }
   ```
   Save the `appId` value for later.

## Create and configure a new Azure Key Vault

1. Create a resource group for the Azure resources you will use for your key vault; for example:
   ```azurecli
   az group create --name wingtiptoysresources --location westus
   ```
   Where:
   | Parameter | Description |
   |---|---|
   | `name` | Specifies a unique name for your resource group. |
   | `location` | Specifies the [Azure region](https://azure.microsoft.com/regions/) where your resource group will be hosted. |

   The Azure CLI will display the results of your resource group creation; for example:  

   ```json
   {
     "id": "/subscriptions/11111111-1111-1111-1111-111111111111/resourceGroups/wingtiptoysresources",
     "location": "westus",
     "managedBy": null,
     "name": "wingtiptoysresources",
     "properties": {
       "provisioningState": "Succeeded"
     },
     "tags": null
   }
   ```

1. Create a new key vault in the resource group you just created; for example:
   ```azurecli
   az keyvault create --name wingtiptoyskeyvault --resource-group wingtiptoysresources --location westus --enabled-for-deployment true --enabled-for-disk-encryption true --enabled-for-template-deployment true --sku standard
   ```
   Where:
   | Parameter | Description |
   |---|---|
   | `name` | Specifies a unique name for your key vault. |
   | `location` | Specifies the [Azure region](https://azure.microsoft.com/regions/) where your resource group will be hosted. |
   | `enabled-for-deployment` | Specifies the [key vault deployment option](https://docs.microsoft.com/en-us/cli/azure/keyvault). |
   | `enabled-for-disk-encryption` | Specifies the [key vault encryption option](https://docs.microsoft.com/en-us/cli/azure/keyvault). |
   | `enabled-for-template-deployment` | Specifies the [key vault encryption option](https://docs.microsoft.com/en-us/cli/azure/keyvault). |
   | `sku` | Specifies the [key vault SKU option](https://docs.microsoft.com/en-us/cli/azure/keyvault). |

   The Azure CLI will display the results of your key vault creation; for example:  

   ```json
   {
     "id": "/subscriptions/11111111-1111-1111-1111-111111111111/resourceGroups/wingtiptoysresources/providers/Microsoft.KeyVault/vaults/wingtiptoyskeyvault",
     "location": "westus",
     "name": "wingtiptoyskeyvault",
     "properties": {
       //
       // A long list of values will be displayed here.
       //
       "enabledForDeployment": true,
       "enabledForDiskEncryption": true,
       "enabledForTemplateDeployment": true,
       "sku": {
         "name": "standard"
       },
       "tenantId": "tttttttt-tttt-tttt-tttt-tttttttttttt",
       "vaultUri": "https://wingtiptoyskeyvault.vault.azure.net"
     },
     "resourceGroup": "wingtiptoysresources",
     "tags": {},
     "type": "Microsoft.KeyVault/vaults"
   }
   ```
   Save the `vaultUri` value for later.

1. Set the access policy for the Azure service principal you created earlier; for example:
   ```azurecli
   az keyvault set-policy --name wingtiptoyskeyvault --secret-permission backup delete get list purge recover restore set --object-id aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa
   ```
   Where:
   | Parameter | Description |
   |---|---|
   | `name` | Specifies your key vault name from earlier. |
   | `secret-permission` | Specifies the [security policies](https://docs.microsoft.com/en-us/cli/azure/keyvault) for your key vault. |
   | `object-id` | Specifies your service principal's `appId` from earlier. |

   The Azure CLI will display the results of your security policy creation; for example:  

   ```json
   {
     "id": "/subscriptions/11111111-1111-1111-1111-111111111111/resourceGroups/wingtiptoysresources/providers/Microsoft.KeyVault/vaults/wingtiptoyskeyvault",
     "location": "westus",
     "name": "wingtiptoyskeyvault",
     "properties": {
       //
       // A long list of values will be displayed here.
       //
       "createMode": null,
       "enableSoftDelete": null,
       "enabledForDeployment": true,
       "enabledForDiskEncryption": true,
       "enabledForTemplateDeployment": true,
       "sku": {
         "name": "standard"
       },
       "tenantId": "tttttttt-tttt-tttt-tttt-tttttttttttt",
       "vaultUri": "https://wingtiptoyskeyvault.vault.azure.net/"
     },
     "resourceGroup": "wingtiptoysresources",
     "tags": {},
     "type": "Microsoft.KeyVault/vaults"
   }
   ```

1. Store a secret in your new key vault; for example:
   ```azurecli
   az keyvault secret set --name connection-string --value "jdbc:sqlserver://wingtiptoys.database.windows.net:1433;database=DATABASE;" --vault-name wingtiptoyskeyvault
   ```
   Where:
   | Parameter | Description |
   |---|---|
   | `name` | Specifies the name of your secret. |
   | `value` | Specifies the value of your secret. |
   | `vault-name` | Specifies your key vault name from earlier. |

   The Azure CLI will display the results of your secret creation; for example:  

   ```json
   {
     "attributes": {
       "created": "2017-12-01T09:00:16+00:00",
       "enabled": true,
       "expires": null,
       "notBefore": null,
       "recoveryLevel": "Purgeable",
       "updated": "2017-12-01T09:00:16+00:00"
     },
     "contentType": null,
     "id": "https://wingtiptoyskeyvault.vault.azure.net/secrets/connection-string/123456789abcdef123456789abcdef",
     "kid": null,
     "managed": null,
     "tags": {
       "file-encoding": "utf-8"
     },
     "value": "jdbc:sqlserver://wingtiptoys.database.windows.net:1433;database=DATABASE;"
   }
   ```

## Configure and compile your Spring Boot application

1. Extract the files from the Spring Boot project archive files that you downloaded earlier into a directory.

1. Navigate to the *src/main/resources* folder in your project and open the *application.properties* file in a text editor.

1. Add the values for your key vault; for example:
   ```yaml
   azure.keyvault.uri=https://wingtiptoyskeyvault.vault.azure.net/
   azure.keyvault.client-id=aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa
   azure.keyvault.client-key=put-your-azure-client-key-here
   ```
   Where:
   | Parameter | Description |
   |---|---|
   | `azure.keyvault.uri` | Specifies the `vaultUri` of your key vault from earlier. |
   | `azure.keyvault.client-id` | Specifies the `appId` value from your service principal. |
   | `azure.keyvault.client-key` | Specifies your key vault name from earlier. |

1. Navigate to the main source code file of your project; for example: */src/main/java/com/wingtiptoys/secrets*.

1. Open the application's main Java file in a file in a text editor; for example: *SecretsApplication.java*, and add the following lines to the file:

   ```java
   package com.wingtiptoys.secrets;

   import org.springframework.boot.SpringApplication;
   import org.springframework.boot.autoconfigure.SpringBootApplication;
   import org.springframework.beans.factory.annotation.Value;
   import org.springframework.boot.CommandLineRunner;

   @SpringBootApplication
   public class SecretsApplication implements CommandLineRunner {

       @Value("${connection-string}")
       private String connectionString;

       public static void main(String[] args) {
           SpringApplication.run(SecretsApplication.class, args);
       }

       public void run(String... varl) throws Exception {
           System.out.println("Connection String stored in Azure Key Vault: " + connectionString);
       }
   }
   ```

1. Save and close the main application Java file.

## Build and test your app

1. Navigate to the directory where the *pom.xml* file for your Spring Boot app is located:

1. Build your Spring Boot application with Maven and run it; for example:

   ```azurecli
   mvn clean package
   mvn spring-boot:run
   ```

## Next steps

For more information about using Azure Key Vaults, see the following articles:

* [Key Vault Documentation].

* [Get started with Azure Key Vault]

For more information about using Spring Boot applications on Azure, see the following articles:

* [Deploy a Spring Boot Application to the Azure App Service](deploy-spring-boot-java-web-app-on-azure.md)

* [Running a Spring Boot Application on a Kubernetes Cluster in the Azure Container Service](deploy-spring-boot-java-app-on-kubernetes.md)

For more information about using Azure with Java, see the [Azure Java Developer Center] and the [Java Tools for Visual Studio Team Services].

The **[Spring Framework]** is an open-source solution that helps Java developers create enterprise-level applications. One of the more-popular projects that is built on top of that platform is [Spring Boot], which provides a simplified approach for creating stand-alone Java applications. To help developers get started with Spring Boot, several sample Spring Boot packages are available at <https://github.com/spring-guides/>. In addition to choosing from the list of basic Spring Boot projects, the **[Spring Initializr]** helps developers get started with creating custom Spring Boot applications.

<!-- URL List -->

[Key Vault Documentation]: /azure/key-vault/
[Get started with Azure Key Vault]: /azure/key-vault/key-vault-get-started
[Azure Java Developer Center]: https://docs.microsoft.com/java/azure/
[free Azure account]: https://azure.microsoft.com/pricing/free-trial/
[Java Tools for Visual Studio Team Services]: https://java.visualstudio.com/
[MSDN subscriber benefits]: https://azure.microsoft.com/pricing/member-offers/msdn-benefits-details/
[Spring Boot]: http://projects.spring.io/spring-boot/
[Spring Initializr]: https://start.spring.io/
[Spring Framework]: https://spring.io/

<!-- IMG List -->

[secrets-01]: media/configure-spring-boot-starter-java-app-with-azure-key-vault/secrets-01.png
[secrets-02]: media/configure-spring-boot-starter-java-app-with-azure-key-vault/secrets-02.png
[secrets-03]: media/configure-spring-boot-starter-java-app-with-azure-key-vault/secrets-03.png
