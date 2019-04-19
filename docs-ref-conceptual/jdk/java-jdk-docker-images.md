---
# Mandatory fields.
title: Using Azul Zulu Docker images for Azure Java development
description: 
author: bmitchell287
manager: douge
ms.author: brendm # Microsoft employees only
ms.date: 4/9/2019
ms.devlang: java
ms.topic: conceptual
---
# Docker images for Azure

Pre-built Docker images for Java 7, 8, and 11 are available through [Docker Hub](https://hub.docker.com/_/microsoft-java-se). 

These Zulu OpenJDK Dockerfiles are to be used solely with Java applications or application components developed for deployment on Microsoft Azure or Azure Stack, and are not intended to be used for any other purpose. 

## Running a Docker image

Docker images can be run using the syntax `$ docker run mcr.microsoft.com/java/jdk:tag java` as shown in the following example.

```cli
$ docker run mcr.microsoft.com/java/jdk:8u202-zulu-alpine java -version 
```

## Creating a Docker image

You can create an image using Microsoft's official Docker Hub images as shown in the following examples.

### Create a Docker file

```cli
FROM mcr.microsoft.com/java/jdk:8u202-zulu-alpine 
  
RUN echo $' \ 
  
public class HelloWorld { \ 
   public static void main(String[] args) { \ 
      // Prints "Hello, World" in the terminal window. \ 
      System.out.println("Hello, World - From Microsoft Azure !!!"); \ 
   } \ 
}' > HelloWorld.java 
  
RUN javac HelloWorld.java 
  
CMD ["java", "HelloWorld"] 
```

### Build a Docker image

```
$ docker build -t hello-world 
```

### Run the new image

```
$ docker run hello-world 
```
