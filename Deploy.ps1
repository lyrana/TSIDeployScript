$subscription = $args[0]
$environmentName = $args[2]
$deploymentNamePrefix = $environmentName + "deployment"
$resourceGroupName = $args[1]
$pathToTemplate = $args[6]
$pathToParams = $args[5]

$tsID = @(
       [pscustomobject]@{name=$args[3] ;type='string'}
   )

# Connect-AzAccount

Set-AzContext -SubscriptionId $subscription

$a = Get-Content $pathToParams | ConvertFrom-Json
$a.parameters.environmentTimeSeriesIdProperties.value = $tsID
$a.parameters.iotHubName.value = $environmentName + "hub"
$a.parameters.environmentName.value = $environmentName
$a.parameters.eventSourceName.value = $environmentName + "eventSource"
$a.parameters.eventSourceTimestampPropertyName.value = $args[4]

$a | ConvertTo-Json -depth 32| set-content $pathToParams


New-AzResourceGroupDeployment -Name ($deploymentNamePrefix -join $i) -ResourceGroupName $resourceGroupName -TemplateFile  $pathToTemplate `
  -TemplateParameterFile $pathToParams `






