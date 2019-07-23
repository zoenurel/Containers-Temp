cd .\LunchNLearn1-Intro\Excercises\105-Registry-Repos\AzureContainerRegistryDeployment


Login-AzAccount

Set-AzContext -SubscriptionName 'Engineering_LAB'

$rg = New-AzResourceGroup -Name dockerregistrylab -Location 'East US' -Tag @{environment = 'deleteme'}

New-AzResourceGroupDeployment -Name dockerregistrylab -ResourceGroupName $rg.ResourceGroupName -Mode Incremental -TemplateFile .\azuredeploy.json


