# TSIDeployScript

Deploys an IoT Hub and an Azure Time Series Insights PAYG environment into East US in the specific subscription/RG with the specified parameters 

## Required Args
Azure Subscription ID
Azure Resource Group Name
Name of the Azure Time Series Insights PAYG environment
Your desired TS ID
Your desired timestamp
Path to your ARM template parameters
Path to your ARM template

## Example
.\Deploy.ps1 23aea7c9-25e9-4b5d-aeb5-fd0713992c6b Omicron Omicron "data.items.id" "data.items.datapoints.time" "C:\Repos\TSIDeployScript\WithIotHub\params.json" "C:\Repos\TSIDeployScript\WithIotHub\deploy.json"
