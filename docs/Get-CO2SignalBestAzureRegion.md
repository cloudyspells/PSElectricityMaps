# Get-ElectricityMapsBestAzureRegion

## SYNOPSIS
Get the best Azure region from a provided list of regions based on CO2 Signal emissions data.

## SYNTAX

```
Get-ElectricityMapsBestAzureRegion [-Regions] <String[]> [-AuthToken] <String> [<CommonParameters>]
```

## DESCRIPTION
Retrieves the best Azure region from a provided list of regions based on CO2 Signal emissions data.

## EXAMPLES

### EXAMPLE 1
```
Get-ElectricityMapsBestAzureRegion -Regions @("westeurope", "northeurope", "eastus") -AuthToken $token
```

### EXAMPLE 2
```
"westeurope", "northeurope", "eastus" | Get-ElectricityMapsBestAzureRegion -AuthToken $token
```

## PARAMETERS

### -Regions
The list of Azure Regions to get the CO2 Signal value for.

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -AuthToken
The CO2 Signal API token to use for authentication.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### System.String[]
### - The Azure Regions to get the CO2 Signal value for.
## OUTPUTS

### System.Management.Automation.PSObject
### - Timestamp: The timestamp of the CO2 Signal data.
### - CarbonIntensity: The carbon intensity of the electricity.
### - CarbonIntensityUnit: The unit of measure of the carbon intensity value.
### - FossilFuelPercentage: The percentage of fossil fuel used to generate electricity.
### - Region: The Azure Region.
### - CountryCode: The country location code from CO2 Signal.
## NOTES
You will need to register an account for an API token from https://www.ElectricityMaps.com/ to use this function.

## RELATED LINKS

[https://github.com/cloudyspells/PSElectricityMaps/wiki/Get-ElectricityMapsBestAzureRegion](https://github.com/cloudyspells/PSElectricityMaps/wiki/Get-ElectricityMapsBestAzureRegion)

[https://docs.co2signal.com/#get-latest-by-geographic-coordinate](https://docs.co2signal.com/#get-latest-by-geographic-coordinate)

[https://docs.microsoft.com/en-us/powershell/module/az.resources/get-azlocation?view=azps-6.4.0](https://docs.microsoft.com/en-us/powershell/module/az.resources/get-azlocation?view=azps-6.4.0)

