# CI/CD for MicroProfile applications to Azure using VSTS

This tutorial will show how Java EE developers can easily setup a CI/CD release cycle to deploy their [MicroProfile](http://microprofile.io) applications to an Azure Web App for Containers using VSTS.  In this example, we’ll be using a MicroProfile application that uses a [Payara Micro](https://www.payara.fish/payara_micro) instance.   We will start the VSTS containerize process by building a Docker image and pushing the container image to an Azure Container Register.  Then complete with a VSTS release pipeline to deploy the container image to a Web App.

## Prerequisites
- Copy and save the Git url from [Github](https://github.com/Azure-Samples/microprofile-hello-azure)
- Register or Log into your [VSTS](https://visualstudio.microsoft.com/team-services) account
- Create a new [VSTS project](https://docs.microsoft.com/en-us/vsts/organizations/projects/create-project?view=vsts&tabs=new-nav) using the above Git url 
- Create an [Azure Container Registry](https://azure.microsoft.com/en-us/services/container-registry) (ACR)
- Create an Azure Web App for Container
Note:  Select **Quickstart** for the Container Settings when provision the Web App instance


## Create a Build definition

The build definition in VSTS automatically executes all the tasks in the build each time there’s a commit in Java EE application source application.  In this example, VSTS will use Maven to build the Java MicroProfile project.

1. Click on the "Build and Release" tab on top your VSTS project page.  Then, select the **Builds** link 

2. Click on the **New Pipeline** button, and then **Continue** to start defining your build tasks
3. Select "Maven" from the list of templates, then click on the **Apply** button to build your Java project
4. Use the drop-down menu for the Agent pool field to select **Hosted Linux Preview** option.
Note:  This informs VSTS which build server to use.  
5. To configure your build for continuous integration, select the **Triggers** tab and check the **Enable continuous integration** checkbox.  
 
6. Select the **Tasks** tab to return back to the main build pipeline page
7. Use the **Save & queue** drop-down menu to select the **Save** option
 

## Create a Docker Build Image

In this task, VSTS uses a Dockerfile with a base image from Payara Micro to create a Docker image.  

1. Select the **Tasks** tab to return back to the main build pipeline page
2. Click on the **+** icon to add new task to the build definition
 
3. Select "Docker" from the list of templates, then click on the **Add** button
4. Verify that **Azure Container Registry** is selected in the drop-down menu for **Container registry type**.
Note:  if you are using Docker Hub or another registry, select **Container Registry** instead.  Then click on the **+ New** button to provide the credentials and connection information for it. Then skip to the Commands section to continue.
5. Use the **Azure subscription** drop-down menu to select your azure subscription ID.  Then click on the **Authorize** button
6. In the **Azure container registry** drop-down menu, select registry name you created in Azure.
7. Verify that **build** option is selected in the **Command** drop-down menu.
8. For the **Dockerfile**, click on the path navigation icon next to the textbox to select the Dockerfile from the github project.  Then click the **OK** button.
 
9. Under the **Image name**, check the **Include latest tag** checkbox. 
10. Use the **Save & queue** drop-down menu to select the **Save** option.

## Push Docker Image to ACR

In this task, VSTS will push the docker image to your Azure Container Registry.  This will be used to run the MicroProfile API application as a containerized Java web app.

1. Click on the **+** icon to add new task to the build definition
2. Select "Docker" from the list of templates, then click on the **Add** button
3. Change the **Display name** value to **Push an image**
4. Verify that **Azure Container Registry** is selected in the drop-down menu for **Container registry type**.
Note:  if you are using Docker Hub or another registry, select **Container Registry** instead.  Then click on the **+ New** button to provide the credentials and connection information for it. Then skip to the Commands section to continue.
5. Use the **Azure subscription** drop-down menu to select your azure subscription ID.
6. In the **Azure container registry** drop-down menu, select registry name you created in Azure.
7. Select **push** in the **Command** drop-down menu.
8. Click on the **Save & queue** tab, then select **Save & queue** option.
9. Verify that the **Hosted Linux Preview** is select for the Agent pool on the pop-up window.  Then click on the **Save & queue** button.
10. Click on the build number to verify that the build pipeline for the Java project completed successfully.
 

## Create a release definition for a Java app

The release pipeline in VSTS automatically triggers the deployment of build artifacts to a target environment like Azure as soon as the Build process completes successfully.   The release pipeline can be created for dev, test, staging or production environments.

1. Click on the "Build and release" tab on top your VSTS project page.  Then, select the **Releases** link.
 
2. Click on the "New pipeline** button
3. Select the **Deploy a Java app to Azure App Service** in the list of templates, then click on the **Apply** button.
 
4. Set a **Stage name** (e.g Dev, Test, Staging or Production).  Then click on the **X** button to close the pop-up window
5. Click on the **+ Add** button in the Artifacts section.  This will link artifacts from the build definition to this release definition.  
6. Use the drop-down menu for the **Source (build pipeline)** to select your build definition. Then click the **Add** button to continue.
 
7. Click on the **Tasks** tab on the pipeline.  Then, select your stage name.
 

8. Use the **Azure subscription** drop-down menu to select your azure subscription ID.
9. Select **Linux App** from the **App type** drop-down menu
10. Select the name of the Web App for Container instance you created above in the **App service name** drop-down menu
11. Enter the name of your azure container registry in the **Registry or Namespaces** field.  E.g **myregistry.azure.io**
12. Enter the registry name in the **Repository** field
13. Click on **Run on agent**.  Select **Hosted Linux Preview** in the Agent pool drop-down menu
 
14. Click on the **Variables** tab.  Then click on the **+ Add** button to define your environment variables
15. Add the variable name and values for your container registry url, username and password.   For security, click on the lock icon to keep the password value hidden.

For example:
- registry.password
- registry.url
- registry.username

 

16. Click on the **Tasks** tab to return to the main release pipeline definition page
17. Click on **Deploy Azure App Service**.  Enter the tag for the container image in the **Tag** textbox 
 
18. Expand the **Application and Configuration Settings** section, then click on the navigation path for the **App Settings** field to add environments variable to connect to the container registry during deployment.
19. Click on the ** + Add** button to define the following app settings and assign the environment variables
- DOCKER_REGISTRY_SERVER_PASSWORD = $(registry.password)
- DOCKER_REGISTRY_SERVER_URL = $(registry.url)
- DOCKER_REGISTRY_SERVER_USERNAME = $(registry.username)
 
20. Click on the **OK** button to continue
21. To enable continuous deployment, click the **Pipelines** tab
22. In the Artifacts section, click on the lightening icon.  Then set the **Continuous deployment trigger** to Enabled.

 
23. Click on the **Save** button, then the **OK** button 
 
24. Click on the **+ Release** drop-down menu, then select **Create a release** link
25. Click on the release number.  Then hover your mouse cursor over the stage name and click on the **Deploy** button
 
26. The click on the **Deploy** button on the pop-up window to start the deployment process to Azure


## Test the Java Web Application
1. Open a web browser and paste your web app url:  
https://{your-app-service-name}.azurewebsites.net/api/hello

 

2. The web page should say **Hello Azure!**
 




