---
title: Azure Purview Catalog client library for Java
keywords: Azure, java, SDK, API, azure-analytics-purview-catalog, purview
ms.date: 06/15/2022
ms.topic: reference
ms.devlang: java
ms.service: purview
---
# Azure Purview Catalog client library for Java - version 1.0.0-beta.4 


Azure Purview Catalog is a fully managed cloud service whose users can discover the data sources they need and understand the data sources they find. At the same time, Data Catalog helps organizations get more value from their existing investments.

- Search for data using technical or business terms
- Browse associated technical, business, semantic, and operational metadata
- Identify the sensitivity level of data.

**Please rely heavily on the [service's documentation][product_documentation] and our [data-plane client docs][protocol_method] to use this library**

[Source code][source_code] | [Package (Maven)][package] | [API reference documentation][api_reference_doc] | [Product Documentation][product_documentation] | [Samples][samples_readme]

## Getting started

### Prerequisites

- A [Java Development Kit (JDK)][jdk_link], version 8 or later.
- [Azure Subscription][azure_subscription]
- An existing Azure Purview account.

For more information about creating the account, see [here][create_azure_purview_account].

### Include the Package

[//]: # ({x-version-update-start;com.azure:azure-analytics-purview-catalog;current})
```xml
<dependency>
  <groupId>com.azure</groupId>
  <artifactId>azure-analytics-purview-catalog</artifactId>
  <version>1.0.0-beta.2</version>
</dependency>
```
[//]: # ({x-version-update-end})


### Authenticate the client
In order to interact with the Azure Purview service, your client must present an Azure Active Directory bearer token to the service.

The simplest way of providing a bearer token is to use the `DefaultAzureCredential` authentication method by providing client secret credentials is being used in this getting started section but you can find more ways to authenticate with [azure-identity][azure_identity].

#### Create GlossaryBaseClient with Azure Active Directory Credential

You can authenticate with Azure Active Directory using the [Azure Identity library][azure_identity].

To use the [DefaultAzureCredential][DefaultAzureCredential] provider shown below, or other credential providers provided with the Azure SDK, please include the `azure-identity` package:

[//]: # ({x-version-update-start;com.azure:azure-identity;dependency})
```xml
<dependency>
    <groupId>com.azure</groupId>
    <artifactId>azure-identity</artifactId>
    <version>1.3.6</version>
</dependency>
```
[//]: # ({x-version-update-end})

Set the values of the client ID, tenant ID, and client secret of the AAD application as environment variables: AZURE_CLIENT_ID, AZURE_TENANT_ID, AZURE_CLIENT_SECRET.

##### Example
```java readme-sample-createGlossaryClient
GlossaryClient client = new GlossaryClientBuilder()
    .endpoint(System.getenv("<account-name>.purview.azure.com"))
    .credential(new DefaultAzureCredentialBuilder().build())
    .buildClient();
```

## Key concepts

## Examples
More examples can be found in [samples][samples_code].

## Troubleshooting

### Enabling Logging

Azure SDKs for Java offer a consistent logging story to help aid in troubleshooting application errors and expedite
their resolution. The logs produced will capture the flow of an application before reaching the terminal state to help
locate the root issue. View the [logging][logging] wiki for guidance about enabling logging.

## Next steps

## Contributing

This project welcomes contributions and suggestions. Most contributions require you to agree to a [Contributor License Agreement (CLA)][cla] declaring that you have the right to, and actually do, grant us the rights to use your contribution.

When you submit a pull request, a CLA-bot will automatically determine whether you need to provide a CLA and decorate the PR appropriately (e.g., label, comment). Simply follow the instructions provided by the bot. You will only need to do this once across all repos using our CLA.

This project has adopted the [Microsoft Open Source Code of Conduct][coc]. For more information see the [Code of Conduct FAQ][coc_faq] or contact [opencode@microsoft.com][coc_contact] with any additional questions or comments.

<!-- LINKS -->
[samples]: src/samples/java/com/azure/analytics/purview/catalog
[source_code]: https://github.com/Azure/azure-sdk-for-java/blob/azure-analytics-purview-catalog_1.0.0-beta.4/sdk/purview/azure-analytics-purview-catalog/src
[samples_code]: https://github.com/Azure/azure-sdk-for-java/blob/azure-analytics-purview-catalog_1.0.0-beta.4/sdk/purview/azure-analytics-purview-catalog/src/samples/
[azure_subscription]: https://azure.microsoft.com/free/
[api_reference_doc]: https://azure.github.io/azure-sdk-for-java
[product_documentation]: https://azure.microsoft.com/services/purview/
[azure_identity]: https://github.com/Azure/azure-sdk-for-java/tree/azure-analytics-purview-catalog_1.0.0-beta.4/sdk/identity/azure-identity
[DefaultAzureCredential]: https://github.com/Azure/azure-sdk-for-java/blob/azure-analytics-purview-catalog_1.0.0-beta.4/sdk/identity/azure-identity/README.md#defaultazurecredential
[jdk_link]: /java/azure/jdk/?view=azure-java-stable
[package]: https://mvnrepository.com/artifact/com.azure/azure-analytics-purview-catalog
[samples_readme]: https://github.com/Azure/azure-sdk-for-java/tree/azure-analytics-purview-catalog_1.0.0-beta.4/sdk/purview/azure-analytics-purview-catalog/src/samples/README.md
[protocol_method]: https://github.com/Azure/azure-sdk-for-java/wiki/Protocol-Methods
[create_azure_purview_account]: /azure/purview/create-catalog-portal
[logging]: https://github.com/Azure/azure-sdk-for-java/wiki/Logging-with-Azure-SDK
[cla]: https://cla.microsoft.com
[coc]: https://opensource.microsoft.com/codeofconduct/
[coc_faq]: https://opensource.microsoft.com/codeofconduct/faq/
[coc_contact]: mailto:opencode@microsoft.com



