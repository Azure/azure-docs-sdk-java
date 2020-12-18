---
title: Azure DNS libraries for Java
description: Reference documentation for the Azure DNS Java management libraries 
keywords: Azure, Java, SDK, API, domains, DNS, name, service, domain name service
author: rloutlaw
ms.author: routlaw
manager: douge
ms.date: 07/11/2017
ms.topic: reference
ms.prod: azure
ms.technology: azure
ms.devlang: java
ms.service: dns
---

# Azure DNS libraries for Java

## Overview

Provide domain name resolution and manage your DNS records using the same credentials, APIs, tools, and billing as your other Azure services with [Azure DNS](/azure/dns/dns-overview).

To get started with Azure DNS, see [Get started with Azure DNS using the Azure CLI 2.0](/azure/dns/dns-getstarted-cli).

## Management API

Create DNS zones and add records to zones with the management API.

[Add a dependency](https://maven.apache.org/guides/getting-started/index.html#How_do_I_use_external_dependencies) to your Maven `pom.xml` file to use the client library in your project.

```XML
<dependency>
    <groupId>com.microsoft.azure</groupId>
    <artifactId>azure-mgmt-dns</artifactId>
    <version>1.22.0</version>
</dependency>
```   

### Example

Create a root DNS zone and add a `www` CNAME record in an existing resource group.

```java
DnsZone rootDnsZone = azure.dnsZones().define("contoso.com")
        .withExistingResourceGroup("myResourceGroup")
        .create();
rootDnsZone = rootDnsZone.update()
        .withCNameRecordSet("www", "172.30.241.20")
        .apply();
```

> [!div class="nextstepaction"]
> [Explore the Management APIs](/java/api/overview/azure/dns/management)

## Samples

[Host and manage your domains with Azure DNS](https://github.com/Azure-Samples/dns-java-host-and-manage-your-domains)

Explore more [sample Java code for Azure DNS](https://azure.microsoft.com/resources/samples/?platform=java&term=dns) you can use in your apps.

<!---Loc Comment: Please, refer to conversation section to check the issue. Thanks.--->
