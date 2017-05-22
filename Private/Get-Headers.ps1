Function Get-Headers{
    Param(
    [Parameter(Mandatory = $true,Position = 0,HelpMessage = 'Credentials')]
    [ValidateNotNullorEmpty()]
    [System.Management.Automation.PSCredential]$Credential,
    [Parameter(Mandatory=$true,Position = 1, HelpMessage = 'AcceptKey')]
    [String] $Accept
    )
Process {
    $basicAuthValue = [Convert]::ToBase64String([Text.Encoding]::ASCII.GetBytes(("{0}:{1}" -f $Credential.GetNetworkCredential().UserName,$Credential.GetNetworkCredential().Password)))
    $basicAuthValue = "Basic "+$basicAuthValue
    $headers = @{ 
        Authorization = $basicAuthValue 
        Accept = $Accept
        }
    return $headers
    }
}