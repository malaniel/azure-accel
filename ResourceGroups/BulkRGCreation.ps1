### Mandatory Parameters to ask for at script execution
Param(
    [Parameter(Mandatory=$true)][string]$InputFile
      ) 
      

$sub = Get-AzSubscription -SubscriptionId "ed032c55-ba85-407d-94a1-d0cdfdd76119"
$tenant = Get-AzTenant -TenantId 053f3d4a-8065-45e0-bf11-bb0dbf293522
Set-AzContext -SubscriptionID $sub.SubscriptionId

$InputFile = ".\ResourceGroupList.csv"
$grouplist = Import-Csv $InputFile
$grouplist |ForEach-Object{
$newgroup = New-AzResourceGroup -Name $_.RGName -Location $_.Location -Tag @{ "Environment" = $_.ENV; "Department" = $_.Department }
Write-Output $newgroup.ResourceGroupName
}



