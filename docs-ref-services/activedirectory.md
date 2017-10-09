---
title: Azure Active Directory libraries for Java
description: Reference documentation for the Java client and management libraries Azure Active Directory
keywords: Azure, Java, SDK, API, SQL, authentication, AAD, Active Directory , Graph, OAuth 2.0
author: rloutlaw
ms.author: routlaw
manager: douge
ms.date: 07/11/2017
ms.topic: reference
ms.prod: azure
ms.technology: azure
ms.devlang: java
ms.service: active-directory
---

# Azure Active Directory libraries for Java

## Overview

Sign-on users and control access to applications and APIs with [Azure Active Directory](/azure/active-directory/active-directory-whatis).

To get started with Azure AD, see [Java web app sign-in and sign-out with Azure AD](/azure/active-directory/develop/active-directory-devquickstarts-webapp-java).

## Client library

Configure OAuth2, OpenID Connect, or Active Directory Graph authentication and [SAML 2.0](https://docs.microsoft.com/azure/active-directory/develop/active-directory-saml-protocol-reference) single-sign on with the [Azure Active Directory authentication library (ADAL) for Java](https://github.com/AzureAD/azure-activedirectory-library-for-java).

[Add a dependency](https://maven.apache.org/guides/getting-started/index.html#How_do_I_use_external_dependencies) to your Maven `pom.xml` file to use the client library in your project.

```XML
<dependency>
    <groupId>com.microsoft.azure</groupId>
    <artifactId>adal4j</artifactId>
    <version>1.2.0</version>
</dependency>
```   

### Example

Retrieve a JSON Web Token (JWT) for a user in your an Active Directory tenant using Azure Active Directory's [Graph API](https://docs.microsoft.com/azure/active-directory/develop/active-directory-graph-api). This token can then be used to authenticate the user with an application or API.

```java
ExecutorService service = Executors.newFixedThreadPool(1);
AuthenticationContext context = new AuthenticationContext(AUTHORITY, false, service);
Future<AuthenticationResult> future = context.acquireToken(
    "https://graph.windows.net", YOUR_TENANT_ID, username, password,
    null);
AuthenticationResult result = future.get();
System.out.println("Access Token - " + result.getAccessToken());
System.out.println("Refresh Token - " + result.getRefreshToken());
System.out.println("ID Token - " + result.getIdToken());
```

## Management API

Configure [role based access control](/azure/active-directory/role-based-access-control-what-is) and assign identities (such as users and [service principals](https://docs.microsoft.com/en-us/azure/active-directory/develop/active-directory-application-objects)) to those roles with the management API. 

[Add a dependency](https://maven.apache.org/guides/getting-started/index.html#How_do_I_use_external_dependencies) to your Maven `pom.xml` file to use the management API in your project.

```XML
<dependency>
    <groupId>com.microsoft.azure</groupId>
    <artifactId>azure-mgmt-graph-rbac</artifactId>
    <version>1.3.0</version>
</dependency>
```

### Example 

Create a new service principal and assign it the Contributor role.

```java
ServicePrincipal sp = Azure.servicePrincipals().define(spName)
    .withNewApplication("http://" + spName)
    .create();
RoleAssignment roleAssignment2 = authenticated.roleAssignments()
    .define("contribRoleAssignment")
    .forServicePrincipal(sp)
    .withBuiltInRole(BuiltInRole.CONTRIBUTOR)
    .withSubscriptionScope("862f67bc-d3ae-4243-bec7-3da6dca77717")
    .create();
```

> [!div class="nextstepaction"]
> [Explore the Management APIs](/java/api/overview/azure/activedirectory/managementapi)


## Samples

[Manage groups, users, and roles](https://github.com/Azure-Samples/aad-java-browse-graph-and-manage-roles)    
[Sign-in and sign-out users in a Java web app](https://github.com/Azure-Samples/active-directory-java-webapp-openidconnect)    
[Access an API with Azure AD using a command line app](https://github.com/Azure-Samples/active-directory-java-native-headless)   
[Call the Active AD Graph API from your Java web app](https://github.com/Azure-Samples/active-directory-java-graphapi-web/)  

Explore more [sample Java code for Azure AD](https://azure.microsoft.com/en-us/resources/samples/?term=active+directory&platform=java) you can use in your apps.