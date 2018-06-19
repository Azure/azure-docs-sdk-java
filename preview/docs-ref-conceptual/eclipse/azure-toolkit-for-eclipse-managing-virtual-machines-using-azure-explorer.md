---
title: Manage virtual machines by using the Azure Explorer for Eclipse
description: Learn how to manage your Azure virtual machines by using the Azure Explorer for Eclipse.
services: ''
documentationcenter: java
author: rmcmurray
manager: routlaw
editor: ''

ms.assetid: 
ms.author: robmcm
ms.date: 02/01/2018
ms.devlang: Java
ms.service: multiple
ms.tgt_pltfrm: multiple
ms.topic: article
ms.workload: na
---

# Manage virtual machines by using the Azure Explorer for Eclipse

The Azure Explorer, which is part of the Azure Toolkit for Eclipse, provides Java developers with an easy-to-use solution for managing virtual machines in their Azure account from inside the Eclipse integrated development environment (IDE).

[!INCLUDE [azure-toolkit-for-eclipse-prerequisites](../includes/azure-toolkit-for-eclipse-prerequisites.md)]

[!INCLUDE [azure-toolkit-for-eclipse-show-azure-explorer](../includes/azure-toolkit-for-eclipse-show-azure-explorer.md)]

## Create a virtual machine in Eclipse

To create a virtual machine by using the Azure Explorer, do the following:

