# TSIDeployScript

Deploys an IoT Hub and an Azure Time Series Insights PAYG environment to the specific subscription/RG with the specified parameters 

## Requirements
You'll need an Azure subscription and the AzureRm modules<br />

In admin mode Run Install-Module -Name Az.Resources -AllowClobber -Scope CurrentUser

You may need to first uninstall old versions by running Uninstall-AzureRm in admin mode

## Args
Your desired TS ID(s) this MUST be position 0 and if entering a composite TS ID use a comma as the separator<br />
Azure Subscription ID <br />
Azure Resource Group Name <br />
Name of the Azure Time Series Insights PAYG environment<br />
Your desired timestamp<br />
Path to your ARM template parameters<br />
Path to your ARM template<br />

## Example
.\Deploy.ps1 -tsIDs series_id, id -timestamp timestamp -subscriptionId 05aea7c9-25e9-4b5d-aeb5-fd0713992c6b -resourceGroupName ZetaRG -environmentName Zeta -pathToParams .\params.json -pathToTemplate .\deploy.json
