<# 
$darwinVersionSplitOptions = [System.StringSplitOptions]::RemoveEmptyEntries
$testResults = "choose file default location (`"$testPathString`" as POSIX file) with multiple selections allowed"|/usr/bin/osascript -so

# the nice thing about doing the trim is that even a single file becomes an array of one member, so we don't have 
# any special string v. array cases to deal with
$testArray = $testResults.Split("alias ",$darwinVersionSplitOptions)

foreach($entry in $testArray) {
    #trim leading/trailing whitespace
     $entry = $entry.Trim()
    
     
     #we have to deal with some of the nonsense in the return string
     if ($entry.EndsWith(",")){
          Write-Output "has a comma"
     } else {
          write-output "$entry has no comma"
     }
} #>

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

#$fileTypeItem = @([fileType]::new($name,$type))

#the order of the array is somewhat important, dealing with common special cases first
$sourceFileTypeArray = @("jpg","jpeg","doc","docx","xls","xlsx","ppt","pptx","pdf","psd","indd","ai","gif","png","mpeg","mp3","mp4","m4a","aiff","heic","pages","key","keynote","numbers","epub","ibooks","rtf","applescript","scpt","scptd","script","sh","py","pl","ps1","url","zip","app","pxm","der","p7c","pem","crt","cer","txt","text","vcf","ics","html","htm","sql","webloc","plist","workflow","lz4","json","csv","tsv","sqlite","dat","osax","xcodeproj","swift","entitlements","xcassets","colorset","hmap","yaml","dep","h","c","cpp","d","dia","xib","lproj","m","strings","build","pbindex","o","linkfilelist")

foreach($item in $sourceFileTypeArray) {

     #deal with the jpeg/jpeg issue
     if($item -eq "jpg") {
          $fileTypeItem = @([fileType]::new("jpeg",$item))
          $fileTypeArrayList.Add($fileTypeItem)
          $fileTypeItem = @([fileType]::new("jpg",$item))
          $fileTypeArrayList.Add($fileTypeItem)
     }

     if($item -eq "jpeg") {
          $fileTypeItem = @([fileType]::new("jpeg",$item))
          $fileTypeArrayList.Add($fileTypeItem)
          $fileTypeItem = @([fileType]::new("jpg",$item))
          $fileTypeArrayList.Add($fileTypeItem)
     }

     #now other cases where the app is the file, so word for docx, powerpoint for pptx, photoshop for psd, etc.

     if($item -eq "doc") {
          $fileTypeItem = @([fileType]::new("doc",$item))
          $fileTypeArrayList.Add($fileTypeItem)
          $fileTypeItem = @([fileType]::new("word",$item))
          $fileTypeArrayList.Add($fileTypeItem)
     }

     if($item -eq "docx") {
          $fileTypeItem = @([fileType]::new("docx",$item))
          $fileTypeArrayList.Add($fileTypeItem)
          $fileTypeItem = @([fileType]::new("word",$item))
          $fileTypeArrayList.Add($fileTypeItem)
     }

     if($item -eq "xls") {
          $fileTypeItem = @([fileType]::new("xls",$item))
          $fileTypeArrayList.Add($fileTypeItem)
          $fileTypeItem = @([fileType]::new("excel",$item))
          $fileTypeArrayList.Add($fileTypeItem)
     }

     if($item -eq "xlsx") {
          $fileTypeItem = @([fileType]::new("xlsx",$item))
          $fileTypeArrayList.Add($fileTypeItem)
          $fileTypeItem = @([fileType]::new("excel",$item))
          $fileTypeArrayList.Add($fileTypeItem)
     }

     if($item -eq "ppt") {
          $fileTypeItem = @([fileType]::new("ppt",$item))
          $fileTypeArrayList.Add($fileTypeItem)
          $fileTypeItem = @([fileType]::new("powerpoint",$item))
          $fileTypeArrayList.Add($fileTypeItem)
     }

     if($item -eq "pptx") {
          $fileTypeItem = @([fileType]::new("pptx",$item))
          $fileTypeArrayList.Add($fileTypeItem)
          $fileTypeItem = @([fileType]::new("powerpoint",$item))
          $fileTypeArrayList.Add($fileTypeItem)
     }
     
     if($item -eq "pdf") {
          $fileTypeItem = @([fileType]::new("pdf",$item))
          $fileTypeArrayList.Add($fileTypeItem)
          $fileTypeItem = @([fileType]::new("acrobat",$item))
          $fileTypeArrayList.Add($fileTypeItem)
     }
     
     if($item -eq "psd") {
          $fileTypeItem = @([fileType]::new("psd",$item))
          $fileTypeArrayList.Add($fileTypeItem)
          $fileTypeItem = @([fileType]::new("photoshop",$item))
          $fileTypeArrayList.Add($fileTypeItem)
     }

     if($item -eq "indd") {
          $fileTypeItem = @([fileType]::new("indd",$item))
          $fileTypeArrayList.Add($fileTypeItem)
          $fileTypeItem = @([fileType]::new("indesign",$item))
          $fileTypeArrayList.Add($fileTypeItem)
     }

     if($item -eq "ai") {
          $fileTypeItem = @([fileType]::new("ai",$item))
          $fileTypeArrayList.Add($fileTypeItem)
          $fileTypeItem = @([fileType]::new("illustrator",$item))
          $fileTypeArrayList.Add($fileTypeItem)
     }

     #everything else just uses the type as the name
     $fileTypeItem = @([fileType]::new($item,$item))
     $fileTypeArrayList.Add($fileTypeItem)
}
$fileTypeArrayList