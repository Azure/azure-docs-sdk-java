---
title: Azure Active directory libraries for Java
description: 
keywords: Azure, Java, SDK, API, SQL, authentication, AAD, Active Directory , JDBC
author: rloutlaw
ms.author: routlaw
manager: douge
ms.date: 05/17/2017
ms.topic: article
ms.prod: azure
ms.technology: azure
ms.devlang: java
ms.service: appservice
---

# Azure Active Directory libraries for Java

## Overview

Authenticate users and control access to your applications with Azure Active Directory.

## Import the libraries

Add a dependency to your Maven project's `pom.xml` file to use the libraries in your own project.

### Client 

```XML
<dependency>
    <groupId>com.microsoft.azure</groupId>
    <artifactId>adal4j</artifactId>
    <version>1.2.0</version>
</dependency>
```   

### Management

```XML
<dependency>
    <groupId>com.microsoft.azure</groupId>
    <artifactId>azure-mgmt-graph-rbac</artifactId>
    <version>1.0.0</version>
</dependency>
```

## Example

Retrieve A JSON Web Token for a user in your an Active Directory tenant using Azure Active Directory's [Graph API](https://docs.microsoft.com/azure/active-directory/develop/active-directory-graph-api). This token can then be used to authenticate the user with a web API or application.

```java
ExecutorService service = Executors.newFixedThreadPool(1);
AuthenticationContext context = ew AuthenticationContext(AUTHORITY, false, service);
Future<AuthenticationResult> future = context.acquireToken(
    "https://graph.windows.net", YOUR_TENANT_ID, username, password,
    null);
AuthenticationResult result = future.get();
System.out.println("Access Token - " + result.getAccessToken());
System.out.println("Refresh Token - " + result.getRefreshToken());
System.out.println("ID Token - " + result.getIdToken());
```

## Samples

| | |
|--|--|
| [Java web app sign-in and sign-out with Azure AD](https://docs.microsoft.com/azure/active-directory/develop/active-directory-devquickstarts-webapp-java) | Sign users in and out of your web apps with the ADAL4J library.
| [Access an API with Azure AD using a command line app](https://docs.microsoft.com/azure/active-directory/develop/active-directory-devquickstarts-headless-java) | Sign a user in from a command line app and use their credentials to access a web API using OAuth 2.0 | 
| [Access Active Directory Graph API from your Java app](https://azure.microsoft.com/resources/samples/active-directory-java-graphapi-web/) | Query user information from your Java web app using the Active Directory Graph API | 

Explore more [sample Java code](https://azure.microsoft.com/resources/samples/?platform=java) you can use in your apps.