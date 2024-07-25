#Script for Choose File

function Get-ChooseFile {
     Param (
          [Parameter(Mandatory = $false)][string] $defaultLocation,
          [Parameter(Mandatory = $false)][bool] $showInvisibles,
          [Parameter(Mandatory = $false)][bool] $multipleSelectionsAllowed,
          [Parameter(Mandatory = $false)][string[]] $fileTypes,
          [Parameter(Mandatory = $false)][bool] $showPackageContents,
          [Parameter(Mandatory = $false)][string] $chooseFilePrompt
     )
     
}