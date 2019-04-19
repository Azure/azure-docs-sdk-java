---
# Mandatory fields.
title: Install the Azul Zulu JDKs for Azure development
description: How to install the Azul Zulu Java Development Kits (JDKs) for Azure development with Windows, Linux, and Mac
author: erickson-doug
manager: douge
ms.author: douge # Microsoft employees only
ms.date: 4/19/2019
ms.devlang: java
ms.topic: conceptual
---

# Install an Azul Zulu JDK for Azure Java development

Azul Systems provides Java Development Kits (JDKs) free-of-charge for Azure development. These JDKs are compliant implementations of the Java Standard Edition (Java SE) specification and contain all the components for building and running Java SE applications.

For more detailed guidance on preparing, installing, and managing your Azul Zulu JDKs for Azure development, read [the official Zulu docs](https://docs.azul.com/zulu/zuludocs/index.htm).

There are [multiple download package types supported for each client OS](https://www.azul.com/downloads/zulu/). You can also get a virtual machine image from the Azure Marketplace Gallery for the following platforms:

- [Azul Zulu on Ubuntu 18.04](https://azuremarketplace.microsoft.com/en-us/marketplace/apps/azul.azul-zulu-ubuntu-1804)
- [Azul Zulu on Windows Server 2016](https://azuremarketplace.microsoft.com/en-us/marketplace/apps/azul.azul-zulu-windows-2016)
- [Azul Zulu 11 on Windows Server 2019](https://azuremarketplace.microsoft.com/en-us/marketplace/apps/azul.azul-zulu11-windows-2019)

> [!NOTE]
> These instructions target the 64-bit Java 8 version of the JDK. Azul also provides the Java Run-time Environment (JRE) as a stand-alone installation. The JRE is included with the JDK install.)

## Download and install the Azul Zulu JDKs for Alpine Linux

1. [Download the 64-bit Azul Zulu JDK 8 as an MSI](https://cdn.azul.com/zulu/bin/zulu8.38.0.13-ca-jdk8.0.212-linux_musl_x64.tar.gz) to a location on your client, such as `/usr/lib/jvm`.

2. Go to your directory and run the following command to unzip and expand the file:

    ```cli
    tar -xzvf <name_of_zulu_package>.tar.gz
    ```


## Download and install the Azul Zulu JDKs for Windows 

1. [Download the 64-bit Azul Zulu JDK 8](https://cdn.azul.com/zulu/bin/zulu8.38.0.13-ca-jdk8.0.212-win_x64.msi) to a location on your client, such as `C:\Users\<your_login>\Downloads`.

2. Navigate to the directory and double-click the downloaded MSI file to begin installation.

## Download and install the Azul Zulu JDKs for Mac 

These steps download a ZIP file to your Mac. There is also a DMG version available.

1. [Download the 64-bit Azul Zulu JDK 8](https://cdn.azul.com/zulu/bin/zulu8.38.0.13-ca-jdk8.0.212-macosx_x64.zip) to a location on your client, such as `/Library/Java/JavaVirtualMachines/`.

2. Launch Finder, navigate to the download directory, and double-click the ZIP file. Alternatively, you can launch a terminal command window, navigate to the directory, and run:

```cli
unzip <name_of_zulu_package>.zip
```

## Download and install the Azul Zulu JDKs from a Yum repository

The Azul Zulu JDKs are provided in a [Yum repository](https://docs.azul.com/zulu/zuludocs/#ZuluUserGuide/PrepareZuluPlatform/AttachYumRepositoryRHEL-SLES-OracleLinuxSys.htm) by Azul.

**To install the Azul Zulu JDK for Java 8, run the following commands from your CLI:**

```cli
sudo rpm --import http://repos.azul.com/azul-repo.key
sudo curl http://repos.azul.com/azure-only/zulu-azure.repo -o /etc/yum.repos.d/zulu-azure.repo
sudo yum -q -y update
sudo yum -q -y install zulu-8-azure-jdk
```

For Java 11, run:

```cli
sudo rpm --import http://repos.azul.com/azul-repo.key
sudo curl http://repos.azul.com/azure-only/zulu-azure.repo -o /etc/yum.repos.d/zulu-azure.repo
sudo yum -q -y update
sudo yum -q -y install zulu-11-azure-jdk
```

For Java 12 (Preview), run:

```cli
sudo rpm --import http://repos.azul.com/azul-repo.key
sudo curl http://repos.azul.com/azure-only/zulu-azure.repo -o /etc/yum.repos.d/zulu-azure.repo
sudo yum -q -y update
sudo yum -q -y install zulu-12-azure-jdk
```

**To update a Zulu JDK 8 package from a Yum repository:**

```cli
sudo yum -q -y install zulu-8-azure-jdk
```

(Change the version number in the command above if you are using versions 11 or 12.)

**To remove a Zulu JDK 8 package from a Yum repository:**

```cli
sudo yum -y erase zulu-8-azure-jdk
```
(Change the version number in the command above if you are using versions 11 or 12.)

## Download and install the Azul Zulu JDKs from an apt-get repository

The Azul Zulu JDKs are also provided in an [apt-get repository](https://docs.azul.com/zulu/zuludocs/#ZuluUserGuide/PrepareZuluPlatform/AttachAPTRepositoryUbuntuOrDebianSys.htm) by Azul.

**To install the Azul Zulu JDK for Java 8 with apt-get, run the following commands from your CLI:**

```cli
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 0xB1998361219BD9C9
sudo apt-add-repository "deb http://repos.azul.com/azure-only/zulu/apt stable main"
sudo apt-get -q update
sudo apt-get -y install zulu-8-azure-jdk
```

For Java 11, run:

```cli
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 0xB1998361219BD9C9
sudo apt-add-repository "deb http://repos.azul.com/azure-only/zulu/apt stable main"
sudo apt-get -q update
sudo apt-get -y install zulu-11-azure-jdk
```

For Java 12 (Preview), run:

```cli
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 0xB1998361219BD9C9
sudo apt-add-repository "deb http://repos.azul.com/azure-only/zulu/apt stable main"
sudo apt-get -q update
sudo apt-get -y install zulu-12-azure-jdk
```

**To update a Zulu JDK 8 package from an apt-get repository:**

```cli
sudo apt-get -q update
sudo apt-get -y install zulu-8-azure-jdk
```

The previous release will be automatically removed.
(Change the version number in the command above if you are using versions 11 or 12.)

**To remove a Zulu JDK 8 package from an apt-get repository:**

```cli
sudo apt-get -y purge zulu-8-azure-jdk
```

(Change the version number in the command above if you are using versions 11 or 12.)

