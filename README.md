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

### Level 1 - Change the HTML

Let's verify that this starter kit works. Go ahead and make some changes to [index.html](./index.html)
You should see the deployment pipeline running

### Level 2 - Change the Terraform

Now let's add another file to the website. In this simple example, this means editing the terraform code in 
[main.tf](./main.tf). 

### Level 3 - Change the Pipeline

This example is simple on purpose and doesn't do much validation in the deployment pipeline. You can add more steps
and checks in the pipeline if you want

### Level 4 - Understand the Pipeline

There's a few elements that make this example work. These were setup for you (again, using terraform) by a building
block managed outside of this repository. You can check out the source code at https://github.com/likvid-bank/likvid-cloudfoundation/tree/feature/starterkit/kit/buildingblocks/starterkit/buildingblock

You will find the infrastructure in the `ci-cd` resource group in your subscription.

The building block did set up for you

- a terraform state backend used by [backend.tf](backend.tf)
- a [UAMI](https://learn.microsoft.com/en-us/entra/identity/managed-identities-azure-resources/how-manage-user-assigned-managed-identities?pivots=identity-mi-methods-azp) used by [provider.tf](provider.tf)

## Next Steps

> When you are done with this starter kit, please remember to delete your project in meshStack.

Leveraging everything you've learned by now, you are now ready to get yourselves a cloud-native Landing Zone subscription, an empty GitHub repository and build
up a development environment tailored to your needs!
