---
title: Deploy a sample Spring Boot web app to Azure Container Service using the Fabric8 Maven Plugin
description: Learn how to use the Fabric8 Maven Plugin to deploy a containerized Spring Boot web app to Azure Container Service.
services: cosmos-db
documentationcenter: java
author: rmcmurray
manager: routlaw
editor: ''

ms.assetid:
ms.service: multiple
ms.workload: data-services
ms.tgt_pltfrm: na
ms.devlang: java
ms.topic: article
ms.date: 11/01/2017
ms.author: yuwzho;robmcm
---

# Deploy a containerized Spring Boot web app using a Cosmos DB database to App Service Linux using IntelliJ

This article will show you how to clone a sample Spring Boot application that uses Cosmos DB for data and deploy it to Azure Container Service using the Fabric8 Maven Plugin.

When you complete the steps in this tutorial you will have a simple todo list running in Azure.

![Using the web app remotely](media/s5-deploy-spring-boot-app-to-azure-container-service-using-fabric8-maven/using-remote-app.png)

## Prerequisites

In order to complete the steps in this tutorial, you need to have the following prerequisites:

* An Azure subscription; if you don't already have an Azure subscription, you can activate your [MSDN subscriber benefits](https://azure.microsoft.com/pricing/member-offers/msdn-benefits-details/) or sign up for a [free Azure account](https://azure.microsoft.com/pricing/free-trial/).
* The [Azure Command-Line Interface (CLI)](http://docs.microsoft.com/cli/azure/overview).
* An up-to-date [Java Development Kit (JDK)](http://www.oracle.com/technetwork/java/javase/downloads/), version 1.7 or later.
* Apache's [Maven](http://maven.apache.org/) build tool (Version 3).
* A [Git](https://github.com/) client.
* A [Docker](https://www.docker.com/) client.

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
       "tenantId": "22222222-2222-2222-2222-222222222222",
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

## Create an Azure Kubernetes cluster

1. Create a resource group for the Azure resources you will use in this article; for example:
   ```azurecli
   az group create --name=wingtiptoysresources --location=westus
   ```
   Where:
   Parameter | Description
   ---|---|---
   `name` | Specifies a unique name for your resource group.
   `location` | Specifies the [Azure region](https://azure.microsoft.com/regions/) where your resource group will be hosted.

1. Create a Kubernetes cluster in the resource group for your Spring Boot app; for example:
   ```azurecli
   az acs create --orchestrator-type kubernetes --resource-group wingtiptoysresources --name wingtiptoyscluster --generate-ssh-keys
   ```
   Where:
   Parameter | Description
   ---|---|---
   `orchestrator-type` | In this example, specifies a Kubernetes cluster.
   `resource-group` | Specifies the name of the resource group you created that you created previous steps.
   `name` | Specifies a unique name for your Kubernetes cluster.
   Azure will return with a long JSON string which will contain the provisioning state; for example:
   ```json
   {
     "id": "/subscriptions/11111111-1111-1111-1111-111111111111/...",
     "name": "azurecli12345678.12345678",
     "properties": {
       ...
       ...
       ...
       "provisioningState": "Succeeded",
       "template": null,
       "templateLink": null,
       "timestamp": "2017-11-01T01:01:01.000000+00:00"
     },
     "resourceGroup": "wingtiptoysresources"
   }
   ```

1. Download your Kubernetes credentials to your profile folder; the Fabric8 Maven Plugin and kubectl will use this information file to interact with your Kubernetes cluster.
   ```azurecli
   az acs kubernetes get-credentials --resource-group wingtiptoysresources --name wingtiptoyscluster
   ```
   Where:
   Parameter | Description
   ---|---|---
   `resource-group` | Specifies the name of the resource group that you created previous steps.
   `name` | Specifies the name of the Kubernetes cluster that you created previous steps.
   Azure should return a status message which details the path where your credentials were stored; for example:
   ```
   Merged "wingtiptoy-wingtiptoysresou-000000mgmt" as current context in /home/robert/.kube/config
   ```

1. Retrieve the password for the container registry you just created; for example:
   ```azurecli
   az acr credential show --name wingtiptoysregistry --query passwords[0]
   ```
   Azure will respond with your password; for example:
   ```json
   {
      "name": "password",
      "value": "AbCdEfGhIjKlMnOpQrStUvWxYz"
   }
   ```

## Create an Azure container registry

1. Create a resource group for the Azure resources you will use in this article; for example:
   ```azurecli
   az group create --name=wingtiptoysresources --location=westus
   ```
   Where:
   Parameter | Description
   ---|---|---
   `name` | Specifies a unique name for your resource group.
   `location` | Specifies the [Azure region](https://azure.microsoft.com/regions/) where your resource group will be hosted.

1. Create a private Azure container registry in the resource group for your Spring Boot app; for example:
   ```azurecli
   az acr create --admin-enabled --resource-group wingtiptoysresources --location westus --name wingtiptoysregistry --sku Basic
   ```
   Where:
   Parameter | Description
   ---|---|---
   `resource-group` | Specifies the name of the resource group you created in the previous step.
   `name` | Specifies a unique name for your container registry.
   `location` | Specifies the [Azure region](https://azure.microsoft.com/regions/) where your container registry will be hosted.
   `sku` | Specifies one of the following: `Classic`, `Basic`, `Standard`, `Premium`.

1. Retrieve the password for the container registry you just created; for example:
   ```azurecli
   az acr credential show --name wingtiptoysregistry --query passwords[0]
   ```
   Azure will respond with your password; for example:
   ```json
   {
      "name": "password",
      "value": "AbCdEfGhIjKlMnOpQrStUvWxYz"
   }
   ```

## Create a Cosmos DB documentDB

1. Create a new Cosmos DB in the resource group you created in the previous section; for example:

   ```azurecli
   az cosmosdb create --kind GlobalDocumentDB --resource-group wingtiptoysresources --name wingtiptoysdata
   ```
   Where:
   Parameter | Description
   ---|---|---
   `GlobalDocumentDB` | Specifies that you want to use DocumentDB.
   `resource-group` | Specifies the name of the resource group you created earlier.
   `name` | Specifies a unique name for your Cosmos DB.
   Azure will respond with a status message that contains the `documentEndpoint` which you will use later:
   ```json
   {
     "consistencyPolicy": {
       "defaultConsistencyLevel": "Session",
       "maxIntervalInSeconds": 5,
       "maxStalenessPrefix": 100
     },
     "databaseAccountOfferType": "Standard",
     "documentEndpoint": "https://wingtiptoysdata.documents.azure.com:443/",
     "enableAutomaticFailover": false,
     "failoverPolicies": [
          {
         "failoverPriority": 0,
         "id": "wingtiptoysdata-westus",
         "locationName": "West US"
       }
     ],
     ...
     ...
     ...
   }
   ```

1. Retrieve the key for the Cosmos DB you just created; for example:

   ```azurecli
   az cosmosdb list-keys --resource-group wingtiptoysresources --name wingtiptoysdata
   ```
   Where:
   Parameter | Description
   ---|---|---
   `resource-group` | Specifies the name of the resource group.
   `name` | Specifies the name for your Cosmos DB you just created.
   Azure will respond with a status message that contains the keys which you will use later:
   ```json
   {
     "primaryMasterKey": "AbCdEfGhIjKlMnOpQrStUvWxYz==",
     "primaryReadonlyMasterKey": "AbCdEfGhIjKlMnOpQrStUvWxYz==",
     "secondaryMasterKey": "AbCdEfGhIjKlMnOpQrStUvWxYz==",
     "secondaryReadonlyMasterKey": "AbCdEfGhIjKlMnOpQrStUvWxYz=="
   }
   ```

## Clone and configure the TODO sample application

1. Open a command prompt or terminal window and create a local directory to hold your Spring Boot application, and change to that directory; for example:
   ```shell
   md C:\SpringBoot
   cd C:\SpringBoot
   ```
   -- or --
   ```shell
   mkdir /home/robert/SpringBoot
   cd /home/robert/SpringBoot
   ```

1. Clone the [Spring Boot on Docker Getting Started] sample project into the directory you created; for example:
   ```shell
   git clone https://github.com/Microsoft/todo-app-java-on-azure/
   ```

1. Open your Maven *settings.xml* file in a text editor; this file might be in a path like the following examples:

   - `/etc/maven/settings.xml`
   - `%ProgramFiles%\apache-maven\3.5.0\conf\settings.xml`
   - `$HOME/.m2/settings.xml`

1. Add your Azure Container Registry access settings from the previous section of this article to the `<servers>` collection in the *settings.xml* file; for example:

   ```xml
   <servers>
     <server>
       <id>wingtiptoysregistry.azurecr.io</id>
       <username>wingtiptoysregistry</username>
       <password>AbCdEfGhIjKlMnOpQrStUvWxYz</password>
       <configuration>
         <email>contoso@microsoft.com</email>
       </configuration>
     </server>
   </servers>
   ```
   Where:
   Element | Description
   ---|---|---
   `<id>` | Specifies the URL of your private Azure container registry, which is derived by appending ".azurecr.io" to the name of your private container registry.
   `<username>` | Specifies the name of your private Azure container registry.
   `<password>` | Specifies the password you retrieved the previous steps of this article.

1. Save and close the *settings.xml* file. 

1. Navigate to the project directory for the sample Spring Boot application, (e.g. "*C:\SpringBoot\todo-app-java-on-azure*" or "*/home/robert/SpringBoot/todo-app-java-on-azure*")

1. Open the *pom.xml* file with a text editor. 

1. Update the `<properties>` collection in the *pom.xml* file with the login server value for your Azure Container Registry from the previous section of this tutorial; for example:

   ```xml
   <properties>
      ...
      <docker.image.prefix>wingtiptoysregistry.azurecr.io</docker.image.prefix>
      <azure.app.name>todo-app-${maven.build.timestamp}</azure.app.name>
      ...
   </properties>
   ```
   Where:
   Element | Description
   ---|---|---
   `<docker.image.prefix>` | Specifies the URL of your private Azure container registry, which is derived by appending ".azurecr.io" to the name of your private container registry.
   `<azure.app.name>` | Specifies an optional name for your web app, which in this example uses the build timestamp differentiate between app versions.

1. Save and close the *pom.xml* file. 

1. Navigate to the directory that contains the project's *application.properties* file,  (e.g. "*C:\SpringBoot\todo-app-java-on-azure\src\main\resources*" or "*/home/robert/SpringBoot/todo-app-java-on-azure/src/main/resources*")

1. Open the *application.properties* file with a text editor. 

1. Update the properties with the appropriate values for your Cosmos DB from previous steps; for example:
   ```yaml
   azure.documentdb.uri=https://wingtiptoysdata.documents.azure.com:443/
   azure.documentdb.key=AbCdEfGhIjKlMnOpQrStUvWxYz==
   azure.documentdb.database=wingtiptoysdata
   ```
   Where:
   Property | Description
   ---|---|---
   `azure.documentdb.uri` | Specifies the URL of your Cosmos DB, which is derived by appending ".documents.azure.com:443" to the name of your private container registry.
   `azure.documentdb.key | Specifies the key for your Cosmos DB (which you retrieved in earlier steps).
   `azure.documentdb.database` | Specifies the name for your Cosmos DB.

1. Save and close the *application.properties* file. 

1. Create a new directory named *fabric8* under the project's *main* folder,  (e.g. "*C:\SpringBoot\todo-app-java-on-azure\src\main\fabric8*" or "*/home/robert/SpringBoot/todo-app-java-on-azure/src/main/fabric8*")

   a. Create a new file named *deployment.yml* in a text editor with the following contents, and save it to your project's new *fabric8* folder:
      ```yaml
      apiVersion: extensions/v1beta1
      kind: Deployment
      metadata:
        name: ${project.artifactId}
        labels:
          run: spring
      spec:
        replicas: 1
        selector:
          matchLabels:
            run: spring
        strategy:
          rollingUpdate:
            maxSurge: 1
            maxUnavailable: 1
          type: RollingUpdate
        template:
          metadata:
            labels:
              run: spring
          spec:
            containers:
            - image: ${docker.image.prefix}/${project.artifactId}:${project.version}
              name: spring
              ports:
              - containerPort: 8080
            imagePullPolicy: Always
            imagePullSecrets:
              - name: mydockerkey
      ```

   b. Create a new file named *service.yml* in a text editor with the following contents and save in the *fabric8* folder:
      ```yaml
      apiVersion: v1
      kind: Service
      metadata:
        name: ${project.artifactId}
        labels:
          expose: "true"
      spec:
        ports:
        - port: 80
          targetPort: 8080
        type: LoadBalancer
        ```

   c. Create a new file named *secrets.yml* in a text editor with the following contents and save in the *fabric8* folder:
      ```yaml
      apiVersion: v1
      kind: Secret
      metadata:
        name: mydockerkey
        namespace: default
        annotations:
          maven.fabric8.io/dockerServerId: ${docker.image.prefix}
      type: kubernetes.io/dockercfg
      ```

## Build the Docker image and deploy it to Azure

1. Build the sample project and create a docker container image, then push the image to your Azure container registry.
   ```shell
   mvn clean package docker:build docker:push
   ```

   > [!NOTE]
   >
   > You may see an error message similar to the following when you attempt to deploy your Docker image:
   >
   > `[INFO] Building image wingtiptoysregistry.azurecr.io/todo-app-java-on-azure`
   > `[INFO] ------------------------------------------------------------------------`
   > `[INFO] BUILD FAILURE`
   > `[INFO] ------------------------------------------------------------------------`
   > `[INFO] Total time: 12.069s`
   > `[INFO] Finished at: Sat Nov 11 21:12:00 GMT 2017`
   > `[INFO] Final Memory: 14M/107M`
   > `[INFO] ------------------------------------------------------------------------`
   > `[ERROR] Failed to execute goal com.spotify:docker-maven-plugin:0.4.11:build (de`
   > `fault-cli) on project todo-app-java-on-azure: Exception caught: java.util.concu`
   > `rrent.ExecutionException: com.spotify.docker.client.shaded.javax.ws.rs.Processi`
   > `ngException: org.apache.http.conn.HttpHostConnectException: Connect to 192.168.`
   > `0.50:2375 [/192.168.0.50] failed: Connection refused (connect failed) -> [Help 1]`
   >
   > If this happens, you should try setting your DOCKER_HOST environment variable to localhost; for example:
   >
   > `export DOCKER_HOST=tcp://127.0.0.1:2375`
   >

1. Deploy your docker image to your Kubernetes cluster.
   ```shell
   mvn fabric8:resource fabric8:apply
   ```

   > [!NOTE]
   >
   > You may see an error message similar to the following when you attempt to deploy your Docker image to your Kubernetes cluster:
   >
   > `[INFO] ------------------------------------------------------------------------`
   > `[INFO] BUILD FAILURE`
   > `[INFO] ------------------------------------------------------------------------`
   > `[INFO] Total time: 2.011s`
   > `[INFO] Finished at: Sat Nov 11 12:34:56 GMT 2017`
   > `[INFO] Final Memory: 27M/330M`
   > `[INFO] ------------------------------------------------------------------------`
   > `[ERROR] Failed to execute goal io.fabric8:fabric8-maven-plugin:3.1.37:resource`
   > `(fmp) on project client: Execution fmp of goal io.fabric8:fabric8-maven-plugin:`
   > `3.1.37:resource failed: Unable to load the mojo 'resource' (or one of its requi`
   > `red components) from the plugin 'io.fabric8:fabric8-maven-plugin:3.1.37': com.g`
   > `oogle.inject.ProvisionException: Guice provision errors:`
   > `[ERROR] `
   > `[ERROR] 1) No implementation for io.fabric8.maven.core.util.GoalFinder was boun`
   > `d. while locating io.fabric8.maven.plugin.ResourceMojo at ClassRealm[plugin>io.`
   > `fabric8:fabric8-maven-plugin:3.1.37, parent: sun.misc.Launcher$AppClassLoader@3`
   > `479404a] while locating org.apache.maven.plugin.Mojo annotated with @com.google`
   > `.inject.name.Named(value=io.fabric8:fabric8-maven-plugin:3.1.37:resource)`
   > `[ERROR] `
   > `[ERROR] 1 error`
   > `[ERROR] role: org.apache.maven.plugin.Mojo`
   > `[ERROR] roleHint: io.fabric8:fabric8-maven-plugin:3.1.37:resource`
   > `[ERROR] -> [Help 1]`
   >
   > If this happens, your Maven installation may be mismatched with your version of the Fabric8 Maven Plugin. To resolve the issue, you chould try upgrading your Maven installation.
   >

## Test the TODO sample application remotely

1. Allow a few minutes for the cluster to deploy, then retrieve the external IP address of your cluster.
   ```shell
   kubectl get svc -w
   ```
   Once your cluster has deployed successfully, your public IP address will visible in the EXTERNAL-IP column; for example:
   ```
   NAME                     TYPE           CLUSTER-IP   EXTERNAL-IP    PORT(S)        AGE
   kubernetes               ClusterIP      10.0.0.1     <none>         443/TCP        2h
   todo-app-java-on-azure   LoadBalancer   10.0.81.67   13.14.15.16    80:30993/TCP   4m
   ```

1. Browse to your web app's public IP address using a web browser; you should see same the home page for the sample app displayed.

   ![Browsing to the web app remotely](media/s5-deploy-spring-boot-app-to-azure-container-service-using-fabric8-maven/browse-remote-app.png)

1. If you click on the **Todo List** link, you can Add/Edit/Remove entries from the todo list.

   ![Using the web app remotely](media/s5-deploy-spring-boot-app-to-azure-container-service-using-fabric8-maven/using-remote-app.png)

## OPTIONAL: Remove your resources from your Azure account

You can delete the resource group that contains all of resources which were created in this tutorial by using the Azure CLI:

   ```azurecli
   az group delete -y --no-wait --name wingtiptoysresources
   ```

## Next steps

For more information about the various technologies discussed in this article, see the following articles:

* [Maven Plugin for Azure Web Apps](https://github.com/Microsoft/azure-maven-plugins/tree/master/azure-webapp-maven-plugin)

* [Log in to Azure from the Azure CLI](https://docs.microsoft.com/azure/xplat-cli-connect)

* [Maven Settings Reference](https://maven.apache.org/settings.html)

* [Docker plugin for Maven](https://github.com/spotify/docker-maven-plugin)

* [NoSQL tutorial: Build a DocumentDB API Java console application](https://docs.microsoft.com/en-us/azure/cosmos-db/documentdb-java-get-started)
