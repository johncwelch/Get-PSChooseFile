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
          [Parameter(Mandatory = $false)][bool] $multipleSelectionsAllowed, #same as for show invisibles
          [Parameter(Mandatory = $false)][string[]] $fileTypes, #this is going to be an array of custom objects
          [Parameter(Mandatory = $false)][bool] $showPackageContents, #default is false
          [Parameter(Mandatory = $false)][string] $chooseFilePrompt #optional, default is nothing
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

     #file types will go here, this will be a pain in the ass

     if($showPackageContents) {
          #we only care if showing package contents is true, the default is false, so we don't need to gode for that
          $chooseFileCommand = $chooseFileCommand + "with showing package contents "
     }

     #return the command
     return $chooseFileCommand
}

#use a custom class here so we don't have to deal with name collisions, which there will be many
#this way we can just create an array of fileTypes and pass it to the check as an array
#we build the initial array here, then use the filetypes, if any, to build an array to pass to the function

class fileType {
     [string]$name
     [string]$type

     fileType(
          [string]$name,
          [string]$type
     ){
          $this.name = $name
          $this.type = $type
     }
}

#arrayList to hold the filetypes
[System.Collections.ArrayList]$fileTypeArrayList=@()

#the order of the array is somewhat important, dealing with common special cases first
$sourceFileTypeArray = @("jpg","jpeg","doc","docx","xls","xlsx","ppt","pptx","pdf","psd","indd","ai","gif","png","mpeg","mp3","mp4","m4a","aiff","heic","pages","key","keynote","numbers","epub","ibooks","rtf","applescript","scpt","scptd","script","sh","py","pl","ps1","url","zip","app","pxm","der","p7c","pem","crt","cer","txt","text","vcf","ics","html","htm","sql","webloc","plist","workflow","lz4","json","csv","tsv","sqlite","dat","osax","xcodeproj","swift","entitlements","xcassets","colorset","hmap","yaml","dep","h","c","cpp","d","dia","xib","lproj","m","strings","build","pbindex","o","linkfilelist")

