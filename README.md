# PSElectricityMaps

## PowerShell Module for ElectricityMaps emission data

[![PowerShell Module Quality Assurance](https://github.com/cloudyspells/PSElectricityMaps/actions/workflows/qa.yml/badge.svg)](https://github.com/cloudyspells/PSElectricityMaps/actions/workflows/qa.yml)
![GitHub release (latest by date)](https://img.shields.io/github/v/release/cloudyspells/PSElectricityMaps)
![PowerShell Gallery Version](https://img.shields.io/powershellgallery/v/PSElectricityMaps)
![PowerShell Gallery](https://img.shields.io/powershellgallery/dt/PSElectricityMaps)


This PowerShell module is intended for retrieving emissions data from
[CO2 Signal](https://www.co2signal.com/) for a supplied Azure Region during
resource deployments. This is a lightweight solution making use of non-commercial
functionality available with a free account at _ElectricityMaps_. This means
the module is only able to get near-realtime emissions data and no prodictive
values. This means this module is _not_ a real solution for reduced carbon
deployments and -software. It _does_ however provide some nice realtime values
so you can simulate the beheaviour of deployments and software based on 
emissions data without the cost of a paid account for such data. For example in
lab- or proof of concept environments.

The intended use of this module is for setting the `Location` parameter
on Azure IaC deployments in GitHub workflows using the included GitHub
action.

For a real-world solution with a commercial data provider, check out
the [carbon-aware-sdk](https://github.com/Green-Software-Foundation/carbon-aware-sdk)
by the [Green Software Foundation](https://greensoftware.foundation/)

**NOTE:** ElectricityMaps is currently migrating from 
[co2signal.com](http://www.co2signal.com). Until migration is finished you will
have to register a new account there. The module's API calls also still point to
_co2signal.com_ and will be updated by the author as migration proceeds.

### Usage

#### PowerShell Module

To get started with this module you will need an account on
[ElectricityMaps](https://www.ElectricityMaps.com/). See the website for details on
registering and the conditions that apply.

You will also need the _Az.Resources_ PowerShell Module for Azure installed
and connected to your Azure account. See
[the installation manual](https://learn.microsoft.com/en-us/powershell/azure/install-az-ps)
for the _Az_ module for instructions.

To install the module from the [PowerShell Gallery](https://www.powershellgallery.com/packages/PSElectricityMaps/).

```powershell
Install-Module -Name PSElectricityMaps
```

Get current percentage of energy with emissions the 'westeurope' Azure region:

```powershell
PS C:\> Get-ElectricityMapsForAzureRegion -Region westeurope -AuthToken $token

Region               : westeurope
FossilFuelPercentage : 29.37
CountryCode          : NL
CarbonIntensity      : 231
CarbonIntensityUnit  : gCO2eq/kWh
Timestamp            : 3/26/2023 8:00:00 AM

```

Determine the lowest emissions for the list of northeurope,
westeurope, francecentral and uksouth Azure regions:

```powershell
PS C:\> Get-ElectricityMapsBestAzureRegion -Regions westeurope,uksouth,northeurope,francecentral -AuthToken $token

Region               : westeurope
FossilFuelPercentage : 29.37
CountryCode          : NL
CarbonIntensity      : 231
CarbonIntensityUnit  : gCO2eq/kWh
Timestamp            : 3/26/2023 8:00:00 AM

```

##### Module Functions

- [Get-ElectricityMapsForAzureRegion](docs/Get-ElectricityMapsForAzureRegion.md)
- [Get-ElectricityMapsBestAzureRegion](docs/Get-ElectricityMapsBestAzureRegion.md)

#### GitHub Action

This PowerShell module also comes with a _GitHub Action_ you can use
in your GitHub workflows. Again you will need a pre-existing account
for _ElectricityMaps_ and an Azure CLI/PowerShell secret configured in your repo

##### Example

```yaml

on:
  pull_request:
    branches:
      - 'main'
      - 'releases/**'

name: Deploy to region with lowest emissions

jobs:
  deploy-to-test:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout
        uses: actions/checkout@v3

      - name: Get region with lowest emissions
        uses: cloudyspells/PSElectricityMaps@main
        id: signal_action # Set step id for using output in deployment
        with:
          azure_credential: ${{ secrets.AZURE_CREDENTIALS }}
          signal_token: ${{ secrets.SIGNALTOKEN }}
          regions: '"westeurope","northeurope","uksouth","francecentral","germanynorth"'

      - name: Login to Az PowerShell Module
        uses: azure/login@v1
        with:
          creds: ${{ secrets.AZURE_CREDENTIALS }}
          enable-AzPSSession: true

      - uses: azure/arm-deploy@v1
        name: Run Bicep deployment
        with:
          subscriptionId: ${{ secrets.AZURE_SUBSCRIPTION_ID }}
          scope: subscription
          region: ${{ steps.signal_action.outputs.region }} # The region output from PSElectricityMaps
          template: src/bicep/main.bicep
```

