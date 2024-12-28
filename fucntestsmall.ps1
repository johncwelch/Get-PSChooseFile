function testFunc {
	Param (
		[Parameter(Mandatory = $false)][string[]] $fileTypes
	)

     #we only really care if there's more than zero items in $fileTypes
	if ($fileTypes.Count -gt 0) {

          $fileTypeArrayList = New-Object System.Collections.ArrayList

          foreach ($item in $fileTypes) {
			switch ($item) {
				"tiff" {
					#$fileTypeItem = @([fileType]::new($item,"com.canon.tif-raw-image"))
					#$fileTypeArrayList.Add($fileTypeItem) |Out-Null
					$fileTypeArrayList.Add("com.canon.tif-raw-image") |Out-Null
		
					# $fileTypeItem = @([fileType]::new($item,"public.fax"))
					# $fileTypeArrayList.Add($fileTypeItem) |Out-Null
					$fileTypeArrayList.Add("public.fax") |Out-Null

					# $fileTypeItem = @([fileType]::new($item,"public.jpeg-xl"))
					# $fileTypeArrayList.Add($fileTypeItem) |Out-Null
					$fileTypeArrayList.Add("public.jpeg-xl") |Out-Null
		
					# $fileTypeItem = @([fileType]::new($item,"public.tiff"))
					# $fileTypeArrayList.Add($fileTypeItem) |Out-Null
					$fileTypeArrayList.Add("public.tiff") |Out-Null
		
					# $fileTypeItem = @([fileType]::new($item,"com.microsoft.ppt.export.ext.tiff"))
					# $fileTypeArrayList.Add($fileTypeItem) |Out-Null
					$fileTypeArrayList.Add("com.microsoft.ppt.export.ext.tiff") |Out-Null
		
					# $fileTypeItem = @([fileType]::new($item,"com.microsoft.ppt.export.tiff"))
					# $fileTypeArrayList.Add($fileTypeItem) |Out-Null
					$fileTypeArrayList.Add("com.microsoft.ppt.export.tiff") |Out-Null
				}
		
				"jpeg" {
					# $fileTypeItem = @([fileType]::new($item,"public.jpeg"))
					# $fileTypeArrayList.Add($fileTypeItem) |Out-Null
					$fileTypeArrayList.Add("public.jpeg") |Out-Null
				}
		
				"pdf" {
					# $fileTypeItem = @([fileType]::new($item,"com.adobe.pdf"))
					# $fileTypeArrayList.Add($fileTypeItem) |Out-Null
					$fileTypeArrayList.Add("com.adobe.pdf") |Out-Null
		
					# $fileTypeItem = @([fileType]::new($item,"com.microsoft.ppt.export.pdf"))
					# $fileTypeArrayList.Add($fileTypeItem) |Out-Null
					$fileTypeArrayList.Add("com.microsoft.ppt.export.pdf") |Out-Null
				}
		
				"docx" {
					# $fileTypeItem = @([fileType]::new($item,"com.microsoft.word.strictopenxmlformats.wordprocessingml.document"))
					# $fileTypeArrayList.Add($fileTypeItem) |Out-Null
					$fileTypeArrayList.Add("com.microsoft.word.strictopenxmlformats.wordprocessingml.document") |Out-Null
		
					# $fileTypeItem = @([fileType]::new($item,"org.openxmlformats.wordprocessingml.document"))
					# $fileTypeArrayList.Add($fileTypeItem) |Out-Null
					$fileTypeArrayList.Add("org.openxmlformats.wordprocessingml.document") |Out-Null
		
					# $fileTypeItem = @([fileType]::new($item,"org.strictopenxmlformats.wordprocessingml.document"))
					# $fileTypeArrayList.Add($fileTypeItem) |Out-Null
					$fileTypeArrayList.Add("org.strictopenxmlformats.wordprocessingml.document") |Out-Null
				}
			}
          }

		Write-Output "the list count is:  " $fileTypeArrayList.Count
          Write-Output "`nthe list type is: " $fileTypeArrayList.GetType()
          Write-Output "`nthe list contents are" $fileTypeArrayList
	}
}

testFunc -fileTypes "tiff","jpeg"

