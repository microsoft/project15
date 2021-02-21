# Deploying Project 15 from Microsoft Open Platform in 3 steps

This document walks through :

- How to deploy Project 15 from Microsoft Open Platform

1. Start Deployment with Azure Resource Manager (ARM) Template
1. Run Post Deployment Script

## Requirements

- Azure Subscription  
    If you do not have Azure Subscription, please create an account for free (12 months)  
    <https://azure.microsoft.com/free/>  
    You must be an administrator or an owner of the subscription  
- A PC with Web Browser

## 1. ARM Template Deployment

Click **Deploy to Azure** button below  

<a href="https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fmicrosoft%2Fproject15%2Fmaster%2FDeploy%2Fazuredeploy.json" target="_blank"><img src="deploy-to-azure.svg"/></a>

> [!TIP]  
> Right click the button below and select **Open link in new tab** or **Open lin in new window**

## 2. Deploy Open Platform solution

![Deployment 01](media/Deployment-01.png)

1. Select Subscription (if you have more than one)  

    If you do not have Azure Subscription, please create an account for free for 12 months

    <https://azure.microsoft.com/free/>  

1. Create a new resource Group  

    A resource group is a container that holds related resources for an Azure solution. Similar to folder and files.

    Open the dialog box by clicking `Create new` and give a unique name such as `MyOpenPlatformSolution`  

1. Select Region nearest to you

1. Select Unique ID  

    Some Azure services and names such as web site URL require globally unique ID.  The default is a random string based on the resource group.  You may enter your own unique ID string.

    - Minimum 5 characters
    - Maximum 12 characters
    - Alphanumeric characters only (no special characters)

1. If you are interested in adding Azure Digital Twins, set `Azure Digital Twins` = true  

1. Click `Review + create`, then click `Create` to start deployment  

    > [!TIP]  
    > Azure Portral validates your parameters, etc.
    > Some services may not be available in the region you selected.  Please select other regions.

### Review and Create Open Platform Solution

Typically the deployment process takes about 10 minutes.

![Deployment 05](media/Deployment-05.png)

Ensure there is no error reported

![Deployment 06](media/Deployment-06.png)

## 3. Post Deployment

Some Azure services require additional settings, such as permission and access control. We will complete deployment by running a script in Cloud Shell.

1. Switch to `Outputs`  

    > [!TIP]  
    > You can always go to Deployment Outputs page in Azure Portal.  
    > Navigate to `Resource Group` and select `Deployment`

1. Copy `postDeploymentCommand` by clicking blue button next to the command line

    ![Deployment 07](media/Deployment-07.png)

1. Launch Cloud Shell  

    Open a new browser tab or window, then navigate to <https://shell.azure.com>

    <a href="https://shell.azure.com" target="_blank"><img src="./media/launchcloudshell.png"/></a>

    > [!TIP]  
    > If you have multiple subscriptions, please select the subscription used to deploy Open Platform solution.
    >  
    > If this is the first time for you to start `Cloud Shell`, you will see the following dialog.  
    >  
    > Select subscription and click `Create storage`  
    >
    > ![Deployment 08](media/Deployment-08.png)

1. Ensure to select `Bash` from the list  

    ![Deployment 09](media/Deployment-09.png)

1. Paste `Post Deployment Script` from above step then execute by pressing `Enter` key

    ![Deployment 10](media/Deployment-10.png)

1. The command takes about 1~2 minutes to complete  

    You may close `Cloud Shell` now.

    ![Deployment 11](media/Deployment-11.png)

1. Open a new browser window or tab, then navigate to the web site using URL from `Outputs`  

    You can find `_Web_Site_Address` in `Outputs` of the deployment

    ![Deployment 12](media/Deployment-12.png)

1. Confirm the web site is up and accessible

    ![Deployment 13](media/Deployment-13.png)

## Next Step

- [Brief introduction](OpenPlatformPortal.md) of Open Platform Portal
- [Connect a device](ConnectingDevice.md) to the Open Platform web application
- Developers : Learn more technical details of the Open Platform Open Platform Developer Guide : [Architecture Overview](../Developer-Guide/Architecture-Overview.md)

[Project 15 from Microsoft - Open Platform](../README.md)
