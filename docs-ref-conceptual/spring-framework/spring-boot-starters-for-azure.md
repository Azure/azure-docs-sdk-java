---
title: Spring Boot Starters for Azure
description: This article describes the various Spring Boot Starters that are available for Azure.
services: ''
documentationcenter: java
author: rmcmurray
manager: routlaw
editor: ''

ms.assetid: 
ms.service: multiple
ms.workload: na
ms.tgt_pltfrm: multiple
ms.devlang: java
ms.topic: article
ms.date: 11/15/2017
ms.author: robmcm
---

# Spring Boot Starters for Azure

This article describes the various Spring Boot Starters for the [Spring Initializr] that provide Java developers with integration features for working with Microsoft Azure.

![Azure Spring Boot Starters][spring-boot-starters]

## Azure Support

This Spring Boot Starter provides auto-configuration support for Azure Services; for example: Service Bus, Storage, Active Directory, Cosmos DB, Key Vault, etc.

For examples of how to use the various Azure features that are provided by this starter, see <https://github.com/Microsoft/azure-spring-boot/tree/master/azure-spring-boot-samples>.

This starter differs from the default Spring Boot starter through the following changes to the *pom.xml* file:

* Adds the following property to `<properties>` element:

   ```xml
   <properties>
      <!-- Other properties will be listed here -->
      <azure.version>0.2.0</azure.version>
   </properties>
   ```

* Replaces the default `spring-boot-starter` dependency with the following:

   ```xml
   <dependency>
      <groupId>com.microsoft.azure</groupId>
      <artifactId>azure-spring-boot</artifactId>
   </dependency>
   ```

* Adds the following section:

   ```xml
   <dependencyManagement>
      <dependencies>
         <dependency>
            <groupId>com.microsoft.azure</groupId>
            <artifactId>azure-spring-boot-bom</artifactId>
            <version>${azure.version}</version>
            <type>pom</type>
            <scope>import</scope>
         </dependency>
      </dependencies>
   </dependencyManagement>
   ```

## Azure Active Directory

This Spring Boot Starter provides auto-configuration support for Spring Security in order to provide integration with Azure Active Directory for authentication.

For examples of how to use the Azure Active Directory features that are provided by this starter, see <https://github.com/Microsoft/azure-spring-boot/tree/master/azure-spring-boot-samples/azure-active-directory-spring-boot-sample>.

This starter differs from the default Spring Boot starter through the following changes to the *pom.xml* file:

* Adds the following property to `<properties>` element:

   ```xml
   <properties>
      <!-- Other properties will be listed here -->
      <azure.version>0.2.0</azure.version>
   </properties>
   ```

* Replaces the default `spring-boot-starter` dependency with the following:

   ```xml
   <dependency>
      <groupId>com.microsoft.azure</groupId>
      <artifactId>azure-active-directory-spring-boot-starter</artifactId>
   </dependency>
   ```

* Adds the following section:

   ```xml
   <dependencyManagement>
      <dependencies>
         <dependency>
            <groupId>com.microsoft.azure</groupId>
            <artifactId>azure-spring-boot-bom</artifactId>
            <version>${azure.version}</version>
            <type>pom</type>
            <scope>import</scope>
         </dependency>
      </dependencies>
   </dependencyManagement>
   ```

## Azure Key Vault

This Spring Boot Starter provides Spring value annotation support for integration with Azure Key Vault Secrets.

For examples of how to use the Azure Key Vault features that are provided by this starter, see <https://github.com/Microsoft/azure-spring-boot/tree/master/azure-spring-boot-samples/azure-keyvault-secrets-spring-boot-sample>.

This starter differs from the default Spring Boot starter through the following changes to the *pom.xml* file:

* Adds the following property to `<properties>` element:

   ```xml
   <properties>
      <!-- Other properties will be listed here -->
      <azure.version>0.2.0</azure.version>
   </properties>
   ```

* Replaces the default `spring-boot-starter` dependency with the following:

   ```xml
   <dependency>
      <groupId>com.microsoft.azure</groupId>
      <artifactId>azure-keyvault-secrets-spring-boot-starter</artifactId>
   </dependency>
   ```

* Adds the following section:

   ```xml
   <dependencyManagement>
      <dependencies>
         <dependency>
            <groupId>com.microsoft.azure</groupId>
            <artifactId>azure-spring-boot-bom</artifactId>
            <version>${azure.version}</version>
            <type>pom</type>
            <scope>import</scope>
         </dependency>
      </dependencies>
   </dependencyManagement>
   ```

## Azure Storage

This Spring Boot Starter provides integration support for Azure Storage services.

For examples of how to use the Azure Storage features that are provided by this starter, see <https://github.com/Microsoft/azure-spring-boot/tree/master/azure-spring-boot-samples/azure-storage-spring-boot-sample>.

This starter differs from the default Spring Boot starter through the following changes to the *pom.xml* file:

* Adds the following property to `<properties>` element:

   ```xml
   <properties>
      <!-- Other properties will be listed here -->
      <azure.version>0.2.0</azure.version>
   </properties>
   ```

* Replaces the default `spring-boot-starter` dependency with the following:

   ```xml
   <dependency>
      <groupId>com.microsoft.azure</groupId>
      <artifactId>azure-storage-spring-boot-starter</artifactId>
   </dependency>
   ```

* Adds the following section:

   ```xml
   <dependencyManagement>
      <dependencies>
         <dependency>
            <groupId>com.microsoft.azure</groupId>
            <artifactId>azure-spring-boot-bom</artifactId>
            <version>${azure.version}</version>
            <type>pom</type>
            <scope>import</scope>
         </dependency>
      </dependencies>
   </dependencyManagement>
   ```

## Next steps

For more information about using [Spring Boot] applications on Azure, see [Spring Boot Getting Started].

For more information about using Azure with Java, see the [Azure Java Developer Center] and the [Java Tools for Visual Studio Team Services].

For help with getting started with your own Spring Boot applications, see the **Spring Initializr** at https://start.spring.io/.

<!-- URL List -->

[Azure Java Developer Center]: https://azure.microsoft.com/develop/java/
[Java Tools for Visual Studio Team Services]: https://java.visualstudio.com/
[Spring Boot]: http://projects.spring.io/spring-boot/
[Spring Boot Getting Started]: https://github.com/spring-guides/gs-spring-boot
[Spring Framework]: https://spring.io/
[Spring Initializr]: https://start.spring.io/

<!-- IMG List -->

[spring-boot-starters]: media/spring-boot-starters-for-azure/spring-boot-starters-scaled.png
