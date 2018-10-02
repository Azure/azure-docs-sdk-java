---
title: How to use the Spring Boot Starter for Azure Active Directory
description: Learn how to configure a Spring Boot Initializer app with the Azure Active Directory starter.
services: active-directory
documentationcenter: java
author: rmcmurray
manager: mbaldwin
editor: ''

ms.assetid:
ms.author: robmcm
ms.date: 07/02/2018
ms.devlang: java
ms.service: active-directory
ms.tgt_pltfrm: multiple
ms.topic: article
ms.workload: identity
---

# How to use the Spring Boot Starter for Azure Active Directory

## Overview

This article demonstrates creating an app with the **[Spring Initializr]** that uses the Spring Boot Starter for Azure Active Directory (Azure AD).

## Prerequisites

The following prerequisites are required in order to complete the steps in this article:

* An Azure subscription; if you don't already have an Azure subscription, you can activate your [MSDN subscriber benefits] or sign up for a [free Azure account].
* A [Java Development Kit (JDK)](http://www.oracle.com/technetwork/java/javase/downloads/), version 1.7 or later.
* [Apache Maven](http://maven.apache.org/), version 3.0 or later.

## Create a custom application using the Spring Initializr

1. Browse to <https://start.spring.io/>.

1. Specify that you want to generate a **Maven** project with **Java**, enter the **Group** and **Artifact** names for your application, and then click the link to **Switch to the full version** of the Spring Initializr.

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

1. Enter your **Organization name** and your **Initial domain name**. Copy the full URL of your directory; you will use that to add user accounts later in this tutorial. (For example: `wingtiptoysdirectory.onmicrosoft.com`.) When you have finished, click **Create**.

   ![Specify Azure Active Directory names][directory-02]

1. Select your new Azure Active Directory from the drop-down menu on the top toolbar of the Azure portal.

   ![Choose your Azure Active Directory][directory-03]

1. Select **Azure Active Directory** from the portal menu, click **Properties**, and copy the **Directory ID**; you will use that value to configure your *application.properties* file later in this tutorial.

   ![Copy your Azure Active Directory ID][directory-13]

### Add an application registration for your Spring Boot app

1. Select **Azure Active Directory** from the portal menu, click **Overview**, and then click **App registrations**.

   ![Add a new app registration][directory-04]

1. Click **New application registration**, specify your application **Name**, use http://localhost:8080 for the **Sign-on URL**, and then click **Create**.

   ![Create new app registration][directory-05]

1. Click your application registration after it has been created.

   ![Select your app registration][directory-06]

1. When the page for your app registration appears, copy your **Application ID**; you will use this value to configure your *application.properties* file later in this tutorial. Click **Settings**, and then click **Keys**.

   ![Create app registration keys][directory-07]

1. Add a **Description** and specify the **Duration** for a new key and click **Save**; the value for the key will be automatically filled in when you click the **Save** icon, and you need to copy down the value of the key to configure your *application.properties* file later in this tutorial. (You will not be able to retrieve this value later.)

   ![Specify app registration key parameters][directory-08]

1. From the main page for your app registration, click **Settings**, and then click **Required permissions**.

   ![App registration required permissions][directory-09]

1. Click **Windows Azure Active Directory**.

   ![Select Windows Azure Active Directory][directory-10]

1. Check the boxes for **Access the directory as the signed-in user** and **Sign in and read user profile**, and then click **Save**.

   ![Enable access permissions][directory-11]

1. On the **Required permissions** page, click **Grant Permissions**, and click **Yes** when prompted.

   ![Grant access permissions][directory-12]

1. From the main page for your app registration, click **Settings**, and then click **Reply URLs**.

   ![Edit Reply URLs][directory-14]

1. Enter "http://localhost:8080/login/oauth2/code/azure" as a new reply URL, and then click **Save**.

   ![Add new Reply URL][directory-15]

1. From the main page for your app registration, click **Manifest**, then set the value of the `oauth2AllowImplicitFlow` parameter to `true`, and then click **Save**.

   ![Configure app manifest][directory-16]

   > [!NOTE]
   > 
   > For more information about the `oauth2AllowImplicitFlow` parameter and other application settings, see [Azure Active Directory application manifest][AAD app manifest]. 
   >

### Add a user account to your directory, and add that account to a group

1. From the **Overview** page of your Active Directory, click **Users**.

   ![Open the Users panel][directory-17]

1. When the **Users** panel is displayed, click **New user**.

   ![Add a new user account][directory-18]

1. When the **User** panel is displayed, enter the **Name** and **User name**.

   ![Enter user account information][directory-19]

   > [!NOTE]
   > 
   > You need to specify your directory URL from earlier in this tutorial when you enter the user name; for example:
   >
   > `wingtipuser@wingtiptoysdirectory.onmicrosoft.com`
   > 

1. Click **Groups**, then select the groups that you will use for authorization in your application, and then click **Select**. (For the purposes of this tutorial, add the account to the _Users_ group.)

   ![Select the user's groups][directory-20]

1. Click **Show password**, and copy the password; you will use this when you log into your application later in this tutorial.

   ![Show the password][directory-21]

1. Click **Create** to add the new user account to your directory.

   ![Create the new user account][directory-22]

## Configure and compile your Spring Boot application

1. Extract the files from the project archive you created and downloaded earlier in this tutorial into a directory.

1. Navigate to the parent folder for your project, and open the *pom.xml* file in a text editor.

1. Add the dependencies for Spring OAuth2 security; for example:

   ```xml
   <dependency>
      <groupId>org.springframework.security</groupId>
      <artifactId>spring-security-oauth2-client</artifactId>
   </dependency>
   <dependency>
      <groupId>org.springframework.security</groupId>
      <artifactId>spring-security-oauth2-jose</artifactId>
   </dependency>
   ```

1. Save and close the *pom.xml* file.

1. Navigate to the *src/main/resources* folder in your project and open the *application.properties* file in a text editor.

1. Specify the settings for your app registration using the values you created earlier; for example:

   ```yaml
   # Specifies your Active Directory ID:
   azure.activedirectory.tenant-id=22222222-2222-2222-2222-222222222222

   # Specifies your App Registration's Application ID:
   spring.security.oauth2.client.registration.azure.client-id=11111111-1111-1111-1111-1111111111111111

   # Specifies your App Registration's secret key:
   spring.security.oauth2.client.registration.azure.client-secret=AbCdEfGhIjKlMnOpQrStUvWxYz==

   # Specifies the list of Active Directory groups to use for authorization:
   azure.activedirectory.active-directory-groups=Users
   ```
   Where:

   | Parameter | Description |
   |---|---|
   | `azure.activedirectory.tenant-id` | Contains your Active Directory's **Directory ID** from earlier. |
   | `spring.security.oauth2.client.registration.azure.client-id` | Contains the **Application ID** from your app registration that you completed earlier. |
   | `spring.security.oauth2.client.registration.azure.client-secret` | Contains the **Value** from your app registration key that you completed earlier. |
   | `azure.activedirectory.active-directory-groups` | Contains a list of Active Directory groups to use for authorization. |

   > [!NOTE]
   > 
   > For a full list of values that are available in your *application.properties* file, see  the [Azure Active Directory Spring Boot Sample][AAD Spring Boot Sample] on GitHub.
   >

1. Save and close the *application.properties* file.

1. Create a folder named *controller* in the Java source folder for your application; for example: *src/main/java/com/wingtiptoys/security/controller*.

1. Create a new Java file named *HelloController.java* in the *controller* folder and open it in a text editor.

1. Enter the following code, then save and close the file:

   ```java
   package com.wingtiptoys.security;

   import org.springframework.web.bind.annotation.RequestMapping;
   import org.springframework.web.bind.annotation.RestController;
   import org.springframework.beans.factory.annotation.Autowired;
   import org.springframework.security.access.prepost.PreAuthorize;
   import org.springframework.security.oauth2.client.OAuth2AuthorizedClient;
   import org.springframework.security.oauth2.client.authentication.OAuth2AuthenticationToken;
   import org.springframework.ui.Model;

   @RestController
   public class HelloController {
      @Autowired
      @PreAuthorize("hasRole('Users')")
      @RequestMapping("/")
      public String helloWorld() {
         return "Hello World!";
      }
   }
   ```
   > [!NOTE]
   > 
   > The group name that you specify for the `@PreAuthorize("hasRole('')")` method must contain one of the groups that you specified in the `azure.activedirectory.active-directory-groups` field of your *application.properties* file.
   >

   > [!NOTE]
   > 
   > You can specify different authorization settings for different request mappings; for example:
   >
   > ``` java
   > public class HelloController {
   >    @Autowired
   >    @PreAuthorize("hasRole('Users')")
   >    @RequestMapping("/")
   >    public String helloWorld() {
   >       return "Hello Users!";
   >    }
   >    @PreAuthorize("hasRole('Group1')")
   >    @RequestMapping("/Group1")
   >    public String groupOne() {
   >       return "Hello Group 1 Users!";
   >    }
   >    @PreAuthorize("hasRole('Group2')")
   >    @RequestMapping("/Group2")
   >    public String groupTwo() {
   >       return "Hello Group 2 Users!";
   >    }
   > }
   > ```
   >    

1. Create a folder named *security* in the Java source folder for your application; for example: *src/main/java/com/wingtiptoys/security/security*.

1. Create a new Java file named *WebSecurityConfig.java* in the *security* folder and open it in a text editor.

1. Enter the following code, then save and close the file:

    ```java
    package com.wingtiptoys.security;

    import org.springframework.beans.factory.annotation.Autowired;
    import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
    import org.springframework.security.config.annotation.web.builders.HttpSecurity;
    import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
    import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
    import org.springframework.security.oauth2.client.oidc.userinfo.OidcUserRequest;
    import org.springframework.security.oauth2.client.userinfo.OAuth2UserService;
    import org.springframework.security.oauth2.core.oidc.user.OidcUser;

    @EnableWebSecurity
    @EnableGlobalMethodSecurity(prePostEnabled = true)
    public class WebSecurityConfig extends WebSecurityConfigurerAdapter {
        @Autowired
        private OAuth2UserService<OidcUserRequest, OidcUser> oidcUserService;

        @Override
        protected void configure(HttpSecurity http) throws Exception {
            http
                .authorizeRequests()
                .anyRequest().authenticated()
                .and()
                .oauth2Login()
                .userInfoEndpoint()
                .oidcUserService(oidcUserService);
        }
    }
    ```

## Build and test your app

1. Open a command prompt and change directory to the folder where your app's *pom.xml* file is located.

1. Build your Spring Boot application with Maven and run it; for example:

   ```shell
   mvn clean package
   mvn spring-boot:run
   ```

   ![Build your application][build-application]

1. After your application is built and started by Maven, open <http://localhost:8080> in a web browser; you should be prompted for a user name and password.

   ![Logging into your application][application-login]

   > [!NOTE]
   > 
   > You may be prompted to change your password if this is the first login for a new user account.
   > 
   > ![Changing your password][update-password]
   > 

1. After you have logged in successfully, you should see the sample "Hello World" text from the controller.

   ![Successful login][hello-world]

   > [!NOTE]
   > 
   > User accounts which are not authorized will receive an **HTTP 403 Unauthorized** message.
   >

## Next steps

For more information about using Azure Active Directory, see the following articles:

* [Azure Active Directory Documentation].

For more information about using Spring Boot applications on Azure, see the following articles:

* [Deploy a Spring Boot Application to the Azure App Service](deploy-spring-boot-java-web-app-on-azure.md)

* [Running a Spring Boot Application on a Kubernetes Cluster in the Azure Container Service](deploy-spring-boot-java-app-on-kubernetes.md)

For more information about using Azure with Java, see the [Azure for Java Developers] and the [Java Tools for Visual Studio Team Services].

The **[Spring Framework]** is an open-source solution that helps Java developers create enterprise-level applications. One of the more-popular projects that is built on top of that platform is [Spring Boot], which provides a simplified approach for creating stand-alone Java applications. To help developers get started with Spring Boot, several sample Spring Boot packages are available at <https://github.com/spring-guides/>. In addition to choosing from the list of basic Spring Boot projects, the **[Spring Initializr]** helps developers get started with creating custom Spring Boot applications.

For a more-detailed sample, see the [Azure Active Directory Spring Boot Sample][AAD Spring Boot Sample] on GitHub.

<!-- URL List -->

[Azure Active Directory Documentation]: /azure/active-directory/
[AAD app manifest]: /azure/active-directory/develop/active-directory-application-manifest
[Get started with Azure AD]: /azure/active-directory/get-started-azure-ad
[Azure for Java Developers]: /java/azure/
[free Azure account]: https://azure.microsoft.com/pricing/free-trial/
[Java Tools for Visual Studio Team Services]: https://java.visualstudio.com/
[MSDN subscriber benefits]: https://azure.microsoft.com/pricing/member-offers/msdn-benefits-details/
[Spring Boot]: http://projects.spring.io/spring-boot/
[Spring Initializr]: https://start.spring.io/
[Spring Framework]: https://spring.io/
[AAD Spring Boot Sample]: https://github.com/Microsoft/azure-spring-boot/tree/master/azure-spring-boot-samples/azure-active-directory-spring-boot-backend-sample

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
[directory-13]: media/configure-spring-boot-starter-java-app-with-azure-active-directory/directory-13.png
[directory-14]: media/configure-spring-boot-starter-java-app-with-azure-active-directory/directory-14.png
[directory-15]: media/configure-spring-boot-starter-java-app-with-azure-active-directory/directory-15.png
[directory-16]: media/configure-spring-boot-starter-java-app-with-azure-active-directory/directory-16.png
[directory-17]: media/configure-spring-boot-starter-java-app-with-azure-active-directory/directory-17.png
[directory-18]: media/configure-spring-boot-starter-java-app-with-azure-active-directory/directory-18.png
[directory-19]: media/configure-spring-boot-starter-java-app-with-azure-active-directory/directory-19.png
[directory-20]: media/configure-spring-boot-starter-java-app-with-azure-active-directory/directory-20.png
[directory-21]: media/configure-spring-boot-starter-java-app-with-azure-active-directory/directory-21.png
[directory-22]: media/configure-spring-boot-starter-java-app-with-azure-active-directory/directory-22.png

[application-login]: media/configure-spring-boot-starter-java-app-with-azure-active-directory/application-login.png
[build-application]: media/configure-spring-boot-starter-java-app-with-azure-active-directory/build-application.png
[hello-world]: media/configure-spring-boot-starter-java-app-with-azure-active-directory/hello-world.png
[update-password]: media/configure-spring-boot-starter-java-app-with-azure-active-directory/update-password.png
