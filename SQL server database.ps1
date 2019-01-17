$resourcegroupname = "LenoraRG"

$location = "EastUs"

$adminlogin = "lenoraserver"

$password = "Lenora@123"

$servername = "lenoraserver"

$databasename = "lenoradatabase"

$startip = "183.82.98.101"

$endip = "183.82.98.101"

$resourcegroup = New-AzureRmResourceGroup -Name $resourcegroupname -Location $location

$server = New-AzureRmSqlServer -ResourceGroupName $resourcegroupname `
    -ServerName $servername `
    -Location $location `
    -SqlAdministratorCredentials $(New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $adminlogin, $(ConvertTo-SecureString -String $password -AsPlainText -Force))

$serverfirewallrule = New-AzureRmSqlServerFirewallRule -ResourceGroupName $resourcegroupname `
    -ServerName $servername `
    -FirewallRuleName "AllowedIPs" -StartIpAddress $startip -EndIpAddress $endip

$database = New-AzureRmSqlDatabase  -ResourceGroupName $resourcegroupname `
    -ServerName $servername `
    -DatabaseName $databasename `
    -RequestedServiceObjectiveName "S0" `
    -SampleName "AdventureWorksLT"

