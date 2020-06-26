param(
    [Parameter(Position = 0)]
    [string[]]$tsIDs,
    [string]$subscriptionId,
    [string]$resourceGroupName,
    [string]$environmentName,
    [string]$timestamp,
    [string]$pathToParams,
    [string]$pathToTemplate
    )

$deploymentNamePrefix = $environmentName + "deployment"
$tsIDArray= @()

foreach ($id in $tsIDs)  
{ 
    $tsId = [pscustomobject]@{name=$id ;type='string'}
    $tsIDArray += $tsID
}


Connect-AzAccount

Set-AzContext -SubscriptionId $subscriptionId

$a = Get-Content $pathToParams | ConvertFrom-Json
$a.parameters.environmentTimeSeriesIdProperties.value = $tsIDArray
$a.parameters.iotHubName.value = $environmentName + "hub" + [guid]::NewGuid()
$a.parameters.environmentName.value = $environmentName
$a.parameters.eventSourceName.value = $environmentName + "eventSource"
$a.parameters.eventSourceTimestampPropertyName.value = $timestamp

$a | ConvertTo-Json -depth 32| set-content $pathToParams

New-AzResourceGroupDeployment -Name $deploymentNamePrefix -ResourceGroupName $resourceGroupName -TemplateFile  $pathToTemplate `
  -TemplateParameterFile $pathToParams `






