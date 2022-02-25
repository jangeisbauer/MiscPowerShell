# Function to pull TenantID based by providing the TenantName 
# for a tenant URL like 'microsoft.onmicrosoft.com', provide 'microsoft' at the prompt of the function
# Author: @jangeisbauer

$tenantName = Read-Host Tanant name 
function Get-TenantIDbyName {
    [CmdletBinding()]
    param (
        [string]$tenantName
    )
    $r=Invoke-RestMethod "https://login.microsoftonline.com/$tenantName.onmicrosoft.com/.well-known/openid-configuration"
    [regex]::match($r.token_endpoint,'https://login.microsoftonline.com/(.*?)/oauth2/token').Groups[1].Value
}
Get-TenantIDbyName -tenantName $tenantName
