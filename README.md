# Welcome to your Starter Kit Template

This starter kit deploys a static website using Azure Blob storage. Starter kits are meant as a learning
and experimentation tool. 

## Prerequisites

When you are reading this, you have already successfully provisioned the "Starter Kit" building block
from Likvid Bank's Cloud Foundation Portal (meshStack). You now have

- An Azure Subscription in our "Sandbox" Landing Zone
- This GitHub repository, containing
    - a sample website html code in [index.html](./index.html)
    - a GitHub actions deployment pipeline [.github/workflows/deploy.yml](.github/workflows/deploy.yml) deploying this website via terraform to your subscription

## Using this Starter Kit

### Level 1 - Change the HTML and API

This repo is used as a starter for a _very basic_ web application with an API.

Let's verify that this starter kit works. Go ahead and make some changes to [src/index.html](./src/index.html) and open a pull request.

You should see the deployment pipeline running and the changes go live in a dedicated preview environment a few seconds afterwards.
You will see the URL for your preview environment added as a comment to your PR once the build is completed.

> [Azure Static Web Apps](https://docs.microsoft.com/azure/static-web-apps/overview) allows you to easily build Javascript apps in minutes.
> Use this repo with the [Add an API to Static Web Apps with Azure Functions](https://docs.microsoft.com/azure/static-web-apps/add-api?tabs=vanilla-javascript) article to build and customize the static site.

The API in this example is implemeted as a serverless Azure Function. You can edit it at [api/GetMessage/index.js](./api/GetMessage/index.js).

### Level 2 - Change the Pipeline

This example is simple on purpose and doesn't do much validation in the deployment pipeline. You can add more steps
and checks in the pipeline if you want. See [.github/workflows/test.yml](./github/workflows/test.yml) for an example
of how to run playwright tests for your app in GitHub actions.

### Level 3 - Change the Infrastructure with Terraform

Before we make any changes head over to your Subscription and inspect the `app` resource group, where you will find
the static website and its resources on Azure Portal.

Now let's try changing the infrastructure of our app, for example by adding a custom domain using a [`azurerm_static_site_domain`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/static_site_custom_domain) resource to
[main.tf](./main.tf). 

### Level 4 - Understand the Pipeline

There's a few elements that make the starter kit and its pipeline work with your Azure subscription.
These were setup for you (again, using terraform) by a building block provided by the Likvid Bank DevOps Toolchain team.
You can check out the source code of what was deployed for you at https://github.com/likvid-bank/likvid-cloudfoundation/tree/feature/starterkit/kit/buildingblocks/starterkit/buildingblock

You will find the infrastructure in the `ci-cd` resource group in your subscription.

The building block did set up for you

- a terraform state backend used by [backend.tf](backend.tf)
- a [UAMI](https://learn.microsoft.com/en-us/entra/identity/managed-identities-azure-resources/how-manage-user-assigned-managed-identities?pivots=identity-mi-methods-azp) used by [provider.tf](provider.tf)

## Next Steps

> When you are done with this starter kit, please remember to delete your project in meshStack.

Leveraging everything you've learned by now, you are now ready to get yourselves a cloud-native Landing Zone subscription, an empty GitHub repository and build
up a development environment tailored to your needs!

## Acknowledgements

This template reuses parts from the Azure static website template https://github.com/staticwebdev/vanilla-api
You can derive more similar starter templates from https://github.com/staticwebdev/ - feel free to make your own!