1. Sign in to your Azure account by using the [Sign-in instructions for the Azure Toolkit for Eclipse](https://docs.microsoft.com/java/azure/eclipse/azure-toolkit-for-eclipse-sign-in-instructions).

1. In the **Azure Explorer** view, expand the **Azure** node, right-click **Virtual Machines**, and then click **Create VM**.

   ![The Create VM command][CR01]  

   The **Create new Virtual Machine** wizard opens.

1. In the **Choose a Subscription** window, select your subscription, and then click **Next**.

   ![The Choose a Subscription window][CR02]

1. In the **Select a Virtual Machine Image** window, enter the following information:

   * **Location**: Specifies where your virtual machine will be created (for example, *West US*).

   * **Publisher**: Specifies the publisher that created the image you'll use to create your virtual machine (for example, *Microsoft*).

   * **Offer**: Specifies the virtual machine offering to use from the selected publisher (for example, *JDK*).

   * **Sku**: Specifies the stockkeeping unit (SKU) to use from the selected offering (for example, *JDK_8*).

   * **Version #**: Specifies which version of the selected SKU to use.

   ![The Select a Virtual Machine Image window][CR03]

1. Click **Next**.

1. In the **Virtual Machine Basic Settings** window, enter the following information:

   * **Virtual Machine Name**: Specifies the name for your new virtual machine, which must start with a letter and contain only letters, numbers, and hyphens.

   * **Size**: Specifies the number of cores and memory to allocate for your virtual machine.

   * **User name**: Specifies the administrator account to create for managing your virtual machine.

   * **Password** and **Confirm**: Specifies the password for your administrator account.

   ![The Virtual Machine Basic Settings window][CR04]

1. Click **Next**.

1. In the **Create New Storage Account** window, enter the following information:

   * **Resource Group**: Specifies the resource group for your virtual machine. Select one of the following options:
      * **Create new**: Specifies that you want to create a new resource group.
      * **Use existing**: Specifies that you want to select a resource group that is already associated with your Azure account.

      ![The Create New Storage Account dialog box][CR05]

   * **Storage account**: Specifies the storage account to use for storing your virtual machine. You can use an existing storage account or create a new account.

   * **Virtual Network** and **Subnet**: Specifies the virtual network and subnet that your virtual machine will connect to. You can use an existing network and subnet, or you can create a new network and subnet. If you select **Create new**, the following dialog box is displayed:

      ![The Create New Virtual Network dialog box][CR06]

1. In the **Associated Resources** window, enter the following information:

   * **Public IP address**: Specifies an external-facing IP address for your virtual machine. You can choose to create a new IP address or, if your virtual machine will not have a public IP address, you can select **(None)**.

   * **Network security group**: Specifies an optional networking firewall for your virtual machine. You can select an existing firewall or, if your virtual machine will not use a network firewall, you can select **(None)**.

   * **Availability set**: Specifies an optional availability set that your virtual machine can belong to. You can select an existing availability set or create a new availability set or, if your virtual machine will not belong to an availability set, you can select **(None)**.

   ![The Associated Resources window][CR07]

1. Click **Finish**.  

   Your new virtual machine is displayed in the Azure Explorer tool window.

   ![New Virtual Machine][CR08]

## Restart a virtual machine in Eclipse

To restart a virtual machine by using the Azure Explorer in Eclipse, do the following:

1. In the **Azure Explorer** view, right-click the virtual machine, and then select **Restart**.

   ![The virtual-machine Restart command][RE01]

1. In the confirmation window, click **Yes**.

   ![The Restart confirmation window][RE02]

## Shut down a virtual machine in Eclipse

To shut down a running virtual machine by using the Azure Explorer in Eclipse, do the following:

1. In the **Azure Explorer** view, right-click the virtual machine, and then select **Shutdown**.

   ![The virtual-machine Shutdown command][SH01]

1. In the confirmation window, click **Yes**.

   ![The virtual-machine shutdown confirmation window][SH02]

## Delete a virtual machine in Eclipse

To delete a virtual machine by using the Azure Explorer in Eclipse, do the following:

1. In the **Azure Explorer** view, right-click the virtual machine, and then select **Delete**.

   ![The virtual-machine Delete command][DE01]

1. In the confirmation window, click **Yes**.

   ![The virtual-machine deletion confirmation window][DE02]

## Next steps

For more information about Azure virtual-machine sizes and pricing, see the following resources:

* Azure virtual-machine sizes
  * [Sizes for Windows virtual machines in Azure]
  * [Sizes for Linux virtual machines in Azure]
* Azure virtual-machine pricing
  * [Windows virtual-machine pricing]
  * [Linux virtual-machine pricing]

[!INCLUDE [azure-toolkit-for-eclipse-additional-resources](../includes/azure-toolkit-for-eclipse-additional-resources.md)]

<!-- URL List -->

[Sizes for Windows virtual machines in Azure]: /azure/virtual-machines/virtual-machines-windows-sizes
[Sizes for Linux virtual machines in Azure]: /azure/virtual-machines/virtual-machines-linux-sizes
[Windows virtual-machine pricing]: /pricing/details/virtual-machines/windows/
[Linux virtual-machine pricing]: /pricing/details/virtual-machines/linux/

<!-- IMG List -->

[RE01]: media/azure-toolkit-for-eclipse-managing-virtual-machines-using-azure-explorer/RE01.png
[RE02]: media/azure-toolkit-for-eclipse-managing-virtual-machines-using-azure-explorer/RE02.png

[SH01]: media/azure-toolkit-for-eclipse-managing-virtual-machines-using-azure-explorer/SH01.png
[SH02]: media/azure-toolkit-for-eclipse-managing-virtual-machines-using-azure-explorer/SH02.png

[DE01]: media/azure-toolkit-for-eclipse-managing-virtual-machines-using-azure-explorer/DE01.png
[DE02]: media/azure-toolkit-for-eclipse-managing-virtual-machines-using-azure-explorer/DE02.png

[CR01]: media/azure-toolkit-for-eclipse-managing-virtual-machines-using-azure-explorer/CR01.png
[CR02]: media/azure-toolkit-for-eclipse-managing-virtual-machines-using-azure-explorer/CR02.png
[CR03]: media/azure-toolkit-for-eclipse-managing-virtual-machines-using-azure-explorer/CR03.png
[CR04]: media/azure-toolkit-for-eclipse-managing-virtual-machines-using-azure-explorer/CR04.png
[CR05]: media/azure-toolkit-for-eclipse-managing-virtual-machines-using-azure-explorer/CR05.png
[CR06]: media/azure-toolkit-for-eclipse-managing-virtual-machines-using-azure-explorer/CR06.png
[CR07]: media/azure-toolkit-for-eclipse-managing-virtual-machines-using-azure-explorer/CR07.png
[CR08]: media/azure-toolkit-for-eclipse-managing-virtual-machines-using-azure-explorer/CR08.png
