---
title: Install the Azure SDK for Java
description: Import the Azure SDK for Java into your Maven or Gradle project
keywords: Azure, Java, SDK, API, Maven, Gradle
author: rloutlaw
ms.author: routlaw
manager: douge
ms.date: 04/16/2017
ms.topic: article
ms.prod: azure
ms.technology: azure
ms.devlang: java
ms.service: multiple
ms.assetid: 3d6961b1-5bf5-4514-84cf-100d756f41fd
---

# Set up the Azure SDK for Java

## Install with Maven

Add a dependency entry in your `pom.xml` to import the SDK into your [Maven](https://maven.apache.org) project.

```XML
<dependency>
    <groupId>com.microsoft.azure</groupId>
    <artifactId>azure</artifactId>
    <version>1.0.0-beta5</version>
</dependency>
```

## Install with Gradle

Add a compile entry in the dependency section of your build.gradle file to import the SDK into your [Gradle](https://gradle.org) project:

```groovy
dependencies {
    compile 'com.microsoft.azure:azure:1.0.0-beta5'
}
```

## Verify your install

After configuring your build tool, create a new class source file in the location appropriate to your project tooling with the following contents:

```java
import com.microsoft.azure.credentials.AzureTokenCredentials;
import com.microsoft.azure.management.Azure;

public class TestJavaSDK {
	
	public static void main(String[] args) {
		
	    AzureTokenCredentials credentials = null;
	    
	    try {
	    	Azure azure = Azure.configure()
	    			.authenticate(credentials)
	                .withDefaultSubscription();	
	    }
	    catch(Exception e) {
	    	System.out.println(e.getMessage());
	        e.printStackTrace();
	    }
	}
}
```

If you're using an IDE, the import of the SDK is successful if the `Azure` and `AzureTokenCredentials` imports resolve. On the command line, run the compile step for your build tool (such as `mvn compile`) and verify the code compiles successfully.

## Next steps

Now that the SDK is ready to use, visit the [get started with the Azure SDK for Java](java-sdk-azure-get-started.md) guide to see it in action.