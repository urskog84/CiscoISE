$ModuleManifestName = 'CiscoISE.psd1'
$ModuleManifestPath = "$PSScriptRoot\..\$ModuleManifestName"

Describe 'Module Manifest Tests' {
    It 'Passes Test-ModuleManifest' {
        Test-ModuleManifest -Path $ModuleManifestPath
        $? | Should Be $true
    }
}


$crdISE = Get-Credential 

Remove-Module CiscoISE
Import-Module \\ad01\it\TU-Soft\Powershell\Module\CiscoISE



Get-CiscoISE-Endpoints -ISEserver "nrkapise002.migrationsverket.se" -Credential $crdISE

Get-CiscoISE-InternalUsers -ISEserver "nrkapise002.migrationsverket.se" -Credential $crdISE

Get-CiscoISE-EndpointIdentityGroups -ISEserver "nrkapise002.migrationsverket.se" -Credential $crdISE

Get-CiscoISE-Identitygroup -ISEserver "nrkapise002.migrationsverket.se" -Credential $crdISE

Get-CiscoISE-Portals -ISEserver "nrkapise002.migrationsverket.se" -Credential $crdISE
