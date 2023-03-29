# PSElectricityMaps Github Action Quickstart

This PowerShell module also comes with a _GitHub Action_ you can use in your
GitHub workflows. Again you will need a pre-existing account for _ElectricityMaps_
and an Azure CLI/PowerShell secret configured in your repo.

**NOTE:** ElectricityMaps is currently migrating from 
[co2signal.com](http://www.co2signal.com). Until migration is finished you will
have to register a new account there. The module's API calls also still point to
_co2signal.com_ and will be updated by the author as migration proceeds.

## Inputs

- `azure_credential` - **Required** - Azure credential secret for azure/login action
- `signal_token` - **Required** - ElectricityMaps API token
- `regions` - **Required** - Comma separated list of Azure regions to check

## Outputs

- `region` - The Azure region with the lowest emissions
- `fosilFuelPercentage` - The percentage of energy in the region that is fossil fuel based

## Example

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
        uses: actions/checkout@v2

      - name: Get ElectricityMaps for Azure Region
        id: ElectricityMaps
        uses: cloudyspells/PSElectricityMaps@v1
        with:
          auth-token: ${{ secrets.ElectricityMaps_TOKEN }}
          regions: 'westeurope,uksouth,northeurope,francecentral'

      - name: echo region
        run: echo ${{ steps.ElectricityMaps.outputs.region }}

      - name: Deploy to best region
        uses: azure/arm-deploy@v1
        with:
          resourceGroupName: 'my-rg'
          location: ${{ steps.ElectricityMaps.outputs.region }}
          template: 'azuredeploy.json'
          parameters: 'azuredeploy.parameters.json'
          deploymentName: 'my-deployment'
          subscriptionId: ${{ secrets.AZURE_SUBSCRIPTION_ID }}
          credentials: ${{ secrets.AZURE_CREDENTIALS }}
```
