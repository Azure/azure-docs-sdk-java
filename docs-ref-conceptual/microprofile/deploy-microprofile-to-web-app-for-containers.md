---
title: Deploy a Java-based MicroProfile service to Azure Web App for Containers
description: Learn how to deploy a MicroProfile service using Docker and Azure Web App for Containers
services: container-registry;app-service
documentationcenter: java
author: jonathangiles
manager: routlaw
editor: jonathangiles

ms.assetid:
ms.author: jogiles
ms.date: 09/07/2018
ms.devlang: java
ms.service: container-registry;app-service
ms.tgt_pltfrm: multiple
ms.topic: article
ms.workload: web
---

# Deploy a Java-based MicroProfile service to Azure Web App for Containers

MicroProfile is a great way to build exceedingly small Java applications that you can quickly and easily deploy to services such as [Azure Web App for Containers](https://azure.microsoft.com/services/app-service/containers/). In this tutorial, you create a simple, MicroProfile-based microservice that you then containerize into a Docker container, deploy to an [Azure container registry instance](https://azure.microsoft.com/services/container-registry/), and then host by using Azure Web App for Containers.

> [!NOTE]
> This procedure works with any implementation of MicroProfile.io, as long the Docker container image is self-executable (that is, the image includes the runtime).

In this sample, you use [Payara Micro](https://www.payara.fish/payara_micro) and [MicroProfile 1.3](https://microprofile.io/) to create a small (approximately 5,000 bytes) Java web application requirement (WAR) file, and then package it into a Docker image of approximately 174 megabytes (MB). The Docker image contains everything necessary for a fully containerized deployment of the web app.

An entire 174 MB Docker image ordinarily doesn't need to be redeployed whenever the application source code is changed, because Docker uploads only the differences (which are significantly smaller). Consequently, the process of executing a new release of a MicroProfile application via a CI/CD pipeline is extremely efficient and quick, reducing friction and enabling rapid development iteration.

You'll work through this tutorial by first creating and running the code locally and then deploying it as a web app on Azure. In both phases, you can depend on Docker to simplify and standardize your efforts. Before you begin, you'll create an Azure container registry instance for storing your Docker containers.

## Create an Azure container registry instance

You use the [Azure portal](http://portal.azure.com) to create the Azure Container Registry, but there are other choices also, such as the Azure CLI. To create a new Azure container registry instance, do the following:

1. Sign in to the [Azure portal](http://portal.azure.com) and create a new Azure container registry resource. Provide a registry name (this name should be set as the `docker.registry` property in the *pom.xml* file). Change the defaults as you want, and then select **Create**.

1. In about 30 seconds, when the container registry instance is live, select the container registry instance and then, in the left pane, select the **Access keys** link. 

    Be sure to enable the *admin user* setting, so that you can access this container registry instance from your machines and push Docker containers into it. Doing so also enables access from the Azure Web App for Containers instance we will set up soon.

1. In the **Access keys** pane, copy the **username** and **password** values and paste them into your global Maven *settings.xml* file. For more information about Maven settings, go to the [Apache Maven Project](https://maven.apache.org/settings.html) website. 

   For your reference, here is an example of the *${user.home}/.m2/settings.xml* file:

    ```xml
    <settings xmlns="http://maven.apache.org/SETTINGS/1.0.0"
      xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
      xsi:schemaLocation="http://maven.apache.org/SETTINGS/1.0.0
                          https://maven.apache.org/xsd/settings-1.0.0.xsd">
        <servers>
          <server>
            <id>jogilescr.azurecr.io</id>
            <username>jogilescr</username>
            <password>ojoirshois.this-isn't-real.hrihslirhlishrglih</password>
          </server>
        </servers>
    </settings>
    ```

Now that you've created your container registry instance, you can move on to building and running your MicroProfile application locally.

## Create your MicroProfile application

This example code is based on a sample application that's available on GitHub. To clone the code onto your machine, enter the following commands:

```
git clone https://github.com/Azure-Samples/microprofile-docker-helloworld.git

cd microprofile-docker-helloworld
```

This directory contains a *pom.xml* file that you use to specify the project in the format that's used by the Maven build tool. You can edit the file to suit your own needs. In particular, the `docker.registry` and `docker.name` properties should be changed to the `docker.registry` and `docker.name` properties that were created when you set up the Azure container registry instance.

Another file of note in this directory is the Dockerfile, which is reproduced below:

```dockerfile
FROM payara/micro

ARG WAR_FILE
COPY target/${WAR_FILE} $DEPLOY_DIR

EXPOSE 8080
```

The Dockerfile simply creates a new Docker container that's based on the Payara Micro Docker Container. It copies in the WAR file that was created as part of your build process. It also exposes port 8080 so that you can access the service after it's up and running within a Docker container.

When you open the *src* directory, you'll eventually discover the `Application` class that's reproduced here:

```java
package com.microsoft.azure.samples.microprofile.docker.helloworld;

import javax.ws.rs.ApplicationPath;

@ApplicationPath("/api")
public class Application extends javax.ws.rs.core.Application { }
```

The *@ApplicationPath("/api")* annotation specifies the base endpoint for this microservice. That is, for all endpoints, */api* precedes the rest of the URL that's required to access any specific REST endpoint.

Inside the *api* package is a class named `API`, which contains the following code:

```java
package com.microsoft.azure.samples.microprofile.docker.helloworld.api;

import javax.enterprise.context.ApplicationScoped;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;

import static javax.ws.rs.core.MediaType.TEXT_HTML;

@ApplicationScoped
@Path("/")
public class API {

    @GET
    @Path("/helloworld")
    @Produces(TEXT_HTML)
    public String info() {
        return "Hello, world!";
    }
}
```

Through the use of the *@Path("/helloworld")* annotation, you can see that this REST endpoint, when it's combined with the */api* that's specified in the `Application` class, will be */api/helloworld*. When you call this endpoint by using an HTTP GET request, you can see that the method produces text/html and, in fact, it's simply a hard-coded string, "Hello, world!"

So far, this article has covered all the code that's required for you to create a microservice by using MicroProfile. You can now use Maven to build it, containerize it into a Docker container, and run it locally by doing the following:

1. Run `mvn clean package`, and wait until it is complete.

1. Run `docker run -it --rm -p 8080:8080 <docker.registry>/<docker.name>:latest`. For example, *docker run -it --rm -p 8080:8080 jogilescr.azurecr.io/samples/docker-helloworld:latest*, where *\<docker.registry>* is *jogilescr.azurecr.io* and *\<docker.name>* is *samples/docker-helloworld*.

1. Try to access [http://localhost:8080/microprofile/api/helloworld](http://localhost:8080/microprofile/api/helloworld) and [http://localhost:8080/health](http://localhost:8080/health) in your web browser. If you see the expected "Hello, world!" response (and health-related information for the [/health](http://localhost:8080/health) endpoint), you've successfully deployed the MicroProfile application on your local machine.

## Push the container to the Azure container registry instance

Now that you've successfully built and run your MicroProfile application on your local machine, push this container to your container registry instance. 

> [!NOTE]
> Although this article uses an Azure container registry instance, any container registry instance should work, as long as the *pom.xml* file is edited to point to the relevant location.

1. To clean, compile, and create a local Docker image, run `mvn clean package`.
2. To push the container to the Azure container registry instance, run `mvn dockerfile:push`.

You now have your Docker container image uploaded to the Azure container registry instance. However, it's not yet running. You now have to deploy it to an Azure Web App for Containers instance. 

## Create an Azure Web App for Containers instance

1. In the [Azure portal](http://portal.azure.com), in the left pane, select **Web + Mobile**, and then do the following:

   a. Specify a name. The name will become the public URL of the web app, so it's a good idea to pick a name that you can easily remember. You can add a custom domain name later, if you want.

   b. In the **Configure container** section, under **Image source**, select **Azure Container Registry** and then, in the drop-down list, select the correct image.

   c. You don't need to specify a value in the **Startup File** field.

1. After you've created the instance, select it, and then select **Application Settings**. For **Key**, enter **WEBSITES_PORT**, and for **Value**, enter **8080**. These settings tell Azure which port to expose in the container and to map it to port 80 externally.

1. (Optional) Select the **Docker Container** link, and then enable **Continuous Deployment**. By doing so, whenever you update the Azure container registry instance image, it's automatically updated in the Azure Web App for Containers instance.

1. You should now be able to access the Azure-hosted instances at `http://<appname>.azurewebsites.net/microprofile/api/helloworld` and `http://<appname>.azurewebsites.net/health`.

## Summary

In this tutorial, you've stepped through the process of creating a simple MicroProfile-based microservice, containerized it into a Docker container, run it locally, and published it to Azure. You can extend your microservice to provide additional useful functionality. For more information, go to [MicroProfile.io](https://microprofile.io/).
