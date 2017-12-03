---
title: How to use the Spring Boot Starter for Azure Active Directory
description: Learn how to configure a Spring Boot Initializer app with the Azure Active Directory starter.
services: active-directory
documentationcenter: java
author: rmcmurray
manager: routlaw
editor: ''

ms.assetid:
ms.service: active-directory
ms.workload: identity
ms.tgt_pltfrm: multiple
ms.devlang: java
ms.topic: article
ms.date: 12/01/2017
ms.author: robmcm
---

# How to use the Spring Boot Starter for Azure Active Directory

## Overview

This article demonstrates creating an app with the **[Spring Initializr]** which the Spring Boot Starter for Azure Active Directory (Azure AD).

## Prerequisites

The following prerequisites are required in order to follow the steps in this article:

* An Azure subscription; if you don't already have an Azure subscription, you can activate your [MSDN subscriber benefits] or sign up for a [free Azure account].
* A [Java Development Kit (JDK)](http://www.oracle.com/technetwork/java/javase/downloads/), version 1.7 or later.
* [Apache Maven](http://maven.apache.org/), version 3.0 or later.

## Create a custom application using the Spring Initializr

1. Browse to <https://start.spring.io/>.

1. Specify that you want to generate a **Maven** project with **Java**, enter the **Group** and **Aritifact** names for your application, and then click the link to **Switch to the full version** of the Spring Initializr.

   ![Specify Group and Aritifact names][security-01]

1. Scroll down to the **Core** section and check the box for **Security**, and in the **Web** section check the box for **Web**.

   ![Select Security and Web starters][security-02]

1. Scroll down to the **Azure** section and check the box for **Azure Active Directory**.

   ![Select Azure Active Directory starter][security-03]

1. Scroll to the bottom of the page and click the button to **Generate Project**.

   ![Generate Spring Boot project][security-04]

1. When prompted, download the project to a path on your local computer.

## Create and configure a new Azure Active Directory instance

### Create the Active Directory instance

1. Log into <https://portal.azure.com>.

1. Click **+New**, then **Security + Identity**, and then **Azure Active Directory**.

   ![Create new Azure Active Directory instance][directory-01]

1. Enter your **Organization name** and your **Initial domain name**, and then click **Create**.

   ![Specify Azure Active Directory names][directory-02]

1. Select your new Azure Active Directory from the drop-down menu on the top toolbar of the Azure portal.

   ![Choose your Azure Active Directory][directory-03]

### Add an application registration for your Spring Boot app

1. Select **Azure Active Directory** from the portal menu, click **Overview**, and then click **App registrations**.

   ![Add a new app registration][directory-04]

1. Click **New application registration**, specify your application **Name**, use http://localhost:8080 for the **Sign-on URL**, and then click **Create**.

   ![Create new app registration][directory-05]

1. Click your application registration after it has been created.

   ![Select your app registration][directory-06]

1. When the page for your app registration, copy your **Application ID** for later, then click **Keys**.

   ![Create app registration keys][directory-07]

1. Add a **Description** and specify the **Duration** for a new key and click **Save**; the value for the key will be automatically filled in when you click the **Save** icon, and you need to copy down the value of the key for later. (You will not be able to retrieve this value later.)

   ![Specify app registration key parameters][directory-08]

1. From the main page for your app registration, click **Required permissions**.

   ![App registration required permissions][directory-09]

1. Click **Windows Azure Active Directory**.

   ![Select Windows Azure Active Directory][directory-10]

1. Check the boxes for **Access the directory as the signed-in user** and **Sign in and read user profile**, and then click **Save**.

   ![Enable access permissions][directory-11]

1. On the **Required permissions** page, click **Grant Permissions**, and click **Yes** when prompted.

   ![Grant access permissions][directory-12]

## Configure and compile your Spring Boot application

1. Extract the files from the downloaded project archive into a directory.

1. Navigate to the parent folder in your project and open the *pom.xml* file in a text editor.

1. Add the dependency for Spring OAuth2 security; for example:

   ```xml
   <dependency>
      <groupId>org.springframework.security.oauth</groupId>
      <artifactId>spring-security-oauth2</artifactId>
   </dependency>
   ```

1. Save and close the  the *pom.xml* file.

1. Navigate to the *src/main/resources* folder in your project and open the *application.properties* file in a text editor.

1. Add the key for your storage account using the values from earlier; for example:

   ```yaml
   # Specifies your Active Directory Application ID:
   azure.activedirectory.clientId=11111111-1111-1111-1111-1111111111111111

   # Specifies your secret key:
   azure.activedirectory.clientSecret=AbCdEfGhIjKlMnOpQrStUvWxYz==

   # Specifies the list of Active Directory groups to use for authentication:
   azure.activedirectory.activeDirectoryGroups=Users
   ```
   Where:
   Parameter | Description
   ---|---|---
   `azure.activedirectory.clientId` | Contains your **Application ID** from earlier.
   `azure.activedirectory.clientSecret` | Contains the key value from your app registration which you completed earlier.
   `azure.activedirectory.activeDirectoryGroups` | Contains a list of Active Directory groups to use for authentication.


1. Save and close the  the *application.properties* file.

1. Create a folder named *controller* in the Java source folder for your application; for example: *src/main/java/com/wingtiptoys/security/controller*.

1. Create a new Java file named *HelloController.java* in the *controller* folder and open it in a text editor.

1. Enter the following code, then save and close the file:

   ```java
   package com.wingtiptoys.security;
   
   import org.springframework.web.bind.annotation.RequestMapping;
   import org.springframework.web.bind.annotation.RestController;
   import org.springframework.boot.SpringApplication;
   import org.springframework.boot.autoconfigure.SpringBootApplication;
   
   import org.springframework.security.access.prepost.PreAuthorize;
   import org.springframework.security.web.authentication.preauth.PreAuthenticatedAuthenticationToken;
   
   @RestController
   public class HelloController {
      @PreAuthorize("hasRole('Users')")
      @RequestMapping("/")
      public String hello() {
         return "Hello World!";
      }
   }
   ```

1. Create a folder named *security* in the Java source folder for your application; for example: *src/main/java/com/wingtiptoys/security/security*.

1. Create a new Java file named *WebSecurityConfig.java* in the *security* folder and open it in a text editor.

1. Enter the following code, then save and close the file:

   ```java
   package com.wingtiptoys.security;

   import com.microsoft.azure.spring.autoconfigure.aad.AADAuthenticationFilter;
   import org.springframework.beans.factory.annotation.Autowired;
   import org.springframework.boot.autoconfigure.security.oauth2.client.EnableOAuth2Sso;
   import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
   import org.springframework.security.config.annotation.web.builders.HttpSecurity;
   import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
   import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;
   import org.springframework.security.web.csrf.CookieCsrfTokenRepository;
   
   @EnableOAuth2Sso
   @EnableGlobalMethodSecurity(securedEnabled = true, prePostEnabled = true)
   
   public class WebSecurityConfig extends WebSecurityConfigurerAdapter {
      @Autowired
      private AADAuthenticationFilter aadAuthFilter;
      @Override
      protected void configure(HttpSecurity http) throws Exception {
         http.authorizeRequests().anyRequest().permitAll();
         http.addFilterBefore(aadAuthFilter, UsernamePasswordAuthenticationFilter.class);
      }
   }
   ```

## Build and test your app

1. Open a command prompt and change directory to the folder where your app's *pom.xml* file is located.

1. Build your Spring Boot application with Maven and run it; for example:

   ```shell
   mvn clean package
   ```

   ![][build-application]

1. Build your Spring Boot application with Maven and run it; for example:

   ```shell
   mvn clean package
   mvn spring-boot:run
   ```



1. After your application is built and started by Maven, open <http://localhost:8080> in a web browser.

## Next steps

For more information about using Azure Active Directory, see the following articles:

* [Azure Active Directory Documentation].

For more information about using Spring Boot applications on Azure, see the following articles:

* [Deploy a Spring Boot Application to the Azure App Service](deploy-spring-boot-java-web-app-on-azure.md)

* [Running a Spring Boot Application on a Kubernetes Cluster in the Azure Container Service](deploy-spring-boot-java-app-on-kubernetes.md)

For more information about using Azure with Java, see the [Azure Java Developer Center] and the [Java Tools for Visual Studio Team Services].

The **[Spring Framework]** is an open-source solution that helps Java developers create enterprise-level applications. One of the more-popular projects that is built on top of that platform is [Spring Boot], which provides a simplified approach for creating stand-alone Java applications. To help developers get started with Spring Boot, several sample Spring Boot packages are available at <https://github.com/spring-guides/>. In addition to choosing from the list of basic Spring Boot projects, the **[Spring Initializr]** helps developers get started with creating custom Spring Boot applications.

<!-- URL List -->

[Azure Active Directory Documentation]: /azure/active-directory/
[Get started with Azure AD]: /azure/active-directory/get-started-azure-ad
[Azure Java Developer Center]: https://docs.microsoft.com/java/azure/
[free Azure account]: https://azure.microsoft.com/pricing/free-trial/
[Java Tools for Visual Studio Team Services]: https://java.visualstudio.com/
[MSDN subscriber benefits]: https://azure.microsoft.com/pricing/member-offers/msdn-benefits-details/
[Spring Boot]: http://projects.spring.io/spring-boot/
[Spring Initializr]: https://start.spring.io/
[Spring Framework]: https://spring.io/

<!-- IMG List -->

[security-01]: media/configure-spring-boot-starter-java-app-with-azure-active-directory/security-01.png
[security-02]: media/configure-spring-boot-starter-java-app-with-azure-active-directory/security-02.png
[security-03]: media/configure-spring-boot-starter-java-app-with-azure-active-directory/security-03.png
[security-04]: media/configure-spring-boot-starter-java-app-with-azure-active-directory/security-04.png

[directory-01]: media/configure-spring-boot-starter-java-app-with-azure-active-directory/directory-01.png
[directory-02]: media/configure-spring-boot-starter-java-app-with-azure-active-directory/directory-02.png
[directory-03]: media/configure-spring-boot-starter-java-app-with-azure-active-directory/directory-03.png
[directory-04]: media/configure-spring-boot-starter-java-app-with-azure-active-directory/directory-04.png
[directory-05]: media/configure-spring-boot-starter-java-app-with-azure-active-directory/directory-05.png
[directory-06]: media/configure-spring-boot-starter-java-app-with-azure-active-directory/directory-06.png
[directory-07]: media/configure-spring-boot-starter-java-app-with-azure-active-directory/directory-07.png
[directory-08]: media/configure-spring-boot-starter-java-app-with-azure-active-directory/directory-08.png
[directory-09]: media/configure-spring-boot-starter-java-app-with-azure-active-directory/directory-09.png
[directory-10]: media/configure-spring-boot-starter-java-app-with-azure-active-directory/directory-10.png
[directory-11]: media/configure-spring-boot-starter-java-app-with-azure-active-directory/directory-11.png
[directory-12]: media/configure-spring-boot-starter-java-app-with-azure-active-directory/directory-12.png

[build-application]: media/configure-spring-boot-starter-java-app-with-azure-active-directory/build-application.png
