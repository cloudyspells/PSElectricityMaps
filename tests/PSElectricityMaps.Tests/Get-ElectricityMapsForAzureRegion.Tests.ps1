Describe "Get-ElectricityMapsForAzureRegion.Tests" {
    BeforeAll {
        $module = Import-Module -Name $PSScriptRoot/../../src/PSElectricityMaps -PassThru -Force
        $module | Should -Not -BeNullOrEmpty
        $env:SIGNALTOKEN | Should -Not -BeNullOrEmpty
    }

    Context " Get-ElectricityMapsForAzureRegion with named parameters" {
        BeforeAll {
            $testCase = Get-ElectricityMapsForAzureRegion -Region "westeurope" -AuthToken $env:SIGNALTOKEN
        }

        It " Should return a result" {
            $testCase | Should -Not -BeNullOrEmpty
        }

        It " Should return a result with the correct properties" {
            $testCase.Timestamp | Should -Not -BeNullOrEmpty
            $testCase.CarbonIntensity | Should -Not -BeNullOrEmpty
            $testCase.CarbonIntensityUnit | Should -Not -BeNullOrEmpty
            $testCase.FossilFuelPercentage | Should -Not -BeNullOrEmpty
            $testCase.Region | Should -Not -BeNullOrEmpty
            $testCase.CountryCode | Should -Not -BeNullOrEmpty
        }

        It " Should return a result with a timestamp property of type DateTime" {
            $testCase.Timestamp | Should -Not -BeNullOrEmpty
            $testCase.Timestamp | Should -BeOfType System.DateTime
        }

        It " Should return a result with a carbon intensity property of type Int64" {
            $testCase.CarbonIntensity | Should -Not -BeNullOrEmpty
            $testCase.CarbonIntensity | Should -BeOfType System.Int64
        }

        It " Should return a result with a carbon intensity unit property of type String" {
            $testCase.CarbonIntensityUnit | Should -Not -BeNullOrEmpty
            $testCase.CarbonIntensityUnit | Should -BeOfType System.String
        }

        It " Should return a result with a fossil fuel percentage property of type Double" {
            $testCase.FossilFuelPercentage | Should -Not -BeNullOrEmpty
            $testCase.FossilFuelPercentage | Should -BeOfType System.Double
        }

        It " Should return a result with a region property of type String" {
            $testCase.Region | Should -Not -BeNullOrEmpty
            $testCase.Region | Should -BeOfType System.String
        }

        It " Should return a result with a country code property of type String" {
            $testCase.CountryCode | Should -Not -BeNullOrEmpty
            $testCase.CountryCode | Should -BeOfType System.String
        }

        It " Should return a result with a carbon intensity unit property of value 'gCO2eq/kWh'" {
            $testCase.CarbonIntensityUnit | Should -Be "gCO2eq/kWh"
        }

        It " Should return a result with a fossil fuel percentage property of value between 0 and 100" {
            $testCase.FossilFuelPercentage | Should -BeLessOrEqual 100.0
            $testCase.FossilFuelPercentage | Should -BeGreaterOrEqual 0.0
        }

        It " Should return a result with a region property of value 'westeurope'" {
            $testCase.Region | Should -Be "westeurope"
        }
        
        
    }

    Context " Get-ElectricityMapsForAzureRegion with pipeline parameters" {
        BeforeAll {
            $testCase = "westeurope" | Get-ElectricityMapsForAzureRegion -AuthToken $env:SIGNALTOKEN
        }

        It " Should return a result" {
            $testCase | Should -Not -BeNullOrEmpty
        }

        It " Should return a result with a timestamp property of type DateTime" {
            $testCase.Timestamp | Should -Not -BeNullOrEmpty
            $testCase.Timestamp | Should -BeOfType System.DateTime
        }

        It " Should return a result with a carbon intensity property of type Int64" {
            $testCase.CarbonIntensity | Should -Not -BeNullOrEmpty
            $testCase.CarbonIntensity | Should -BeOfType System.Int64
        }

        It " Should return a result with a carbon intensity unit property of type String" {
            $testCase.CarbonIntensityUnit | Should -Not -BeNullOrEmpty
            $testCase.CarbonIntensityUnit | Should -BeOfType System.String
        }

        It " Should return a result with a fossil fuel percentage property of type Double" {
            $testCase.FossilFuelPercentage | Should -Not -BeNullOrEmpty
            $testCase.FossilFuelPercentage | Should -BeOfType System.Double
        }

        It " Should return a result with a region property of type String" {
            $testCase.Region | Should -Not -BeNullOrEmpty
            $testCase.Region | Should -BeOfType System.String
        }

        It " Should return a result with a country code property of type String" {
            $testCase.CountryCode | Should -Not -BeNullOrEmpty
            $testCase.CountryCode | Should -BeOfType System.String
        }

        It " Should return a result with a carbon intensity unit property of value 'gCO2eq/kWh'" {
            $testCase.CarbonIntensityUnit | Should -Be "gCO2eq/kWh"
        }

        It " Should return a result with a fossil fuel percentage property of value between 0 and 100" {
            $testCase.FossilFuelPercentage | Should -BeLessOrEqual 100.0
            $testCase.FossilFuelPercentage | Should -BeGreaterOrEqual 0.0
        }

        It " Should return a result with a region property of value 'westeurope'" {
            $testCase.Region | Should -Be "westeurope"
        }
    }
}