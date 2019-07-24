---
title: CI/CD for MicroProfile apps using Azure Pipelines
description: Learn how to set up a CI/CD release cycle to deploy a MicroProfile app to an Azure Web App for Containers instance with Azure Pipelines.
services: Azure DevOps
documentationcenter: MicroProfile
author: ruyakubu
manager: brunoborges
editor: ruyakubu

ms.assetid:
ms.author: ruyakubu
ms.date: 07/23/2019
ms.devlang: Java
ms.service: Azure DevOps
ms.tgt_pltfrm: multiple
ms.topic: tutorial
ms.workload: web
---

# CI/CD for MicroProfile apps using Azure Pipelines

This tutorial shows you how to easily set up an Azure Pipelines continuous integration and continuous deployment (CI/CD) release cycle to deploy your [MicroProfile](http://microprofile.io) Java EE application to an Azure Web App for Containers. The MicroProfile app in this tutorial uses a [Payara Micro](https://www.payara.fish/payara_micro) base image. 

```Dockerfile
FROM payara/micro:5.182
COPY target/*.war $DEPLOY_DIR/ROOT.war
EXPOSE 8080
```
You start the Azure Pipelines containerize process by building a Docker image and pushing the container image to an Azure Container Registry. You complete the process by creating an Azure Pipelines release pipeline and deploying the container image to a web app.

## Prerequisites
- Copy and save the clone URL from [GitHub](https://github.com/Azure-Samples/microprofile-hello-azure)
- Register or log into your [Azure DevOps](https://dev.azure.com) account
- Create a new [Azure DevOps project](/vsts/organizations/projects/create-project) and use the Git clone URL to **Import a repository**
- Create an [Azure Container Registry](https://azure.microsoft.com/services/container-registry) (ACR) in Azure
- Create an Azure Web App for Containers 
  
  > [!NOTE]
  > Select **Quickstart** in the **Container Settings** when provisioning the web app instance.

## Create a build pipeline

The build pipeline in Azure Pipelines automatically executes all the build tasks each time there's a commit in in the Java EE source app. In this example, Azure Pipelines uses Maven to build the Java MicroProfile project.

1. On your Azure DevOps project page, select **Azure Pipelines** > **Builds** in the left navigation. 
   
   ![Select Builds](media/cicd-microprofile/builds.png)
   
1. Select **New Pipeline**.
   
1. Select **Maven** from the list of templates, and then select **Apply**.
   
1. In the left pane, select **Agent job 1**. In the right pane, select **Hosted Ubuntu 1604** from the **Agent pool** dropdown.
   
   > [!NOTE]
   > This setting lets Azure Pipelines know which build server to use.  You can also use your private customized build server.
   
1. To configure your build for continuous integration, select the **Triggers** tab, and then select the checkbox next to **Enable continuous integration**.  
   
   ![Enable continuous integration](media/cicd-microprofile/continuous-integration.png)
   
1. Select the **Tasks** tab to return to the main build pipeline page.
   
1. Select the dropdown next to **Save & queue**, and select **Save**. 

## Create a Docker build image

Azure Pipelines uses a Dockerfile with a base image from Payara Micro to create a Docker image.  

1. On the **Tasks** tab, select the **+** next to **Agent job 1** to add a task.
   
   ![Add a new task](media/cicd-microprofile/add-task.png)
   
1. In the right pane, select **Docker** from the list of templates, and then select **Add**. 
   
1. Select **buildAndPush** in the left pane, and in the right pane, enter a description in the **Display name** field.
   
1. Under **Container Repository**, select **New** next to the **Container Registry** field. 
   
1. In the **Add a Docker Registry service connection** dialog:
   1. Select **Azure Container Registry** next to **Registry type**.
   1. Enter a name next to **Connection Name**.
   1. Select your Azure subscription from the **Azure subscription** dropdown.
   1. Select your Azure Container Registry name from the **Azure container registry** dropdown. 
   1. Select **OK**.
   
   > [!NOTE]
   > If you're using Docker Hub or another registry, select **Docker Hub** or **Others** instead of **Azure Container Registry** next to **Registry type**. Then provide the credentials and connection information for your container registry.
   
1. Under **Commands**, select **build** from the **Command** dropdown.
   
1. Select the ellipsis **...** next to the **Dockerfile** field, browse to and select the Dockerfile from the GitHub project, and then select **OK**. 
   
   ![Select the Dockerfile](media/cicd-microprofile/selectdockerfile.png)
   
1. Under **Tags**, enter *latest* on a new line. 
   
1. Select the dropdown next to **Save & queue**, and select **Save**. 

## Push the Docker image to ACR

Azure Pipelines pushes the Docker image to your Azure Container Registry, and uses it to run the MicroProfile API app as a containerized Java web app.

1. Since you are using Docker in Azure Pipelines, create a new Docker template by repeating the steps under [Create a Docker build image](#create-a-docker-build-image). This time, select **push** in the **Command** dropdown.
   
1. Select the dropdown next to **Save & queue**, and select **Save & queue**. 
   
1. In the **Run pipeline** popup, make sure **Hosted Ubuntu 1604** is selected under **Agent pool**, and select **Save and run**. 
   
1. After the build finishes, you can select the hyperlink on the **Build** page to verify build success and see other details.
   
   ![Select the build hyperlink](media/cicd-microprofile/checkbuild.png)

## Create a release pipeline

An Azure Pipelines continuous release pipeline automatically triggers deployment to a target environment like Azure as soon as a build succeeds. You can create release pipelines for dev, test, staging, or production environments.

1. On your Azure DevOps project page, select **Azure Pipelines** > **Releases** in the left navigation. 
   
1. Select **New Pipeline**.
   
   ![Select Releases and then select New Pipeline](media/cicd-microprofile/newrelease.png)
   
1. Select **Deploy a Java app to Azure App Service** in the list of templates, and then select **Apply**. 
   
   ![Select the Deploy a Java app to Azure App Service template](media/cicd-microprofile/selectreleasetemplate.png)
   
1. In the popup window, change **Stage 1** to a stage name like *Dev*, *Test*, *Staging*, or *Production*, and then close the window. 
   
1. Under **Artifacts** in the left pane, select **Add** to link artifacts from the build pipeline to the release pipeline. 
   
1. Select your build pipeline in the dropdown under **Source (build pipeline)**, and then select **Add**.
   
   ![Add a build artifact](media/cicd-microprofile/addbuildartifact.png)
   
1. Select the hyperlink in the **Production** stage to **View stage tasks**.
   
   ![Select the stage name](media/cicd-microprofile/viewstagetasks.png)
   
1. In the right pane:
   
   1. Select your Azure subscription in the **Azure subscription** dropdown.
      
   1. Select **Linux App** from the **App type** dropdown.
      
   1. Select your Web App for Container instance in the **App service name** dropdown.
      
   1. Enter your Azure Container Registry name in the **Registry or Namespaces** field. For example, enter *myregistry.azure.io*.
      
   1. Enter the registry name in the **Repository** field.
   
1. In the left pane, select **Deploy War to Azure App Service**, and in the right pane, enter the *latest* tag for the container image in the **Tag** field. 
   
   > [!NOTE]
   > Use the fully-qualified image name in the tag: `<registry or namespace>/<repository>:<tag>`. For example, *mymicroprofileregistry.azurecr.io*.
   
1. In the left pane, select **Run on agent**, and in the right pane, select **Hosted Ubuntu 1604** in the **Agent pool** dropdown. 

## Set up environment variables

Add and define environment variables to connect to the container registry during deployment.

1. Select the **Variables** tab, and then select **Add**.
   
1. Add the variable names and values for your container registry URL, username, and password. For security, select the lock icon to keep the password value hidden.
   
   For example, add:
   - registry.url
   - registry.username
   - registry.password
   
   ![Add variables](media/cicd-microprofile/addvariables.png)
   
1. On the **Tasks** tab, select **Deploy War to Azure App Service** in the left pane. 
   
1. In the right pane, expand **Application and Configuration Settings**, and then select the ellipsis **...** next to the **App Settings** field.
   
1. In the **App settings** popup, select **Add** to define and assign the following app setting variables.
   - DOCKER_REGISTRY_SERVER_PASSWORD = $(registry.password)
   - DOCKER_REGISTRY_SERVER_URL = $(registry.url)
   - DOCKER_REGISTRY_SERVER_USERNAME = $(registry.username)
   
1. Select **OK**.
   
   ![Add and set variables](media/cicd-microprofile/appsettings.png)
   
## Set up continuous deployment and deploy the Java app

To enable continuous deployment: 

1. On the **Pipeline** tab, under **Artifacts**, select the lightning icon in the build artifact. 
   
1. In the right pane, set the **Continuous deployment trigger** to **Enabled**.
   
   ![Enable continuous deployment trigger](media/cicd-microprofile/setcontinuousdeployment.png)
   
1. Select **Save** at upper right, and then select **OK**. 
   
## Deploy the Java app

Now that you enabled CI/CD, modifying the source code creates and runs builds and releases automatically. To create and run a new release manually.

1. Select **Create release** at the upper right on the pipeline page.
   
1. Select your stage in the left pane, and in the right pane, select the stage name under **Stages for a trigger change from automated to manual**. 
   
1. Select **Create**. 
   
1. Select the release number in the banner, and then select your stage name and select **Deploy**. 
   
1. Select **Deploy** again in the popup window to start the deployment to Azure. 

## Test the Java web app

1. Copy your web app URL from the Azure portal.
   
   ![App Service app in the Azure portal](media/cicd-microprofile/portalurl.png)
   
1. Enter the URL in your web browser to run your app. The web page should say **Hello Azure!**
   
   ![Java web app page](media/cicd-microprofile/webapp.png)

