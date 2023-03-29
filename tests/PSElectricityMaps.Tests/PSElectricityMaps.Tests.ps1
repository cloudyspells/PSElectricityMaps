Describe "PSElectricityMaps.Tests" {
    BeforeAll {
        $module = Import-Module -Name $PSScriptRoot/../../src/PSElectricityMaps/PSElectricityMaps.psd1 -PassThru -Force
        $module | Should -Not -BeNullOrEmpty
        $env:SIGNALTOKEN | Should -Not -BeNullOrEmpty
    }
    Context " PSElectricityMaps Base Module Tests" {
        BeforeAll {
            $getModule = Get-Module -Name PSElectricityMaps
        }
        
        It " Should have a valid module manifest" {
            $getModule | Should -Not -BeNullOrEmpty
            $getModule | Should -BeOfType 'System.Management.Automation.PSModuleInfo'
            $getModule.RootModule | Should -Be "PSElectricityMaps.psm1"
            $getModule.Version | Should -Match "^\d+\.\d+\.\d+$"
            $getModule.GUID | Should -Not -BeNullOrEmpty
        }
    }   
}