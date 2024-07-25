#Script for Choose File
#do the conversion of $defaultLocation from string to POSIX file in the function.
#we'll also need a foreach loop to convert a string array to an applescript list for file types.
#note that all parameters are optional, so calling this with zero gets you a basic dialog. 
#we'll have to convert the return to a posix file via: quoted form of (posix path of theResults) to avoid quoting problems
#return from choose file is seen as a string, so that's convenient

function Get-ChooseFile {
     Param (
          [Parameter(Mandatory = $false)][string] $defaultLocation, #the dictionary says this has to be an alias, setting it to POSIX file works too. 
          [Parameter(Mandatory = $false)][bool] $showInvisibles,
          [Parameter(Mandatory = $false)][bool] $multipleSelectionsAllowed,
          [Parameter(Mandatory = $false)][string[]] $fileTypes,
          [Parameter(Mandatory = $false)][bool] $showPackageContents,
          [Parameter(Mandatory = $false)][string] $chooseFilePrompt
     )
     
}