foreach($item in $sourceFileTypeArray) {
     #the pipe to out-null avoids the spurious array index output. If I find a more elegant way to handle it, i will
     #deal with the jpeg/jpeg issue
     if($item -eq "jpg") {
          $fileTypeItem = @([fileType]::new("jpeg",$item))
          $fileTypeArrayList.Add($fileTypeItem) |Out-Null
          $fileTypeItem = @([fileType]::new("jpg",$item))
          $fileTypeArrayList.Add($fileTypeItem) |Out-Null
     }

     if($item -eq "jpeg") {
          $fileTypeItem = @([fileType]::new("jpeg",$item))
          $fileTypeArrayList.Add($fileTypeItem) |Out-Null
          $fileTypeItem = @([fileType]::new("jpg",$item))
          $fileTypeArrayList.Add($fileTypeItem) |Out-Null
     }

     #now other cases where the app is the file, so word for docx, powerpoint for pptx, photoshop for psd, etc.
     #we are not going to try to decode stuff like "adobe"

     if($item -eq "doc") {
          $fileTypeItem = @([fileType]::new("doc",$item))
          $fileTypeArrayList.Add($fileTypeItem) | Out-Null
          $fileTypeItem = @([fileType]::new("word",$item))
          $fileTypeArrayList.Add($fileTypeItem) | Out-Null
     }

     if($item -eq "docx") {
          $fileTypeItem = @([fileType]::new("docx",$item))
          $fileTypeArrayList.Add($fileTypeItem) | Out-Null
          $fileTypeItem = @([fileType]::new("word",$item))
          $fileTypeArrayList.Add($fileTypeItem) | Out-Null
     }

     if($item -eq "xls") {
          $fileTypeItem = @([fileType]::new("xls",$item))
          $fileTypeArrayList.Add($fileTypeItem) | Out-Null
          $fileTypeItem = @([fileType]::new("excel",$item))
          $fileTypeArrayList.Add($fileTypeItem) | Out-Null
     }

     if($item -eq "xlsx") {
          $fileTypeItem = @([fileType]::new("xlsx",$item))
          $fileTypeArrayList.Add($fileTypeItem) | Out-Null
          $fileTypeItem = @([fileType]::new("excel",$item))
          $fileTypeArrayList.Add($fileTypeItem) | Out-Null
     }

     if($item -eq "ppt") {
          $fileTypeItem = @([fileType]::new("ppt",$item))
          $fileTypeArrayList.Add($fileTypeItem) | Out-Null
          $fileTypeItem = @([fileType]::new("powerpoint",$item))
          $fileTypeArrayList.Add($fileTypeItem) | Out-Null
     }

     if($item -eq "pptx") {
          $fileTypeItem = @([fileType]::new("pptx",$item))
          $fileTypeArrayList.Add($fileTypeItem) | Out-Null
          $fileTypeItem = @([fileType]::new("powerpoint",$item))
          $fileTypeArrayList.Add($fileTypeItem) | Out-Null
     }
     
     if($item -eq "pdf") {
          $fileTypeItem = @([fileType]::new("pdf",$item))
          $fileTypeArrayList.Add($fileTypeItem) | Out-Null
          $fileTypeItem = @([fileType]::new("acrobat",$item))
          $fileTypeArrayList.Add($fileTypeItem) | Out-Null
     }
     
     if($item -eq "psd") {
          $fileTypeItem = @([fileType]::new("psd",$item))
          $fileTypeArrayList.Add($fileTypeItem) | Out-Null
          $fileTypeItem = @([fileType]::new("photoshop",$item))
          $fileTypeArrayList.Add($fileTypeItem) | Out-Null
     }

     if($item -eq "indd") {
          $fileTypeItem = @([fileType]::new("indd",$item))
          $fileTypeArrayList.Add($fileTypeItem) | Out-Null
          $fileTypeItem = @([fileType]::new("indesign",$item))
          $fileTypeArrayList.Add($fileTypeItem) | Out-Null
     }

     if($item -eq "ai") {
          $fileTypeItem = @([fileType]::new("ai",$item))
          $fileTypeArrayList.Add($fileTypeItem) | Out-Null
          $fileTypeItem = @([fileType]::new("illustrator",$item))
          $fileTypeArrayList.Add($fileTypeItem) | Out-Null
     }

     #everything else just uses the type as the name
     $fileTypeItem = @([fileType]::new($item,$item))
     $fileTypeArrayList.Add($fileTypeItem) | Out-Null
}

## note that choose file returns a string labeled "alias" with the HFS path as a string:
## alias Lancer:Users:jwelch:Pictures:1558688.pdf
## to make this usable in a powershell environment, we'll convert that by stripping out the "alias " at the front, then
## convert to unix-style paths via "set theFile to posix path of theFile". It gets annoying whith multiple items,
## because that is returned as a comma-delimited string. However, if we convert all output in the string to an array
## with $output.Split(","), then we get an array with >= 1 items, which then becomes easier. They all start with 
## "alias " so we can remove that, get the posix path, then shove that into an arrayList and have that be the output
## of the command in powershell

#build the command
$chooseFileCommand = Get-ChooseFile -multipleSelectionsAllowed $true
#run the command
$chooseFileString = $chooseFileCommand|/usr/bin/osascript -so

#deal with cancel
if($chooseFileString.Contains("execution error: User canceled. `(-128`)")) {
     #Write-Output "user hit cancel button"
     return "userCancelError"
}

#build the output array
$chooseFileArray = $chooseFileString.Split(",")
#we need an arrayList here to shove the processed entries into
[System.Collections.ArrayList]$chooseFileArrayList = @()

#process the array removing spurious spaces and "alias "
foreach($item in $chooseFileArray){
     #remove any leading/trailing spaces
     $item = $item.Trim()
     #remove the leading "alias "
     $item = $item.Substring(6)
     #build the command to get the posix path. When expanded, $item has to be in quotes, so escaped quotes required
     $thePOSIXPathCommand = "get POSIX path of `"$item`""
     #run the command and get the posix path
     $item = $thePOSIXPathCommand|/usr/bin/osascript -so
     #add onto the arraylist
     $chooseFileArrayList.Add($item) |Out-Null
}

#this is what we'd return
$chooseFileArrayList