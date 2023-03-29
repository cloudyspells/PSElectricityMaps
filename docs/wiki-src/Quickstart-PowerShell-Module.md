# PSElectricityMaps PowerShell Module Quickstart

This PowerShell module is intended for retrieving emissions data from
[ElectricityMaps](https://www.ElectricityMaps.com/) for a supplied Azure Region
during resource deployments. This is a lightweight solution making use of only
the limited functionality available with a free account at _ElectricityMaps_.
This means the module is only able to get near-realtime emissions data and no
prodictive values. This means this module is _not_ a real solution for reduced
carbon deployments and -software. It _does_ however provide some nice realtime
values so you can simulate the beheaviour of deployments and software based on
emissions data without the cost of a paid account for such data. For example in
lab- or proof of concept environments.

**NOTE:** ElectricityMaps is currently migrating from 
[co2signal.com](http://www.co2signal.com). Until migration is finished you will
have to register a new account there. The module's API calls also still point to
_co2signal.com_ and will be updated by the author as migration proceeds.

## Usage

### PowerShell Module

To get started with this module you will need an account on
[ElectricityMaps](https://www.ElectricityMaps.com/). See the website for details
on registering and the conditions that apply.

**NOTE:** ElectricityMaps is currently migrating from 
[co2signal.com](http://www.co2signal.com). Until migration is finished you will
have to register a new account there. The module's API calls also still point to
_co2signal.com_ and will be updated by the author as migration proceeds.

Once you have an account, you will need to create an API token. This can be done
in the _API_ section of your account. You will need to copy the token and store
it in a secure location. You will need to supply this token to the module when
you use it.

The module is available on the
[PowerShell Gallery](https://www.powershellgallery.com/packages/PSElectricityMaps/).
You can install it using the following command:

```powershell
Install-Module -Name PSElectricityMaps
```

Once installed, you can import the module using the following command:

```powershell
Import-Module -Name PSElectricityMaps
```

#### Get current percentage of energy with emissions for the 'westeurope' Azure region:

```powershell
PS C:\> Get-ElectricityMapsForAzureRegion -Region westeurope -AuthToken $token

Region               : westeurope
FossilFuelPercentage : 29.37
CountryCode          : NL
CarbonIntensity      : 231
CarbonIntensityUnit  : gCO2eq/kWh
Timestamp            : 3/26/2023 8:00:00 AM

```

#### Determine the lowest emissions for the list of northeurope, westeurope, francecentral and uksouth Azure regions:

```powershell
PS C:\> Get-ElectricityMapsBestAzureRegion -Regions westeurope,uksouth,northeurope,francecentral -AuthToken $token

Region               : westeurope
FossilFuelPercentage : 29.37    
CountryCode          : NL
CarbonIntensity      : 231
CarbonIntensityUnit  : gCO2eq/kWh
Timestamp            : 3/26/2023 8:00:00 AM

```
