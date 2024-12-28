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
	
	#we only really care if there's more than zero items in $fileTypes
	if ($fileTypes.Count -gt 0) {

		#this set of loops does two things. The out loop goes through filetypes and gets the type identifiers associated 
		#with that extension or file type. Since the result of the Where-Object is an array, to avoid using an array of arrays
		#the inner loop steps through each of the items in $typeIdentifier and adds that to $typeIdentifierList
		foreach ($fileType in $fileTypes) {
			$typeIdentifier = $fileTypeArrayList|Where-Object {$_.name -eq $fileType}
			foreach ($item in $typeIdentifier) {
				$typeIdentifierList.Add($item)|Out-Null
			}
		}
		
		#now we build the applescript list of type identifiers
		$typeIdentifierASList = "{"

		#loop through $typeIdentifierList and add the type (identifier) of each entry on to the end of the list,
		#with a trailing comma
		foreach($item in $typeIdentifierList) {
			#$item.type 
			$typeIdentifierASList = $typeIdentifierASList + "`"" + $item.type +"`","
		}
		
		#since we'll always have a spurious trailing comma, we trim that off the end of the string
		$typeIdentifierASList = $typeIdentifierASList.TrimEnd(",")

		#and add on the closing brace and we're done
		$typeIdentifierASList = $typeIdentifierASList + "}"
		#write-host "the applescript list is: " $typeIdentifierASList

		#return $typeIdentifierASList
		return $typeIdentifierASList
	}
}

#create an empty arraylist, which is a mutable array that we can add into, remove from without having to do
#massive copies of the whole thing. *technically* this should be a generic list as arraylists are "deprecated"
#but given MS, we'll all be dead before they actually remove it
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

$sourceFileTypeArray = @("3fr","3g2","3gp","3gp2","3gpp","7z","8BPB","aa","aac","aae","aaf","aar","Aarc","aax","abcdg","abcdp","abdg","abr","ac-3","ac3","acct","acrobat","action","acts","ada","adb","adcL","adjustments","ads","adts","aea","afploc","afps","agent","ahap","ai","aicb","aif","aifc","aiff","aird","all","amnu","amr","animoji","anylistrecipes","apinotes","aplibrary","apns","app","APPC","APPD","appdownload","appe","appex","appledocumentscanarchive","applescript","appr","apps","arng","artrace","arw","as","asf","ASF_","asif","asm","asnd","asp","aspx","astc","astí","asup","asx","ASX_","atlk","atrc","atzn","au","AUDB","AUDX","aupreset","avchd","avci","AVcL","avcs","avi","avif","axr","backupbundle","band","baro","bash","bbaiworksheet","bbcolors","bbcolorscheme","bblm","bbnotebookd","bbpackage","bbproject","bbprojectd","bdm","bdmv","bfld","bin","binlog","blank","bmp","bmpf","bmrk","board","bonj","book","brushes","burn","bwf","bz","bz2","c","c++","cab","caction","caf","cannedsearch","capl","caut","cbdg","cboard","cc","ccl","CCTX","cdda","cddr","cdev","cdr","cel","cepp","cer","cert","cfg","cfr","cgi","chrono-timeline","cl","class","clck","clipsother","clipspkg","clipsproject","clp","clpu","clr","clsp","cmnu","CMYK","cnct","coderequirement","colorpalette","command","configprofile","copilot","cp","cpgz","cpio","cpp","cr2","cr3","crash","crt","crw","crwebloc","crx","cs","csh","cshm","csproj","css","csstore","cst","csv","ctags","ctrD","ctrl","cube","cxx","dae","dali","db","db3","dbox","dcm","dcr","DDim","dds","definition","defs","der","desk","devf","devi","dext","dflexp","dfont","dib","dic","DICM","dicom","dif","diff","disk","dist","distz","dll","dls","dlyan","dmg","dmgpart","dng","doc","doccarchive","docm","docs","docx","dot","dotm","dotx","download","drawing","drfb","dsnd","dsrv","dsym","dtdspec","dv","dvc!","dvd","dvdr","dvdw","dvticonspec","dvtplugin","dwnf","dxo","dylib","eac3","ec-3","edn","edtf","effects","efx","ejec","EM3F","eml","emltpl","emlx","emlxpart","enex","entitlements","eps","EPSF","epub","eras","erb","erf","etd","etx","eval","evry","ewsmbox","exe","exp","explain","exr","exs","extD","extn","f","f4a","f4p","f4v","f77","f90","f95","faro","favs","fcgi","fcpproj","fcpxmld","fdf","fff","ffil","fileloc","flac","flc","fldr","fli","fluid","flv","FNDR","fold","font","fpbf","fpx","frag","fragment","fragsh","framework","fs","fsh","fsproj","ftploc","ftps","ftrh","furl","fVlt","fvoc","game","gbproj","gcf","gchdb","gdiagramstyle","geojson","geom","gfld","gif","GIFf","GImg","glas","glb","glibb","glsl","gltf","gmac","gmk","gnpc","gnrl","go","gpr","gpurestart","gputrace","gpx","gradients","graffle","grid","groupactivity","grup","gs","gsh","gstencil","gtdbg","gtemplate","gtmi","guide","gusr","gwin","gz","gzip","h","h++","hang","hasaccessory","haslibrary","hasstate","hdr","hdrv","heic","heics","heif","heifs","help","hfs","hh","hlsl","horizon365vm","horizonapp","horizonvm","hp","hp_remote_control_config","hpp","hqx","htm","html","htps","hufl","hvpl","hxx","i","iba","ibooks","ibplugin","icbu","icc","icloud","icm","icma","icml","icns","ico","iconset","ics","idcp","ideplugin","idml","idms","idsk","ig","igo","íhlp","ii","iig","iiq","ílib","illustrator","ilmbplugin","íloc","imapmbox","img","imovieevent","imovielibrary","imoviemobile","imovieother","imovieproject","imovietrailer","indb","indd","indesign","indl","indt","ínet","inetloc","ini","inkt","inl","ino","instrdst","instrpkg","intentdefinition","internetconnect","intí","introspection","INX","ioreg","ipa","ipmeta","íprd","ips","ipspot","ipsw","íscr","iso","isrv","issf","ite","ítex","itimer","itl","itlp","itms","itun","j2c","j2k","jar","jav","java","javascript","jfx","jnlp","jpeg","jpf","jpg","jpx","js","jscript","json","json_crash","jsp","jxl","kar","kext","key","key-tef","keychain","keychain-db","keynote","kpdc","kpf","ksh","kth","ktrace","ktx","l","lasso","latex","latm","layerstyles","lbdg","lcs","lid","ll","lm","lmm","loas","lock","logarchive","logic","logicx","logikcs","loop","lpdf","lpp","lso","lsr","lua","LWFN","lxx","m","m15","m2ts","m2v","m3u","m3u8","m4a","m4b","m4p","m4r","m4v","m75","M822","Mac","macD","Macintosh","macs","mailloc","mainstagegraph","mak","make","markdown","mbdg","mbox","md","mdimporter","mdown","memgraph","menu","metal","mht","mhtm","mhtml","mi","mid","midi","mig","mii","mime","minc","mitm","mk","mkdirectionsrequest","mlarchive","mlkitmodel","mlmodel","mlmodelc","mlmodelkey","mlpackage","mlpd","mlperf","mlproj","mm","mme","mnc","mntd","mobile","mobileconfig","mobileprovision","mode0","mode0v3","mode1","mode1v3","mode2","mode2v3","mode3","mode3v3","modulemap","mom","MooV","morí","mos","mov","movpkg","mp2","mp3","mp3!","mp3u","mp4","mpe","mpeg","mpg","MPG2","mpg3","mpg4","mpga","mpkg","mpo","mpsgraph","mpsgraphpackage","mrw","musiclibrary","mwand","mxf","myatt","mymc","mysql","nasm","navtrace","nef","netB","networkconnect","newsloc","nfbg","nfil","nfld","nib","nii","nldd","nmbtemplate","note","notesairdropdocument","notesarchive","notesspotlightrecord","nrw","numbers","numbers-tef","nwrt","nyrc","o","obj","objcap","octest","odb","odc","odf","odg","odi","odm","odp","ods","odt","ofd","ofld","ogg","ogm","olk15contact","olk15event","olk15group","olk15message","olk15note","olk15task","omf","omfi","omnigrafflejs","omnigrafflejsz","omnijs","omnijsz","omnipresence-config","onxofflinemap","oo3","oo3template","ooutline","OPCD","order","orf","otc","otemplate","otf","otg","oth","oti","otp","ots","ott","otto","outline","ova","ovf","owl","ownd","p12","p12_key","p7c","pages","pages-tef","panic","papp","pas","patch","pax","pbcl","pbm","pbproj","pbxproj","pbxuser","pch","pch++","pct","pdf","pef","pem","perspectivev3","pf","pfa","pfb","pfcl","pfm","pfnt","pgm","pgn","pgsql","ph3","ph4","phfs","photo","photobooth","photo-edit","photosasset","photoshop","photoslibrary","php","php3","php4","phtml","pic","pict","pictclipping","pisn","pkcs12","pkg","pkpass","pkpasses","pl","placeholder","playground","playgroundbook","plist","pls","plugin","plugindata","pluginkit","ply","pm","pmcl","png","PNGf","PNRA","PNRM","pntg","pot","potm","potx","ppa","ppam","ppdf","ppm","ppot","ppp","pps","ppsm","PPSS","ppsx","ppt","pptm","pptx","pref","prefpane","prfb","prfí","prm","prn","prnt","proto","provisionprofile","prvf","ps","psb","psd","pset","psys","pvm","pvr","pvs","pvt","pwl","pxb","pxd","pxd-sidecar","pxm","pxs","py","pyc","qlgenerator","qt","qta","qtif","qtpxcomposition","qtz","ques","r","ra","raf","ram","ramd","rapp","raw","rb","rbw","rcar","rcnt","rdfe","rdoc","rdp","reality","realitycomposerpro","realityenv","redditvault","referenceobject","rgb","rge","rhtml","rjson","rm","rmp","rmvb","root","rpp","rs","rsrv","rss","rtf","rtfd","rtsl","rtsx","rw2","rwl","s","sabundle","safariextz","sample.txt","sapl","sapp","savedsearch","saver","sbdg","sbDp","sbFl","sbIC","sbk","sbNC","sbPC","sbRc","scc","scmp","scn","scnassets","scncache","scnp","scnz","scpt","scptd","scrí","script","scriptterminology","scrp","scsh","scss","sd2","sdbp","sdd","sdef","sdoc","sdv","sea","service","setext","sf2","sfld","sfnt","sfont","sgi","sh","shapes","shazamcatalog","shdD","shdf","shfl","shlb","shna","shortcut","shpt","shro","shrt","shrw","shtm","shuk","shutdownstall","sidx","simruntime","sit","SIT5","sitx","sks","sld8","slidesaver","slk","slm","sln","slnf","sLS8","smart-health-card","smf","sndclipping","son","sparsebundle","sparseimage","spbundle","spf","spfs","spin","spki","sptheme","spx","sql","sqlite","sqlite3","sr2","srf","srvr","srw","stc","std","sti","stickerpack","stl","stop","storekit","storyboard","storyboardc","strD","strings","stringsdict","strt","stsn","stw","stx","styl","suggestionsassets","suit","susr","svg","svgz","swift","swiftpm","sxc","sxd","sxg","sxi","sxm","sxw","sync","sysprefex","systemextension","tags","tailspin","tAps","tar","tbav","tbd","tblb","tbz","tbz2","tcl","tcsh","tcus","tdel","tDoc","tDsk","tDwn","template","term","terminal","tex","text","textclipping","textfactory","textile","textstyles","tfil","tga","tgz","theater","thmx","thom","thumb.low","thumb.standard","tif","tiff","tightbeam","tl","tlb","tMov","tMus","toast","toml","tool","tpic","tPub","tql","trace","tracetemplate","trsh","ts","tsv","tsx","ttc","ttf","tUtl","tutorial","tvdb","TVLb","tvlibrary","txt","txtn","txz","ubdg","udif","udsk","ufld","ul","ulaw","ulck","ulw","unfs","unus","url","urln","usd","usdz","user","ustl","ut16","utf8","utií","utxt","uu","v","vbs","vcal","vcard","vcf","vCrd","vcs","vdx","vert","vertex","vfw","vhd","vhdl","videoslibrary","viewhierarchy","VirtualMac","vl","vmsn","vmtm","VMWare","vmx","vmxf","vncloc","voicecontrolcommands","voprefs","vpc7","vs","vsd","vsdx","vsh","vss","vssm","vssx","vst","vstm","vstx","vsx","vtt","vtx","w64","W8BN","W8TN","waa","wai","wam","wand","war","wasm","Watch","watchface","wav","wave","wax","WDCD","wdgt","wdmon","wdsidecar","weba","webarchive","webbookmark","webhistory","webloc","webm","webp","webplugin","wfld","wflow","whiteboard","widgetkitsim","Windows","Windows2000","Windows2003","Windows2008","Windows7","WindowsVista","WindowsXP","wm","wma","wmp","wmv","wmx","workflow","workout","worksheet","wprd","writ","wvx","wxbn","xar","xbm","xcappdata","xcarchive","xcassets","xcbuildmetrics","xcconfig","xccrashpoint","xcdatamodel","xcdatamodeld","xcdiskwritelog","xcdiskwritepoint","xcfeedbackpoint","xcfilelist","xcframework","xchanglog","xchangpoint","xclaunchlog","xclaunchpoint","xcmappingmodel","xcmetricsdata","xcode","xcplaygroundpage","xcplugin","xcplugindata","xcprivacy","xcprocessorusagelog","xcprocessorusagepoint","xcresult","xcscheme","xcsnapshots","xcstickers","xcstrings","xctest","xctestplan","xctestproducts","xctestrun","xctoolchain","xcworkspace","xfd","xfdf","xhtm","xhtml","xib","xip","xla","xlam","xlb","xliff","xll","xlm","xlp9","xls","xls8","xlsb","xlsm","xlsx","xltm","xltx","xlw","xlw8","xml","xpc","xpl","xz","y","yaa","yaml","ym","yml","ymm","yxx","z","zettingz","zip","zsh")

#build our array of filetype classes
foreach($item in $sourceFileTypeArray) {
     #the pipe to out-null avoids the spurious array index output. If I find a more elegant way to handle it, i will
     #deal with the jpeg/jpeg issue. This does create duplicate entries, but it shouldn't be a problem for us

	switch ($item) {
		"3fr" {
			$fileTypeItem = @([fileType]::new($item,"com.hasselblad.3fr-raw-image"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"3g2" {
			$fileTypeItem = @([fileType]::new($item,"public.3gpp2"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"3gp" {
			$fileTypeItem = @([fileType]::new($item,"public.3gpp"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"3gp2" {
			$fileTypeItem = @([fileType]::new($item,"public.3gpp2"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"3gpp" {
			$fileTypeItem = @([fileType]::new($item,"public.3gpp"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"7z" {
			$fileTypeItem = @([fileType]::new($item,"org.7-zip.7-zip-archive"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"8BPB" {
			$fileTypeItem = @([fileType]::new($item,"com.adobe.photoshop-large-image"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"aa" {
			$fileTypeItem = @([fileType]::new($item,"com.audible.aa-audio"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"aac" {
			$fileTypeItem = @([fileType]::new($item,"public.aac-audio"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"aae" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.photos.apple-adjustment-envelope"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"aaf" {
			$fileTypeItem = @([fileType]::new($item,"org.aafassociation.advanced-authoring-format"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"aar" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.archive"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"Aarc" {
			$fileTypeItem = @([fileType]::new($item,"com.microsoft.outlook15.archive"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"aax" {
			$fileTypeItem = @([fileType]::new($item,"com.audible.aax-audiobook"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"abcdg" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.addressbook.group"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"abcdp" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.addressbook.person"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"abdg" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.icon-overlay.alias-badge"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"abr" {
			$fileTypeItem = @([fileType]::new($item,"com.adobe.photoshop.brush"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"com.apple.watch-38mm-series3-gps-6"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"ac-3" {
			$fileTypeItem = @([fileType]::new($item,"public.ac3-audio"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"ac3" {
			$fileTypeItem = @([fileType]::new($item,"public.ac3-audio"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"acct" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.application-icon.icloud-private-relay"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"acrobat" {
			$fileTypeItem = @([fileType]::new($item,"com.adobe.pdf"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"action" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.automator-action"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"acts" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.legacy.actions-icon"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"ada" {
			$fileTypeItem = @([fileType]::new($item,"public.ada-source"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"adb" {
			$fileTypeItem = @([fileType]::new($item,"public.ada-source"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"adcL" {
			$fileTypeItem = @([fileType]::new($item,"public.folder"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"adjustments" {
			$fileTypeItem = @([fileType]::new($item,"com.pixelmatorteam.adjustments"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"ads" {
			$fileTypeItem = @([fileType]::new($item,"public.ada-source"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"adts" {
			$fileTypeItem = @([fileType]::new($item,"public.aac-audio"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"aea" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.encrypted-archive"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"afploc" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.afp-internet-location"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"afps" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.legacy.finder-icon"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"agent" {
			$fileTypeItem = @([fileType]::new($item,"com.microsoft.onedrive.fluid"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"ahap" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.haptics.ahap"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"public.haptics-content"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"ai" {
			$fileTypeItem = @([fileType]::new($item,"com.adobe.illustrator.ai-image"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"aicb" {
			$fileTypeItem = @([fileType]::new($item,"com.adobe.illustrator.aicb"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"aif" {
			$fileTypeItem = @([fileType]::new($item,"public.aiff-audio"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"aifc" {
			$fileTypeItem = @([fileType]::new($item,"public.aifc-audio"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"aiff" {
			$fileTypeItem = @([fileType]::new($item,"public.aiff-audio"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"aird" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.generic-airdisk"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"all" {
			$fileTypeItem = @([fileType]::new($item,"purebred.zip.all"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"amnu" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.legacy.finder-icon"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"amr" {
			$fileTypeItem = @([fileType]::new($item,"org.3gpp.adaptive-multi-rate-audio"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"animoji" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.avatarkit.animoji"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"anylistrecipes" {
			$fileTypeItem = @([fileType]::new($item,"com.purplecover.anylist.recipeexport"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"apinotes" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.xcode.apinotes"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"aplibrary" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.photos.projects.slideshow"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"apns" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.dt.document.apns"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"app" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.application-bundle"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"com.apple.localizable-name-bundle"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"APPC" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.application-file"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"com.apple.deprecated-application-file"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"APPD" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.application-file"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"com.apple.deprecated-application-file"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"appdownload" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.appstore.appdownload"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"appe" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.application-file"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"com.apple.deprecated-application-file"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"appex" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.application-and-system-extension"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"appledocumentscanarchive" {
			$fileTypeItem = @([fileType]::new($item,"public.app-category.medical"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"applescript" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.applescript.text"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"appr" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.legacy.finder-icon"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"apps" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.applications-folder"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"arng" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.legacy.keep-arranged"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"artrace" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.ariadne.artrace"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"arw" {
			$fileTypeItem = @([fileType]::new($item,"com.sony.arw-raw-image"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"as" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.applesingle-archive"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"com.barebones.bbedit.actionscript-source"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"asf" {
			$fileTypeItem = @([fileType]::new($item,"com.microsoft.advanced-systems-format"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"org.oasis-open.opendocument.presentation"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"ASF_" {
			$fileTypeItem = @([fileType]::new($item,"com.microsoft.advanced-systems-format"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"org.oasis-open.opendocument.presentation"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"asif" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.disk-image-sparse"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"asm" {
			$fileTypeItem = @([fileType]::new($item,"public.assembly-source"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"asnd" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.legacy.finder-icon"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"com.apple.unknown-object"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"asp" {
			$fileTypeItem = @([fileType]::new($item,"com.barebones.bbedit.asp-source"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"aspx" {
			$fileTypeItem = @([fileType]::new($item,"com.barebones.bbedit.asp-source"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"astc" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.notes.gallery"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"org.khronos.astc"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"astí" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.legacy.finder-icon"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"com.apple.unknown-object"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"asup" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.legacy.finder-icon"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"com.apple.unknown-object"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"asx" {
			$fileTypeItem = @([fileType]::new($item,"com.microsoft.advanced-stream-redirector"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"ASX_" {
			$fileTypeItem = @([fileType]::new($item,"com.microsoft.advanced-stream-redirector"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"atlk" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.legacy.finder-icon"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"com.apple.unknown-object"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"atrc" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.trace"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"atzn" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.legacy.finder-icon"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"com.apple.unknown-object"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"au" {
			$fileTypeItem = @([fileType]::new($item,"public.au-audio"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"AUDB" {
			$fileTypeItem = @([fileType]::new($item,"com.audible.aa-audio"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"AUDX" {
			$fileTypeItem = @([fileType]::new($item,"com.audible.aa-audio"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"com.audible.aax-audiobook"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"aupreset" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.mainstage.patches"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"avchd" {
			$fileTypeItem = @([fileType]::new($item,"public.audiovisual-content-collection"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"avci" {
			$fileTypeItem = @([fileType]::new($item,"public.avci"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"AVcL" {
			$fileTypeItem = @([fileType]::new($item,"com.adobe.indesign-import-avcl"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"avcs" {
			$fileTypeItem = @([fileType]::new($item,"public.avcs"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"avi" {
			$fileTypeItem = @([fileType]::new($item,"public.avi"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"avif" {
			$fileTypeItem = @([fileType]::new($item,"public.avif"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"axr" {
			$fileTypeItem = @([fileType]::new($item,"com.sony.axr-raw-image"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"backupbundle" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.disk-image-sparse-bundle"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"band" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.garageband.project"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"baro" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.legacy.backward-arrow"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"bash" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.xcode.bash-script"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"public.bash-script"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"bbaiworksheet" {
			$fileTypeItem = @([fileType]::new($item,"com.barebones.bbedit.ai-chat-worksheet"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"bbcolors" {
			$fileTypeItem = @([fileType]::new($item,"com.barebones.bbedit.legacy-color-scheme"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"bbcolorscheme" {
			$fileTypeItem = @([fileType]::new($item,"com.barebones.bbedit.color-scheme"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"bblm" {
			$fileTypeItem = @([fileType]::new($item,"com.barebones.bbedit.language-module"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"com.barebones.bbedit.text-factory"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"bbnotebookd" {
			$fileTypeItem = @([fileType]::new($item,"com.barebones.bbedit.notebook"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"bbpackage" {
			$fileTypeItem = @([fileType]::new($item,"com.barebones.bbedit.package"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"bbproject" {
			$fileTypeItem = @([fileType]::new($item,"com.barebones.bbedit.legacy-project"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"bbprojectd" {
			$fileTypeItem = @([fileType]::new($item,"com.barebones.bbedit.project"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"bdm" {
			$fileTypeItem = @([fileType]::new($item,"public.sdp"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"bdmv" {
			$fileTypeItem = @([fileType]::new($item,"public.sdp"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"bfld" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.finder.burn-folder"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"bin" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.macbinary-archive"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"binlog" {
			$fileTypeItem = @([fileType]::new($item,"com.microsoft.msbuild-log"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"blank" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.preview.blank"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"bmp" {
			$fileTypeItem = @([fileType]::new($item,"com.microsoft.bmp"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"bmpf" {
			$fileTypeItem = @([fileType]::new($item,"com.hp.smartmac.bmpf"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"com.microsoft.bmp"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"bmrk" {
			$fileTypeItem = @([fileType]::new($item,"public.bookmark"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"board" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.freeform.board"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"bonj" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.bonjour"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"book" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.ibooksauthor.book"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"com.apple.ibooksauthor.pkgbook"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"brushes" {
			$fileTypeItem = @([fileType]::new($item,"com.pixelmatorteam.brushes"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"burn" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.legacy.burn"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"bwf" {
			$fileTypeItem = @([fileType]::new($item,"com.microsoft.waveform-audio"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"bz" {
			$fileTypeItem = @([fileType]::new($item,"public.bzip2-archive"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"bz2" {
			$fileTypeItem = @([fileType]::new($item,"public.bzip2-archive"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"c" {
			$fileTypeItem = @([fileType]::new($item,"public.c-source"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"c++" {
			$fileTypeItem = @([fileType]::new($item,"public.c-plus-plus-source"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"cab" {
			$fileTypeItem = @([fileType]::new($item,"com.microsoft.cab"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"caction" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.applescript.text-object"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"com.apple.automator-conversion-action"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"caf" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.coreaudio-format"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"cannedsearch" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.finder.predefined-search"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"capl" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.legacy.finder-icon"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"com.apple.unknown-object"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"caut" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.alert-caution"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"cbdg" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.icon-overlay.alert-caution-badge"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"cboard" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.iwork.keynote.kth"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"cc" {
			$fileTypeItem = @([fileType]::new($item,"public.c-plus-plus-source"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"ccl" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.color-file"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"CCTX" {
			$fileTypeItem = @([fileType]::new($item,"com.adobe.cc-text-interchange"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"cdda" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.music.cdda"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"public.cdda-audio"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"cddr" {
			$fileTypeItem = @([fileType]::new($item,"public.cd-media"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"cdev" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.application-file"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"com.apple.deprecated-application-file"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"cdr" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.disk-image-cdr"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"cel" {
			$fileTypeItem = @([fileType]::new($item,"public.flc-animation"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"cepp" {
			$fileTypeItem = @([fileType]::new($item,"com.adobe.cep.dnd.pasteboardtype"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"cer" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.data-container"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"public.x509-certificate"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"cert" {
			$fileTypeItem = @([fileType]::new($item,"public.x509-certificate"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"cfg" {
			$fileTypeItem = @([fileType]::new($item,"com.barebones.bbedit.ini-configuration"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"cfr" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.cfr-font"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"cgi" {
			$fileTypeItem = @([fileType]::new($item,"com.barebones.bbedit.cgi-script"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"chrono-timeline" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.widgetkit.simulator.timeline"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"cl" {
			$fileTypeItem = @([fileType]::new($item,"public.opencl-source"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"class" {
			$fileTypeItem = @([fileType]::new($item,"com.sun.java-class"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"clck" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.legacy.clock-icon"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"clipsother" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.clips.clipsother"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"clipspkg" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.clips.clipspkg"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"clipsproject" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.clips.project"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"clp" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.clips-source"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"clpu" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.finder.clipping"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"clr" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.color-file"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"clsp" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.colorsync-profile"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"cmnu" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.legacy.finder-icon"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"com.apple.unknown-object"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"CMYK" {
			$fileTypeItem = @([fileType]::new($item,"com.adobe.cmyk-color"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"cnct" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.legacy.connect-to"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"coderequirement" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.xcode.code-requirement-property-list"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"colorpalette" {
			$fileTypeItem = @([fileType]::new($item,"com.pixelmatorteam.colorpalette"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"command" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.terminal.shell-script"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"configprofile" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.configprofile"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"copilot" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.mach-o-executable"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"com.microsoft.onedrive.fluid"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"cp" {
			$fileTypeItem = @([fileType]::new($item,"public.c-plus-plus-source"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"cpgz" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.bom-compressed-cpio"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"com.apple.instruments.instrdst"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"cpio" {
			$fileTypeItem = @([fileType]::new($item,"public.cpio-archive"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"cpp" {
			$fileTypeItem = @([fileType]::new($item,"public.c-plus-plus-source"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"cr2" {
			$fileTypeItem = @([fileType]::new($item,"com.canon.cr2-raw-image"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"cr3" {
			$fileTypeItem = @([fileType]::new($item,"com.canon.cr3-raw-image"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"crash" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.crashreport"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"crt" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.data-container"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"public.x509-certificate"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"crw" {
			$fileTypeItem = @([fileType]::new($item,"com.canon.crw-raw-image"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"crwebloc" {
			$fileTypeItem = @([fileType]::new($item,"org.chromium.shortcut"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"crx" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.graphic-icon.usb-c-port"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"com.microsoft.msbuild-log"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"org.chromium.extension"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"cs" {
			$fileTypeItem = @([fileType]::new($item,"com.microsoft.c-sharp"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"csh" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.xcode.csh-script"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"public.csh-script"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"cshm" {
			$fileTypeItem = @([fileType]::new($item,"public.cd-r-media"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"csproj" {
			$fileTypeItem = @([fileType]::new($item,"com.microsoft.c-sharp-project"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"css" {
			$fileTypeItem = @([fileType]::new($item,"public.css"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"csstore" {
			$fileTypeItem = @([fileType]::new($item,"public.database"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"cst" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.logic.channelstripsetting"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"csv" {
			$fileTypeItem = @([fileType]::new($item,"public.comma-separated-values-text"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"ctags" {
			$fileTypeItem = @([fileType]::new($item,"com.barebones.bbedit.ctags-data"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"ctrD" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.legacy.finder-icon"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"com.apple.unknown-object"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"ctrl" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.legacy.finder-icon"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"com.apple.unknown-object"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"org.khronos.glsl.tess-control-shader"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"cube" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.videoapps.cube"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"com.blackmagicdesign.cube"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"cxx" {
			$fileTypeItem = @([fileType]::new($item,"public.c-plus-plus-source"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"dae" {
			$fileTypeItem = @([fileType]::new($item,"org.khronos.collada.digital-asset-exchange"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"dali" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.legacy.finder-icon"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"db" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.gamecontrollersettings.playstation.logo"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"com.hyperobjc.sqliteflow.db"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"db3" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.gamecontrollersettings.playstation.logo"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"com.hyperobjc.sqliteflow.db"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"dbox" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.drop-folder"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"dcm" {
			$fileTypeItem = @([fileType]::new($item,"org.nema.dicom"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"dcr" {
			$fileTypeItem = @([fileType]::new($item,"com.kodak.raw-image"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"DDim" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.disk-image-raw"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"dds" {
			$fileTypeItem = @([fileType]::new($item,"com.microsoft.dds"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"definition" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.automator-type-definition"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"defs" {
			$fileTypeItem = @([fileType]::new($item,"public.mig-source"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"der" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.data-container"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"public.x509-certificate"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"desk" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.desktop-folder"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"devf" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.developer-folder"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"devi" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.disk-image"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"com.apple.disk-image-udif"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"dext" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.driver-extension"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"dflexp" {
			$fileTypeItem = @([fileType]::new($item,"com.hyperobjc.sqliteflow.filter"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"dfont" {
			$fileTypeItem = @([fileType]::new($item,"com.adobe.postscript-font"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"com.apple.fontbook.draggablefont"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"com.apple.truetype-datafork-suitcase-font"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"dib" {
			$fileTypeItem = @([fileType]::new($item,"com.microsoft.bmp"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"dic" {
			$fileTypeItem = @([fileType]::new($item,"com.microsoft.word.dictionary"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"com.microsoft.word.mhtml"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"DICM" {
			$fileTypeItem = @([fileType]::new($item,"org.nema.dicom"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"dicom" {
			$fileTypeItem = @([fileType]::new($item,"org.nema.dicom"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"dif" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.protected-mpeg-4-video"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"com.microsoft.excel.dif"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"diff" {
			$fileTypeItem = @([fileType]::new($item,"public.patch-file"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"disk" {
			$fileTypeItem = @([fileType]::new($item,"public.volume"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"dist" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.installer-distribution-package"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"distz" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.installer-distribution-package"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"dll" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.x11-mach-o-executable"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"com.microsoft.windows-dynamic-link-library"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"dls" {
			$fileTypeItem = @([fileType]::new($item,"public.downloadable-sound"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"dlyan" {
			$fileTypeItem = @([fileType]::new($item,"public.dylan-source"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"dmg" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.disk-image"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"com.apple.disk-image-udif"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"dmgpart" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.disk-image-udif-segment"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"dng" {
			$fileTypeItem = @([fileType]::new($item,"com.adobe.raw-image"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"doc" {
			$fileTypeItem = @([fileType]::new($item,"com.microsoft.word.doc"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"doccarchive" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.documentation.doccarchive"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"docm" {
			$fileTypeItem = @([fileType]::new($item,"com.microsoft.word.openxmlformats.wordprocessingml.document.macroenabled"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"org.openxmlformats.wordprocessingml.document.macro-enabled"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"docs" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.documents-folder"))
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

		"dot" {
			$fileTypeItem = @([fileType]::new($item,"com.microsoft.word.dot"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"dotm" {
			$fileTypeItem = @([fileType]::new($item,"com.microsoft.word.openxmlformats.wordprocessingml.template.macroenabled"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"dotx" {
			$fileTypeItem = @([fileType]::new($item,"com.microsoft.word.openxmlformats.wordprocessingml.template"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"org.openxmlformats.wordprocessingml.template"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"download" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.safari.download"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"drawing" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.drawing"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"drfb" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.icon-overlay.drop-folder-badge"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"dsnd" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.legacy.finder-icon"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"com.apple.unknown-object"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"dsrv" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.legacy.finder-icon"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"com.apple.unknown-object"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"dsym" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.xcode.dsym"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"dtdspec" {
			$fileTypeItem = @([fileType]::new($item,"com.barebones.bbedit.dtdspec"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"com.barebones.bbedit.textdocument-object"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"dv" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.protected-mpeg-4-video"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"dvc!" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.protected-mpeg-4-video"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"dvd" {
			$fileTypeItem = @([fileType]::new($item,"public.dvd-media"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"dvdr" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.disk-image-cdr"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"com.apple.pro-display-xdr"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"public.dvd-r-media"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"dvdw" {
			$fileTypeItem = @([fileType]::new($item,"public.dvd-rw-media"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"dvticonspec" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.dt.dvticon.spec"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"dvtplugin" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.dt.dvt.plug-in"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"dwnf" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.downloads-folder"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"dxo" {
			$fileTypeItem = @([fileType]::new($item,"com.dxo.raw-image"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"dylib" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.mach-o-dylib"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"eac3" {
			$fileTypeItem = @([fileType]::new($item,"public.enhanced-ac3-audio"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"ec-3" {
			$fileTypeItem = @([fileType]::new($item,"public.enhanced-ac3-audio"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"edn" {
			$fileTypeItem = @([fileType]::new($item,"com.adobe.edn"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"edtf" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.legacy.finder-icon"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"com.apple.unknown-object"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"effects" {
			$fileTypeItem = @([fileType]::new($item,"com.pixelmatorteam.effects"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"efx" {
			$fileTypeItem = @([fileType]::new($item,"com.j2.efx-fax"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"ejec" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.legacy.eject-media"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"EM3F" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.logic-song"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"eml" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.mail.email"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"com.microsoft.outlook15.email-message"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"emltpl" {
			$fileTypeItem = @([fileType]::new($item,"com.microsoft.outlook.template"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"emlx" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.mail.emlx"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"emlxpart" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.mail.emlx.part"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"enex" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.notes.richtext"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"com.apple.notes.richtext"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"entitlements" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.xcode.entitlements-property-list"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"eps" {
			$fileTypeItem = @([fileType]::new($item,"com.adobe.encapsulated-postscript"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"EPSF" {
			$fileTypeItem = @([fileType]::new($item,"com.adobe.encapsulated-postscript"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"epub" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.ibooks.epub"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"org.idpf.epub-container"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"org.idpf.epub-folder"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"eras" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.legacy.erasing"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"erb" {
			$fileTypeItem = @([fileType]::new($item,"com.barebones.bbedit.erb-source"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"erf" {
			$fileTypeItem = @([fileType]::new($item,"com.epson.raw-image"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"etd" {
			$fileTypeItem = @([fileType]::new($item,"com.adobe.etd"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"etx" {
			$fileTypeItem = @([fileType]::new($item,"com.barebones.bbedit.setext-source"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"eval" {
			$fileTypeItem = @([fileType]::new($item,"org.khronos.glsl.tess-evaluation-shader"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"evry" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.everyone-icon"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"ewsmbox" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.mail.ewsmbox"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"exe" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.mach-o-bundle"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"com.vmware.foreign.vhd"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"exp" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.symbol-export"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"explain" {
			$fileTypeItem = @([fileType]::new($item,"com.morriscooke.explain"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"exr" {
			$fileTypeItem = @([fileType]::new($item,"com.ilm.openexr-image"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"com.microsoft.powerpoint.pps"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"exs" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.logic.exs"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"extD" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.legacy.finder-icon"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"com.apple.unknown-object"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"extn" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.library-folder"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"f" {
			$fileTypeItem = @([fileType]::new($item,"public.fortran-source"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"f4a" {
			$fileTypeItem = @([fileType]::new($item,"com.adobe.flash.video"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"f4p" {
			$fileTypeItem = @([fileType]::new($item,"com.adobe.flash.video"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"f4v" {
			$fileTypeItem = @([fileType]::new($item,"com.adobe.flash.video"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"f77" {
			$fileTypeItem = @([fileType]::new($item,"public.fortran-77-source"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"f90" {
			$fileTypeItem = @([fileType]::new($item,"public.fortran-90-source"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"f95" {
			$fileTypeItem = @([fileType]::new($item,"public.fortran-95-source"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"faro" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.legacy.forward-arrow"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"favs" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.legacy.favorite-items"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"fcgi" {
			$fileTypeItem = @([fileType]::new($item,"com.barebones.bbedit.cgi-script"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"fcpproj" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.videoapps.fcpproj"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"fcpxmld" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.keynote.key"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"fdf" {
			$fileTypeItem = @([fileType]::new($item,"com.adobe.fdf"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"fff" {
			$fileTypeItem = @([fileType]::new($item,"com.hasselblad.fff-raw-image"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"ffil" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.font-suitcase"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"fileloc" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.file-internet-location"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"flac" {
			$fileTypeItem = @([fileType]::new($item,"org.xiph.flac"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"flc" {
			$fileTypeItem = @([fileType]::new($item,"public.flc-animation"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"fldr" {
			$fileTypeItem = @([fileType]::new($item,"public.folder"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"fli" {
			$fileTypeItem = @([fileType]::new($item,"public.flc-animation"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"fluid" {
			$fileTypeItem = @([fileType]::new($item,"com.microsoft.onedrive.fluid"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"flv" {
			$fileTypeItem = @([fileType]::new($item,"com.adobe.flash.video"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"FNDR" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.legacy.finder-icon"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"com.apple.unknown-object"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"fold" {
			$fileTypeItem = @([fileType]::new($item,"public.folder"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"font" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.legacy.finder-icon"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"com.apple.unknown-object"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"fpbf" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.finder.burn-folder"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"fpx" {
			$fileTypeItem = @([fileType]::new($item,"com.kodak.flashpix-image"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"frag" {
			$fileTypeItem = @([fileType]::new($item,"org.khronos.glsl.fragment-shader"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"fragment" {
			$fileTypeItem = @([fileType]::new($item,"org.khronos.glsl.fragment-shader"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"fragsh" {
			$fileTypeItem = @([fileType]::new($item,"org.khronos.glsl.fragment-shader"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"framework" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.localizable-name-bundle"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"fs" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.file-system-plug-in"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"org.fsharp.f-sharp"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"org.khronos.glsl.fragment-shader"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"fsh" {
			$fileTypeItem = @([fileType]::new($item,"org.khronos.glsl.fragment-shader"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"fsproj" {
			$fileTypeItem = @([fileType]::new($item,"org.fsharp.f-sharp-project"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"ftploc" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.ftp-internet-location"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"ftps" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.legacy.finder-icon"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"com.apple.unknown-object"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"ftrh" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.trash-full"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"furl" {
			$fileTypeItem = @([fileType]::new($item,"public.file-url"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"fVlt" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.file-vault"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"fvoc" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.movie-folder"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"game" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.chess.game"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"gbproj" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.garageband.project"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"gcf" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.storage.settings.trash.fill"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"com.pacifict.graphingcalculator.gcf"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"gchdb" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.logic.gchdb"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"com.omnigroup.omnigraffle.diagramstyle-package"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"gdiagramstyle" {
			$fileTypeItem = @([fileType]::new($item,"com.omnigroup.omnigraffle.diagramstyle"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"geojson" {
			$fileTypeItem = @([fileType]::new($item,"public.geojson"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"geom" {
			$fileTypeItem = @([fileType]::new($item,"org.khronos.glsl.geometry-shader"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"gfld" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.groups-folder"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"gif" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.private.auto-loop-gif"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"com.compuserve.gif"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"com.microsoft.ppt.export.ext.animatedgif"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"com.microsoft.ppt.export.ext.gif"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"GIFf" {
			$fileTypeItem = @([fileType]::new($item,"com.compuserve.gif"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"GImg" {
			$fileTypeItem = @([fileType]::new($item,"com.roxio.disk-image-toast"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"glas" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.legacy.magnifying-glass"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"glb" {
			$fileTypeItem = @([fileType]::new($item,"org.khronos.glb"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"glibb" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.logic.impulseresponse"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"glsl" {
			$fileTypeItem = @([fileType]::new($item,"org.khronos.glsl-source"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"gltf" {
			$fileTypeItem = @([fileType]::new($item,"org.khronos.gltf"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"gmac" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.mac"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"gmk" {
			$fileTypeItem = @([fileType]::new($item,"public.make-source"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"gnpc" {
			$fileTypeItem = @([fileType]::new($item,"public.computer"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"gnrl" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.legacy.general-icon"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"go" {
			$fileTypeItem = @([fileType]::new($item,"com.barebones.bbedit.go-source"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"gpr" {
			$fileTypeItem = @([fileType]::new($item,"com.gopro.gpr"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"gpurestart" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.gpurestart"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"gputrace" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.dt.xctest.element-snapshot"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"gpx" {
			$fileTypeItem = @([fileType]::new($item,"com.topografix.gpx"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"gradients" {
			$fileTypeItem = @([fileType]::new($item,"com.pixelmatorteam.gradients"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"graffle" {
			$fileTypeItem = @([fileType]::new($item,"com.omnigroup.omnigraffle.graffle"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"grid" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.legacy.grid"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"groupactivity" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.groupactivities.activity"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"grup" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.user-group"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"gs" {
			$fileTypeItem = @([fileType]::new($item,"org.khronos.glsl.geometry-shader"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"gsh" {
			$fileTypeItem = @([fileType]::new($item,"org.khronos.glsl.geometry-shader"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"gstencil" {
			$fileTypeItem = @([fileType]::new($item,"com.omnigroup.omnigraffle.gstencil"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"com.omnigroup.omnigraffle.gstencil-package"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"gtdbg" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.gputools.gtdbg"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"gtemplate" {
			$fileTypeItem = @([fileType]::new($item,"com.omnigroup.omnigraffle.template"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"com.omnigroup.omnigraffle.template-package"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"gtmi" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.generic-time-machine-disk"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"guide" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.documentation.guide"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"gusr" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.guest-user"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"gwin" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.legacy.window"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"gz" {
			$fileTypeItem = @([fileType]::new($item,"org.gnu.gnu-zip-archive"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"gzip" {
			$fileTypeItem = @([fileType]::new($item,"org.gnu.gnu-zip-archive"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"h" {
			$fileTypeItem = @([fileType]::new($item,"public.c-header"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"h++" {
			$fileTypeItem = @([fileType]::new($item,"public.c-plus-plus-header"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"hang" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.hangreport"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"hasaccessory" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.homekit-accessory-simulator.accessory"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"com.apple.settings.privacysecurity.extension.privacy-filesandfolders"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"haslibrary" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.homekit-accessory-simulator.library"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"com.apple.softwareupdate-settings.generic-update"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"hasstate" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.homekit-accessory-simulator.state"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"hdr" {
			$fileTypeItem = @([fileType]::new($item,"public.radiance"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"hdrv" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.disk-image-raw"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"heic" {
			$fileTypeItem = @([fileType]::new($item,"public.heic"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"heics" {
			$fileTypeItem = @([fileType]::new($item,"public.heics"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"heif" {
			$fileTypeItem = @([fileType]::new($item,"public.heif"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"heifs" {
			$fileTypeItem = @([fileType]::new($item,"public.heifs"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"help" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.help"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"com.apple.help-document"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"hfs" {
			$fileTypeItem = @([fileType]::new($item,"com.adobe.indesign-import-hfs"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"hh" {
			$fileTypeItem = @([fileType]::new($item,"public.c-plus-plus-header"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"hlsl" {
			$fileTypeItem = @([fileType]::new($item,"com.microsoft.hlsl"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"horizon365vm" {
			$fileTypeItem = @([fileType]::new($item,"com.vmware.horizon365vm"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"horizonapp" {
			$fileTypeItem = @([fileType]::new($item,"com.vmware.horizonapp"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"horizonvm" {
			$fileTypeItem = @([fileType]::new($item,"com.vmware.horizonvm"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"hp" {
			$fileTypeItem = @([fileType]::new($item,"public.c-plus-plus-header"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"hp_remote_control_config" {
			$fileTypeItem = @([fileType]::new($item,"com.hp.remote.control.config"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"hpp" {
			$fileTypeItem = @([fileType]::new($item,"public.c-plus-plus-header"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"hqx" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.binhex-archive"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"htm" {
			$fileTypeItem = @([fileType]::new($item,"public.html"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"html" {
			$fileTypeItem = @([fileType]::new($item,"public.html"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"htps" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.legacy.finder-icon"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"com.apple.unknown-object"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"hufl" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.music.iappurl"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"com.apple.tv.iappurl"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"hvpl" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.music.visual"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"hxx" {
			$fileTypeItem = @([fileType]::new($item,"public.c-plus-plus-header"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"i" {
			$fileTypeItem = @([fileType]::new($item,"public.c-source.preprocessed"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"public.source-code"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"iba" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.ibooksauthor.book"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"ibooks" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.ibooks"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"com.apple.ibooks-container"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"com.apple.ibooks-folder"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"ibplugin" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.interfacebuilder.plugin"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"icbu" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.ical.backup-package"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"com.apple.ical.ics.event"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"icc" {
			$fileTypeItem = @([fileType]::new($item,"clsp"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"com.apple.colorsync-profile"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"icloud" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.bookmark"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"com.apple.mapkit.map-item"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"icm" {
			$fileTypeItem = @([fileType]::new($item,"clsp"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"com.apple.colorsync-profile"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"icma" {
			$fileTypeItem = @([fileType]::new($item,"com.adobe.incopy-assignment"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"icml" {
			$fileTypeItem = @([fileType]::new($item,"com.adobe.incopy-document"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"icns" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.icns"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"ico" {
			$fileTypeItem = @([fileType]::new($item,"com.microsoft.ico"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"iconset" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.iconset"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"ics" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.ical.ics"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"com.microsoft.outlook15.icalendar"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"public.to-do-item"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"idcp" {
			$fileTypeItem = @([fileType]::new($item,"com.charlessoft.macos-classic-installation-tome"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"ideplugin" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.dt.ide.plug-in"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"idml" {
			$fileTypeItem = @([fileType]::new($item,"com.adobe.indesign-markup"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"idms" {
			$fileTypeItem = @([fileType]::new($item,"com.adobe.indesign-snippet"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"idsk" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.idisk"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"public.file-sharepoint"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"ig" {
			$fileTypeItem = @([fileType]::new($item,"com.instagram.gram"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"igo" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.ios-simulator"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"com.instagram.exclusivegram"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"íhlp" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.legacy.finder-icon"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"com.apple.unknown-object"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"ii" {
			$fileTypeItem = @([fileType]::new($item,"public.c-plus-plus-source.preprocessed"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"iig" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.iig-source"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"public.source-code"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"iiq" {
			$fileTypeItem = @([fileType]::new($item,"com.phaseone.raw-image"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"ílib" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.library-folder"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"illustrator" {
			$fileTypeItem = @([fileType]::new($item,"com.adobe.illustrator.ai-image"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"ilmbplugin" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.ilifemediabrowser.plugin"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"íloc" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.legacy.finder-icon"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"com.apple.unknown-object"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"imapmbox" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.mail.imapmbox"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"img" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.disk-image-udif"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"imovieevent" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.iwork.keynote.sffkth"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"imovielibrary" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.imovielibrary"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"imoviemobile" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.imovie.imoviemobile"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"com.apple.imoviemobile"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"imovieother" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.imovie.imovieother"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"imovieproject" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.iwork.pages.pages"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"imovietrailer" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.imovie.imovietrailer"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"indb" {
			$fileTypeItem = @([fileType]::new($item,"com.adobe.indesign-book"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"indd" {
			$fileTypeItem = @([fileType]::new($item,"com.adobe.indesign-document"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"indesign" {
			$fileTypeItem = @([fileType]::new($item,"com.adobe.indesign-document"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"indl" {
			$fileTypeItem = @([fileType]::new($item,"com.adobe.indesign-library"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"indt" {
			$fileTypeItem = @([fileType]::new($item,"com.adobe.indesign-template"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"ínet" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.legacy.finder-icon"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"com.apple.unknown-object"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"inetloc" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.generic-internet-location"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"ini" {
			$fileTypeItem = @([fileType]::new($item,"com.barebones.bbedit.ini-configuration"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"inkt" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.ink.inktext"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"inl" {
			$fileTypeItem = @([fileType]::new($item,"public.c-plus-plus-inline-header"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"ino" {
			$fileTypeItem = @([fileType]::new($item,"com.barebones.bbedit.arduino-source"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"instrdst" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.instruments.instrdst"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"instrpkg" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.instruments.package-definition"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"intentdefinition" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.sirikit.intentdefinition"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"com.apple.sirikit.intentdefinition"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"internetconnect" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.podcasts.episode"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"com.apple.preference.network"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"intí" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.legacy.finder-icon"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"com.apple.unknown-object"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"introspection" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.quartzdebug.introspectiontrace"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"com.apple.settings.privacysecurity.extension.privacy-advertising"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"INX" {
			$fileTypeItem = @([fileType]::new($item,"com.adobe.indesign-interchange"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"ioreg" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.ioregistryexplorer.archive"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"ipa" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.itunes.ipa"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"ipmeta" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.iphoto.ipmeta"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"íprd" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.legacy.finder-icon"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"com.apple.unknown-object"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"ips" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.ips"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"com.apple.printcenter.jobids"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"ipspot" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.iphoto.ipspot"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"ipsw" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.itunes.ipsw"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"íscr" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.legacy.finder-icon"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"com.apple.unknown-object"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"iso" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.disk-image"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"isrv" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.legacy.finder-icon"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"com.apple.unknown-object"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"issf" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.sites-folder"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"ite" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.tv.ite"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"ítex" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.legacy.finder-icon"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"com.apple.unknown-object"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"itimer" {
			$fileTypeItem = @([fileType]::new($item,"com.fourthframe.intervals.itimer"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"itl" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.itunes.db"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"itlp" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.music.itlp"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"itms" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.itunes.store-url"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"com.apple.music.itms"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"com.apple.tv.itms"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"itun" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.music.metadata"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"com.apple.tv.metadata"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"j2c" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.live-photo"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"j2k" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.live-photo"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"jar" {
			$fileTypeItem = @([fileType]::new($item,"com.sun.java-archive"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"jav" {
			$fileTypeItem = @([fileType]::new($item,"com.sun.java-source"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"java" {
			$fileTypeItem = @([fileType]::new($item,"com.sun.java-source"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"javascript" {
			$fileTypeItem = @([fileType]::new($item,"com.netscape.javascript-source"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"jfx" {
			$fileTypeItem = @([fileType]::new($item,"com.j2.jfx-fax"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"jnlp" {
			$fileTypeItem = @([fileType]::new($item,"com.sun.java-web-start"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"jpeg" {
			$fileTypeItem = @([fileType]::new($item,"public.jpeg"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"jpf" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.live-photo"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"jpg" {
			$fileTypeItem = @([fileType]::new($item,"com.microsoft.ppt.export.ext.jpg"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"com.microsoft.ppt.export.jpg"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"public.heif-standard"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"public.jpeg"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"jpx" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.live-photo"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"js" {
			$fileTypeItem = @([fileType]::new($item,"com.netscape.javascript-source"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"jscript" {
			$fileTypeItem = @([fileType]::new($item,"com.netscape.javascript-source"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"json" {
			$fileTypeItem = @([fileType]::new($item,"public.json"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"json_crash" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.json-crash"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"jsp" {
			$fileTypeItem = @([fileType]::new($item,"com.barebones.bbedit.jsp-source"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"jxl" {
			$fileTypeItem = @([fileType]::new($item,"public.jpeg-xl"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"kar" {
			$fileTypeItem = @([fileType]::new($item,"public.midi-audio"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"kext" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.kernel-extension"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"key" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.iwork.keynote.key"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"com.apple.iwork.keynote.sffkey"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"key-tef" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.iwork.keynote.key-tef"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"com.apple.keynote.key"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"keychain" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.settings.privacysecurity.extension.filevault"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"com.rsa.pkcs-12"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"keychain-db" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.keychain"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"com.apple.settings.privacysecurity.extension.filevault"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"keynote" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.iwork.keynote.key"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"kpdc" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.iwork.keynote.kpdc"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"kpf" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.iwork.keynote.kpf"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"ksh" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.xcode.ksh-script"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"public.ksh-script"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"kth" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.iwork.keynote.kth"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"com.apple.iwork.keynote.sffkth"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"ktrace" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.ktrace"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"com.apple.pftmultiplerecordinginstrumenttype"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"ktx" {
			$fileTypeItem = @([fileType]::new($item,"org.khronos.ktx"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"l" {
			$fileTypeItem = @([fileType]::new($item,"public.lex-source"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"lasso" {
			$fileTypeItem = @([fileType]::new($item,"com.barebones.bbedit.lasso-source"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"latex" {
			$fileTypeItem = @([fileType]::new($item,"com.barebones.bbedit.tex-source"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"latm" {
			$fileTypeItem = @([fileType]::new($item,"public.mp4a-latm"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"public.mp4a-loas"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"layerstyles" {
			$fileTypeItem = @([fileType]::new($item,"com.pixelmatorteam.layerstyles"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"lbdg" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.icon-overlay.locked-badge"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"lcs" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.graphic-icon.accessories"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"com.microsoft.outlook15.icalendar"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"lid" {
			$fileTypeItem = @([fileType]::new($item,"public.dylan-source"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"ll" {
			$fileTypeItem = @([fileType]::new($item,"public.lex-source"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"lm" {
			$fileTypeItem = @([fileType]::new($item,"public.lex-source"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"lmm" {
			$fileTypeItem = @([fileType]::new($item,"public.lex-source"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"loas" {
			$fileTypeItem = @([fileType]::new($item,"public.mp4a-loas"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"lock" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.legacy.locked"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"logarchive" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.logarchive"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"logic" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.logic.project"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"logicx" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.logicx.project"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"logikcs" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.logic.keycommand"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"loop" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.mach-o-executable"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"com.microsoft.onedrive.fluid"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"lpdf" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.localized-pdf-bundle"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"lpp" {
			$fileTypeItem = @([fileType]::new($item,"public.lex-source"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"lso" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.logic-song"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"lsr" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.lsr-image"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"lua" {
			$fileTypeItem = @([fileType]::new($item,"com.barebones.bbedit.lua-source"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"LWFN" {
			$fileTypeItem = @([fileType]::new($item,"com.adobe.postscript-lwfn-font"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"lxx" {
			$fileTypeItem = @([fileType]::new($item,"public.lex-source"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"m" {
			$fileTypeItem = @([fileType]::new($item,"public.objective-c-plus-plus-source"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"public.objective-c-source"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"m15" {
			$fileTypeItem = @([fileType]::new($item,"public.mpeg"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"m2ts" {
			$fileTypeItem = @([fileType]::new($item,"public.avchd-mpeg-2-transport-stream"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"m2v" {
			$fileTypeItem = @([fileType]::new($item,"public.audiovisual-content"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"public.mpeg-2-video"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"m3u" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.music.m3u-playlist"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"com.apple.tv.m3u-playlist"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"m3u8" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.music.m3u-playlist"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"com.apple.tv.m3u-playlist"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"m4a" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.m4a-audio"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"m4b" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.protected-mpeg-4-audio-b"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"m4p" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.protected-mpeg-4-audio"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"m4r" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.mpeg-4-ringtone"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"com.apple.protected-mpeg-4-audio"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"m4v" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.m4v-video"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"m75" {
			$fileTypeItem = @([fileType]::new($item,"public.mpeg"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"M822" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.graphic-icon.game-controller"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"Mac" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.mac"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"macD" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.legacy.finder-icon"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"com.apple.unknown-object"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"Macintosh" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.mac"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"macs" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.document-type.system-folder"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"mailloc" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.mail-internet-location"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"mainstagegraph" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.logic.dpst"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"mak" {
			$fileTypeItem = @([fileType]::new($item,"public.make-source"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"make" {
			$fileTypeItem = @([fileType]::new($item,"public.make-source"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"markdown" {
			$fileTypeItem = @([fileType]::new($item,"net.daringfireball.markdown"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"mbdg" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.legacy.finder-icon"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"com.apple.unknown-object"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"mbox" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.mail.mbox"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"com.microsoft.outlook15.mailbox"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"md" {
			$fileTypeItem = @([fileType]::new($item,"net.daringfireball.markdown"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"mdimporter" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.metadata-importer"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"mdown" {
			$fileTypeItem = @([fileType]::new($item,"net.daringfireball.markdown"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"memgraph" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.dt.ide.memorygraphdebuggercontenttype"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"menu" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.menu-extra"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"metal" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.metal"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"mht" {
			$fileTypeItem = @([fileType]::new($item,"com.microsoft.word.mhtml"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"org.ietf.mhtml"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"mhtm" {
			$fileTypeItem = @([fileType]::new($item,"com.microsoft.word.mhtml"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"org.ietf.mhtml"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"mhtml" {
			$fileTypeItem = @([fileType]::new($item,"com.microsoft.word.mhtml"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"org.ietf.mhtml"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"mi" {
			$fileTypeItem = @([fileType]::new($item,"public.objective-c-source.preprocessed"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"mid" {
			$fileTypeItem = @([fileType]::new($item,"public.midi-audio"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"midi" {
			$fileTypeItem = @([fileType]::new($item,"public.midi-audio"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"mig" {
			$fileTypeItem = @([fileType]::new($item,"public.mig-source"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"mii" {
			$fileTypeItem = @([fileType]::new($item,"public.objective-c-plus-plus-source.preprocessed"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"mime" {
			$fileTypeItem = @([fileType]::new($item,"com.microsoft.outlook15.mime"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"minc" {
			$fileTypeItem = @([fileType]::new($item,"ca.mcgill.mni.bic.mnc"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"mitm" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.legacy.multiple-items"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"mk" {
			$fileTypeItem = @([fileType]::new($item,"public.make-source"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"mkdirectionsrequest" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.maps.directionsrequest"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"mlarchive" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.coreml.mlarchive"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"mlkitmodel" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.coreml.model"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"mlmodel" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.coreml.model"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"public.haptics-content"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"mlmodelc" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.coreml.mlmodelc"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"mlmodelkey" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.coreml.mlmodelkey"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"mlpackage" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.coreml.mlpackage"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"mlpd" {
			$fileTypeItem = @([fileType]::new($item,"org.mono.profile"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"mlperf" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.coreml.mlperfreport"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"mlproj" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.createml.project"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"mm" {
			$fileTypeItem = @([fileType]::new($item,"public.objective-c-plus-plus-source"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"mme" {
			$fileTypeItem = @([fileType]::new($item,"com.microsoft.outlook15.mime"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"mnc" {
			$fileTypeItem = @([fileType]::new($item,"ca.mcgill.mni.bic.mnc"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"mntd" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.legacy.finder-icon"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"com.apple.unknown-object"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"mobile" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.mobileconfig"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"mobileconfig" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.mobileconfig"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"mobileprovision" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.mobileprovision"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"mode0" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.xcode.projectdata"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"mode0v3" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.xcode.projectdata"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"mode1" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.xcode.projectdata"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"mode1v3" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.xcode.projectdata"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"mode2" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.xcode.projectdata"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"mode2v3" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.xcode.projectdata"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"mode3" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.xcode.projectdata"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"mode3v3" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.xcode.projectdata"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"modulemap" {
			$fileTypeItem = @([fileType]::new($item,"public.module-map"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"mom" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.xcode.mom"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"MooV" {
			$fileTypeItem = @([fileType]::new($item,"public.movie"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"morí" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.pictures-folder"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"mos" {
			$fileTypeItem = @([fileType]::new($item,"com.leafamerica.raw-image"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"mov" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.private.photos.mail-movie-export"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"com.microsoft.ppt.export.mov"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"public.movie"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"movpkg" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.tv.movpkg"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"mp2" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.music.mp2"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"public.audiovisual-content-collection"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"mp3" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.mediaextension-content"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"public.mp3"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"mp3!" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.mediaextension-content"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"public.mp3"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"mp3u" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.music.m3u-playlist"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"com.apple.tv.m3u-playlist"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"mp4" {
			$fileTypeItem = @([fileType]::new($item,"com.microsoft.ppt.export.mp4"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"org.oasis-open.opendocument.presentation"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"public.mpeg-4"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"public.mpeg-4-audio"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"mpe" {
			$fileTypeItem = @([fileType]::new($item,"public.mpeg"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"mpeg" {
			$fileTypeItem = @([fileType]::new($item,"public.mpeg"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"mpg" {
			$fileTypeItem = @([fileType]::new($item,"public.mpeg"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"MPG2" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.music.mp2"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"mpg3" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.mediaextension-content"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"public.mp3"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"mpg4" {
			$fileTypeItem = @([fileType]::new($item,"public.mpeg-4"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"public.mpeg-4-audio"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"mpga" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.mediaextension-content"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"public.mp3"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"mpkg" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.installer-meta-package"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"com.apple.installer-package-archive"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"mpo" {
			$fileTypeItem = @([fileType]::new($item,"public.mpo-image"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"mpsgraph" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.mps.graph"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"mpsgraphpackage" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.mps.graph.package"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"mrw" {
			$fileTypeItem = @([fileType]::new($item,"com.konicaminolta.raw-image"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"musiclibrary" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.music.library"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"mwand" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.garageband.template.magicmentor"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"mxf" {
			$fileTypeItem = @([fileType]::new($item,"org.smpte.mxf"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"myatt" {
			$fileTypeItem = @([fileType]::new($item,"com.att.configuration.myatt"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"mymc" {
			$fileTypeItem = @([fileType]::new($item,"public.file-sharepoint"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"mysql" {
			$fileTypeItem = @([fileType]::new($item,"com.barebones.bbedit.sql-source"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"nasm" {
			$fileTypeItem = @([fileType]::new($item,"public.nasm-assembly-source"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"navtrace" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.maps.navtracefile"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"nef" {
			$fileTypeItem = @([fileType]::new($item,"com.nikon.raw-image"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"netB" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.storage-netboot"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"networkconnect" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.preference.network"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"newsloc" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.news-internet-location"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"nfbg" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.icon-overlay.new-folder-badge"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"nfil" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.legacy.finder-icon"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"com.apple.unknown-object"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"nfld" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.legacy.finder-icon"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"com.apple.unknown-object"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"nib" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.interfacebuilder.document"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"nii" {
			$fileTypeItem = @([fileType]::new($item,"gov.nih.nifti-1"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"nldd" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.not-loaded"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"nmbtemplate" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.iwork.numbers.sfftemplate"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"com.apple.iwork.numbers.template"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"note" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.alert"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"com.gingerlabs.notability.notearchive"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"com.microsoft.onedrive.fluid"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"notesairdropdocument" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.notes.airdrop.document"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"com.apple.notes.inlinetextattachment.hashtag"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"notesarchive" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.notes.inlinetextattachment.calculategraphexpression"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"notesspotlightrecord" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.notes.note"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"nrw" {
			$fileTypeItem = @([fileType]::new($item,"com.nikon.nrw-raw-image"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"numbers" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.iwork.numbers.numbers"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"com.apple.iwork.numbers.sffnumbers"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"numbers-tef" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.iwork.numbers.numbers-tef"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"nwrt" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.legacy.no-write"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"nyrc" {
			$fileTypeItem = @([fileType]::new($item,"public.dvd-ram-media"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"o" {
			$fileTypeItem = @([fileType]::new($item,"public.object-code"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"obj" {
			$fileTypeItem = @([fileType]::new($item,"public.3d-content"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"objcap" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.rkassets"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"octest" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.dt.bundle.unit-test"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"odb" {
			$fileTypeItem = @([fileType]::new($item,"org.oasis-open.opendocument.database"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"odc" {
			$fileTypeItem = @([fileType]::new($item,"org.oasis-open.opendocument.chart"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"odf" {
			$fileTypeItem = @([fileType]::new($item,"org.oasis-open.opendocument.formula"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"odg" {
			$fileTypeItem = @([fileType]::new($item,"org.oasis-open.opendocument.graphics"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"odi" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.ibooksauthor.pkgbook"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"org.oasis-open.opendocument.image"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"odm" {
			$fileTypeItem = @([fileType]::new($item,"org.oasis-open.opendocument.text-master"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"odp" {
			$fileTypeItem = @([fileType]::new($item,"org.oasis-open.opendocument.presentation"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"ods" {
			$fileTypeItem = @([fileType]::new($item,"org.oasis-open.opendocument.spreadsheet"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"odt" {
			$fileTypeItem = @([fileType]::new($item,"org.oasis-open.opendocument.text"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"ofd" {
			$fileTypeItem = @([fileType]::new($item,"org.webmproject.webm"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"ofld" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.legacy.open-folder"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"ogg" {
			$fileTypeItem = @([fileType]::new($item,"org.xiph.ogg-audio"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"ogm" {
			$fileTypeItem = @([fileType]::new($item,"org.xiph.ogv"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"olk15contact" {
			$fileTypeItem = @([fileType]::new($item,"com.microsoft.outlook15.contact"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"olk15event" {
			$fileTypeItem = @([fileType]::new($item,"com.microsoft.outlook15.event"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"olk15group" {
			$fileTypeItem = @([fileType]::new($item,"com.microsoft.outlook15.group"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"olk15message" {
			$fileTypeItem = @([fileType]::new($item,"com.microsoft.outlook15.message"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"olk15note" {
			$fileTypeItem = @([fileType]::new($item,"com.microsoft.outlook15.note"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"olk15task" {
			$fileTypeItem = @([fileType]::new($item,"com.microsoft.outlook15.task"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"omf" {
			$fileTypeItem = @([fileType]::new($item,"com.avid.open-media-framework"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"org.aafassociation.advanced-authoring-format"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"omfi" {
			$fileTypeItem = @([fileType]::new($item,"org.aafassociation.advanced-authoring-format"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"com.omnigroup.omnigraffle.omnijs.plugin"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"com.omnigroup.omnigraffle.omnijs.simple-plugin"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"omnigrafflejs" {
			$fileTypeItem = @([fileType]::new($item,"com.omnigroup.omnigraffle.diagramstyle-package"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"omnigrafflejsz" {
			$fileTypeItem = @([fileType]::new($item,"com.omnigroup.omnigraffle.omnijs.compressed-plugin"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"omnijs" {
			$fileTypeItem = @([fileType]::new($item,"com.omnigroup.frameworks.omnijs.compressed-plugin"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"com.omnigroup.frameworks.omnijs.simple-plugin"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"com.omnigroup.frameworks.omnijs.wrapped-plugin"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"omnijsz" {
			$fileTypeItem = @([fileType]::new($item,"com.omnigroup.frameworks.omnijs.compressed-simple-plugin"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"omnipresence-config" {
			$fileTypeItem = @([fileType]::new($item,"com.omnigroup.omnipresence.config"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"onxofflinemap" {
			$fileTypeItem = @([fileType]::new($item,"com.onx.offlinemap"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"oo3" {
			$fileTypeItem = @([fileType]::new($item,"com.omnigroup.omnioutliner.oo3"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"com.omnigroup.omnioutliner.oo3-package"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"oo3template" {
			$fileTypeItem = @([fileType]::new($item,"com.omnigroup.omnioutliner.oo3template"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"com.omnigroup.omnioutliner.oo3template-package"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"ooutline" {
			$fileTypeItem = @([fileType]::new($item,"com.omnigroup.omnioutliner.xmlooutline"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"com.omnigroup.omnioutliner.xmlooutline-package"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"OPCD" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.disk-image-pc"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"order" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.finance.order"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"com.apple.finance.order-data"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"orf" {
			$fileTypeItem = @([fileType]::new($item,"com.olympus.or-raw-image"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"com.olympus.raw-image"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"com.olympus.sr-raw-image"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"otc" {
			$fileTypeItem = @([fileType]::new($item,"org.oasis-open.opendocument.chart-template"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"public.font"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"public.opentype-collection-font"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"otemplate" {
			$fileTypeItem = @([fileType]::new($item,"com.omnigroup.omnioutliner.otemplate"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"com.omnigroup.omnioutliner.otemplate"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"otf" {
			$fileTypeItem = @([fileType]::new($item,"org.oasis-open.opendocument.formula-template"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"public.opentype-font"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"otg" {
			$fileTypeItem = @([fileType]::new($item,"org.oasis-open.opendocument.graphics-template"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"oth" {
			$fileTypeItem = @([fileType]::new($item,"org.oasis-open.opendocument.text-web"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"oti" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.ibooksauthor.book"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"org.oasis-open.opendocument.image-template"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"otp" {
			$fileTypeItem = @([fileType]::new($item,"org.oasis-open.opendocument.presentation-template"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"ots" {
			$fileTypeItem = @([fileType]::new($item,"org.oasis-open.opendocument.spreadsheet-template"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"ott" {
			$fileTypeItem = @([fileType]::new($item,"org.oasis-open.opendocument.text-template"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"otto" {
			$fileTypeItem = @([fileType]::new($item,"public.opentype-font"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"outline" {
			$fileTypeItem = @([fileType]::new($item,"com.omnigroup.omnioutliner.ooutline"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"ova" {
			$fileTypeItem = @([fileType]::new($item,"com.vmware.foreign.ovf"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"ovf" {
			$fileTypeItem = @([fileType]::new($item,"com.vmware.foreign.ovf"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"owl" {
			$fileTypeItem = @([fileType]::new($item,"com.adobe.indesign-import-owl"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"ownd" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.legacy.finder-icon"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"com.apple.unknown-object"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"p12" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.data-container"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"com.rsa.pkcs-12"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"p12_key" {
			$fileTypeItem = @([fileType]::new($item,"com.comcsoft.iterminal.ppk"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"p7c" {
			$fileTypeItem = @([fileType]::new($item,"public.x509-certificate"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"pages" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.iwork.pages.pages"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"com.apple.iwork.pages.sffpages"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"pages-tef" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.iwork.pages.pages-tef"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"panic" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.panicreport"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"papp" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.legacy.finder-icon"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"com.apple.unknown-object"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"pas" {
			$fileTypeItem = @([fileType]::new($item,"public.pascal-source"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"patch" {
			$fileTypeItem = @([fileType]::new($item,"public.patch-file"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"pax" {
			$fileTypeItem = @([fileType]::new($item,"public.cpio-archive"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"pbcl" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.profile-background-color"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"pbm" {
			$fileTypeItem = @([fileType]::new($item,"public.pbm"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"pbproj" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.xcode.project"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"pbxproj" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.xcode.projectdata"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"pbxuser" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.xcode.usersettings"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"pch" {
			$fileTypeItem = @([fileType]::new($item,"public.precompiled-c-header"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"pch++" {
			$fileTypeItem = @([fileType]::new($item,"public.precompiled-c-plus-plus-header"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"pct" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.pict"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"pdf" {
			$fileTypeItem = @([fileType]::new($item,"com.adobe.pdf"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"com.microsoft.ppt.export.pdf"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"pef" {
			$fileTypeItem = @([fileType]::new($item,"com.pentax.raw-image"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"pem" {
			$fileTypeItem = @([fileType]::new($item,"public.x509-printable-encoded-archive"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"perspectivev3" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.xcode.projectdata"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"pf" {
			$fileTypeItem = @([fileType]::new($item,"clsp"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"com.apple.colorsync-profile"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"pfa" {
			$fileTypeItem = @([fileType]::new($item,"com.adobe.postscript-pfa-font"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"pfb" {
			$fileTypeItem = @([fileType]::new($item,"com.adobe.postscript-pfb-font"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"pfcl" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.profile-font-and-color"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"pfm" {
			$fileTypeItem = @([fileType]::new($item,"public.pbm"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"pfnt" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.profile-font-icon"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"pgm" {
			$fileTypeItem = @([fileType]::new($item,"public.pbm"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"pgn" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.chess.pgn"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"pgsql" {
			$fileTypeItem = @([fileType]::new($item,"com.barebones.bbedit.sql-source"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"ph3" {
			$fileTypeItem = @([fileType]::new($item,"public.php-script"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"ph4" {
			$fileTypeItem = @([fileType]::new($item,"public.php-script"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"phfs" {
			$fileTypeItem = @([fileType]::new($item,"com.adobe.indesign-import-phfs"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"photo" {
			$fileTypeItem = @([fileType]::new($item,"com.pixelmatorteam.pixelmator-photo.document.binary"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"com.pixelmatorteam.pixelmator-photo.document.package"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"photobooth" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.photo-booth-library"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null	
		}	

		"photo-edit" {
			$fileTypeItem = @([fileType]::new($item,"com.pixelmatorteam.pixelmator-photo-edit.document.binary"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"com.pixelmatorteam.pixelmator-photo-edit.document.package"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"photosasset" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.photos.asset-bundle"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"photoshop" {
			$fileTypeItem = @([fileType]::new($item,"com.adobe.photoshop-image"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"photoslibrary" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.photos.library"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"php" {
			$fileTypeItem = @([fileType]::new($item,"public.php-script"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"php3" {
			$fileTypeItem = @([fileType]::new($item,"public.php-script"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"php4" {
			$fileTypeItem = @([fileType]::new($item,"public.php-script"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"phtml" {
			$fileTypeItem = @([fileType]::new($item,"public.php-script"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"pic" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.pict"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"public.radiance"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"pict" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.pict"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"pictclipping" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.finder.pictclipping"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"pisn" {
			$fileTypeItem = @([fileType]::new($item,"com.adobe.pageitem-xml-snippet"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"pkcs12" {
			$fileTypeItem = @([fileType]::new($item,"com.rsa.pkcs-12"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"pkg" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.installer-package"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"com.apple.installer-package-archive"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"pkpass" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.pkpass"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"com.apple.pkpass-data"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"pkpasses" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.pkpasses-data"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"pl" {
			$fileTypeItem = @([fileType]::new($item,"public.perl-script"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"placeholder" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.application-placeholder"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"playground" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.dt.playground"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"playgroundbook" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.playgroundbook"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"plist" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.ascii-property-list"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"com.apple.binary-property-list"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"com.apple.property-list"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"com.apple.xml-property-list"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"pls" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.music.pls-playlist"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"com.barebones.bbedit.sql-source"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"public.playlist"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"plugin" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.plugin"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"plugindata" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.xcode.plugindata"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"pluginkit" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.pluginkit"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"ply" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.swiftpm-playgrounds-project"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"public.polygon-file-format"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"pm" {
			$fileTypeItem = @([fileType]::new($item,"public.perl-script"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"pmcl" {
			$fileTypeItem = @([fileType]::new($item,"com.adobe.pm-color"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"png" {
			$fileTypeItem = @([fileType]::new($item,"com.microsoft.ppt.export.ext.png"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"com.microsoft.ppt.export.png"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"public.png"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"PNGf" {
			$fileTypeItem = @([fileType]::new($item,"public.png"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"PNRA" {
			$fileTypeItem = @([fileType]::new($item,"com.real.realaudio"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"PNRM" {
			$fileTypeItem = @([fileType]::new($item,"com.real.realmedia"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"pntg" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.macpaint-image"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"pot" {
			$fileTypeItem = @([fileType]::new($item,"com.microsoft.powerpoint.pot"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"potm" {
			$fileTypeItem = @([fileType]::new($item,"com.microsoft.powerpoint.openxmlformats.presentationml.template.macroenabled"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"org.openxmlformats.presentationml.template.macroenabled"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"potx" {
			$fileTypeItem = @([fileType]::new($item,"com.microsoft.powerpoint.openxmlformats.presentationml.template"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"org.openxmlformats.presentationml.template"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"ppa" {
			$fileTypeItem = @([fileType]::new($item,"com.microsoft.powerpoint.ppa"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"ppam" {
			$fileTypeItem = @([fileType]::new($item,"com.microsoft.powerpoint.ppam"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"ppdf" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.legacy.finder-icon"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"com.apple.unknown-object"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"ppm" {
			$fileTypeItem = @([fileType]::new($item,"public.pbm"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"ppot" {
			$fileTypeItem = @([fileType]::new($item,"com.microsoft.powerpoint.pot"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"ppp" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.ppp-plug-in"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"pps" {
			$fileTypeItem = @([fileType]::new($item,"com.microsoft.powerpoint.pps"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"ppsm" {
			$fileTypeItem = @([fileType]::new($item,"com.microsoft.powerpoint.openxmlformats.presentationml.slideshow.macroenabled"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"org.openxmlformats.presentationml.slideshow.macroenabled"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"PPSS" {
			$fileTypeItem = @([fileType]::new($item,"com.microsoft.powerpoint.pps"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"ppsx" {
			$fileTypeItem = @([fileType]::new($item,"com.microsoft.powerpoint.openxmlformats.presentationml.slideshow"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"org.openxmlformats.presentationml.slideshow"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"ppt" {
			$fileTypeItem = @([fileType]::new($item,"com.hp.remote.control.scanpage"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"com.microsoft.powerpoint.pps"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"com.microsoft.powerpoint.ppt"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"pptm" {
			$fileTypeItem = @([fileType]::new($item,"com.microsoft.powerpoint.openxmlformats.presentationml.presentation.macroenabled"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"org.openxmlformats.presentationml.presentation.macroenabled"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"pptx" {
			$fileTypeItem = @([fileType]::new($item,"com.microsoft.powerpoint.openxmlformats.presentationml.presentation"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"org.openxmlformats.presentationml.presentation"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"pref" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.legacy.finder-icon"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"com.apple.unknown-object"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"prefpane" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.package"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"com.apple.systempreference.prefpane"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"prfb" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.icon-overlay.private-folder-badge"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"prfí" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.legacy.finder-icon"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"com.apple.unknown-object"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"prm" {
			$fileTypeItem = @([fileType]::new($item,"org.fsharp.f-sharp"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"prn" {
			$fileTypeItem = @([fileType]::new($item,"com.microsoft.excel.space-separated-values-text"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"prnt" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.legacy.finder-icon"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"com.apple.unknown-object"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"proto" {
			$fileTypeItem = @([fileType]::new($item,"public.protobuf-source"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"provisionprofile" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.provisionprofile"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"prvf" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.icon-overlay.private-folder"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"ps" {
			$fileTypeItem = @([fileType]::new($item,"com.adobe.postscript"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"psb" {
			$fileTypeItem = @([fileType]::new($item,"com.adobe.photoshop-large-image"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"com.microsoft.powerpoint.ppa"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"psd" {
			$fileTypeItem = @([fileType]::new($item,"com.microsoft.powerpoint.openxmlformats.presentationml.template.macroenabled"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"com.adobe.photoshop-image"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"pset" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.pdf-printer-settings"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"psys" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.legacy.finder-icon"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"com.apple.unknown-object"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"pvm" {
			$fileTypeItem = @([fileType]::new($item,"com.vmware.foreign.pvm"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"pvr" {
			$fileTypeItem = @([fileType]::new($item,"public.pvr"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"pvs" {
			$fileTypeItem = @([fileType]::new($item,"com.vmware.foreign.pvs"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"pvt" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.live-photo-bundle"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"com.apple.private.photos.live-wallpaper"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"public.image"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"pwl" {
			$fileTypeItem = @([fileType]::new($item,"com.leica.pwl-raw-image"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"com.leica.pwl-raw-image"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"pxb" {
			$fileTypeItem = @([fileType]::new($item,"com.pixelmator.pxb"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"com.pixelmatorteam.legacy-touch-brushes"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"pxd" {
			$fileTypeItem = @([fileType]::new($item,"com.pixelmatorteam.pixelmator.document.binary"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"com.pixelmatorteam.pixelmator.document.package"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"pxd-sidecar" {
			$fileTypeItem = @([fileType]::new($item,"com.pixelmatorteam.pixelmator.document-pro-sidecar.binary"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"com.pixelmatorteam.pixelmator.document-pro-sidecar.package"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"pxm" {
			$fileTypeItem = @([fileType]::new($item,"com.pixelmator.pxm"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"com.pixelmatorteam.pixelmator.document-package"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"pxs" {
			$fileTypeItem = @([fileType]::new($item,"com.pixelmator.pxs"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"py" {
			$fileTypeItem = @([fileType]::new($item,"public.python-script"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"pyc" {
			$fileTypeItem = @([fileType]::new($item,"public.python-bytecode"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"qlgenerator" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.quicklook-generator"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"qt" {
			$fileTypeItem = @([fileType]::new($item,"public.movie"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"qta" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.photos.object-reference.collection"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"com.apple.quicktime-audio"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"qtif" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.quicktime-image"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"qtpxcomposition" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.quicktimeplayerx-composition"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"com.apple.quicktimeplayerx-composition-bundle"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"qtz" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.quartz-composer-composition"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"ques" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.legacy.question-mark"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"r" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.rez-source"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"com.barebones.bbedit.r-source"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"com.barebones.bbedit.r-source"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"public.script"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"ra" {
			$fileTypeItem = @([fileType]::new($item,"com.real.realaudio"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"raf" {
			$fileTypeItem = @([fileType]::new($item,"com.fuji.raw-image"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"ram" {
			$fileTypeItem = @([fileType]::new($item,"com.real.realaudio"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"ramd" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.legacy.finder-icon"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"com.apple.unknown-object"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"rapp" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.legacy.finder-icon"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"com.apple.unknown-object"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"raw" {
			$fileTypeItem = @([fileType]::new($item,"com.leica.raw-image"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"com.panasonic.raw-image"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"rb" {
			$fileTypeItem = @([fileType]::new($item,"public.ruby-script"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"rbw" {
			$fileTypeItem = @([fileType]::new($item,"public.ruby-script"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"rcar" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.legacy.right-container-arrow"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"rcnt" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.finder.recent-items"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"rdfe" {
			$fileTypeItem = @([fileType]::new($item,"com.lemonmojo.rdfe"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"rdoc" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.legacy.finder-icon"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"com.apple.unknown-object"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"rdp" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.homekit-accessory-simulator.state"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"com.microsoft.uti.rdpfile"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"org.appextension.find-login-action"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"reality" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.reality"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"public.character-special"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"realitycomposerpro" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.realitycomposerpro"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"realityenv" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.realitycomposerpro.treenodeidentifier"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"redditvault" {
			$fileTypeItem = @([fileType]::new($item,"com.reddit.vault.backup"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"referenceobject" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.arkit.referenceobject"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"public.media-streaming-protocol"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"rgb" {
			$fileTypeItem = @([fileType]::new($item,"com.adobe.rgb-color"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"rge" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.graphic-icon.data-and-sensors"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"com.microsoft.outlook15.archive"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"rhtml" {
			$fileTypeItem = @([fileType]::new($item,"com.barebones.bbedit.erb-source"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"rjson" {
			$fileTypeItem = @([fileType]::new($item,"com.lemonmojo.rjsondocument"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"rm" {
			$fileTypeItem = @([fileType]::new($item,"com.real.realmedia"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"rmp" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.music.rmp-playlist"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"rmvb" {
			$fileTypeItem = @([fileType]::new($item,"com.real.realmedia-vbr"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"root" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.mac"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"rpp" {
			$fileTypeItem = @([fileType]::new($item,"com.lemonmojo.rtsxdmgpluginpackage"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"rs" {
			$fileTypeItem = @([fileType]::new($item,"com.barebones.bbedit.rust-source"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"rsrv" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.legacy.finder-icon"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"com.apple.unknown-object"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"rss" {
			$fileTypeItem = @([fileType]::new($item,"public.rss"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"rtf" {
			$fileTypeItem = @([fileType]::new($item,"com.microsoft.ppt.export.rtf"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"public.rtf"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"rtfd" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.flat-rtfd"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"com.apple.rtfd"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"rtsl" {
			$fileTypeItem = @([fileType]::new($item,"com.lemonmojo.rtslog"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"rtsx" {
			$fileTypeItem = @([fileType]::new($item,"com.code4ward.rtsxdocument"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"rw2" {
			$fileTypeItem = @([fileType]::new($item,"com.panasonic.rw2-raw-image"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"rwl" {
			$fileTypeItem = @([fileType]::new($item,"com.leica.rwl-raw-image"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"s" {
			$fileTypeItem = @([fileType]::new($item,"public.assembly-source"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"public.script"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"sabundle" {
			$fileTypeItem = @([fileType]::new($item,"com.sequel-ace.sequel-ace.sabundle"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"safariextz" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.safari.extension"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"sample.txt" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.dt.sample.txt"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"com.apple.instruments.instrdst"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"sapl" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.legacy.finder-icon"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"com.apple.unknown-object"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"sapp" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.server-applications-folder"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"savedsearch" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.finder.smart-folder"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"saver" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.systempreference.screen-saver"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"sbdg" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.legacy.finder-icon"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"com.apple.unknown-object"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"sbDp" {
			$fileTypeItem = @([fileType]::new($item,"public.display"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"sbFl" {
			$fileTypeItem = @([fileType]::new($item,"public.data"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"sbIC" {
			$fileTypeItem = @([fileType]::new($item,"public.spreadsheet"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"sbk" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.logic.exs"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"sbNC" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.airdrop"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"sbPC" {
			$fileTypeItem = @([fileType]::new($item,"public.computer"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"sbRc" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.finder.recent-items"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"scc" {
			$fileTypeItem = @([fileType]::new($item,"com.scenarist.closed-caption"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"scmp" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.legacy.finder-icon"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"com.apple.unknown-object"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"scn" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.scenekit.scene"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"scnassets" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.dt.xctest.element-snapshot"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"com.apple.scenekit.assetcatalog"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"scncache" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.scenekit.shadercache"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"scnp" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.scenekit.particlesystem"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"scnz" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.scenekit.scene"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"com.apple.scenekit.scene.zip"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"scpt" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.applescript.script"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"scptd" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.applescript.script-bundle"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"com.latenightsw.osa.bundle"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"scrí" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.legacy.finder-icon"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"com.apple.unknown-object"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"script" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.applescript.script"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"scriptterminology" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.dt.document.ascii-property-list"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"scrp" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.legacy.finder-icon"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"com.apple.unknown-object"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"scsh" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.legacy.finder-icon"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"com.apple.unknown-object"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"scss" {
			$fileTypeItem = @([fileType]::new($item,"com.barebones.bbedit.scss-source"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"sd2" {
			$fileTypeItem = @([fileType]::new($item,"com.digidesign.sd2-audio"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"sdbp" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.legacy.sidebar-prefs-icon"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"sdd" {
			$fileTypeItem = @([fileType]::new($item,"org.openoffice.presentation"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"sdef" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.scripting-definition"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"sdoc" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.generic-stationery"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"sdv" {
			$fileTypeItem = @([fileType]::new($item,"public.3gpp"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"sea" {
			$fileTypeItem = @([fileType]::new($item,"com.stuffit.archive.sit"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"service" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.service-application"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"setext" {
			$fileTypeItem = @([fileType]::new($item,"com.barebones.bbedit.setext-source"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"sf2" {
			$fileTypeItem = @([fileType]::new($item,"com.soundblaster.soundfont"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"sfld" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.finder.smart-folder"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"sfnt" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.font-suitcase"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"sfont" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.cfr-font"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"sgi" {
			$fileTypeItem = @([fileType]::new($item,"com.microsoft.powerpoint.pot"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"sh" {
			$fileTypeItem = @([fileType]::new($item,"public.shell-script"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"shapes" {
			$fileTypeItem = @([fileType]::new($item,"com.pixelmatorteam.shapes"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"shazamcatalog" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.shazamcatalog"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"shdD" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.legacy.finder-icon"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"com.apple.unknown-object"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"shdf" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.legacy.finder-icon"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"com.apple.unknown-object"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"shfl" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.legacy.finder-icon"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"com.apple.unknown-object"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"shlb" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.legacy.finder-icon"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"com.apple.unknown-object"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"shna" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.legacy.finder-icon"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"com.apple.unknown-object"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"shortcut" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.shortcut"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"shpt" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.servers-folder"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"shro" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.legacy.finder-icon"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"com.apple.unknown-object"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"shrt" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.legacy.finder-icon"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"com.apple.unknown-object"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"shrw" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.legacy.finder-icon"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"com.apple.unknown-object"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"shtm" {
			$fileTypeItem = @([fileType]::new($item,"public.html"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"shuk" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.legacy.finder-icon"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"com.apple.unknown-object"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"shutdownstall" {
			$fileTypeItem = @([fileType]::new($item,"public.case-insensitive-text"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"sidx" {
			$fileTypeItem = @([fileType]::new($item,"com.allume.stuffit-archive"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"com.stuffit.archive.sidx"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"simruntime" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.coresimulator.bundle"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"sit" {
			$fileTypeItem = @([fileType]::new($item,"com.stuffit.archive.sit"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"SIT5" {
			$fileTypeItem = @([fileType]::new($item,"com.stuffit.archive.sit"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"sitx" {
			$fileTypeItem = @([fileType]::new($item,"com.allume.stuffit-archive"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"sks" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.spritekit.serialized"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"sld8" {
			$fileTypeItem = @([fileType]::new($item,"com.microsoft.powerpoint.pps"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"com.microsoft.powerpoint.ppt"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"slidesaver" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.systempreference.screen-slide-saver"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"slk" {
			$fileTypeItem = @([fileType]::new($item,"com.microsoft.excel.slk"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"slm" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.photos.slow-motion-video-sidecar"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"sln" {
			$fileTypeItem = @([fileType]::new($item,"com.microsoft.solution"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"slnf" {
			$fileTypeItem = @([fileType]::new($item,"com.microsoft.filtered-solution"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"sLS8" {
			$fileTypeItem = @([fileType]::new($item,"com.microsoft.excel.xlt"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"smart-health-card" {
			$fileTypeItem = @([fileType]::new($item,"cards.smarthealth.smart-health-card"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"smf" {
			$fileTypeItem = @([fileType]::new($item,"public.midi-audio"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"sndclipping" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.finder.sound-clipping"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"son" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.logic.pluginsetting"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"sparsebundle" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.disk-image-sparse-bundle"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"sparseimage" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.disk-image-sparse"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"spbundle" {
			$fileTypeItem = @([fileType]::new($item,"com.sequel-ace.sequel-ace.spbundle"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"spf" {
			$fileTypeItem = @([fileType]::new($item,"com.sequel-ace.sequel-ace.spf"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"spfs" {
			$fileTypeItem = @([fileType]::new($item,"com.sequel-ace.sequel-ace.spfs"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"spin" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.spinreport"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"spki" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.music-folder"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"sptheme" {
			$fileTypeItem = @([fileType]::new($item,"com.sequel-ace.sequel-ace.sptheme"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"spx" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.screensharing.draggableconnectionsitem"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"com.apple.systemprofiler.document"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"sql" {
			$fileTypeItem = @([fileType]::new($item,"com.barebones.bbedit.sql-source"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"com.hyperobjc.sqliteflow.sqlscript"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"com.sequel-ace.sequel-ace.sql"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"sqlite" {
			$fileTypeItem = @([fileType]::new($item,"com.hyperobjc.sqliteflow.db"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"sqlite3" {
			$fileTypeItem = @([fileType]::new($item,"com.hyperobjc.sqliteflow.db"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"sr2" {
			$fileTypeItem = @([fileType]::new($item,"com.sony.sr2-raw-image"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"srf" {
			$fileTypeItem = @([fileType]::new($item,"com.sony.raw-image"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"srvr" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.file-server"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"srw" {
			$fileTypeItem = @([fileType]::new($item,"com.samsung.raw-image"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"stc" {
			$fileTypeItem = @([fileType]::new($item,"org.openoffice.spreadsheet-template"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"std" {
			$fileTypeItem = @([fileType]::new($item,"org.openoffice.graphics-template"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"sti" {
			$fileTypeItem = @([fileType]::new($item,"org.openoffice.presentation-template"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"stickerpack" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.dt.messages-sticker-pack"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"stl" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.swiftpm-playgrounds-project"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"public.standard-tesselated-geometry-format"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"stop" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.alert"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"com.apple.alert-stop"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"storekit" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.dt.storekitbundle"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"com.apple.xcframework"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"storyboard" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.dt.interfacebuilder.document.storyboard"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"storyboardc" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.dt.interfacebuilder.document.storyboard.package"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"strD" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.legacy.finder-icon"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"com.apple.unknown-object"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"strings" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.xcode.strings-text"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"stringsdict" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.xcode.strings-dictionary"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"strt" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.legacy.finder-icon"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"com.apple.unknown-object"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"stsn" {
			$fileTypeItem = @([fileType]::new($item,"com.adobe.structure-xml-snippet"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"stw" {
			$fileTypeItem = @([fileType]::new($item,"org.openoffice.text-template"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"stx" {
			$fileTypeItem = @([fileType]::new($item,"com.barebones.bbedit.setext-source"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"styl" {
			$fileTypeItem = @([fileType]::new($item,"com.adobe.indesign-import-styl"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"suggestionsassets" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.intelligentsuggestions.assets"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"suit" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.font-suitcase"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"susr" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.legacy.finder-icon"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"com.apple.unknown-object"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"svg" {
			$fileTypeItem = @([fileType]::new($item,"public.svg-image"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"svgz" {
			$fileTypeItem = @([fileType]::new($item,"public.svg-image"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"swift" {
			$fileTypeItem = @([fileType]::new($item,"cc.utis.paths-file"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"public.swift-source"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"swiftpm" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.swiftpm"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"sxc" {
			$fileTypeItem = @([fileType]::new($item,"org.openoffice.spreadsheet"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"sxd" {
			$fileTypeItem = @([fileType]::new($item,"org.openoffice.graphics"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"sxg" {
			$fileTypeItem = @([fileType]::new($item,"org.openoffice.text-master"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"sxi" {
			$fileTypeItem = @([fileType]::new($item,"org.openoffice.presentation"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"sxm" {
			$fileTypeItem = @([fileType]::new($item,"org.openoffice.formula"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"sxw" {
			$fileTypeItem = @([fileType]::new($item,"org.openoffice.text"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"sync" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.legacy.synchronize"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"sysprefex" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.systempreference.prefpane.extension"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"systemextension" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.system-extension"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"tags" {
			$fileTypeItem = @([fileType]::new($item,"com.barebones.bbedit.ctags-data"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"tailspin" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.tailspin"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"tAps" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.applications-folder"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"tar" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.bom-archive"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"public.disk-image"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"public.tar-archive"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"tbav" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.legacy.toolbar-advanced-icon"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"tbd" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.text-based-dylib"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"tblb" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.application-icon.icloud-homekit-secure-video"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"com.apple.legacy.toolbar-labels-icon"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"tbz" {
			$fileTypeItem = @([fileType]::new($item,"public.tar-bzip2-archive"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"tbz2" {
			$fileTypeItem = @([fileType]::new($item,"public.tar-bzip2-archive"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"tcl" {
			$fileTypeItem = @([fileType]::new($item,"com.barebones.bbedit.tcl-source"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"tcsh" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.xcode.tcsh-script"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"public.tcsh-script"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"tcus" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.legacy.customize-toolbar"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"tdel" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.legacy.delete-toolbar"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"tDoc" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.documents-folder"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"tDsk" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.desktop-folder"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"tDwn" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.downloads-folder"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"template" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.icon-decoration.badge.comments"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"com.apple.iwork.pages.sfftemplate"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"com.apple.iwork.pages.template"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"term" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.terminal.session"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"terminal" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.terminal.settings"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"tex" {
			$fileTypeItem = @([fileType]::new($item,"com.barebones.bbedit.tex-source"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"text" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.traditional-mac-plain-text"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"public.text"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"textclipping" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.finder.textclipping"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"textfactory" {
			$fileTypeItem = @([fileType]::new($item,"com.barebones.bbedit.text-factory"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"textile" {
			$fileTypeItem = @([fileType]::new($item,"com.barebones.bbedit.textile-source"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"textstyles" {
			$fileTypeItem = @([fileType]::new($item,"com.pixelmatorteam.textstyles"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"tfil" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.fontbook.draggablefont"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"tga" {
			$fileTypeItem = @([fileType]::new($item,"com.microsoft.office.openxml.theme"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"com.truevision.tga-image"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"tgz" {
			$fileTypeItem = @([fileType]::new($item,"org.gnu.gnu-zip-tar-archive"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"theater" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.imovietheater"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"com.apple.iwork.pages.sffpages"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"thmx" {
			$fileTypeItem = @([fileType]::new($item,"com.microsoft.office.openxml.theme"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"thom" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.home-folder"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"thumb.low" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.private.photos.thumbnail.low"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"thumb.standard" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.private.photos.thumbnail.standard"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"tif" {
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


		"tightbeam" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.tightbeam-source"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"tl" {
			$fileTypeItem = @([fileType]::new($item,"com.tascam.opentl"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"tlb" {
			$fileTypeItem = @([fileType]::new($item,"com.microsoft.excel.tlb"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"tMov" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.movie-folder"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"tMus" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.music-folder"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"toast" {
			$fileTypeItem = @([fileType]::new($item,"com.roxio.disk-image-toast"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"toml" {
			$fileTypeItem = @([fileType]::new($item,"com.barebones.bbedit.toml-source"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"tool" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.terminal.shell-script"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"tpic" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.pictures-folder"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"com.microsoft.office.openxml.theme"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"com.truevision.tga-image"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"tPub" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.public-folder"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"tql" {
			$fileTypeItem = @([fileType]::new($item,"com.barebones.bbedit.sql-source"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"trace" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.instruments.trace"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"tracetemplate" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.instruments.tracetemplate"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"trsh" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.trash-empty"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"ts" {
			$fileTypeItem = @([fileType]::new($item,"com.barebones.bbedit.typescript-source"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"com.microsoft.typescript"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"org.typescriptlang.typescript"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"public.mpeg-2-transport-stream"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"tsv" {
			$fileTypeItem = @([fileType]::new($item,"public.tab-separated-values-text"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"public.delimited-values-text"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"tsx" {
			$fileTypeItem = @([fileType]::new($item,"com.microsoft.typescript"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"ttc" {
			$fileTypeItem = @([fileType]::new($item,"public.truetype-collection-font"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"ttf" {
			$fileTypeItem = @([fileType]::new($item,"public.truetype-ttf-font"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"tUtl" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.utilities-folder"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"tutorial" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.documentation.tutorial"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"tvdb" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.tv.database"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"TVLb" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.settings.section.icon.privacy"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"com.apple.tv.library"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"tvlibrary" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.settings.section.icon.privacy"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"com.apple.tv.library"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"txt" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.traditional-mac-plain-text"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"public.plain-text"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"public.text"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"txtn" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.txn.text-multimedia-data"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"txz" {
			$fileTypeItem = @([fileType]::new($item,"org.tukaani.tar-xz-archive"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"ubdg" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.icon-overlay.unsupported-badge"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"udif" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.disk-image"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"udsk" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.user-idisk"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"ufld" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.home-folder"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"ul" {
			$fileTypeItem = @([fileType]::new($item,"public.ulaw-audio"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"ulaw" {
			$fileTypeItem = @([fileType]::new($item,"public.ulaw-audio"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"ulck" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.legacy.unlocked"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"ulw" {
			$fileTypeItem = @([fileType]::new($item,"public.ulaw-audio"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"unfs" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.unknown-object"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"unus" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.user-unknown"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"url" {
			$fileTypeItem = @([fileType]::new($item,"com.codeweavers.crossoverhelper.menudummytype"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"com.microsoft.internet-shortcut"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"public.url"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"urln" {
			$fileTypeItem = @([fileType]::new($item,"public.url-name"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"usd" {
			$fileTypeItem = @([fileType]::new($item,"com.pixar.universal-scene-description"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"usdz" {
			$fileTypeItem = @([fileType]::new($item,"com.pixar.universal-scene-description-mobile"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"com.pixar.universal-scene-description-utf8"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"user" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.user"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"ustl" {
			$fileTypeItem = @([fileType]::new($item,"com.adobe.indesign-import-ustl"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"ut16" {
			$fileTypeItem = @([fileType]::new($item,"public.utf16-external-plain-text"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"utf8" {
			$fileTypeItem = @([fileType]::new($item,"public.text"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"public.utf8-plain-text"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"utií" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.utilities-folder"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"utxt" {
			$fileTypeItem = @([fileType]::new($item,"public.utf16-plain-text"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"uu" {
			$fileTypeItem = @([fileType]::new($item,"public.uuencoded-archive"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"v" {
			$fileTypeItem = @([fileType]::new($item,"com.barebones.bbedit.verilog-hdl-source"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"vbs" {
			$fileTypeItem = @([fileType]::new($item,"com.barebones.bbedit.vbscript-source"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"vcal" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.ical.ics.event"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"vcard" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.graphic-icon.account.payment"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"public.vcard"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"vcf" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.graphic-icon.account.payment"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"public.vcard"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"vCrd" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.graphic-icon.account.payment"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"public.vcard"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"vcs" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.graphic-icon.satellite"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"com.apple.ical.ics.event"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"com.microsoft.outlook15.vcalendar"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"vdx" {
			$fileTypeItem = @([fileType]::new($item,"com.omnigroup.foreign-types.ms-visio.xml"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"com.pkware.zip-archive"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"vert" {
			$fileTypeItem = @([fileType]::new($item,"org.khronos.glsl.vertex-shader"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"vertex" {
			$fileTypeItem = @([fileType]::new($item,"org.khronos.glsl.vertex-shader"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"vfw" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.protected-mpeg-4-video"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"public.avi"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"vhd" {
			$fileTypeItem = @([fileType]::new($item,"com.barebones.bbedit.vhdl-source"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"com.vmware.foreign.vhd"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"vhdl" {
			$fileTypeItem = @([fileType]::new($item,"com.barebones.bbedit.vhdl-source"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"videoslibrary" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.tv.library"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"viewhierarchy" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.dt.ide.debughierarchycontenttype"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"VirtualMac" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.virtual-machine"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"vl" {
			$fileTypeItem = @([fileType]::new($item,"com.barebones.bbedit.verilog-hdl-source"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"vmsn" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.graphic-icon.auto-lock"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"com.apple.graphic-icon.hearing"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"com.apple.graphic-icon.safety-check"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"com.apple.graphic-icon.wallet"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"com.vmware.vm-snapshot"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"vmtm" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.graphic-icon.auto-brightness"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"com.apple.graphic-icon.dark-mode"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"com.apple.graphic-icon.voice-memos"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"com.vmware.vm-disk"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"com.apple.graphic-icon.motion-and-fitness"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"VMWare" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.virtual-machine"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"vmx" {
			$fileTypeItem = @([fileType]::new($item,"com.vmware.vm-config"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"vmxf" {
			$fileTypeItem = @([fileType]::new($item,"com.vmware.vm-foundry"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"vncloc" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.vnc-internet-location"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"voicecontrolcommands" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.voicecontrolcommands"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"voprefs" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.voiceover-preferences"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"vpc7" {
			$fileTypeItem = @([fileType]::new($item,"com.vmware.foreign.vpc7"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"vs" {
			$fileTypeItem = @([fileType]::new($item,"com.barebones.bbedit.vectorscript-source"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"org.khronos.glsl.vertex-shader"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"vsd" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.storage-internal"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"com.microsoft.visio.legacyformats.visioml.document"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"vsdx" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.storage-removable"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"com.microsoft.visio.openxmlformats.visioml.document"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"vsh" {
			$fileTypeItem = @([fileType]::new($item,"org.khronos.glsl.vertex-shader"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"vss" {
			$fileTypeItem = @([fileType]::new($item,"com.barebones.bbedit.vectorscript-source"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"com.omnigroup.foreign-types.ms-visio.stencil"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"public.optical-storage-media"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"vssm" {
			$fileTypeItem = @([fileType]::new($item,"com.omnigroup.foreign-types.ms-visio.stencil"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"public.optical-storage-media"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"vssx" {
			$fileTypeItem = @([fileType]::new($item,"com.omnigroup.foreign-types.ms-visio.new-xml.stencil"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"public.cd-based-media"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"vst" {
			$fileTypeItem = @([fileType]::new($item,"com.omnigroup.foreign-types.ms-visio.template"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"vstm" {
			$fileTypeItem = @([fileType]::new($item,"com.omnigroup.foreign-types.ms-visio.template"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"public.cd-based-media"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"vstx" {
			$fileTypeItem = @([fileType]::new($item,"com.omnigroup.foreign-types.ms-visio.new-xml.template"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"vsx" {
			$fileTypeItem = @([fileType]::new($item,"com.omnigroup.foreign-types.ms-visio.xml.stencil"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"vtt" {
			$fileTypeItem = @([fileType]::new($item,"org.w3.webvtt"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"vtx" {
			$fileTypeItem = @([fileType]::new($item,"com.omnigroup.foreign-types.ms-visio.xml.template"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"w64" {
			$fileTypeItem = @([fileType]::new($item,"com.sony.wave64"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"W8BN" {
			$fileTypeItem = @([fileType]::new($item,"com.microsoft.word.doc"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"com.microsoft.word.openxmlformats.wordprocessingml.document"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"W8TN" {
			$fileTypeItem = @([fileType]::new($item,"com.microsoft.word.dot"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"waa" {
			$fileTypeItem = @([fileType]::new($item,"net.whatsapp.audio"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"tv.twitch.uti.core.channel"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"wai" {
			$fileTypeItem = @([fileType]::new($item,"net.whatsapp.image"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"wam" {
			$fileTypeItem = @([fileType]::new($item,"com.tinyspeck.slack.file"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"net.whatsapp.movie"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"wand" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.garageband.template.magic"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"war" {
			$fileTypeItem = @([fileType]::new($item,"com.sun.web-application-archive"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"wasm" {
			$fileTypeItem = @([fileType]::new($item,"com.eab.se"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"Watch" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.watch"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"watchface" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.watchface"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"wav" {
			$fileTypeItem = @([fileType]::new($item,"com.microsoft.waveform-audio"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"wave" {
			$fileTypeItem = @([fileType]::new($item,"com.microsoft.waveform-audio"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"wax" {
			$fileTypeItem = @([fileType]::new($item,"com.microsoft.windows-media-wax"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"WDCD" {
			$fileTypeItem = @([fileType]::new($item,"com.microsoft.word.dictionary"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"wdgt" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.dashboard-widget"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"wdmon" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.wireless-diagnostics.wdmon"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"wdsidecar" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.wireless-diagnostics.wdsidecar"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"weba" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.webarchive"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"webarchive" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.webarchive"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"webbookmark" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.safari.bookmark"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"webhistory" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.safari.history"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"webloc" {
			$fileTypeItem = @([fileType]::new($item,"public.stored-url"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"webm" {
			$fileTypeItem = @([fileType]::new($item,"org.webmproject.webm"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"webp" {
			$fileTypeItem = @([fileType]::new($item,"com.google.webp"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"webplugin" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.webkit-plugin"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"wfld" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.users-folder"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"wflow" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.shortcuts.workflow-file"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"whiteboard" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.mach-o-executable"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"widgetkitsim" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.widgetkit.simulator.document"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"Windows" {
			$fileTypeItem = @([fileType]::new($item,"public.computer"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"Windows2000" {
			$fileTypeItem = @([fileType]::new($item,"public.computer"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"Windows2003" {
			$fileTypeItem = @([fileType]::new($item,"public.computer"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"Windows2008" {
			$fileTypeItem = @([fileType]::new($item,"public.computer"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"Windows7" {
			$fileTypeItem = @([fileType]::new($item,"public.computer"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"WindowsVista" {
			$fileTypeItem = @([fileType]::new($item,"public.computer"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"WindowsXP" {
			$fileTypeItem = @([fileType]::new($item,"public.computer"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"wm" {
			$fileTypeItem = @([fileType]::new($item,"com.microsoft.windows-media-wm"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"wma" {
			$fileTypeItem = @([fileType]::new($item,"com.microsoft.windows-media-wma"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"wmp" {
			$fileTypeItem = @([fileType]::new($item,"com.microsoft.windows-media-wmp"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"wmv" {
			$fileTypeItem = @([fileType]::new($item,"com.microsoft.windows-media-wmv"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"wmx" {
			$fileTypeItem = @([fileType]::new($item,"com.microsoft.windows-media-wmx"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"workflow" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.applescript.data-object"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"com.apple.automator-workflow"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"workout" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.workout"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"worksheet" {
			$fileTypeItem = @([fileType]::new($item,"com.barebones.bbedit.legacy-project"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"wprd" {
			$fileTypeItem = @([fileType]::new($item,"com.microsoft.word.dictionary"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"writ" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.legacy.finder-icon"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"com.apple.unknown-object"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"wvx" {
			$fileTypeItem = @([fileType]::new($item,"com.microsoft.windows-media-wvx"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"wxbn" {
			$fileTypeItem = @([fileType]::new($item,"org.openxmlformats.wordprocessingml.document"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"xar" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.xar-archive"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"xbm" {
			$fileTypeItem = @([fileType]::new($item,"public.xbitmap-image"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"xcappdata" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.xcode.appdata"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"xcarchive" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.xcode.archive"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"xcassets" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.dt.assetcatalog"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"xcbuildmetrics" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.xcode.buildmetrics"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"xcconfig" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.xcode.configsettings"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"xccrashpoint" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.dt.document.xccrashpoint"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"xcdatamodel" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.xcode.model"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"xcdatamodeld" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.xcode.model.data-version"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"xcdiskwritelog" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.dt.document.xcdiskwritelog"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"xcdiskwritepoint" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.dt.document.xcdiskwritepoint"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"xcfeedbackpoint" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.dt.document.xcfeedbackpoint"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"xcfilelist" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.xcode.xcfilelist"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"xcframework" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.xcframework"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"xchanglog" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.dt.document.xchanglog"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"xchangpoint" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.dt.document.xchangpoint"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"xclaunchlog" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.dt.document.xclaunchlog"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"xclaunchpoint" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.dt.document.xclaunchpoint"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"xcmappingmodel" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.xcode.model.data-mapping"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"xcmetricsdata" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.dt.document.xcmetricsdata"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"xcode" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.xcode.project"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"xcplaygroundpage" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.dt.playgroundpage"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"xcplugin" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.xcode.plugin"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"xcplugindata" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.xcode.plugindata.compiled"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"xcprivacy" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.xcode.app-privacy-property-list"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"xcprocessorusagelog" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.dt.document.xcprocessorusagelog"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"xcprocessorusagepoint" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.dt.document.xcprocessorusagepoint"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"xcresult" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.xcode.resultbundle"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"xcscheme" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.dt.document.scheme"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"xcsnapshots" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.dt.document.snapshot"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"xcstickers" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.dt.stickers"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"xcstrings" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.xcode.xcstrings"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"xctest" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.dt.bundle.unit-test"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"xctestplan" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.dt.xctestplancontenttype"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"xctestproducts" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.dt.xctestproductscontenttype"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"xctestrun" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.dt.xctestruncontenttype"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"xctoolchain" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.dt.document.toolchain"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"xcworkspace" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.dt.document.workspace"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"xfd" {
			$fileTypeItem = @([fileType]::new($item,"public.xfd"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"xfdf" {
			$fileTypeItem = @([fileType]::new($item,"com.adobe.xfdf"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"xhtm" {
			$fileTypeItem = @([fileType]::new($item,"public.xhtml"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"xhtml" {
			$fileTypeItem = @([fileType]::new($item,"public.xhtml"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"public.xml"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"xib" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.interfacebuilder.document.cocoa"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"xip" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.xip-archive"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"xla" {
			$fileTypeItem = @([fileType]::new($item,"com.microsoft.excel.xla"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"com.microsoft.excel.xla.biff2"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"com.microsoft.excel.xla.biff4"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"xlam" {
			$fileTypeItem = @([fileType]::new($item,"com.microsoft.excel.openxml.addin"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"xlb" {
			$fileTypeItem = @([fileType]::new($item,"com.microsoft.excel.xlb"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"xliff" {
			$fileTypeItem = @([fileType]::new($item,"org.oasis-open.xliff"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"xll" {
			$fileTypeItem = @([fileType]::new($item,"com.microsoft.excel.xll"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"xlm" {
			$fileTypeItem = @([fileType]::new($item,"com.microsoft.excel.xlm"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"com.microsoft.excel.xlm.biff2"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"com.microsoft.excel.xlm.biff3"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"com.microsoft.excel.xlm.biff4"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"com.microsoft.excel.xlm.stationery.biff3"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"com.microsoft.excel.xlm.stationery.biff4"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"xlp9" {
			$fileTypeItem = @([fileType]::new($item,"com.microsoft.excel.plugin"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"xls" {
			$fileTypeItem = @([fileType]::new($item,"com.microsoft.excel.xls"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"com.microsoft.excel.xls.biff2"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"com.microsoft.excel.xls.biff3"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"com.microsoft.excel.xls.biff4"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"com.microsoft.excel.xls.biff5"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"com.microsoft.excel.xls.stationery.biff3"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"com.microsoft.excel.xls.stationery.biff4"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"com.microsoft.excel.xls.stationery.biff4"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"com.microsoft.onedrive.exportedbadges.tagged.shared"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"xls8" {
			$fileTypeItem = @([fileType]::new($item,"com.microsoft.excel.xls"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"com.microsoft.onedrive.exportedbadges.tagged.shared"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"xlsb" {
			$fileTypeItem = @([fileType]::new($item,"com.microsoft.excel.sheet.binary.macroenabled"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"xlsm" {
			$fileTypeItem = @([fileType]::new($item,"com.microsoft.excel.openxmlformats.spreadsheetml.sheet.macroenabled"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"org.openxmlformats.spreadsheetml.sheet.macroenabled"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"xlsx" {
			$fileTypeItem = @([fileType]::new($item,"com.microsoft.excel.openxmlformats.spreadsheetml.sheet"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"com.microsoft.excel.pref"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"org.openxmlformats.spreadsheetml.sheet"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"xltm" {
			$fileTypeItem = @([fileType]::new($item,"com.microsoft.excel.openxmlformats.spreadsheetml.template.macroenabled"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"org.openxmlformats.spreadsheetml.template.macroenabled"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"xltx" {
			$fileTypeItem = @([fileType]::new($item,"com.microsoft.excel.openxmlformats.spreadsheetml.template"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"org.openxmlformats.spreadsheetml.template"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"xlw" {
			$fileTypeItem = @([fileType]::new($item,"com.microsoft.excel.xld"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"com.microsoft.excel.xlw"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"com.microsoft.excel.xlw.biff2"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"com.microsoft.excel.xlw.biff3"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"com.microsoft.excel.xlw.biff4"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"com.microsoft.excel.xlw.biff5"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"xlw8" {
			$fileTypeItem = @([fileType]::new($item,"com.microsoft.excel.xlw"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"xml" {
			$fileTypeItem = @([fileType]::new($item,"com.microsoft.excel.xml"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"com.microsoft.word.openxmlformats.wordprocessingml.template.macroenabled"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"com.microsoft.word.wordml"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"public.xml"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"xpc" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.xpc-service"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"xpl" {
			$fileTypeItem = @([fileType]::new($item,"com.morriscooke.xpl"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"xz" {
			$fileTypeItem = @([fileType]::new($item,"org.tukaani.xz-archive"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"y" {
			$fileTypeItem = @([fileType]::new($item,"public.yacc-source"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"yaa" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.archive"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"yaml" {
			$fileTypeItem = @([fileType]::new($item,"public.ndjson"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"public.yaml"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"ym" {
			$fileTypeItem = @([fileType]::new($item,"public.yacc-source"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"yml" {
			$fileTypeItem = @([fileType]::new($item,"public.ndjson"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"public.yaml"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"ymm" {
			$fileTypeItem = @([fileType]::new($item,"public.yacc-source"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"yxx" {
			$fileTypeItem = @([fileType]::new($item,"public.yacc-source"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"z" {
			$fileTypeItem = @([fileType]::new($item,"public.z-archive"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"zettingz" {
			$fileTypeItem = @([fileType]::new($item,"com.tinyspeck.slack.file"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"com.zillow.re.zettingz"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"zip" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.pftmultiplerecordinginstrumenttype"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"public.zip-archive"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		"zsh" {
			$fileTypeItem = @([fileType]::new($item,"com.apple.xcode.zsh-script"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null

			$fileTypeItem = @([fileType]::new($item,"public.zsh-script"))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		}

		<# Default {
			$fileTypeItem = @([fileType]::new(" "," "))
			$fileTypeArrayList.Add($fileTypeItem) |Out-Null
		} #>
	}
}

$test = testFunc -fileTypes "tiff","jpeg","pdf","docx"

Write-Output "the list of type identifiers is: " $test
exit

$chooseFileCommand = "choose file with multiple selections allowed of type " + $test

$chooseFileString = $chooseFileCommand|/usr/bin/osascript -so

#deal with cancel
if($chooseFileString.Contains("execution error: User canceled. `(-128`)")) {
     #Write-Output "user hit cancel button"
     return "userCancelError"
}

#$chooseFileString = $testCommand|/usr/bin/osascript -so
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
#$chooseFileArrayList

