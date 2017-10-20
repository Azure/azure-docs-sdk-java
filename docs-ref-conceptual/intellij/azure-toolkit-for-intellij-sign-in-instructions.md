---
title: Sign-in instructions for the Azure Toolkit for IntelliJ
description: Learn how to sign in to Microsoft Azure by using the Azure Toolkit for IntelliJ.
services: ''
documentationcenter: java
author: rmcmurray
manager: routlaw
editor: ''

ms.assetid: 
ms.service: multiple
ms.workload: na
ms.tgt_pltfrm: multiple
ms.devlang: Java
ms.topic: article
ms.date: 10/19/2017
ms.author: robmcm

---

# Sign-in instructions for the Azure Toolkit for IntelliJ

The Azure Toolkit for IntelliJ provides two methods for signing in to your Azure account:

  * **Automated**: You create a credentials file that you can use to automatically sign in to your Azure account.
  * **Interactive**: You enter your Azure credentials each time you sign in to your Azure account.

The following sections describe how to use each method.

[!INCLUDE [azure-toolkit-for-intellij-prerequisites](../includes/azure-toolkit-for-intellij-prerequisites.md)]

## Sign in to your Azure account automatically

This section walks you through creating a credentials file that contains your service principal data. After you have completed this process, Eclipse uses the credentials file to automatically sign you in to Azure each time you open your project.

1. Open your project with IntelliJ IDEA.

1. On the **Tools** menu, point to **Azure**, and then click **Azure Sign In**.

   ![The IntelliJ Azure Sign In command][A01]

1. In the **Azure Sign In** window, select **Automated**, and then click **New**.

   ![The Azure Sign In window with Automated selected][A02]

1. In the **Azure Login Dialog** window, enter your Azure credentials, and then click **Sign in**.

   ![The Azure Login Dialog window][A03]

1. In the **Create Authentication Files** window, select the subscriptions that you want to use, choose your destination directory, and then click **Start**.

   ![The Create Authentication Files window][A04]

1. In the **Service Principal Creation Status** dialog box, after your files have been created successfully, click **OK**.

   ![The Service Principal Creation Status dialog box][A05]

1. In the **Azure Sign In** window, click **Sign in**.

   ![Azure Log In Dialog Box][A06]

1. In the **Select Subscriptions** dialog box, select the subscriptions that you want to use, and then click **OK**.

   ![The Select Subscriptions dialog box][A07]

## Sign out of your Azure account after you have signed in automatically

After you have configured your account by using the preceding steps, the Azure Toolkit automatically signs you in to your Azure account each time you restart IntelliJ IDEA. However, to sign out of your Azure account and prevent the Azure Toolkit from signing you in automatically, do the following:

1. In IntelliJ IDEA, on the **Tools** menu, point to **Azure**, and then click **Azure Sign Out**.

   ![The IntelliJ Azure Sign Out command][L01]

1. In the **Azure Sign Out** confirmation window, click **Yes**.

   ![The Azure Sign Out confirmation window][L03]

## Sign in to your Azure account automatically by using an existing credentials file

If you sign out of your Azure account when you are using IntelliJ IDEA, you must use an existing credentials file to automatically sign back in to the account. To configure the Azure Toolkit for Eclipse to use an existing credentials file, do the following:

1. Open your project with IntelliJ IDEA.

1. On the **Tools** menu, point to **Azure**, and then click **Azure Sign In**.

   ![The IntelliJ Azure Sign In command][A01]

1. In the **Azure Sign In** window, select **Automated**, and then click **Browse**.

   ![The Azure Sign In window with Automated selected][A02]

1. In the **Select Authentication File** dialog box, select a previously created credentials file, and then click **Select**.

   ![The Select Authentication File dialog box][A08]

1. In the **Azure Sign In** window, click **Sign in**.

   ![The Azure Sign In window with Automated selected][A06]

1. In the **Select Subscriptions** dialog box, select the subscriptions that you want to use, and then click **OK**.

   ![The Select Subscriptions dialog box][A07]

## Sign in to your Azure account interactively

To sign in to Azure by manually entering your Azure credentials, do the following:

1. Open your project with IntelliJ IDEA.

1. Click **Tools**, point to **Azure**, and then click **Azure Sign In**.

   ![The IntelliJ Azure Sign In command][I01]

1. In the **Azure Sign In** window, select **Interactive**, and then click **Sign in**.

   ![The Azure Sign In window with Interactive selected][I02]

1. In the **Azure Log In** dialog box appears, enter your Azure credentials, and then click **Sign in**.

   ![The Azure Login Dialog window][I03]

1. In the **Select Subscriptions** dialog box, select the subscriptions that you want to use, and then click **OK**.

   ![The Select Subscriptions dialog box][I04]

## Sign out of your Azure account after you have signed in interactively

After you have configured your account by using the preceding steps, you will be automatically signed out of your Azure account each time you restart IntelliJ IDEA. However, if you want to sign out of your Azure account *without* restarting IntelliJ IDEA, do the following.

1. In IntelliJ IDEA, on the **Tools** menu, point to **Azure**, and then click **Azure Sign Out**.

   ![The IntelliJ Azure Sign Out command][L01]

1. In the **Azure Sign Out** confirmation window, click **Yes**.

   ![The Azure Sign Out confirmation window][L02]

## Next steps

[!INCLUDE [azure-toolkit-additional-resources](../includes/azure-toolkit-additional-resources.md)]

<!-- URL List -->

<!-- IMG List -->

[I01]: media/azure-toolkit-for-intellij-sign-in-instructions/I01.png
[I02]: media/azure-toolkit-for-intellij-sign-in-instructions/I02.png
[I03]: media/azure-toolkit-for-intellij-sign-in-instructions/I03.png
[I04]: media/azure-toolkit-for-intellij-sign-in-instructions/I04.png

[A01]: media/azure-toolkit-for-intellij-sign-in-instructions/A01.png
[A02]: media/azure-toolkit-for-intellij-sign-in-instructions/A02.png
[A03]: media/azure-toolkit-for-intellij-sign-in-instructions/A03.png
[A04]: media/azure-toolkit-for-intellij-sign-in-instructions/A04.png
[A05]: media/azure-toolkit-for-intellij-sign-in-instructions/A05.png
[A06]: media/azure-toolkit-for-intellij-sign-in-instructions/A06.png
[A07]: media/azure-toolkit-for-intellij-sign-in-instructions/A07.png
[A08]: media/azure-toolkit-for-intellij-sign-in-instructions/A08.png

[L01]: media/azure-toolkit-for-intellij-sign-in-instructions/L01.png
[L02]: media/azure-toolkit-for-intellij-sign-in-instructions/L02.png
[L03]: media/azure-toolkit-for-intellij-sign-in-instructions/L03.png
