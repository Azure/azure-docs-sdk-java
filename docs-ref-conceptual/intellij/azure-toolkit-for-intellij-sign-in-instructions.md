---
title: Sign-in instructions for the Azure Toolkit for IntelliJ
description: Learn how to sign in to Microsoft Azure by using the Azure Toolkit for IntelliJ.
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

# Sign-in instructions for the Azure Toolkit for IntelliJ

The Azure Toolkit for IntelliJ provides two methods for signing in to your Azure account:

  * **Device Login**: Open an external browser and sign in with a generated device code.
  * **Service Principal**: Sign in with Azure Active Directory authentication file, you may create it with IntelliJ Toolkit.

The following sections describe how to use each method.

[!INCLUDE [azure-toolkit-for-intellij-prerequisites](../includes/azure-toolkit-for-intellij-prerequisites.md)]

## Sign in to your by device login

To sign in to Azure by device login, do the following:

1. Open your project with IntelliJ IDEA.

1. Open sidebar **Azure Explorer**, and then click **Azure Sign In** (You may also open sign-in window from menu Tools/Azure/Azure Sign in).

   ![The IntelliJ Azure Sign In command][I01]

1. In the **Azure Sign In** window, select **Device Login**, and then click **Sign in**.

   ![The Azure Sign In window with device login selected][I02]

1. Click **Copy&Open** in **Azure Device Login** dialog .

   ![The Azure Login Dialog window][I03]

1. In the browser, paste your device code (which has been copied when you click **Copy&Open** in last step) and then click **Next**.

   ![The device login browser][I04]

1. In the **Select Subscriptions** dialog box, select the subscriptions that you want to use, and then click **OK**.

   ![The Select Subscriptions dialog box][I05]

## Sign in to your Azure account using service principal

This section walks you through creating a credentials file that contains your service principal data. After you have completed this process, IntelliJ uses the credentials file to automatically sign you in to Azure when open your project.

1. Open your project with IntelliJ IDEA.

1. Open sidebar **Azure Explorer**, and then click **Azure Sign In** (You may also open sign-in window from menu Tools/Azure/Azure Sign in).
   ![The IntelliJ Azure Sign In command][A01]

1. In the **Azure Sign In** window, select **Service Principal**, and then click **New**.

   ![The Azure Sign In window with service principal selected][A02]

1. Click **Copy&Open** in **Azure Device Login** dialog .

   ![The Azure Login Dialog window][A03]

1. In the browser, paste your device code (which has been copied when you click **Copy&Open** in last step) and then click **Next**.

   ![The device login browser][A04]

1. In the **Create Authentication Files** window, select the subscriptions that you want to use, choose your destination directory, and then click **Start**.

   ![The Create Authentication Files window][A05]

1. In the **Service Principal Creation Status** dialog box, click **OK** after your files have been created successfully.

   ![The Service Principal Creation Status dialog box][A06]

1. In the **Azure Sign In** window, click **Sign in**. 

   ![Azure Log In Dialog Box][A07]

1. In the **Select Subscriptions** dialog box, select the subscriptions that you want to use, and then click **OK**.

   ![The Select Subscriptions dialog box][A08]

> Once you created the service principal authentication file, you could start from step 8, choose your authentication file and sign in.

## Sign out of your Azure account

After you have configured your account by using the preceding steps, you will be automatically signed in each time you start IntelliJ IDEA. However, if you want to sign out of your Azure account, do the following.

* In IntelliJ IDEA, open Azure Explorer side bar, click **Azure Sign Out** and confirm.(You may also sign out from menu Tools/Azure/Azure Sign Out)

   ![The IntelliJ Azure Sign Out command][L01]

## Next steps

[!INCLUDE [azure-toolkit-for-intellij-additional-resources](../includes/azure-toolkit-for-intellij-additional-resources.md)]

<!-- URL List -->

<!-- IMG List -->

[I01]: media/azure-toolkit-for-intellij-sign-in-instructions/I01.png
[I02]: media/azure-toolkit-for-intellij-sign-in-instructions/I02.png
[I03]: media/azure-toolkit-for-intellij-sign-in-instructions/I03.png
[I04]: media/azure-toolkit-for-intellij-sign-in-instructions/I04.png
[I05]: media/azure-toolkit-for-intellij-sign-in-instructions/I05.png

[A01]: media/azure-toolkit-for-intellij-sign-in-instructions/A01.png
[A02]: media/azure-toolkit-for-intellij-sign-in-instructions/A02.png
[A03]: media/azure-toolkit-for-intellij-sign-in-instructions/A03.png
[A04]: media/azure-toolkit-for-intellij-sign-in-instructions/A04.png
[A05]: media/azure-toolkit-for-intellij-sign-in-instructions/A05.png
[A06]: media/azure-toolkit-for-intellij-sign-in-instructions/A06.png
[A07]: media/azure-toolkit-for-intellij-sign-in-instructions/A07.png
[A08]: media/azure-toolkit-for-intellij-sign-in-instructions/A08.png
[A09]: media/azure-toolkit-for-intellij-sign-in-instructions/A09.png

[L01]: media/azure-toolkit-for-intellij-sign-in-instructions/L01.png
[L02]: media/azure-toolkit-for-intellij-sign-in-instructions/L02.png
[L03]: media/azure-toolkit-for-intellij-sign-in-instructions/L03.png
