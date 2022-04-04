param (
    # Azure DevOps organization where you want to create this HOL resources
    [parameter(mandatory=$true)]
    [string]$orgName = '<orgName>',

    # Azure DevOps organization where you want to create this HOL resources
    [parameter(mandatory=$true)]
    [string]$projectName = '<projectName>',
    
    # ID of the Azure Subscription where you want to create this HOL resources
    [parameter(mandatory=$true)]
    [string]$subscriptionId = '<subscriptionId>',

    # prefix project 3 letters
    [parameter(mandatory=$true)]
    [string]$prefixProjectName = '<prefixProjectName>',

    # ID of the Azure Subscription where you want to create this HOL resources
    [string]$configsTemplate = 'quickstart/configs/cloud-setup/template.json',

    # ID of the Azure Subscription where you want to create this HOL resources
    [string]$configsOutput = 'quickstart/configs/cloud-setup/hol.json'
)

$projectAlias = $prefixProjectName
Write-Output "Project alias generated: " $projectAlias.ToLower()

(Get-Content $configsTemplate) `
    -replace '<projectName>', $projectName `
    -replace '<projectAlias>', $projectAlias.ToLower() `
    -replace '<orgName>', $orgName `
    -replace '<subscriptionId>', $subscriptionId |
  Out-File $configsOutput





