<#
    .SYNOPSIS
    Get the best Azure region from a provided list of regions based on CO2 Signal emissions data.

    .DESCRIPTION
    Retrieves the best Azure region from a provided list of regions based on CO2 Signal emissions data.

    .PARAMETER Regions
    The list of Azure Regions to get the CO2 Signal value for.

    .PARAMETER AuthToken
    The CO2 Signal API token to use for authentication.

    .EXAMPLE
    Get-ElectricityMapsBestAzureRegion -Regions @("westeurope", "northeurope", "eastus") -AuthToken $token

    .EXAMPLE
    "westeurope", "northeurope", "eastus" | Get-ElectricityMapsBestAzureRegion -AuthToken $token

    .NOTES
    You will need to register an account for an API token from https://www.co2signal.com/ to use this function.

    .LINK
    https://github.com/cloudyspells/PSElectricityMaps/wiki/Get-ElectricityMapsBestAzureRegion

    .LINK
    https://docs.co2signal.com/#get-latest-by-geographic-coordinate

    .LINK
    https://docs.microsoft.com/en-us/powershell/module/az.resources/get-azlocation?view=azps-6.4.0

    .INPUTS
    System.String[]
    - The Azure Regions to get the CO2 Signal value for.

    .OUTPUTS
    System.Management.Automation.PSObject
    - Timestamp: The timestamp of the CO2 Signal data.
    - CarbonIntensity: The carbon intensity of the electricity.
    - CarbonIntensityUnit: The unit of measure of the carbon intensity value.
    - FossilFuelPercentage: The percentage of fossil fuel used to generate electricity.
    - Region: The Azure Region.
    - CountryCode: The country location code from CO2 Signal.

    
#>
function Get-ElectricityMapsBestAzureRegion {
    [CmdletBinding()]
    param (
        [Parameter(
            Mandatory = $true,
            ValueFromPipeline = $true,
            HelpMessage = "The list of Azure Regions to get the CO2 Signal value for."
            )]
        [ValidateNotNullOrEmpty()]
        [string[]]
        $Regions,

        [Parameter(
            Mandatory = $true,
            HelpMessage = "The CO2 Signal API token to use for authentication."
            )]
        [ValidateNotNullOrEmpty()]
        [string]
        $AuthToken
    )

    $regionData = @()
    foreach ($region in $Regions) {
        $regionData += Get-ElectricityMapsForAzureRegion -Region $region -AuthToken $AuthToken
    }

    $regionData | Sort-Object CarbonIntensity | Select-Object -First 1
}

Export-ModuleMember -Function Get-ElectricityMapsBestAzureRegion
