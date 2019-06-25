$resgrps = Get-AzResourceGroup |Where-Object {$_.ResourceGroupName -like "AHSCC*"}
ForEach ($grp in $resgrps)
{Remove-AzResourceGroup -Name $grp.ResourceGroupName -Force
}