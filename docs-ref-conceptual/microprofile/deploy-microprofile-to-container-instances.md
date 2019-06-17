---
title: Deploy a MicroProfile app to the cloud by using Docker and Azure
description: Learn how to deploy a MicroProfile app to the cloud by using Docker and Azure Container Instances.
services: container-instances;container-registry
documentationcenter: java
author: brunoborges
manager: routlaw
editor: brunoborges
ms.assetid:
ms.author: brborges
ms.date: 11/21/2018
ms.devlang: java
ms.service: container-instances
ms.tgt_pltfrm: multiple
ms.topic: article
ms.workload: web
---

# Deploy a MicroProfile app to the cloud by using Docker and Azure

This article demonstrates how to pack a [MicroProfile.io] application in a Docker container and run it on Azure Container Instances.

> [!NOTE]
> This procedure works with any implementation of MicroProfile.io, as long as the Docker container image is self-executable (that is, the image includes the runtime).

## Prerequisites

To complete this tutorial, you need the following prerequisites:

* An Azure subscription. If you don't already have an Azure subscription, you can sign up for a [free Azure account].
* The [Azure CLI], installed.
* A supported Java Development Kit (JDK). For more information about the JDKs that are available to use when you develop on Azure, see [Java long-term support for Azure and Azure Stack](https://aka.ms/azure-jdks).
* The [Apache Maven] build tool (version 3 or later).
* A [Git] client.

## MicroProfile Hello Azure sample

In this article, you use the [MicroProfile Hello Azure](https://github.com/azure-samples/microprofile-hello-azure) sample.

Clone, build, and run it locally by using the following commands:

```bash
$ git clone https://github.com/Azure-Samples/microprofile-hello-azure.git
$ mvn clean package
...
[INFO] BUILD SUCCESS
...
$ mvn payara-micro:start
...
[2018-07-30T13:34:51.553-0700] [] [INFO] [] [PayaraMicro] [tid: _ThreadID=1 _ThreadName=main] [timeMillis: 1532982891553] [levelValue: 800] Payara Micro  5.182 #badassmicrofish (build 303) ready in 10,304 (ms)
...
```

You can test the application by calling `curl` or by using a [browser](http://localhost:8080/api/hello):

```bash
$ curl http://localhost:8080/api/hello
Hello, Azure!
```

## Deploy the app to Azure

Now bring this application to Azure by using the [Azure Container Instances] and [Azure Container Registry] services.

### Build a Docker image

The sample project provides a Dockerfile that you can use. You don't need to have Docker installed, though, because you'll use the Azure Container Registry Build feature to build the image in the cloud.

To build the image and prepare to run it on Azure, do the following:

1. Install and sign in to the Azure CLI.
1. Create an Azure resource group.
1. Create an Azure container registry instance.
1. Build a Docker image.
1. Publish the Docker image to the previously created container registry instance.
1. (Optional) Build and publish the image to the container registry instance in one command.


#### Set up the Azure CLI

Make sure that you have an Azure subscription, that you've installed [the Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli?view=azure-cli-latest), and that you're authenticated to your account:

```bash
az login
```

#### Create a resource group

```bash
export ARG=microprofileRG
export ADCL=eastus
az group create --name $ARG --location $ADCL
```

#### Create a container registry instance

This command should create a globally unique container registry instance with a basic name and a random number.

```bash
export RANDINT=`date +"%m%d%y$RANDOM"`
export ACR=mydockerrepo$RANDINT
az acr create --name $ACR -g $ARG --sku Basic --admin-enabled
```

#### Build the Docker image

Although you can easily build the Docker image locally by using Docker itself, you might consider building it in the cloud for few reasons:

* You don't have to install Docker locally.
* It's much faster, because the build happens elsewhere (except for context upload time).
* The process in the cloud has faster access to the internet and, therefore, faster downloads.
* The image goes directly into the container registry instance.

For these reasons, you build the image by using the [Azure Container Registry Build] feature:

```bash
export IMG_NAME="mympapp:latest"
az acr build -r $ACR -t $IMG_NAME -g $ARG .
...
Build complete
Build ID: aa1 was successful after 1m2.674577892s
```

#### Deploy the Docker image from the Azure container registry instance to Container Instances

Now that the image is available on your container registry instance, push and instantiate a container instance on Container Instances. But first, make sure that you can authenticate into the container registry instance:

```bash
export ACR_REPO=`az acr show --name $ACR -g $ARG --query loginServer -o tsv`
export ACR_PASS=`az acr credential show --name $ACR -g $ARG --query "passwords[0].value" -o tsv`
export ACI_INSTANCE=myapp`date +"%m%d%y$RANDOM"`

az container create --resource-group $ARG --name $ACR --image $ACR_REPO/$IMG_NAME --cpu 1 --memory 1 --registry-login-server $ACR_REPO --registry-username $ACR --registry-password $ACR_PASS --dns-name-label $ACI_INSTANCE --ports 8080
```

#### Test your deployed MicroProfile application

Your application should now be up and running. To test it from the command-line, try the following command:

```bash
curl http://$ACI_INSTANCE.$ADCL.azurecontainer.io:8080/api/hello
````

Congratulations! You've successfully built a MicroProfile application as a Docker container and deployed it to Azure.

## Next steps

For more information about the various technologies discussed in this article, see the following articles:

* [Sign in to Azure from the Azure CLI](/azure/xplat-cli-connect)

<!-- URL List -->

[Azure Container Registry Build]: https://docs.microsoft.com/azure/container-registry/container-registry-build-overview
[MicroProfile.io]: https://microprofile.io
[Azure CLI]: /cli/azure/overview
[Azure for Java Developers]: https://docs.microsoft.com/java/azure/
[Azure portal]: https://portal.azure.com/
[free Azure account]: https://azure.microsoft.com/pricing/free-trial/
[Git]: https://github.com/
[Apache Maven]: http://maven.apache.org/
[Java Development Kit (JDK)]: https://aka.ms/azure-jdks
<!-- http://www.oracle.com/technetwork/java/javase/downloads/ -->
[Azure Container Instances]: https://docs.microsoft.com/azure/container-instances/
[Azure Container Registry]:  https://docs.microsoft.com/azure/container-registry