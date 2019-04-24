---
title: Sign In Instructions for the Azure Toolkit for Eclipse
description: Learn how to sign into Microsoft Azure by using the Azure Toolkit for Eclipse.
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

# Sign-in instructions for the Azure Toolkit for Eclipse

The Azure Toolkit for Eclipse provides two methods for signing into your Azure account:

  - [Sign in to your Azure account by Device Login](#sign-in-to-your-azure-account-by-device-login)
  - [Sign in to your Azure account by Service Principal](#sign-in-to-your-azure-account-by-service-principal)

[**Sign out**](#sign-out-of-your-azure-account) methods are also provided.

[!INCLUDE [azure-toolkit-for-eclipse-prerequisites](../includes/azure-toolkit-for-eclipse-prerequisites.md)]

## Sign in to your Azure account by Device Login

To sign in Azure by device login, do the following:

1. Open your project with Eclipse.

2. Click **Tools**, then click **Azure**, and then click **Sign In**.
   ![Eclipse Menu for Azure Sign In][I01]

3. In the **Azure Sign In** window, select **Device Login**, and then click **Sign in**.

   ![The Azure Sign In window with device login selected][I02]

4. Click **Copy&Open** in **Azure Device Login** dialog .

   ![The Azure Login Dialog window][I03]

5. In the browser, paste your device code (which has been copied when you click **Copy&Open** in last step) and then click **Next**.

   ![The device login browser][I04]

6. In the **Select Subscriptions** dialog box, select the subscriptions that you want to use, and then click **OK**.

   ![The Select Subscriptions dialog box][I05]

## Sign in to your Azure account by Service Principal

This section walks you through creating a credentials file that contains your service principal data. After you have completed this process, Eclipse uses the credentials file to automatically sign you in to Azure when open your project.

1. Open your project with Eclipse.

2. Click **Tools**, then click **Azure**, and then click **Sign In**.
   ![The Eclipse Azure Sign In command][A01]

3. In the **Azure Sign In** window, select **Service Principal**, and then click **New**.

   ![The Azure Sign In window with service principal selected][A02]

4. Click **Copy&Open** in **Azure Device Login** dialog .

   ![The Azure Login Dialog window][A08]

5. In the browser, paste your device code (which has been copied when you click **Copy&Open** in last step) and then click **Next**.

   ![The device login browser][A03]

6. In the **Create Authentication Files** window, select the subscriptions that you want to use, choose your destination directory, and then click **Start**.

   ![The Create Authentication Files window][A04]

7. In the **Service Principal Creation Status** dialog box, click **OK** after your files have been created successfully.

   ![The Service Principal Creation Status dialog box][A05]

8. In the **Azure Sign In** window, click **Sign in**. 

   ![Azure Log In Dialog Box][A06]

9. In the **Select Subscriptions** dialog box, select the subscriptions that you want to use, and then click **OK**.

   ![The Select Subscriptions dialog box][A07]

> Once you created the service principal authentication file, you could start from step 8, choose your authentication file and sign in.

## Signing out of your Azure account when you signed in interactively

After you have configured the steps in the previous section, you will automatically signed out of your Azure account each time you restart Eclipse. However, if you want to sign out of your Azure account without restarting Eclipse, use the following steps.

1. In Eclipse, click **Tools**, then click **Azure**, and then click **Sign Out**.

   ![Eclipse Menu for Azure Sign Out][L01]

2. When the **Azure Sign Out** dialog box appears, click **Yes**.

   ![Sign Out Dialog Box][L02]

## Next steps

[!INCLUDE [azure-toolkit-for-eclipse-additional-resources](../includes/azure-toolkit-for-eclipse-additional-resources.md)]

<!-- URL List -->


<!-- IMG List -->

[I01]: media/azure-toolkit-for-eclipse-sign-in-instructions/I01.png
[I02]: media/azure-toolkit-for-eclipse-sign-in-instructions/I02.png
[I03]: media/azure-toolkit-for-eclipse-sign-in-instructions/I03.png
[I04]: media/azure-toolkit-for-eclipse-sign-in-instructions/I04.png
[I05]: media/azure-toolkit-for-eclipse-sign-in-instructions/I05.png

[A01]: media/azure-toolkit-for-eclipse-sign-in-instructions/A01.png
[A02]: media/azure-toolkit-for-eclipse-sign-in-instructions/A02.png
[A03]: media/azure-toolkit-for-eclipse-sign-in-instructions/A03.png
[A04]: media/azure-toolkit-for-eclipse-sign-in-instructions/A04.png
[A05]: media/azure-toolkit-for-eclipse-sign-in-instructions/A05.png
[A06]: media/azure-toolkit-for-eclipse-sign-in-instructions/A06.png
[A07]: media/azure-toolkit-for-eclipse-sign-in-instructions/A07.png
[A08]: media/azure-toolkit-for-eclipse-sign-in-instructions/A08.png

[L01]: media/azure-toolkit-for-eclipse-sign-in-instructions/L01.png
[L02]: media/azure-toolkit-for-eclipse-sign-in-instructions/L02.png
[L03]: media/azure-toolkit-for-eclipse-sign-in-instructions/L03.png
