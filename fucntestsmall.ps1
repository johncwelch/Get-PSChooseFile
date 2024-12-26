function testFunc {
	Param (
		[Parameter(Mandatory = $false)][string[]] $fileTypes
	)
	
	#set up the array list for our list of type identifiers that we'll need to build our AppleScript list
	#using arraylist so we can take advantage of .add(). Yes I know, it's deprecated. I'll care when I fine
	#out it's actually going away. It's been deprecated for YEARS. 
	[System.Collections.ArrayList]$typeIdentifierList=@()

     #so this line lets me avoid scope issues, and having to pass the filetypearraylist to the function, which
     #would be annoying in our final module. By adding $Global: to the front of the array list variable, we can
     #make a local reference to it, and just use it in the function, which normally would be out of scope.
     
     #$myList = $Global:fileTypeArrayList 

    # Write-Host "mylist's count is: " $myList.Count
     Write-host "fileTypeArrayList's count is: " $fileTypeArrayList.Count

     #$myList
	#we only really care if there's more than zero items in $fileTypes
	if ($fileTypes.Count -gt 0) {
          #Write-Output "there's at least one item in the list"

		#this set of loops does two things. The out loop goes through filetypes and gets the type identifiers associated 
		#with that extension or file type. Since the result of the Where-Object is an array, to avoid using an array of arrays
		#the inner loop steps through each of the items in $typeIdentifier and adds that to $typeIdentifierList
		foreach ($fileType in $fileTypes) {
			$typeIdentifier = $fileTypeArrayList|Where-Object {$_.name -eq $fileType}
			foreach ($item in $typeIdentifier) {

				$typeIdentifierList.Add($item.type)|Out-Null
			}
		}

		
          Write-Output "the list count is:  " $typeIdentifierList.Count
          Write-Output "`nthe list type is: " $typeIdentifierList.GetType()
          Write-Output "`nthe list contents are" $typeIdentifierList
	}
}

#[System.Collections.ArrayList]$fileTypeArrayList=@()
$Global:fileTypeArrayList = New-Object System.Collections.ArrayList

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

$sourceFileTypeArray = @("tiff","jpeg","pdf","docx")

foreach($item in $sourceFileTypeArray) {
     switch ($item) {
          "tiff" {
			$fileTypeItem = @([fileType]::new($item,"com.canon.tif-raw-image"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"public.fax"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"public.jpeg-xl"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"public.tiff"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"com.microsoft.ppt.export.ext.tiff"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"com.microsoft.ppt.export.tiff"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

          "jpeg" {
			$fileTypeItem = @([fileType]::new($item,"public.jpeg"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

          "pdf" {
			$fileTypeItem = @([fileType]::new($item,"com.adobe.pdf"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"com.microsoft.ppt.export.pdf"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

          "docx" {
			$fileTypeItem = @([fileType]::new($item,"com.microsoft.word.strictopenxmlformats.wordprocessingml.document"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"org.openxmlformats.wordprocessingml.document"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"org.strictopenxmlformats.wordprocessingml.document"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}
     }
}

testFunc -fileTypes "tiff"

