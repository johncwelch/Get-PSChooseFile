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

	switch ($item) {
		"jpg" {  
			$fileTypeItem = @([fileType]::new($item,"public.jpeg"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"jpeg" {  
			$fileTypeItem = @([fileType]::new($item,"public.jpeg"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"doc" {  
			$fileTypeItem = @([fileType]::new($item,"com.microsoft.word.doc"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"docx" {  
			$fileTypeItem = @([fileType]::new($item,"org.openxmlformats.wordprocessingml.document"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"xls" {  
			$fileTypeItem = @([fileType]::new($item,"com.microsoft.excel.xls"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"xlsx" {  
			$fileTypeItem = @([fileType]::new($item,"org.openxmlformats.spreadsheetml.sheet"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"ppt" {  
			$fileTypeItem = @([fileType]::new($item,"com.microsoft.powerpoint.ppt"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"pptx" {  
			$fileTypeItem = @([fileType]::new($item,"org.openxmlformats.presentationml.presentation"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"pdf" {  
			$fileTypeItem = @([fileType]::new($item,"com.adobe.pdf"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"psd" {  
			$fileTypeItem = @([fileType]::new($item,"com.adobe.photoshop-image"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"indd" {  
			$fileTypeItem = @([fileType]::new($item,"com.adobe.photoshop-image"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"ai" {  
			$fileTypeItem = @([fileType]::new($item,"com.adobe.illustrator.ai-image"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"gif" {  
			$fileTypeItem = @([fileType]::new($item,"com.compuserve.gif"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"png" {  
			$fileTypeItem = @([fileType]::new($item,"public.png"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"mpeg" {  
			$fileTypeItem = @([fileType]::new($item,"public.mpeg"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"mp3" {  
			$fileTypeItem = @([fileType]::new($item,"public.mp3"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"m4a" {  
			$fileTypeItem = @([fileType]::new($item,"public.mpeg-4-audio"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"mp4" {  
			$fileTypeItem = @([fileType]::new($item,"public.mpeg-4"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"aiff" {  
			$fileTypeItem = @([fileType]::new($item,"public.aiff-audio"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"heic" {  
			$fileTypeItem = @([fileType]::new($item,"public.heic"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"pages" {  
			$fileTypeItem = @([fileType]::new($item,"com.apple.iwork.pages.sffpages"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"key" {  
			$fileTypeItem = @([fileType]::new($item,"com.apple.iwork.keynote.sffkey"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"keynote" {  
			$fileTypeItem = @([fileType]::new($item,"com.apple.iwork.keynote.sffkey"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"numbers" {  
			$fileTypeItem = @([fileType]::new($item,"com.apple.iwork.numbers.sffnumbers"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"epub" {  
			$fileTypeItem = @([fileType]::new($item,"org.idpf.epub-container"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"ibooks" {  
			$fileTypeItem = @([fileType]::new($item,"com.apple.ibooks.epub"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"rtf" {  
			$fileTypeItem = @([fileType]::new($item,"public.rtf"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"applescript" {  
			$fileTypeItem = @([fileType]::new($item,"com.apple.applescript.text"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}
		
		"scpt" {  
			$fileTypeItem = @([fileType]::new($item,"com.apple.applescript.script"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"script" {  
			$fileTypeItem = @([fileType]::new($item,"com.apple.applescript.script"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}


		"scptd" {  
			$fileTypeItem = @([fileType]::new($item,"com.apple.applescript.script-bundle"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"sh" {  
			$fileTypeItem = @([fileType]::new($item,"public.shell-script"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		<# Default {
			$fileTypeItem = @([fileType]::new(" "," "))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		} #>
	}
}

testFunc
