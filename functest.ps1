function testFunc {
     #so this line lets me avoid scope issues, and having to pass the filetypearraylist to the function, which
     #would be annoying in our final module. By adding $Global: to the front of the array list variable, we can
     #make a local reference to it, and just use it in the function, which normally would be out of scope.
     $myList = $Global:fileTypeArrayList 

     $myList
     
}

#create an empty arraylist, which is a mutable array that we can add into, remove from without having to do
#massive copies of the whole thing. *technically* this should be a generic list as arraylists are "deprecated"
#but given MS, we'll all be dead before they actually remove it
[System.Collections.ArrayList]$fileTypeArrayList=@()

#a custom class to hold the filetype name and type. While technically, we could use a hashlist for this, but because we can
#have dupes in some cases, working around that in a hashlist gets awkward. A custom class gives us flexibility and
#more convenience
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

#the order of the array is somewhat important, dealing with common special cases first
$sourceFileTypeArray = @("jpg","jpeg","doc","docx","xls","xlsx","ppt","pptx","pdf","psd","indd","ai","gif","png","mpeg","mp3","mp4","m4a","aiff","heic","pages","key","keynote","numbers","epub","ibooks","rtf","applescript","scpt","scptd","script","sh","py","pl","ps1","url","zip","app","pxm","der","p7c","pem","crt","cer","txt","text","vcf","ics","html","htm","sql","webloc","plist","workflow","lz4","json","csv","tsv","sqlite","dat","osax","xcodeproj","swift","entitlements","xcassets","colorset","hmap","yaml","dep","h","c","cpp","d","dia","xib","lproj","m","strings","build","pbindex","o","linkfilelist")

#build our array of filetype classes
foreach($item in $sourceFileTypeArray) {
     #the pipe to out-null avoids the spurious array index output. If I find a more elegant way to handle it, i will
     #deal with the jpeg/jpeg issue. This does create duplicate entries, but it shouldn't be a problem for us
     if($item -eq "jpg") {

          $fileTypeItem = @([fileType]::new($item,"public.jpeg"))
          $fileTypeArrayList.Add($fileTypeItem) |Out-Null

          #continue is needed to avoid spurious entry in array
          continue 
     }

     if($item -eq "jpeg") {
          $fileTypeItem = @([fileType]::new($item,"public.jpeg"))
          $fileTypeArrayList.Add($fileTypeItem) |Out-Null
          
          #continue is needed to avoid spurious entry in array
          continue 
     }

     #now other cases where the app is the file, so word for docx, powerpoint for pptx, photoshop for psd, etc.
     #we are not going to try to decode stuff like "adobe". This is one of the advantages of a list of classes instead of 
     #a hashtable. Having multiple entries where the key is the same, i.e. word for doc and docx would not be allowed in 
     #a hashtable, since the keys have to be unique. With our method, it's not a problem.

     if($item -eq "doc") {
          $fileTypeItem = @([fileType]::new($item,"com.microsoft.word.doc"))
          $fileTypeArrayList.Add($fileTypeItem) | Out-Null
          #continue is needed to avoid spurious entry in array
          continue
     }

     if($item -eq "docx") {
          $fileTypeItem = @([fileType]::new($item,"org.openxmlformats.wordprocessingml.document"))
          $fileTypeArrayList.Add($fileTypeItem) | Out-Null
          #continue is needed to avoid spurious entry in array
          continue
     }
     
     if($item -eq "xls") {
          $fileTypeItem = @([fileType]::new($item,"com.microsoft.excel.xls"))
          $fileTypeArrayList.Add($fileTypeItem) | Out-Null
          #continue is needed to avoid spurious entry in array
          continue
     }

     if($item -eq "xlsx") {
          $fileTypeItem = @([fileType]::new($item,"org.openxmlformats.spreadsheetml.sheet"))
          $fileTypeArrayList.Add($fileTypeItem) | Out-Null
          #continue is needed to avoid spurious entry in array
          continue
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

     #everything else just uses the type as the name. So adding a new type that doesn't have multiple names is
     #as easy as adding a new item in the array
     $fileTypeItem = @([fileType]::new($item,$item))
     $fileTypeArrayList.Add($fileTypeItem) | Out-Null
}

testFunc
