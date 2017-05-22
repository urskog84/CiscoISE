function Get-CiscoISE-Endpoints {   
    [OutputType([system.object[]])]
    [cmdletbinding()]
    param(
        [Parameter(Mandatory = $true, HelpMessage = 'ISE server')]
        [string]$ISEserver = (Read-Host -Prompt 'Cisco Identity Services Engine Hostname'),
        [Parameter(ValueFromPipeline)]
        [int]$ISEport = '9060',
        [Parameter(Mandatory = $true, HelpMessage = 'Credentials')]
        [ValidateNotNullorEmpty()]
        [System.Management.Automation.PSCredential]$Credential
        )

    Begin {
        $Uri = "https://" + $ISEserver +":" + $ISEport + "/ers/config/endpoint"
        $Headers = Get-Headers -Credential $Credential -Accept 'application/vnd.com.cisco.ise.identity.endpoint.1.0+xml'
        }

    Process {
        [Xml]$Response = Invoke-RestMethod -Uri $Uri -Method "Get" -Headers $Headers 
        return $Response.searchResult.resources.resource
    }
}
    