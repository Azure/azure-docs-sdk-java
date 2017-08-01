---
title: Azure Application Insights libraries for Java
description: Reference documentation for the Java management API for Azure Appplication Insights
keywords: Azure, Java, SDK, API, AppInsights, telemetry, diagnostics, trace, logs, performance
author: rloutlaw
ms.author: routlaw
manager: douge
ms.date: 07/21/2017
ms.topic: reference
ms.prod: azure
ms.technology: azure
ms.devlang: java
ms.service: appinsights
---

# Azure Application Insights libraries for Java

## Overview

Detect, triage, and diagnose issues in your web apps and services with [Application Insights](/azure/application-insights/app-insights-overview).

To get started with Application Insights, see [Get started with Application Insights in a Java web project](/azure/application-insights/app-insights-java-get-started).

## Client library

Add telemetry to track events, exceptions, and user metrics in your apps with the Application Insights client library.

[Add a dependency](https://maven.apache.org/guides/getting-started/index.html#How_do_I_use_external_dependencies) to your Maven `pom.xml` file to use the client library in your project.

```XML
<dependency>
    <groupId>com.microsoft.azure</groupId>
    <artifactId>applicationinsights-web</artifactId>   
    <version>1.0.8</version>
</dependency>
```   

### Example

Create a new metric entry and record a value for it.

```java
    MetricTelemetry sample = new MetricTelemetry();
    sample.setName("metric name");
    sample.setValue(42.3);
    telemetryClient.TrackMetric(sample);
```

> [!div class="nextstepaction"]
> [Explore the Client APIs](/java/api/overview/azure/appinsights/clientlibrary)

## Samples

Explore more [sample Java code for Application Insights](https://azure.microsoft.com/en-us/resources/samples/?term=insights&platform=java) you can use in your apps.