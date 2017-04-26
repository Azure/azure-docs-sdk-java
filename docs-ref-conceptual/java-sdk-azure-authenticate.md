---
title: Authenticate with the Azure Management libraries for Java
description: Authenticate with a service principal into the Azure Management libraries for Java
keywords: Azure, Java, SDK, API, Maven, Gradle, authentication, active directory, service principal
author: rloutlaw
ms.author: routlaw
manager: douge
ms.date: 04/16/2017
ms.topic: article
ms.prod: azure
ms.technology: azure
ms.devlang: java
ms.service: multiple
ms.assetid: 10f457e3-578b-4655-8cd1-51339226ee7d
---


# Authenticate with the Azure Management libraries for Java using a service principal

## File based authentication (Preview)

The simplest way to authenticate is to create a properties file that contains credentials for an [Azure service principal](https://docs.microsoft.com/azure/active-directory/develop/active-directory-application-objects). If you don't have a service principal created for your app yet, [create one now with the Azure CLI 2.0](/cli/azure/create-an-azure-service-principal-azure-cli).

```text
# sample management library properties file
subscription=########-####-####-####-############
client=########-####-####-####-############
key=XXXXXXXXXXXXXXXX
tenant=########-####-####-####-############
managementURI=https\://management.core.windows.net/
baseURL=https\://management.azure.com/
authURL=https\://login.windows.net/
graphURL=https\://graph.windows.net/
```

- subscription: use the *id* value from `az account show` in the Azure CLI 2.0.
- client: use the *appId* value from the output taken from a service principal created to run the application. If you don't have a service principal for your app, [create one with the Azure CLI 2.0](https://docs.microsoft.com/cli/azure/create-an-azure-service-principal-azure-cli).
- key: use the *password* value from the service principal output 
- tenant: use the *tenant* value from the service principal output

Save this file in a secure location on your system where your code can read it. Set an environment variable with the full path to the file in your shell:

```bash
AZURE_AUTH_LOCATION=/Users/raisa/azureauth.properties
```

Create the entry point `Azure` object to start working with the API:

```java
// pull in the location of the authenticaiton properties file from the environment 
final File credFile = new File(System.getenv("AZURE_AUTH_LOCATION"));

Azure azure = Azure
        .configure()
        .withLogLevel(LogLevel.NONE)
        .authenticate(credFile)
        .withDefaultSubscription();
```

## Create an ApplicationTokenCredentials object

Create an instance of `ApplicationTokenCredentials` to supply the service principal credentials to the top-level `Azure` object from inside your code.

```
import com.microsoft.azure.credentials.ApplicationTokenCredentials;
import com.microsoft.azure.AzureEnvironment;

...

ApplicationTokenCredentials credentials = new ApplicationTokenCredentials(client, tenant, key, AzureEnvironment.AZURE);
Azure azure = Azure
        .configure()
        .withLogLevel(LogLevel.NONE)
        .authenticate(credentials)
        .withDefaultSubscription();
```

The `client`, `tenant` and `key` are the same as the values used with file-based authentication. The `AzureEnvironment.AZURE` creates credentials against the Azure public cloud-change this to a different `AzureEnvironment` enum if you need to access another cloud (for example, `AzureEnvironment.AZURE_GERMANY`).  Read the `client`, `tenant`, and `key` values from environment variables or a secret management store like [Key Vault](/azure/key-vault/key-vault-whatis.md). Avoid setting these values as cleartext strings in your code to prevent a leak of the credentials through your version control history.



