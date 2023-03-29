PSElectricityMaps Wiki
======================

PowerShell module for [ElectricityMaps.com](https://www.ElectricityMaps.com/) API
-------------------------------------------------------------------

[![PowerShell Module Quality Assurance](https://github.com/cloudyspells/PSElectricityMaps/actions/workflows/qa.yml/badge.svg)](https://github.com/cloudyspells/PSElectricityMaps/actions/workflows/qa.yml)
![GitHub release (latest by date)](https://img.shields.io/github/v/release/cloudyspells/PSElectricityMaps)
![PowerShell Gallery Version](https://img.shields.io/powershellgallery/v/PSElectricityMaps)
![PowerShell Gallery](https://img.shields.io/powershellgallery/dt/PSElectricityMaps)

This PowerShell module is intended for retrieving emissions data from
[ElectricityMaps](https://www.ElectricityMaps.com/) for a supplied Azure Region during
resource deployments. This is a lightweight solution making use of only the
limited functionality available with a free account at _ElectricityMaps_. This means
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