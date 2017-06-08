[CmdletBinding()]
param(
[Parameter(Position=0, Mandatory=$true ,ValueFromPipeline = $true, ParameterSetName="AMLWebService", HelpMessage="Azure Machine Learning Web Service Request-Response URL [e.g. https://ussouthcentral.services.azureml.net/subscriptions/456/services/123/execute?api-version=2.0&format=swagger]")] [string] $apiURL
,[Parameter(Position=1, Mandatory=$true ,ValueFromPipeline = $true, ParameterSetName="AMLWebService", HelpMessage="Azure Machine Learning Web Service Primary Key [e.g. ABCxxx000++==]")] [string] $apiKey
,[Parameter(Position=2, Mandatory=$true ,ValueFromPipeline = $true, ParameterSetName="AMLWebService", HelpMessage="Azure Machine Learning Web Service Input JSON [e.g. {`"Inputs`":{}...]")] [string] $inputJSON
)

<#
Write-Host $apiURL
Write-Host $apiKey
Write-Host $inputJSON
#>

Invoke-AmlWebServiceRRSEndpoint -ApiLocation $apiURL -ApiKey $apiKey -InputJsonText $inputJSON -OutVariable $ignoreOutput
