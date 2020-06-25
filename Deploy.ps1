$subscription = $args[0]
$resourceGroupName = $args[1]
$environmentName = $args[2]
$deploymentNamePrefix = $environmentName + "deployment"
$tsID = @(
       [pscustomobject]@{name=$args[3] ;type='string'}
   )
$timestamp = $args[4]
$pathToParams = $args[5]
$pathToTemplate = $args[6]


 Connect-AzAccount

Set-AzContext -SubscriptionId $subscription

$a = Get-Content $pathToParams | ConvertFrom-Json
$a.parameters.environmentTimeSeriesIdProperties.value = $tsID
$a.parameters.iotHubName.value = $environmentName + "hub"
$a.parameters.environmentName.value = $environmentName
$a.parameters.eventSourceName.value = $environmentName + "eventSource"
$a.parameters.eventSourceTimestampPropertyName.value = $timestamp

$a | ConvertTo-Json -depth 32| set-content $pathToParams


New-AzResourceGroupDeployment -Name ($deploymentNamePrefix -join $i) -ResourceGroupName $resourceGroupName -TemplateFile  $pathToTemplate `
  -TemplateParameterFile $pathToParams `






