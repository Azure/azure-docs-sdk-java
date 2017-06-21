---
title: Azure Active Directory libraries for Java
description: Reference documentation for the Java client and management libraries Azure Active Directory
keywords: Azure, Java, SDK, API, SQL, authentication, AAD, Active Directory , Graph, OAuth 2.0
author: rloutlaw
ms.author: routlaw
manager: douge
ms.date: 05/17/2017
ms.topic: article
ms.prod: azure
ms.technology: azure
ms.devlang: java
ms.service: active-directory
---

# Azure Active Directory libraries for Java

## Overview

Sign-on users to web apps and control access to API and applications with Azure Active Directory. The [Azure Active Directory authentication library (ADAL) for Java](https://github.com/AzureAD/azure-activedirectory-library-for-java) provides a Java interface to set up OAuth2, OpenID Connect, and Active Directory Graph API authentication flows and provides support for single sign-on with [SAML 2.0](https://docs.microsoft.com/azure/active-directory/develop/active-directory-saml-protocol-reference).

The management libraries provide an interface to configure [role based access control](https://docs.microsoft.com/azure/active-directory/role-based-access-control-what-is) and assign identities (such as users and [service principals](https://docs.microsoft.com/en-us/azure/active-directory/develop/active-directory-application-objects)) to those roles.

- [Client library](http://javadoc.io/doc/com.microsoft.azure/adal4j/1.2.0)
- [Management API](https://docs.microsoft.com/java/api/overview/azure/activedirectory/managementapi)

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

Retrieve a JSON Web Token for a user in your an Active Directory tenant using Azure Active Directory's [Graph API](https://docs.microsoft.com/azure/active-directory/develop/active-directory-graph-api). This token can then be used to authenticate the user with a web API or application.

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