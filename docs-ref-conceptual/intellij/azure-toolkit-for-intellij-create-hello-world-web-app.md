---
title: Create a Hello World web app for Azure using IntelliJ
description: This tutorial shows you how to use the Azure Toolkit for IntelliJ to create a Hello World Web App for Azure.
services: app-service
documentationcenter: java
author: selvasingh
manager: routlaw
editor: ''

ms.assetid: 75ce7b36-e3ae-491d-8305-4b42ce37db4e
ms.author: robmcm;asirveda
ms.date: 02/01/2018
ms.devlang: java
ms.service: app-service
ms.tgt_pltfrm: multiple
ms.topic: article
ms.workload: web
---

# Create a Hello World web app for Azure using IntelliJ

This tutorial shows how to create and deploy a basic Hello World application to Azure as a web app by using the [Azure Toolkit for IntelliJ].

> [!NOTE]
>
> For a version of this article that uses the [Azure Toolkit for Eclipse], see [Create a Hello World web app for Azure using Eclipse][eclipse-hello-world].
>

> [!IMPORTANT]
> 
> The Azure Toolkit for IntelliJ was updated in August 2017 with a different workflow. This article illustrates creating a Hello World web app by using version 3.0.7 (or later) of the Azure Toolkit for IntelliJ. If you are using the version 3.0.6 (or earlier) of the toolkit, you will need to follow the steps in [Create a Hello World web app for Azure in IntelliJ using the legacy toolkit][Legacy Version].
> 

When you have completed this tutorial, your application will look similar to the following illustration when you view it in a web browser:

![Preview of Hello World app][browse-web-app]

[!INCLUDE [azure-toolkit-for-intellij-prerequisites](../includes/azure-toolkit-for-intellij-prerequisites.md)]

## Create a new web app project

1. Start IntelliJ, and sign into your Azure account by using the instructions in the [Azure Sign In Instructions for the Azure Toolkit for IntelliJ][intelliJ-sign-in-instructions] article.

1. Click the **File** menu, then click **New**, and then click **Project**.
   
   ![Create New Project][file-new-project]

1. In the **New Project** dialog box, select **Maven**, then **maven-archetype-webapp**, and then click **Next**.
   
   ![Choose Maven archetype webapp][maven-archetype-webapp]
   
1. Specify the **GroupId** and **ArtifactId** for your web app, and then click **Next**.
   
   ![Specify GroupId and ArtifactId][groupid-and-artifactid]

1. Customize any Maven settings or accept the defaults, and then click **Next**.
   
   ![Specify Maven settings][maven-options]

1. Specify your project name and location, and then click **Finish**.
   
   ![Specify project name][project-name]

1. Within IntelliJ's Project Explorer view, expand **src**, then **main**, then **webapp**, and then double-click **index.jsp**.
   
   ![Open index page][open-index-page]

1. When your index.jsp file opens in IntelliJ, add in text to dynamically display **Hello World!** within the existing `<body>` element. Your updated `<body>` content should resemble the following example:
   
   ```java
   <body><b><% out.println("Hello World!"); %></b></body>
   ``` 

   ![Edit index page][edit-index-page]

1. Save index.jsp.

## Deploy your web app to Azure

1. Within IntelliJ's Project Explorer view, right-click your project, choose **Azure**, and then choose **Run on Web App**.
   
   ![Run on web app menu][run-on-web-app-menu]

1. In the Run on Web App dialog box, you can choose one of the following options:

   * Choose an existing web app (if one exists), and then click **Run**.

      ![Run on Web App dialog box][run-on-web-app-dialog]

   * Click **Create New Web App** from WebApp dropdown. If you choose to create a new web app, specify the requisite information for your web app, and then click **Run** after web app creation.

      ![Create new web app][create-new-web-app-dialog]

1. The toolkit will display a status message when it has successfully deployed your web app, which will also display the URL of your deployed web app.

   ![Successful deployment][successfully-deployed]

1. You can browse to your web app using the link provided in the status message.

   ![Browsing your web app][browse-web-app]

1. After you have published your web app, your settings will be saved as the default, and you can run your application on Azure by clicking the green arrow icon on the toolbar. You can modify your settings by clicking the drop-down menu for your web app and click **Edit Configurations**.

   ![Edit configuration menu][edit-configuration-menu]

1. When the **Run/Debug Configurations** dialog box is displayed, you can modify any of the default settings, and then click **OK**.

   ![Edit configuration dialog box][edit-configuration-dialog]

## Next steps

[!INCLUDE [azure-toolkit-for-intellij-additional-resources](../includes/azure-toolkit-for-intellij-additional-resources.md)]

For additional information about creating Azure Web Apps, see the [Web Apps Overview].

<!-- URL List -->

[Azure Toolkit for IntelliJ]: azure-toolkit-for-intellij.md
[Azure Toolkit for Eclipse]: ../eclipse/azure-toolkit-for-eclipse.md
[eclipse-hello-world]: ../eclipse/azure-toolkit-for-eclipse-create-hello-world-web-app.md
[Web Apps Overview]: /azure/app-service/app-service-web-overview
[Apache Tomcat]: http://tomcat.apache.org/
[Jetty]: http://www.eclipse.org/jetty/
[Legacy Version]: azure-toolkit-for-intellij-create-hello-world-web-app-legacy-version.md
[intelliJ-sign-in-instructions]: azure-toolkit-for-intellij-sign-in-instructions.md

<!-- IMG List -->

[file-new-project]: ./media/azure-toolkit-for-intellij-create-hello-world-web-app/file-new-project.png
[maven-archetype-webapp]: ./media/azure-toolkit-for-intellij-create-hello-world-web-app/maven-archetype-webapp.png
[groupid-and-artifactid]: ./media/azure-toolkit-for-intellij-create-hello-world-web-app/groupid-and-artifactid.png
[maven-options]: ./media/azure-toolkit-for-intellij-create-hello-world-web-app/maven-options.png
[project-name]: ./media/azure-toolkit-for-intellij-create-hello-world-web-app/project-name.png
[open-index-page]: ./media/azure-toolkit-for-intellij-create-hello-world-web-app/open-index-page.png
[edit-index-page]: ./media/azure-toolkit-for-intellij-create-hello-world-web-app/edit-index-page.png
[run-on-web-app-menu]: ./media/azure-toolkit-for-intellij-create-hello-world-web-app/run-on-web-app-menu.png
[run-on-web-app-dialog]: ./media/azure-toolkit-for-intellij-create-hello-world-web-app/run-on-web-app-dialog.png
[create-new-web-app-dialog]: ./media/azure-toolkit-for-intellij-create-hello-world-web-app/create-new-web-app-dialog.png
[successfully-deployed]: ./media/azure-toolkit-for-intellij-create-hello-world-web-app/successfully-deployed.png
[browse-web-app]: ./media/azure-toolkit-for-intellij-create-hello-world-web-app/browse-web-app.png
[edit-configuration-menu]: ./media/azure-toolkit-for-intellij-create-hello-world-web-app/edit-configuration-menu.png
[edit-configuration-dialog]: ./media/azure-toolkit-for-intellij-create-hello-world-web-app/edit-configuration-dialog.png
