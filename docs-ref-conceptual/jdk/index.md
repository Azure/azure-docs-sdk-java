---
title: Java JDKs and long-term support for Azure development
description: This article presents download links and a statement of Azure support for developing and running Java applications.
author: bmitchell287
manager: douge
ms.devlang: java
ms.topic: article
ms.date: 04/09/2019
ms.author: brendm
ms.topic: conceptual
---

# Java long-term support for Azure and Azure Stack

As a Java developer on Microsoft Azure and Azure Stack, you can build and run production Java applications by using [Azul Zulu Enterprise for Azure](https://www.azul.com/downloads/azure-only/zulu/) without incurring additional support costs. You can use any Java runtime you want on Azure, but when you use Zulu, you get free maintenance updates and can resolve support issues with Microsoft.

> [!div class="nextstepaction"]
> [Download and install Java](java-jdk-install.md)

## Long-term support

* [Java 11](https://www.azul.com/downloads/azure-only/zulu/#java11)
* [Java 8](https://www.azul.com/downloads/azure-only/zulu/#java8)
* [Java 7](https://www.azul.com/downloads/azure-only/zulu/#java7)

## Technical preview

* [Java 12](https://www.azul.com/downloads/azure-only/zulu/#java12)

## What is the Zulu OpenJDK for Azure?

Azul Zulu Enterprise builds of OpenJDK are a no-cost, multi-platform, production-ready distribution of the OpenJDK for Azure and Azure Stack that's backed by Microsoft and Azul Systems. These distributions are:

* 100 percent open-source builds of OpenJDK that are packaged as Java Development Kits (JDKs), Java Runtime Environments (JREs), and Headless JREs. These binaries are fully compatible and compliant commercial builds of Java Standard Edition (SE) that can be used with Java applications or components on Azure and Azure Stack.
* Provided with long-term support (LTS), which includes bug fixes, performance enhancements, and security patches.
* Available for developing and running Java applications on Windows, Linux, and macOS.
* Available as container images on Docker Hub and as virtual machines (Windows and Linux) in the Azure Marketplace.
* Used by Azure to power many Azure services, such as:
  * Azure App Service (Windows)
  * Azure App Service (Linux)
  * Azure Functions
  * Azure Service Fabric
  * Azure HDInsight
  * Azure Search
  * Azure DevOps
  * Azure Cloud Shell  

## Supported Java versions and update schedule

Azul Systems provides fully supported [Zulu Enterprise builds of OpenJDK for Azure](https://www.azul.com/downloads/azure-only/zulu/) for all LTS versions of Java, starting with Java SE 7, 8, and 11. For more information, see the [Azul press release](https://www.azul.com/press_release/free-java-production-support-for-microsoft-azure-azure-stack).

|Java SE LTS  |Support until  |
|---------|----------|
|[![Java 7](../media/jdk/java-7.png)](https://www.azul.com/downloads/azure-only/zulu/#java7) |July 2023 |
|[![Java 8](../media/jdk/java-8.png)](https://www.azul.com/downloads/azure-only/zulu/#java8) |March 2025|
|[![Java 11](../media/jdk/java-11.png)](https://www.azul.com/downloads/azure-only/zulu/#java11) |September 2026|
|[![Java 12](../media/jdk/java-12.png)]() |**Preview**|

These JDK releases have quarterly security updates, bug fixes, and critical out-of-band updates and patches as needed. This support includes back ports of security updates and bug fixes to Java 7 and 8 that are reported in newer versions of Java, such as Java 11. The support ensures the continued stability and security of older versions of Java. Azure customers can get these security updates and platform bug fixes without incurring any unplanned Java SE subscription fees.

Azul Systems maintains a [Java SE roadmap](https://www.azul.com/products/azul_support_roadmap/) for these releases.

## Benefits for developers

The Azul Zulu JDK releases are:

* Backed and supported by both Microsoft and Azul Systems.

   * Zulu binaries are production ready and backed by Microsoft and Azul Systems.
   * Zulu comes with zero-cost LTS for Java 7, 8, and 11. (LTS will be provided for Java 17, as well). You can upgrade Java versions only when you need to.
   * Java 7 is supported until July 2023. Java 8 and 11 are supported beyond 2024.
   * Microsoft is committed to running Zulu internally on machines that power many Azure services.

* Production-ready.

   * 100 percent open-source for its builds of OpenJDK.
   * Drop-in replacements for many Java SE distributions.
   * JDK, JRE, and JRE-headless
   * Java 7, 8, and 11
   * Verified compliant with the Java SE specifications that use the OpenJDK Community Technology Compatibility Kit (TCK).
   * As a developer, you continue to receive production updates for Java SE, including bug fixes, performance enhancements, and security patches for Java SE 7, 8, and 11.

* Supported for multi-platform. Zulu supports binaries for multiple platforms and versions, including:

   * Windows Client
     * 10
     * 8.1
     * 8, 7
   * Windows Server
     * 2016R2
     * 2016
     * 2012 R2
     * 2012
     * 2008 R2
   * Linux, including
     * RHEL
     * CentOS
     * Ubuntu
     * SLES
     * Debian
     * Oracle Linux
   * macOS X
   * Delivery in multiple package types:
     * MSI, ZIP, TAR, DEB, RPM, and DMG

    Certified Docker container images for Zulu JDK, JRE, and JRE-headless on multiple base OS images are available at Docker.

    Hub:

    * [JDK](https://hub.docker.com/_/microsoft-java-jdk)
    * [JRE](https://hub.docker.com/_/microsoft-java-jre)
    * [JRE-headless](https://hub.docker.com/_/microsoft-java-jre-headless)

* No cost.

   * Microsoft provides everything you need to build and scale Java apps on Azure, at no cost to you. Through Zulu you'll receive free security updates and platform bug fixes for Java apps without any fees.
   * [Java Flight Recorder and Mission Control](java-jdk-flight-recorder-and-mission-control.md) are available in Zulu Java 8, 11, and 12 (Preview).

* Tech preview of non-LTS versions.

   * With tech previews, you can progressively test new features as they're delivered, in short-term versions that will eventually graduate to Java 17 LTS.

* Changes to OpenJDK are sent upstream.

   * Azul Systems committers push Zulu changes to OpenJDK, which makes the upstream repo comprehensive and inclusive.

As always, as a Java developer, you can bring to Azure your own Java runtimes, including the Oracle JDK and the Red Hat JDK. You can also use the secure infrastructure and feature-rich services. The production edition of Oracle Java SE is also available to you for running Java workloads in Windows or Linux virtual machines on Azure.

## Use Java JDKs for local development 

You can [download Java JDKs for Azure and Azure Stack](https://www.azul.com/downloads/azure-only/zulu/) for use in your local development environments. Downloads are available for Windows, Linux, and macOS. If you're working on Linux, you can also get packages through the [yum](https://www.azul.com/downloads/azure-only/zulu/#yum-repo) and [apt](https://www.azul.com/downloads/azure-only/zulu/#apt-repo) package managers.

For additional guidance, see [Docker images for Azure](java-jdk-docker-images.md).