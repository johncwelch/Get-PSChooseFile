
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
}