# Get-ElectricityMapsForAzureRegion

## SYNOPSIS
Get ElectricityMaps value for Azure Region

## SYNTAX

```
Get-ElectricityMapsForAzureRegion [-Region] <String> [-AuthToken] <String> [<CommonParameters>]
```

## DESCRIPTION
Retrieves the ElectricityMaps value for the specified Azure Region.

## EXAMPLES

### EXAMPLE 1
```
Get-ElectricityMapsForAzureRegion -Region "westeurope" -AuthToken $token
```

### EXAMPLE 2
```
"westeurope" | Get-ElectricityMapsForAzureRegion -AuthToken $token
```

## PARAMETERS

### -Region
The Azure Region to get the ElectricityMaps value for.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -AuthToken
The ElectricityMaps API token to use for authentication.

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

### System.String
### - The Azure Region to get the ElectricityMaps value for.
## OUTPUTS

### System.Management.Automation.PSObject
### - Timestamp: The timestamp of the ElectricityMaps data.
### - CarbonIntensity: The carbon intensity of the electricity.
### - CarbonIntensityUnit: The unit of measure of the carbon intensity value.
### - FossilFuelPercentage: The percentage of fossil fuel used to generate electricity.
### - Region: The Azure Region.
### - CountryCode: The country location code from ElectricityMaps.
## NOTES
You will need to register an account for an API token from https://www.co2signal.com/ to use this function.
You will also need a connected Azure PowerShell session.

## RELATED LINKS

[https://github.com/cloudyspells/PSElectricityMaps/wiki/Get-ElectricityMapsForAzureRegion](https://github.com/cloudyspells/PSElectricityMaps/wiki/Get-ElectricityMapsForAzureRegion)

[https://docs.co2signal.com/#get-latest-by-geographic-coordinate](https://docs.co2signal.com/#get-latest-by-geographic-coordinate)

[https://docs.microsoft.com/en-us/powershell/module/az.resources/get-azlocation?view=azps-6.4.0](https://docs.microsoft.com/en-us/powershell/module/az.resources/get-azlocation?view=azps-6.4.0)

