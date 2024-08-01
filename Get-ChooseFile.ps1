#Script for Choose File
#do the conversion of $defaultLocation from string to POSIX file in the function.
#we'll also need a foreach loop to convert a string array to an applescript list for file types.
#note that all parameters are optional, so calling this with zero gets you a basic dialog. 
#we'll have to convert the return to a posix file via: quoted form of (posix path of theResults) to avoid quoting problems
#return from choose file is seen as a string, so that's convenient, but we have to do a check for mulitple entries. Split on ", alias "
#then convert to array of strings

#there's no good way to use the file types parameter, so we shan't

function Get-ChooseFile {
     Param (
          [Parameter(Mandatory = $false)][string] $defaultLocation, #the dictionary says this has to be an alias, setting it to POSIX file works too. 
          [Parameter(Mandatory = $false)][bool] $showInvisibles, #the default is false, so we only care if it's true
          [Parameter(Mandatory = $false)][bool] $multipleSelectionsAllowed,
          #[Parameter(Mandatory = $false)][string[]] $fileTypes,
          [Parameter(Mandatory = $false)][bool] $showPackageContents,
          [Parameter(Mandatory = $false)][string] $chooseFilePrompt
     )
     
     if (-Not $IsMacOS) {
          Write-Output "This module only runs on macOS, exiting"
          Exit
     }

     #default command, there's no mandatory parameters for choose file. As with Get-DisplayDialog, we end each new command append with a space,
     #avoids problems later

     $chooseFileCommand = "choose file "

     #prompt processing
     if(-not [string]::IsNullOrEmpty($chooseFilePrompt)) {
          $chooseFileCommand = $chooseFileCommand + "with prompt `"$chooseFilePrompt`" "
     }

     #default location processing
     if(-not [string]::IsNullOrEmpty($defaultLocation)) {
          #we have a location, but we have to be clever. Since we can't convert the path string to a POSIX file in a variable
          #we do the conversion in the command itself. Yes we need the quotes in the command once it's expanded, so we escape them

          $chooseFileCommand = $chooseFileCommand + "default location (`"$defaultLocation`" as POSIX file) "
     }

     #show invisibles processing
     if($showInvisibles) {
          #show invisibles is true
          $chooseFileCommand = $chooseFileCommand + "with invisibles "
     }

     if($multipleSelectionsAllowed) {
          #multiple selections allowed is true. This syntax seems awkward, but you can have multiple boolean "with" clauses in 
          #a choose file statement. It works for osascript and it's quite consistent.
          $chooseFileCommand = $chooseFileCommand + "with multiple selections allowed "
     }

     if($showPackageContents) {
          #we only care if showing package contents is true, the default is false, so we don't need to gode for that
          $chooseFileCommand = $chooseFileCommand + "with showing package contents "
     }

}