---
title: Configure MicroProfile with Azure Key Vault
description: Learn how to inject secrets into a MicroProfile web service with Azure Key Vault
services: key-vault
documentationcenter: java
author: jonathangiles
manager: routlaw
editor: jonathangiles

ms.assetid:
ms.author: jogiles
ms.date: 09/07/2018
ms.devlang: java
ms.service: key-vault
ms.tgt_pltfrm: multiple
ms.topic: article
ms.workload: web
---

# Configure MicroProfile with Azure Key Vault

This tutorial will demonstrate how to configure a [MicroProfile](http://microprofile.io) application to retrieve secrets from [Azure Key Vault](https://azure.microsoft.com/services/key-vault/). In the process, you use the [MicroProfile Config APIs](https://microprofile.io/project/eclipse/microprofile-config) to create a direct connection to Azure Key Vault. As a developer, by using the MicroProfile Config APIs, you benefit from a standard API for retrieving and injecting configuration data into their microservices.

Before you start, take a quick look at what a combination of Azure Key Vault and the MicroProfile Config API enables you to write in your code. The following code snippet is of a field in a class that's annotated with `@Inject` and `@ConfigProperty`. The *name* that's specified in the annotation is the name of the property to look up in Azure Key Vault, and the *defaultValue* is what will be set if the key is not discovered. The result is that the value that's stored in Azure Key Vault, or the default value, is injected automatically into the field at runtime. This action can simplify your life, because you no longer need to pass values around in constructors and setter methods. Instead, MicroProfile handles this task.

```java
@Inject
@ConfigProperty(name = "key-name", defaultValue = "Unknown")
String keyValue;
```

To request secrets, as necessary, you can also access the MicroProfile config directly. For example:

```java
public class DemoClass {
    @Inject
    Config config;

    public void method() {
        System.out.println("Hello: " + config.getValue("key-name", String.class));
    }
}
```

This sample code uses [Payara Micro](https://www.payara.fish/payara_micro) and [MicroProfile](https://microprofile.io/) to create a tiny Java web application requirement (WAR) file that you can run locally on your machine. It doesn't demonstrate how to Dockerize or push the code to Azure, but the links section at the end of this tutorial has links to other useful tutorials that explain this.

The sample uses a free and open source library that creates a config source (using the MicroProfile Config API) for Azure Key Vault. To learn more about this library and review the code, see the [project GitHub page](https://github.com/Azure/azure-microprofile/tree/master/microprofile-config-keyvault). If you use the library, the code in this tutorial can simply focus on the configuration of the library and then injecting keys into your code, and you don't need to write any Azure-specific code.

To run this code on your local machine, starting with creating an Azure Key Vault resource, follow the instructions in the next sections.

## Create an Azure Key Vault resource

In this section, you use the Azure CLI to create the Azure Key Vault resource and populate it with one secret.

1. Create an Azure service principal. This step gives you the client ID and key that you need to access Key Vault:

    ```bash
    az login
    az account set --subscription <subscription_id>

    az ad sp create-for-rbac --name <service_principal_name>
    ```

    Let's use *microprofile-keyvault-service-principal* to replace *\<service_principal_name>* in the preceding step. The response from Azure would be similar to the following:

    ```json
    {
      "appId": "5292398e-XXXX-40ce-XXXX-d49fXXXX9e79",
      "displayName": "microprofile-keyvault-service-principal",
      "name": "http://microprofile-keyvault-service-principal",
      "password": "9b217777-XXXX-4954-XXXX-deafXXXX790a",
      "tenant": "72f988bf-XXXX-41af-XXXX-2d7cd011db47"
    }
    ```

    Of particular note here are the *appId* and *password* values. You'll use them later in this article as *client ID* and *key*.

1. (Optional) Now that you've created a service principal, you can create a resource group. If you already have a resource group that you want to use, you can skip this step. To get a list of resource group locations, you can call `az account list-locations` and use the *name* value from that list to specify where the resource group should be created.

    ```bash
    # In this tutorial, "westus" is the resource group location
    # and "jg-test" is the resource group name.
    az group create -l <resource_group_location> -n <resource_group_name>
    ```

1. Create an Azure Key Vault resource. You'll use the Key Vault name to refer to the key vault later, so be sure to choose a memorable name.

    ```bash
    az keyvault create --name <your_keyvault_name>            \
                      --resource-group <your_resource_group> \
                      --location <location>                  \
                      --enabled-for-deployment true          \
                      --enabled-for-disk-encryption true     \
                      --enabled-for-template-deployment true \
                      --sku standard
    ```

1. Grant the appropriate permissions to the service principal that you created earlier, so that it can access the Key Vault secrets. The appId value in the following code is the *appId* value from step 1, where you created the service principal. That is, the *appId* in step 1 was *5292398e-XXXX-40ce-XXXX-d49fXXXX9e79*, but you should use the value from your own terminal output.

    ```bash
    az keyvault set-policy --name <your_keyvault_name>   \
                          --secret-permission get list  \
                          --spn <your_sp_appId_created_in_step1>
    ```

1. Now you can push a secret into Key Vault. Use the key name *demo-key*, and set the value of the key to *demo-value*:

```bash
az keyvault secret set --name demo-key      \
                       --value demo-value   \
                       --vault-name <your_keyvault_name>  
```

That's it! You now have Key Vault running in Azure with a single secret. You can now clone this repo and configure it to use this resource in your app.

## Get up and running locally

This example is based on a sample application that's available on GitHub, so you'll clone that application and then step through the code. 

1. Clone the code onto your machine by entering the following commands:

    `git clone https://github.com/Azure-Samples/microprofile-configsource-keyvault.git`

    `cd microprofile-configsource-keyvault`

1. Go to *src/main/resources/META-INF/microprofile-config.properties*, and then change the properties in the *microprofile-config.properties* file by using the values from the previous steps.

1. Try running the server by using `mvn clean package payara-micro:start`.

1. Try accessing [http://localhost:8080/keyvault-configsource/api/config](http://localhost:8080/keyvault-configsource/api/config) in your web browser. You should see a simple response that demonstrates values that are being read from Azure Key Vault.

## Summary

This sample application combines the MicroProfile Config API, Azure Key Vault, and the free and open source [microprofile-config-keyvault](https://github.com/Azure/azure-microprofile/tree/master/microprofile-config-keyvault) library to enable easy injection of configuration data and secrets into your MicroProfile web services.
