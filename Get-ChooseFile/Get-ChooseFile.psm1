#!/usr/bin/env pwsh

<#help goes here#>

function buildASTypeIdentifierList {
	Param (
		[Parameter(Mandatory = $false)][string[]] $fileTypes
	)
	
	#we only really care if there's more than zero items in $fileTypes
	if ($fileTypes.Count -gt 0) {

		#create an array list to hold our list of file type identifiers
		$fileTypeArrayList = New-Object System.Collections.ArrayList

		#loop through $filetypes. Every time there's a match, add the appropriate type identifiers to $fileTypeArrayList
		foreach ($item in $fileTypes) {

			#switch case of extensions/file types and type identifiers
			switch ($item) {
				"3fr" {
					$fileTypeArrayList.Add("com.hasselblad.3fr-raw-image") |Out-Null
				}

				"3g2" {
					$fileTypeArrayList.Add("public.3gpp2") |Out-Null
				}

				"3gp" {
					$fileTypeArrayList.Add("public.3gpp") |Out-Null
				}

				"3gp2" {
					$fileTypeArrayList.Add("public.3gpp2") |Out-Null
				}

				"3gpp" {
					$fileTypeArrayList.Add("public.3gpp") |Out-Null
				}

				"7z" {
					$fileTypeArrayList.Add("org.7-zip.7-zip-archive") |Out-Null
				}

				"8BPB" {
					$fileTypeArrayList.Add("com.adobe.photoshop-large-image") |Out-Null
				}

				"aa" {
					$fileTypeArrayList.Add("com.audible.aa-audio") |Out-Null
				}

				"aac" {
					$fileTypeArrayList.Add("public.aac-audio") |Out-Null
				}

				"aae" {
					$fileTypeArrayList.Add("com.apple.photos.apple-adjustment-envelope") |Out-Null
				}

				"aaf" {
					$fileTypeArrayList.Add("org.aafassociation.advanced-authoring-format") |Out-Null
				}

				"aar" {
					$fileTypeArrayList.Add("com.apple.archive") |Out-Null
				}

				"Aarc" {
					$fileTypeArrayList.Add("com.microsoft.outlook15.archive") |Out-Null
				}

				"aax" {
					$fileTypeArrayList.Add("com.audible.aax-audiobook") |Out-Null
				}

				"abcdg" {
					$fileTypeArrayList.Add("com.apple.addressbook.group") |Out-Null
				}

				"abcdp" {
					$fileTypeArrayList.Add("com.apple.addressbook.person") |Out-Null
				}

				"abdg" {
					$fileTypeArrayList.Add("com.apple.icon-overlay.alias-badge") |Out-Null
				}

				"abr" {
					$fileTypeArrayList.Add("com.adobe.photoshop.brush") |Out-Null

					$fileTypeArrayList.Add("com.apple.watch-38mm-series3-gps-6") |Out-Null
				}

				"ac-3" {
					$fileTypeArrayList.Add("public.ac3-audio") |Out-Null
				}

				"ac3" {
					$fileTypeArrayList.Add("public.ac3-audio") |Out-Null
				}

				"acct" {
					$fileTypeArrayList.Add("com.apple.application-icon.icloud-private-relay") |Out-Null
				}

				"acrobat" {
					$fileTypeArrayList.Add("com.adobe.pdf") |Out-Null
				}

				"action" {
					$fileTypeArrayList.Add("com.apple.automator-action") |Out-Null
				}

				"acts" {
					$fileTypeArrayList.Add("com.apple.legacy.actions-icon") |Out-Null
				}

				"ada" {
					$fileTypeArrayList.Add("public.ada-source") |Out-Null
				}

				"adb" {
					$fileTypeArrayList.Add("public.ada-source") |Out-Null
				}

				"adcL" {
					$fileTypeArrayList.Add("public.folder") |Out-Null
				}

				"adjustments" {
					$fileTypeArrayList.Add("com.pixelmatorteam.adjustments") |Out-Null
				}

				"ads" {
					$fileTypeArrayList.Add("public.ada-source") |Out-Null
				}

				"adts" {
					$fileTypeArrayList.Add("public.aac-audio") |Out-Null
				}

				"aea" {
					$fileTypeArrayList.Add("com.apple.encrypted-archive") |Out-Null
				}

				"afploc" {
					$fileTypeArrayList.Add("com.apple.afp-internet-location") |Out-Null
				}

				"afps" {
					$fileTypeArrayList.Add("com.apple.legacy.finder-icon") |Out-Null
				}

				"agent" {
					$fileTypeArrayList.Add("com.microsoft.onedrive.fluid") |Out-Null
				}

				"ahap" {
					$fileTypeArrayList.Add("com.apple.haptics.ahap") |Out-Null

					$fileTypeArrayList.Add("public.haptics-content") |Out-Null
				}

				"ai" {
					$fileTypeArrayList.Add("com.adobe.illustrator.ai-image") |Out-Null
				}

				"aicb" {
					$fileTypeArrayList.Add("com.adobe.illustrator.aicb") |Out-Null
				}

				"aif" {
					$fileTypeArrayList.Add("public.aiff-audio") |Out-Null
				}

				"aifc" {
					$fileTypeArrayList.Add("public.aifc-audio") |Out-Null
				}

				"aiff" {
					$fileTypeArrayList.Add("public.aiff-audio") |Out-Null
				}

				"aird" {
					$fileTypeArrayList.Add("com.apple.generic-airdisk") |Out-Null
				}

				"all" {
					$fileTypeArrayList.Add("purebred.zip.all") |Out-Null
				}

				"amnu" {
					$fileTypeArrayList.Add("com.apple.legacy.finder-icon") |Out-Null
				}

				"amr" {
					$fileTypeArrayList.Add("org.3gpp.adaptive-multi-rate-audio") |Out-Null
				}

				"animoji" {
					$fileTypeArrayList.Add("com.apple.avatarkit.animoji") |Out-Null
				}

				"anylistrecipes" {
					$fileTypeArrayList.Add("com.purplecover.anylist.recipeexport") |Out-Null
				}

				"apinotes" {
					$fileTypeArrayList.Add("com.apple.xcode.apinotes") |Out-Null
				}

				"aplibrary" {
					$fileTypeArrayList.Add("com.apple.photos.projects.slideshow") |Out-Null
				}

				"apns" {
					$fileTypeArrayList.Add("com.apple.dt.document.apns") |Out-Null
				}

				"app" {
					$fileTypeArrayList.Add("com.apple.application-bundle") |Out-Null

					$fileTypeArrayList.Add("com.apple.localizable-name-bundle") |Out-Null
				}

				"APPC" {
					$fileTypeArrayList.Add("com.apple.application-file") |Out-Null

					$fileTypeArrayList.Add("com.apple.deprecated-application-file") |Out-Null
				}

				"APPD" {
					$fileTypeArrayList.Add("com.apple.application-file") |Out-Null

					$fileTypeArrayList.Add("com.apple.deprecated-application-file") |Out-Null
				}

				"appdownload" {
					$fileTypeArrayList.Add("com.apple.appstore.appdownload") |Out-Null
				}

				"appe" {
					$fileTypeArrayList.Add("com.apple.application-file") |Out-Null

					$fileTypeArrayList.Add("com.apple.deprecated-application-file") |Out-Null
				}

				"appex" {
					$fileTypeArrayList.Add("com.apple.application-and-system-extension") |Out-Null
				}

				"appledocumentscanarchive" {
					$fileTypeArrayList.Add("public.app-category.medical") |Out-Null
				}

				"applescript" {
					$fileTypeArrayList.Add("com.apple.applescript.text") |Out-Null
				}

				"appr" {
					$fileTypeArrayList.Add("com.apple.legacy.finder-icon") |Out-Null
				}

				"apps" {
					$fileTypeArrayList.Add("com.apple.applications-folder") |Out-Null
				}

				"arng" {
					$fileTypeArrayList.Add("com.apple.legacy.keep-arranged") |Out-Null
				}

				"artrace" {
					$fileTypeArrayList.Add("com.apple.ariadne.artrace") |Out-Null
				}

				"arw" {
					$fileTypeArrayList.Add("com.sony.arw-raw-image") |Out-Null
				}

				"as" {
					$fileTypeArrayList.Add("com.apple.applesingle-archive") |Out-Null

					$fileTypeArrayList.Add("com.barebones.bbedit.actionscript-source") |Out-Null
				}

				"asf" {
					$fileTypeArrayList.Add("com.microsoft.advanced-systems-format") |Out-Null

					$fileTypeArrayList.Add("org.oasis-open.opendocument.presentation") |Out-Null
				}

				"ASF_" {
					$fileTypeArrayList.Add("com.microsoft.advanced-systems-format") |Out-Null

					$fileTypeArrayList.Add("org.oasis-open.opendocument.presentation") |Out-Null
				}

				"asif" {
					$fileTypeArrayList.Add("com.apple.disk-image-sparse") |Out-Null
				}

				"asm" {
					$fileTypeArrayList.Add("public.assembly-source") |Out-Null
				}

				"asnd" {
					$fileTypeArrayList.Add("com.apple.legacy.finder-icon") |Out-Null

					$fileTypeArrayList.Add("com.apple.unknown-object") |Out-Null
				}

				"asp" {
					$fileTypeArrayList.Add("com.barebones.bbedit.asp-source") |Out-Null
				}

				"aspx" {
					$fileTypeArrayList.Add("com.barebones.bbedit.asp-source") |Out-Null
				}

				"astc" {
					$fileTypeArrayList.Add("com.apple.notes.gallery") |Out-Null

					$fileTypeArrayList.Add("org.khronos.astc") |Out-Null
				}

				"astí" {
					$fileTypeArrayList.Add("com.apple.legacy.finder-icon") |Out-Null

					$fileTypeArrayList.Add("com.apple.unknown-object") |Out-Null
				}

				"asup" {
					$fileTypeArrayList.Add("com.apple.legacy.finder-icon") |Out-Null

					$fileTypeArrayList.Add("com.apple.unknown-object") |Out-Null
				}

				"asx" {
					$fileTypeArrayList.Add("com.microsoft.advanced-stream-redirector") |Out-Null
				}

				"ASX_" {
					$fileTypeArrayList.Add("com.microsoft.advanced-stream-redirector") |Out-Null
				}

				"atlk" {
					$fileTypeArrayList.Add("com.apple.legacy.finder-icon") |Out-Null

					$fileTypeArrayList.Add("com.apple.unknown-object") |Out-Null
				}

				"atrc" {
					$fileTypeArrayList.Add("com.apple.trace") |Out-Null
				}

				"atzn" {
					$fileTypeArrayList.Add("com.apple.legacy.finder-icon") |Out-Null

					$fileTypeArrayList.Add("com.apple.unknown-object") |Out-Null
				}

				"au" {
					$fileTypeArrayList.Add("public.au-audio") |Out-Null
				}

				"AUDB" {
					$fileTypeArrayList.Add("com.audible.aa-audio") |Out-Null
				}

				"AUDX" {
					$fileTypeArrayList.Add("com.audible.aa-audio") |Out-Null

					$fileTypeArrayList.Add("com.audible.aax-audiobook") |Out-Null
				}

				"aupreset" {
					$fileTypeArrayList.Add("com.apple.mainstage.patches") |Out-Null
				}

				"avchd" {
					$fileTypeArrayList.Add("public.audiovisual-content-collection") |Out-Null
				}

				"avci" {
					$fileTypeArrayList.Add("public.avci") |Out-Null
				}

				"AVcL" {
					$fileTypeArrayList.Add("com.adobe.indesign-import-avcl") |Out-Null
				}

				"avcs" {
					$fileTypeArrayList.Add("public.avcs") |Out-Null
				}

				"avi" {
					$fileTypeArrayList.Add("public.avi") |Out-Null
				}

				"avif" {
					$fileTypeArrayList.Add("public.avif") |Out-Null
				}

				"axr" {
					$fileTypeArrayList.Add("com.sony.axr-raw-image") |Out-Null
				}

				"backupbundle" {
					$fileTypeArrayList.Add("com.apple.disk-image-sparse-bundle") |Out-Null
				}

				"band" {
					$fileTypeArrayList.Add("com.apple.garageband.project") |Out-Null
				}

				"baro" {
					$fileTypeArrayList.Add("com.apple.legacy.backward-arrow") |Out-Null
				}

				"bash" {
					$fileTypeArrayList.Add("com.apple.xcode.bash-script") |Out-Null

					$fileTypeArrayList.Add("public.bash-script") |Out-Null
				}

				"bbaiworksheet" {
					$fileTypeArrayList.Add("com.barebones.bbedit.ai-chat-worksheet") |Out-Null
				}

				"bbcolors" {
					$fileTypeArrayList.Add("com.barebones.bbedit.legacy-color-scheme") |Out-Null
				}

				"bbcolorscheme" {
					$fileTypeArrayList.Add("com.barebones.bbedit.color-scheme") |Out-Null
				}

				"bblm" {
					$fileTypeArrayList.Add("com.barebones.bbedit.language-module") |Out-Null

					$fileTypeArrayList.Add("com.barebones.bbedit.text-factory") |Out-Null
				}

				"bbnotebookd" {
					$fileTypeArrayList.Add("com.barebones.bbedit.notebook") |Out-Null
				}

				"bbpackage" {
					$fileTypeArrayList.Add("com.barebones.bbedit.package") |Out-Null
				}

				"bbproject" {
					$fileTypeArrayList.Add("com.barebones.bbedit.legacy-project") |Out-Null
				}

				"bbprojectd" {
					$fileTypeArrayList.Add("com.barebones.bbedit.project") |Out-Null
				}

				"bdm" {
					$fileTypeArrayList.Add("public.sdp") |Out-Null
				}

				"bdmv" {
					$fileTypeArrayList.Add("public.sdp") |Out-Null
				}

				"bfld" {
					$fileTypeArrayList.Add("com.apple.finder.burn-folder") |Out-Null
				}

				"bin" {
					$fileTypeArrayList.Add("com.apple.macbinary-archive") |Out-Null
				}

				"binlog" {
					$fileTypeArrayList.Add("com.microsoft.msbuild-log") |Out-Null
				}

				"blank" {
					$fileTypeArrayList.Add("com.apple.preview.blank") |Out-Null
				}

				"bmp" {
					$fileTypeArrayList.Add("com.microsoft.bmp") |Out-Null
				}

				"bmpf" {
					$fileTypeArrayList.Add("com.hp.smartmac.bmpf") |Out-Null

					$fileTypeArrayList.Add("com.microsoft.bmp") |Out-Null
				}

				"bmrk" {
					$fileTypeArrayList.Add("public.bookmark") |Out-Null
				}

				"board" {
					$fileTypeArrayList.Add("com.apple.freeform.board") |Out-Null
				}

				"bonj" {
					$fileTypeArrayList.Add("com.apple.bonjour") |Out-Null
				}

				"book" {
					$fileTypeArrayList.Add("com.apple.ibooksauthor.book") |Out-Null

					$fileTypeArrayList.Add("com.apple.ibooksauthor.pkgbook") |Out-Null
				}

				"brushes" {
					$fileTypeArrayList.Add("com.pixelmatorteam.brushes") |Out-Null
				}

				"burn" {
					$fileTypeArrayList.Add("com.apple.legacy.burn") |Out-Null
				}

				"bwf" {
					$fileTypeArrayList.Add("com.microsoft.waveform-audio") |Out-Null
				}

				"bz" {
					$fileTypeArrayList.Add("public.bzip2-archive") |Out-Null
				}

				"bz2" {
					$fileTypeArrayList.Add("public.bzip2-archive") |Out-Null
				}

				"c" {
					$fileTypeArrayList.Add("public.c-source") |Out-Null
				}

				"c++" {
					$fileTypeArrayList.Add("public.c-plus-plus-source") |Out-Null
				}

				"cab" {
					$fileTypeArrayList.Add("com.microsoft.cab") |Out-Null
				}

				"caction" {
					$fileTypeArrayList.Add("com.apple.applescript.text-object") |Out-Null

					$fileTypeArrayList.Add("com.apple.automator-conversion-action") |Out-Null
				}

				"caf" {
					$fileTypeArrayList.Add("com.apple.coreaudio-format") |Out-Null
				}

				"cannedsearch" {
					$fileTypeArrayList.Add("com.apple.finder.predefined-search") |Out-Null
				}

				"capl" {
					$fileTypeArrayList.Add("com.apple.legacy.finder-icon") |Out-Null

					$fileTypeArrayList.Add("com.apple.unknown-object") |Out-Null
				}

				"caut" {
					$fileTypeArrayList.Add("com.apple.alert-caution") |Out-Null
				}

				"cbdg" {
					$fileTypeArrayList.Add("com.apple.icon-overlay.alert-caution-badge") |Out-Null
				}

				"cboard" {
					$fileTypeArrayList.Add("com.apple.iwork.keynote.kth") |Out-Null
				}

				"cc" {
					$fileTypeArrayList.Add("public.c-plus-plus-source") |Out-Null
				}

				"ccl" {
					$fileTypeArrayList.Add("com.apple.color-file") |Out-Null
				}

				"CCTX" {
					$fileTypeArrayList.Add("com.adobe.cc-text-interchange") |Out-Null
				}

				"cdda" {
					$fileTypeArrayList.Add("com.apple.music.cdda") |Out-Null

					$fileTypeArrayList.Add("public.cdda-audio") |Out-Null
				}

				"cddr" {
					$fileTypeArrayList.Add("public.cd-media") |Out-Null
				}

				"cdev" {
					$fileTypeArrayList.Add("com.apple.application-file") |Out-Null

					$fileTypeArrayList.Add("com.apple.deprecated-application-file") |Out-Null
				}

				"cdr" {
					$fileTypeArrayList.Add("com.apple.disk-image-cdr") |Out-Null
				}

				"cel" {
					$fileTypeArrayList.Add("public.flc-animation") |Out-Null
				}

				"cepp" {
					$fileTypeArrayList.Add("com.adobe.cep.dnd.pasteboardtype") |Out-Null
				}

				"cer" {
					$fileTypeArrayList.Add("com.apple.data-container") |Out-Null

					$fileTypeArrayList.Add("public.x509-certificate") |Out-Null
				}

				"cert" {
					$fileTypeArrayList.Add("public.x509-certificate") |Out-Null
				}

				"cfg" {
					$fileTypeArrayList.Add("com.barebones.bbedit.ini-configuration") |Out-Null
				}

				"cfr" {
					$fileTypeArrayList.Add("com.apple.cfr-font") |Out-Null
				}

				"cgi" {
					$fileTypeArrayList.Add("com.barebones.bbedit.cgi-script") |Out-Null
				}

				"chrono-timeline" {
					$fileTypeArrayList.Add("com.apple.widgetkit.simulator.timeline") |Out-Null
				}

				"cl" {
					$fileTypeArrayList.Add("public.opencl-source") |Out-Null
				}

				"class" {
					$fileTypeArrayList.Add("com.sun.java-class") |Out-Null
				}

				"clck" {
					$fileTypeArrayList.Add("com.apple.legacy.clock-icon") |Out-Null
				}

				"clipsother" {
					$fileTypeArrayList.Add("com.apple.clips.clipsother") |Out-Null
				}

				"clipspkg" {
					$fileTypeArrayList.Add("com.apple.clips.clipspkg") |Out-Null
				}

				"clipsproject" {
					$fileTypeArrayList.Add("com.apple.clips.project") |Out-Null
				}

				"clp" {
					$fileTypeArrayList.Add("com.apple.clips-source") |Out-Null
				}

				"clpu" {
					$fileTypeArrayList.Add("com.apple.finder.clipping") |Out-Null
				}

				"clr" {
					$fileTypeArrayList.Add("com.apple.color-file") |Out-Null
				}

				"clsp" {
					$fileTypeArrayList.Add("com.apple.colorsync-profile") |Out-Null
				}

				"cmnu" {
					$fileTypeArrayList.Add("com.apple.legacy.finder-icon") |Out-Null

					$fileTypeArrayList.Add("com.apple.unknown-object") |Out-Null
				}

				"CMYK" {
					$fileTypeArrayList.Add("com.adobe.cmyk-color") |Out-Null
				}

				"cnct" {
					$fileTypeArrayList.Add("com.apple.legacy.connect-to") |Out-Null
				}

				"coderequirement" {
					$fileTypeArrayList.Add("com.apple.xcode.code-requirement-property-list") |Out-Null
				}

				"colorpalette" {
					$fileTypeArrayList.Add("com.pixelmatorteam.colorpalette") |Out-Null
				}

				"command" {
					$fileTypeArrayList.Add("com.apple.terminal.shell-script") |Out-Null
				}

				"configprofile" {
					$fileTypeArrayList.Add("com.apple.configprofile") |Out-Null
				}

				"copilot" {
					$fileTypeArrayList.Add("com.apple.mach-o-executable") |Out-Null

					$fileTypeArrayList.Add("com.microsoft.onedrive.fluid") |Out-Null
				}

				"cp" {
					$fileTypeArrayList.Add("public.c-plus-plus-source") |Out-Null
				}

				"cpgz" {
					$fileTypeArrayList.Add("com.apple.bom-compressed-cpio") |Out-Null

					$fileTypeArrayList.Add("com.apple.instruments.instrdst") |Out-Null
				}

				"cpio" {
					$fileTypeArrayList.Add("public.cpio-archive") |Out-Null
				}

				"cpp" {
					$fileTypeArrayList.Add("public.c-plus-plus-source") |Out-Null
				}

				"cr2" {
					$fileTypeArrayList.Add("com.canon.cr2-raw-image") |Out-Null
				}

				"cr3" {
					$fileTypeArrayList.Add("com.canon.cr3-raw-image") |Out-Null
				}

				"crash" {
					$fileTypeArrayList.Add("com.apple.crashreport") |Out-Null
				}

				"crt" {
					$fileTypeArrayList.Add("com.apple.data-container") |Out-Null

					$fileTypeArrayList.Add("public.x509-certificate") |Out-Null
				}

				"crw" {
					$fileTypeArrayList.Add("com.canon.crw-raw-image") |Out-Null
				}

				"crwebloc" {
					$fileTypeArrayList.Add("org.chromium.shortcut") |Out-Null
				}

				"crx" {
					$fileTypeArrayList.Add("com.apple.graphic-icon.usb-c-port") |Out-Null

					$fileTypeArrayList.Add("com.microsoft.msbuild-log") |Out-Null

					$fileTypeArrayList.Add("org.chromium.extension") |Out-Null
				}

				"cs" {
					$fileTypeArrayList.Add("com.microsoft.c-sharp") |Out-Null
				}

				"csh" {
					$fileTypeArrayList.Add("com.apple.xcode.csh-script") |Out-Null

					$fileTypeArrayList.Add("public.csh-script") |Out-Null
				}

				"cshm" {
					$fileTypeArrayList.Add("public.cd-r-media") |Out-Null
				}

				"csproj" {
					$fileTypeArrayList.Add("com.microsoft.c-sharp-project") |Out-Null
				}

				"css" {
					$fileTypeArrayList.Add("public.css") |Out-Null
				}

				"csstore" {
					$fileTypeArrayList.Add("public.database") |Out-Null
				}

				"cst" {
					$fileTypeArrayList.Add("com.apple.logic.channelstripsetting") |Out-Null
				}

				"csv" {
					$fileTypeArrayList.Add("public.comma-separated-values-text") |Out-Null
				}

				"ctags" {
					$fileTypeArrayList.Add("com.barebones.bbedit.ctags-data") |Out-Null
				}

				"ctrD" {
					$fileTypeArrayList.Add("com.apple.legacy.finder-icon") |Out-Null

					$fileTypeArrayList.Add("com.apple.unknown-object") |Out-Null
				}

				"ctrl" {
					$fileTypeArrayList.Add("com.apple.legacy.finder-icon") |Out-Null

					$fileTypeArrayList.Add("com.apple.unknown-object") |Out-Null

					$fileTypeArrayList.Add("org.khronos.glsl.tess-control-shader") |Out-Null
				}

				"cube" {
					$fileTypeArrayList.Add("com.apple.videoapps.cube") |Out-Null

					$fileTypeArrayList.Add("com.blackmagicdesign.cube") |Out-Null
				}

				"cxx" {
					$fileTypeArrayList.Add("public.c-plus-plus-source") |Out-Null
				}

				"dae" {
					$fileTypeArrayList.Add("org.khronos.collada.digital-asset-exchange") |Out-Null
				}

				"dali" {
					$fileTypeArrayList.Add("com.apple.legacy.finder-icon") |Out-Null
				}

				"db" {
					$fileTypeArrayList.Add("com.apple.gamecontrollersettings.playstation.logo") |Out-Null

					$fileTypeArrayList.Add("com.hyperobjc.sqliteflow.db") |Out-Null
				}

				"db3" {
					$fileTypeArrayList.Add("com.apple.gamecontrollersettings.playstation.logo") |Out-Null

					$fileTypeArrayList.Add("com.hyperobjc.sqliteflow.db") |Out-Null
				}

				"dbox" {
					$fileTypeArrayList.Add("com.apple.drop-folder") |Out-Null
				}

				"dcm" {
					$fileTypeArrayList.Add("org.nema.dicom") |Out-Null
				}

				"dcr" {
					$fileTypeArrayList.Add("com.kodak.raw-image") |Out-Null
				}

				"DDim" {
					$fileTypeArrayList.Add("com.apple.disk-image-raw") |Out-Null
				}

				"dds" {
					$fileTypeArrayList.Add("com.microsoft.dds") |Out-Null
				}

				"definition" {
					$fileTypeArrayList.Add("com.apple.automator-type-definition") |Out-Null
				}

				"defs" {
					$fileTypeArrayList.Add("public.mig-source") |Out-Null
				}

				"der" {
					$fileTypeArrayList.Add("com.apple.data-container") |Out-Null

					$fileTypeArrayList.Add("public.x509-certificate") |Out-Null
				}

				"desk" {
					$fileTypeArrayList.Add("com.apple.desktop-folder") |Out-Null
				}

				"devf" {
					$fileTypeArrayList.Add("com.apple.developer-folder") |Out-Null
				}

				"devi" {
					$fileTypeArrayList.Add("com.apple.disk-image") |Out-Null

					$fileTypeArrayList.Add("com.apple.disk-image-udif") |Out-Null
				}

				"dext" {
					$fileTypeArrayList.Add("com.apple.driver-extension") |Out-Null
				}

				"dflexp" {
					$fileTypeArrayList.Add("com.hyperobjc.sqliteflow.filter") |Out-Null
				}

				"dfont" {
					$fileTypeArrayList.Add("com.adobe.postscript-font") |Out-Null

					$fileTypeArrayList.Add("com.apple.fontbook.draggablefont") |Out-Null

					$fileTypeArrayList.Add("com.apple.truetype-datafork-suitcase-font") |Out-Null
				}

				"dib" {
					$fileTypeArrayList.Add("com.microsoft.bmp") |Out-Null
				}

				"dic" {
					$fileTypeArrayList.Add("com.microsoft.word.dictionary") |Out-Null

					$fileTypeArrayList.Add("com.microsoft.word.mhtml") |Out-Null
				}

				"DICM" {
					$fileTypeArrayList.Add("org.nema.dicom") |Out-Null
				}

				"dicom" {
					$fileTypeArrayList.Add("org.nema.dicom") |Out-Null
				}

				"dif" {
					$fileTypeArrayList.Add("com.apple.protected-mpeg-4-video") |Out-Null

					$fileTypeArrayList.Add("com.microsoft.excel.dif") |Out-Null
				}

				"diff" {
					$fileTypeArrayList.Add("public.patch-file") |Out-Null
				}

				"disk" {
					$fileTypeArrayList.Add("public.volume") |Out-Null
				}

				"dist" {
					$fileTypeArrayList.Add("com.apple.installer-distribution-package") |Out-Null
				}

				"distz" {
					$fileTypeArrayList.Add("com.apple.installer-distribution-package") |Out-Null
				}

				"dll" {
					$fileTypeArrayList.Add("com.apple.x11-mach-o-executable") |Out-Null

					$fileTypeArrayList.Add("com.microsoft.windows-dynamic-link-library") |Out-Null
				}

				"dls" {
					$fileTypeArrayList.Add("public.downloadable-sound") |Out-Null
				}

				"dlyan" {
					$fileTypeArrayList.Add("public.dylan-source") |Out-Null
				}

				"dmg" {
					$fileTypeArrayList.Add("com.apple.disk-image") |Out-Null

					$fileTypeArrayList.Add("com.apple.disk-image-udif") |Out-Null
				}

				"dmgpart" {
					$fileTypeArrayList.Add("com.apple.disk-image-udif-segment") |Out-Null
				}

				"dng" {
					$fileTypeArrayList.Add("com.adobe.raw-image") |Out-Null
				}

				"doc" {
					$fileTypeArrayList.Add("com.microsoft.word.doc") |Out-Null
				}

				"doccarchive" {
					$fileTypeArrayList.Add("com.apple.documentation.doccarchive") |Out-Null
				}

				"docm" {
					$fileTypeArrayList.Add("com.microsoft.word.openxmlformats.wordprocessingml.document.macroenabled") |Out-Null

					$fileTypeArrayList.Add("org.openxmlformats.wordprocessingml.document.macro-enabled") |Out-Null
				}

				"docs" {
					$fileTypeArrayList.Add("com.apple.documents-folder") |Out-Null
				}

				"docx" {
					$fileTypeArrayList.Add("com.microsoft.word.strictopenxmlformats.wordprocessingml.document") |Out-Null

					$fileTypeArrayList.Add("org.openxmlformats.wordprocessingml.document") |Out-Null

					$fileTypeArrayList.Add("org.strictopenxmlformats.wordprocessingml.document") |Out-Null
				}

				"Word" {
					$fileTypeArrayList.Add("com.microsoft.word.strictopenxmlformats.wordprocessingml.document") |Out-Null

					$fileTypeArrayList.Add("org.openxmlformats.wordprocessingml.document") |Out-Null

					$fileTypeArrayList.Add("org.strictopenxmlformats.wordprocessingml.document") |Out-Null
				}

				"dot" {
					$fileTypeArrayList.Add("com.microsoft.word.dot") |Out-Null
				}

				"dotm" {
					$fileTypeArrayList.Add("com.microsoft.word.openxmlformats.wordprocessingml.template.macroenabled") |Out-Null
				}

				"dotx" {
					$fileTypeArrayList.Add("com.microsoft.word.openxmlformats.wordprocessingml.template") |Out-Null

					$fileTypeArrayList.Add("org.openxmlformats.wordprocessingml.template") |Out-Null
				}

				"download" {
					$fileTypeArrayList.Add("com.apple.safari.download") |Out-Null
				}

				"drawing" {
					$fileTypeArrayList.Add("com.apple.drawing") |Out-Null
				}

				"drfb" {
					$fileTypeArrayList.Add("com.apple.icon-overlay.drop-folder-badge") |Out-Null
				}

				"dsnd" {
					$fileTypeArrayList.Add("com.apple.legacy.finder-icon") |Out-Null

					$fileTypeArrayList.Add("com.apple.unknown-object") |Out-Null
				}

				"dsrv" {
					$fileTypeArrayList.Add("com.apple.legacy.finder-icon") |Out-Null

					$fileTypeArrayList.Add("com.apple.unknown-object") |Out-Null
				}

				"dsym" {
					$fileTypeArrayList.Add("com.apple.xcode.dsym") |Out-Null
				}

				"dtdspec" {
					$fileTypeArrayList.Add("com.barebones.bbedit.dtdspec") |Out-Null

					$fileTypeArrayList.Add("com.barebones.bbedit.textdocument-object") |Out-Null
				}

				"dv" {
					$fileTypeArrayList.Add("com.apple.protected-mpeg-4-video") |Out-Null
				}

				"dvc!" {
					$fileTypeArrayList.Add("com.apple.protected-mpeg-4-video") |Out-Null
				}

				"dvd" {
					$fileTypeArrayList.Add("public.dvd-media") |Out-Null
				}

				"dvdr" {
					$fileTypeArrayList.Add("com.apple.disk-image-cdr") |Out-Null

					$fileTypeArrayList.Add("com.apple.pro-display-xdr") |Out-Null

					$fileTypeArrayList.Add("public.dvd-r-media") |Out-Null
				}

				"dvdw" {
					$fileTypeArrayList.Add("public.dvd-rw-media") |Out-Null
				}

				"dvticonspec" {
					$fileTypeArrayList.Add("com.apple.dt.dvticon.spec") |Out-Null
				}

				"dvtplugin" {
					$fileTypeArrayList.Add("com.apple.dt.dvt.plug-in") |Out-Null
				}

				"dwnf" {
					$fileTypeArrayList.Add("com.apple.downloads-folder") |Out-Null
				}

				"dxo" {
					$fileTypeArrayList.Add("com.dxo.raw-image") |Out-Null
				}

				"dylib" {
					$fileTypeArrayList.Add("com.apple.mach-o-dylib") |Out-Null
				}

				"eac3" {
					$fileTypeArrayList.Add("public.enhanced-ac3-audio") |Out-Null
				}

				"ec-3" {
					$fileTypeArrayList.Add("public.enhanced-ac3-audio") |Out-Null
				}

				"edn" {
					$fileTypeArrayList.Add("com.adobe.edn") |Out-Null
				}

				"edtf" {
					$fileTypeArrayList.Add("com.apple.legacy.finder-icon") |Out-Null

					$fileTypeArrayList.Add("com.apple.unknown-object") |Out-Null
				}

				"effects" {
					$fileTypeArrayList.Add("com.pixelmatorteam.effects") |Out-Null
				}

				"efx" {
					$fileTypeArrayList.Add("com.j2.efx-fax") |Out-Null
				}

				"ejec" {
					$fileTypeArrayList.Add("com.apple.legacy.eject-media") |Out-Null
				}

				"EM3F" {
					$fileTypeArrayList.Add("com.apple.logic-song") |Out-Null
				}

				"eml" {
					$fileTypeArrayList.Add("com.apple.mail.email") |Out-Null

					$fileTypeArrayList.Add("com.microsoft.outlook15.email-message") |Out-Null
				}

				"emltpl" {
					$fileTypeArrayList.Add("com.microsoft.outlook.template") |Out-Null
				}

				"emlx" {
					$fileTypeArrayList.Add("com.apple.mail.emlx") |Out-Null
				}

				"emlxpart" {
					$fileTypeArrayList.Add("com.apple.mail.emlx.part") |Out-Null
				}

				"enex" {
					$fileTypeArrayList.Add("com.apple.notes.richtext") |Out-Null

					$fileTypeArrayList.Add("com.apple.notes.richtext") |Out-Null
				}

				"entitlements" {
					$fileTypeArrayList.Add("com.apple.xcode.entitlements-property-list") |Out-Null
				}

				"eps" {
					$fileTypeArrayList.Add("com.adobe.encapsulated-postscript") |Out-Null
				}

				"EPSF" {
					$fileTypeArrayList.Add("com.adobe.encapsulated-postscript") |Out-Null
				}

				"epub" {
					$fileTypeArrayList.Add("com.apple.ibooks.epub") |Out-Null

					$fileTypeArrayList.Add("org.idpf.epub-container") |Out-Null

					$fileTypeArrayList.Add("org.idpf.epub-folder") |Out-Null
				}

				"eras" {
					$fileTypeArrayList.Add("com.apple.legacy.erasing") |Out-Null
				}

				"erb" {
					$fileTypeArrayList.Add("com.barebones.bbedit.erb-source") |Out-Null
				}

				"erf" {
					$fileTypeArrayList.Add("com.epson.raw-image") |Out-Null
				}

				"etd" {
					$fileTypeArrayList.Add("com.adobe.etd") |Out-Null
				}

				"etx" {
					$fileTypeArrayList.Add("com.barebones.bbedit.setext-source") |Out-Null
				}

				"eval" {
					$fileTypeArrayList.Add("org.khronos.glsl.tess-evaluation-shader") |Out-Null
				}

				"evry" {
					$fileTypeArrayList.Add("com.apple.everyone-icon") |Out-Null
				}

				"ewsmbox" {
					$fileTypeArrayList.Add("com.apple.mail.ewsmbox") |Out-Null
				}

				"exe" {
					$fileTypeArrayList.Add("com.apple.mach-o-bundle") |Out-Null

					$fileTypeArrayList.Add("com.vmware.foreign.vhd") |Out-Null
				}

				"exp" {
					$fileTypeArrayList.Add("com.apple.symbol-export") |Out-Null
				}

				"explain" {
					$fileTypeArrayList.Add("com.morriscooke.explain") |Out-Null
				}

				"exr" {
					$fileTypeArrayList.Add("com.ilm.openexr-image") |Out-Null

					$fileTypeArrayList.Add("com.microsoft.powerpoint.pps") |Out-Null
				}

				"exs" {
					$fileTypeArrayList.Add("com.apple.logic.exs") |Out-Null
				}

				"extD" {
					$fileTypeArrayList.Add("com.apple.legacy.finder-icon") |Out-Null

					$fileTypeArrayList.Add("com.apple.unknown-object") |Out-Null
				}

				"extn" {
					$fileTypeArrayList.Add("com.apple.library-folder") |Out-Null
				}

				"f" {
					$fileTypeArrayList.Add("public.fortran-source") |Out-Null
				}

				"f4a" {
					$fileTypeArrayList.Add("com.adobe.flash.video") |Out-Null
				}

				"f4p" {
					$fileTypeArrayList.Add("com.adobe.flash.video") |Out-Null
				}

				"f4v" {
					$fileTypeArrayList.Add("com.adobe.flash.video") |Out-Null
				}

				"f77" {
					$fileTypeArrayList.Add("public.fortran-77-source") |Out-Null
				}

				"f90" {
					$fileTypeArrayList.Add("public.fortran-90-source") |Out-Null
				}

				"f95" {
					$fileTypeArrayList.Add("public.fortran-95-source") |Out-Null
				}

				"faro" {
					$fileTypeArrayList.Add("com.apple.legacy.forward-arrow") |Out-Null
				}

				"favs" {
					$fileTypeArrayList.Add("com.apple.legacy.favorite-items") |Out-Null
				}

				"fcgi" {
					$fileTypeArrayList.Add("com.barebones.bbedit.cgi-script") |Out-Null
				}

				"fcpproj" {
					$fileTypeArrayList.Add("com.apple.videoapps.fcpproj") |Out-Null
				}

				"fcpxmld" {
					$fileTypeArrayList.Add("com.apple.keynote.key") |Out-Null
				}

				"fdf" {
					$fileTypeArrayList.Add("com.adobe.fdf") |Out-Null
				}

				"fff" {
					$fileTypeArrayList.Add("com.hasselblad.fff-raw-image") |Out-Null
				}

				"ffil" {
					$fileTypeArrayList.Add("com.apple.font-suitcase") |Out-Null
				}

				"fileloc" {
					$fileTypeArrayList.Add("com.apple.file-internet-location") |Out-Null
				}

				"flac" {
					$fileTypeArrayList.Add("org.xiph.flac") |Out-Null
				}

				"flc" {
					$fileTypeArrayList.Add("public.flc-animation") |Out-Null
				}

				"fldr" {
					$fileTypeArrayList.Add("public.folder") |Out-Null
				}

				"fli" {
					$fileTypeArrayList.Add("public.flc-animation") |Out-Null
				}

				"fluid" {
					$fileTypeArrayList.Add("com.microsoft.onedrive.fluid") |Out-Null
				}

				"flv" {
					$fileTypeArrayList.Add("com.adobe.flash.video") |Out-Null
				}

				"FNDR" {
					$fileTypeArrayList.Add("com.apple.legacy.finder-icon") |Out-Null

					$fileTypeArrayList.Add("com.apple.unknown-object") |Out-Null
				}

				"fold" {
					$fileTypeArrayList.Add("public.folder") |Out-Null
				}

				"font" {
					$fileTypeArrayList.Add("com.apple.legacy.finder-icon") |Out-Null

					$fileTypeArrayList.Add("com.apple.unknown-object") |Out-Null
				}

				"fpbf" {
					$fileTypeArrayList.Add("com.apple.finder.burn-folder") |Out-Null
				}

				"fpx" {
					$fileTypeArrayList.Add("com.kodak.flashpix-image") |Out-Null
				}

				"frag" {
					$fileTypeArrayList.Add("org.khronos.glsl.fragment-shader") |Out-Null
				}

				"fragment" {
					$fileTypeArrayList.Add("org.khronos.glsl.fragment-shader") |Out-Null
				}

				"fragsh" {
					$fileTypeArrayList.Add("org.khronos.glsl.fragment-shader") |Out-Null
				}

				"framework" {
					$fileTypeArrayList.Add("com.apple.localizable-name-bundle") |Out-Null
				}

				"fs" {
					$fileTypeArrayList.Add("com.apple.file-system-plug-in") |Out-Null

					$fileTypeArrayList.Add("org.fsharp.f-sharp") |Out-Null

					$fileTypeArrayList.Add("org.khronos.glsl.fragment-shader") |Out-Null
				}

				"fsh" {
					$fileTypeArrayList.Add("org.khronos.glsl.fragment-shader") |Out-Null
				}

				"fsproj" {
					$fileTypeArrayList.Add("org.fsharp.f-sharp-project") |Out-Null
				}

				"ftploc" {
					$fileTypeArrayList.Add("com.apple.ftp-internet-location") |Out-Null
				}

				"ftps" {
					$fileTypeArrayList.Add("com.apple.legacy.finder-icon") |Out-Null

					$fileTypeArrayList.Add("com.apple.unknown-object") |Out-Null
				}

				"ftrh" {
					$fileTypeArrayList.Add("com.apple.trash-full") |Out-Null
				}

				"furl" {
					$fileTypeArrayList.Add("public.file-url") |Out-Null
				}

				"fVlt" {
					$fileTypeArrayList.Add("com.apple.file-vault") |Out-Null
				}

				"fvoc" {
					$fileTypeArrayList.Add("com.apple.movie-folder") |Out-Null
				}

				"game" {
					$fileTypeArrayList.Add("com.apple.chess.game") |Out-Null
				}

				"gbproj" {
					$fileTypeArrayList.Add("com.apple.garageband.project") |Out-Null
				}

				"gcf" {
					$fileTypeArrayList.Add("com.apple.storage.settings.trash.fill") |Out-Null

					$fileTypeArrayList.Add("com.pacifict.graphingcalculator.gcf") |Out-Null
				}

				"gchdb" {
					$fileTypeArrayList.Add("com.apple.logic.gchdb") |Out-Null

					$fileTypeArrayList.Add("com.omnigroup.omnigraffle.diagramstyle-package") |Out-Null
				}

				"gdiagramstyle" {
					$fileTypeArrayList.Add("com.omnigroup.omnigraffle.diagramstyle") |Out-Null
				}

				"geojson" {
					$fileTypeArrayList.Add("public.geojson") |Out-Null
				}

				"geom" {
					$fileTypeArrayList.Add("org.khronos.glsl.geometry-shader") |Out-Null
				}

				"gfld" {
					$fileTypeArrayList.Add("com.apple.groups-folder") |Out-Null
				}

				"gif" {
					$fileTypeArrayList.Add("com.apple.private.auto-loop-gif") |Out-Null

					$fileTypeArrayList.Add("com.compuserve.gif") |Out-Null

					$fileTypeArrayList.Add("com.microsoft.ppt.export.ext.animatedgif") |Out-Null

					$fileTypeArrayList.Add("com.microsoft.ppt.export.ext.gif") |Out-Null
				}

				"GIFf" {
					$fileTypeArrayList.Add("com.compuserve.gif") |Out-Null
				}

				"GImg" {
					$fileTypeArrayList.Add("com.roxio.disk-image-toast") |Out-Null
				}

				"glas" {
					$fileTypeArrayList.Add("com.apple.legacy.magnifying-glass") |Out-Null
				}

				"glb" {
					$fileTypeArrayList.Add("org.khronos.glb") |Out-Null
				}

				"glibb" {
					$fileTypeArrayList.Add("com.apple.logic.impulseresponse") |Out-Null
				}

				"glsl" {
					$fileTypeArrayList.Add("org.khronos.glsl-source") |Out-Null
				}

				"gltf" {
					$fileTypeArrayList.Add("org.khronos.gltf") |Out-Null
				}

				"gmac" {
					$fileTypeArrayList.Add("com.apple.mac") |Out-Null
				}

				"gmk" {
					$fileTypeArrayList.Add("public.make-source") |Out-Null
				}

				"gnpc" {
					$fileTypeArrayList.Add("public.computer") |Out-Null
				}

				"gnrl" {
					$fileTypeArrayList.Add("com.apple.legacy.general-icon") |Out-Null
				}

				"go" {
					$fileTypeArrayList.Add("com.barebones.bbedit.go-source") |Out-Null
				}

				"gpr" {
					$fileTypeArrayList.Add("com.gopro.gpr") |Out-Null
				}

				"gpurestart" {
					$fileTypeArrayList.Add("com.apple.gpurestart") |Out-Null
				}

				"gputrace" {
					$fileTypeArrayList.Add("com.apple.dt.xctest.element-snapshot") |Out-Null
				}

				"gpx" {
					$fileTypeArrayList.Add("com.topografix.gpx") |Out-Null
				}

				"gradients" {
					$fileTypeArrayList.Add("com.pixelmatorteam.gradients") |Out-Null
				}

				"graffle" {
					$fileTypeArrayList.Add("com.omnigroup.omnigraffle.graffle") |Out-Null
				}

				"grid" {
					$fileTypeArrayList.Add("com.apple.legacy.grid") |Out-Null
				}

				"groupactivity" {
					$fileTypeArrayList.Add("com.apple.groupactivities.activity") |Out-Null
				}

				"grup" {
					$fileTypeArrayList.Add("com.apple.user-group") |Out-Null
				}

				"gs" {
					$fileTypeArrayList.Add("org.khronos.glsl.geometry-shader") |Out-Null
				}

				"gsh" {
					$fileTypeArrayList.Add("org.khronos.glsl.geometry-shader") |Out-Null
				}

				"gstencil" {
					$fileTypeArrayList.Add("com.omnigroup.omnigraffle.gstencil") |Out-Null

					$fileTypeArrayList.Add("com.omnigroup.omnigraffle.gstencil-package") |Out-Null
				}

				"gtdbg" {
					$fileTypeArrayList.Add("com.apple.gputools.gtdbg") |Out-Null
				}

				"gtemplate" {
					$fileTypeArrayList.Add("com.omnigroup.omnigraffle.template") |Out-Null

					$fileTypeArrayList.Add("com.omnigroup.omnigraffle.template-package") |Out-Null
				}

				"gtmi" {
					$fileTypeArrayList.Add("com.apple.generic-time-machine-disk") |Out-Null
				}

				"guide" {
					$fileTypeArrayList.Add("com.apple.documentation.guide") |Out-Null
				}

				"gusr" {
					$fileTypeArrayList.Add("com.apple.guest-user") |Out-Null
				}

				"gwin" {
					$fileTypeArrayList.Add("com.apple.legacy.window") |Out-Null
				}

				"gz" {
					$fileTypeArrayList.Add("org.gnu.gnu-zip-archive") |Out-Null
				}

				"gzip" {
					$fileTypeArrayList.Add("org.gnu.gnu-zip-archive") |Out-Null
				}

				"h" {
					$fileTypeArrayList.Add("public.c-header") |Out-Null
				}

				"h++" {
					$fileTypeArrayList.Add("public.c-plus-plus-header") |Out-Null
				}

				"hang" {
					$fileTypeArrayList.Add("com.apple.hangreport") |Out-Null
				}

				"hasaccessory" {
					$fileTypeArrayList.Add("com.apple.homekit-accessory-simulator.accessory") |Out-Null

					$fileTypeArrayList.Add("com.apple.settings.privacysecurity.extension.privacy-filesandfolders") |Out-Null
				}

				"haslibrary" {
					$fileTypeArrayList.Add("com.apple.homekit-accessory-simulator.library") |Out-Null

					$fileTypeArrayList.Add("com.apple.softwareupdate-settings.generic-update") |Out-Null
				}

				"hasstate" {
					$fileTypeArrayList.Add("com.apple.homekit-accessory-simulator.state") |Out-Null
				}

				"hdr" {
					$fileTypeArrayList.Add("public.radiance") |Out-Null
				}

				"hdrv" {
					$fileTypeArrayList.Add("com.apple.disk-image-raw") |Out-Null
				}

				"heic" {
					$fileTypeArrayList.Add("public.heic") |Out-Null
				}

				"heics" {
					$fileTypeArrayList.Add("public.heics") |Out-Null
				}

				"heif" {
					$fileTypeArrayList.Add("public.heif") |Out-Null
				}

				"heifs" {
					$fileTypeArrayList.Add("public.heifs") |Out-Null
				}

				"help" {
					$fileTypeArrayList.Add("com.apple.help") |Out-Null

					$fileTypeArrayList.Add("com.apple.help-document") |Out-Null
				}

				"hfs" {
					$fileTypeArrayList.Add("com.adobe.indesign-import-hfs") |Out-Null
				}

				"hh" {
					$fileTypeArrayList.Add("public.c-plus-plus-header") |Out-Null
				}

				"hlsl" {
					$fileTypeArrayList.Add("com.microsoft.hlsl") |Out-Null
				}

				"horizon365vm" {
					$fileTypeArrayList.Add("com.vmware.horizon365vm") |Out-Null
				}

				"horizonapp" {
					$fileTypeArrayList.Add("com.vmware.horizonapp") |Out-Null
				}

				"horizonvm" {
					$fileTypeArrayList.Add("com.vmware.horizonvm") |Out-Null
				}

				"hp" {
					$fileTypeArrayList.Add("public.c-plus-plus-header") |Out-Null
				}

				"hp_remote_control_config" {
					$fileTypeArrayList.Add("com.hp.remote.control.config") |Out-Null
				}

				"hpp" {
					$fileTypeArrayList.Add("public.c-plus-plus-header") |Out-Null
				}

				"hqx" {
					$fileTypeArrayList.Add("com.apple.binhex-archive") |Out-Null
				}

				"htm" {
					$fileTypeArrayList.Add("public.html") |Out-Null
				}

				"html" {
					$fileTypeArrayList.Add("public.html") |Out-Null
				}

				"htps" {
					$fileTypeArrayList.Add("com.apple.legacy.finder-icon") |Out-Null

					$fileTypeArrayList.Add("com.apple.unknown-object") |Out-Null
				}

				"hufl" {
					$fileTypeArrayList.Add("com.apple.music.iappurl") |Out-Null

					$fileTypeArrayList.Add("com.apple.tv.iappurl") |Out-Null
				}

				"hvpl" {
					$fileTypeArrayList.Add("com.apple.music.visual") |Out-Null
				}

				"hxx" {
					$fileTypeArrayList.Add("public.c-plus-plus-header") |Out-Null
				}

				"i" {
					$fileTypeArrayList.Add("public.c-source.preprocessed") |Out-Null

					$fileTypeArrayList.Add("public.source-code") |Out-Null
				}

				"iba" {
					$fileTypeArrayList.Add("com.apple.ibooksauthor.book") |Out-Null
				}

				"ibooks" {
					$fileTypeArrayList.Add("com.apple.ibooks") |Out-Null

					$fileTypeArrayList.Add("com.apple.ibooks-container") |Out-Null

					$fileTypeArrayList.Add("com.apple.ibooks-folder") |Out-Null
				}

				"ibplugin" {
					$fileTypeArrayList.Add("com.apple.interfacebuilder.plugin") |Out-Null
				}

				"icbu" {
					$fileTypeArrayList.Add("com.apple.ical.backup-package") |Out-Null

					$fileTypeArrayList.Add("com.apple.ical.ics.event") |Out-Null
				}

				"icc" {
					$fileTypeArrayList.Add("clsp") |Out-Null

					$fileTypeArrayList.Add("com.apple.colorsync-profile") |Out-Null
				}

				"icloud" {
					$fileTypeArrayList.Add("com.apple.bookmark") |Out-Null

					$fileTypeArrayList.Add("com.apple.mapkit.map-item") |Out-Null
				}

				"icm" {
					$fileTypeArrayList.Add("clsp") |Out-Null

					$fileTypeArrayList.Add("com.apple.colorsync-profile") |Out-Null
				}

				"icma" {
					$fileTypeArrayList.Add("com.adobe.incopy-assignment") |Out-Null
				}

				"icml" {
					$fileTypeArrayList.Add("com.adobe.incopy-document") |Out-Null
				}

				"icns" {
					$fileTypeArrayList.Add("com.apple.icns") |Out-Null
				}

				"ico" {
					$fileTypeArrayList.Add("com.microsoft.ico") |Out-Null
				}

				"iconset" {
					$fileTypeArrayList.Add("com.apple.iconset") |Out-Null
				}

				"ics" {
					$fileTypeArrayList.Add("com.apple.ical.ics") |Out-Null

					$fileTypeArrayList.Add("com.microsoft.outlook15.icalendar") |Out-Null

					$fileTypeArrayList.Add("public.to-do-item") |Out-Null
				}

				"idcp" {
					$fileTypeArrayList.Add("com.charlessoft.macos-classic-installation-tome") |Out-Null
				}

				"ideplugin" {
					$fileTypeArrayList.Add("com.apple.dt.ide.plug-in") |Out-Null
				}

				"idml" {
					$fileTypeArrayList.Add("com.adobe.indesign-markup") |Out-Null
				}

				"idms" {
					$fileTypeArrayList.Add("com.adobe.indesign-snippet") |Out-Null
				}

				"idsk" {
					$fileTypeArrayList.Add("com.apple.idisk") |Out-Null

					$fileTypeArrayList.Add("public.file-sharepoint") |Out-Null
				}

				"ig" {
					$fileTypeArrayList.Add("com.instagram.gram") |Out-Null
				}

				"igo" {
					$fileTypeArrayList.Add("com.apple.ios-simulator") |Out-Null

					$fileTypeArrayList.Add("com.instagram.exclusivegram") |Out-Null
				}

				"íhlp" {
					$fileTypeArrayList.Add("com.apple.legacy.finder-icon") |Out-Null

					$fileTypeArrayList.Add("com.apple.unknown-object") |Out-Null
				}

				"ii" {
					$fileTypeArrayList.Add("public.c-plus-plus-source.preprocessed") |Out-Null
				}

				"iig" {
					$fileTypeArrayList.Add("com.apple.iig-source") |Out-Null

					$fileTypeArrayList.Add("public.source-code") |Out-Null
				}

				"iiq" {
					$fileTypeArrayList.Add("com.phaseone.raw-image") |Out-Null
				}

				"ílib" {
					$fileTypeArrayList.Add("com.apple.library-folder") |Out-Null
				}

				"illustrator" {
					$fileTypeArrayList.Add("com.adobe.illustrator.ai-image") |Out-Null
				}

				"ilmbplugin" {
					$fileTypeArrayList.Add("com.apple.ilifemediabrowser.plugin") |Out-Null
				}

				"íloc" {
					$fileTypeArrayList.Add("com.apple.legacy.finder-icon") |Out-Null

					$fileTypeArrayList.Add("com.apple.unknown-object") |Out-Null
				}

				"imapmbox" {
					$fileTypeArrayList.Add("com.apple.mail.imapmbox") |Out-Null
				}

				"img" {
					$fileTypeArrayList.Add("com.apple.disk-image-udif") |Out-Null
				}

				"imovieevent" {
					$fileTypeArrayList.Add("com.apple.iwork.keynote.sffkth") |Out-Null
				}

				"imovielibrary" {
					$fileTypeArrayList.Add("com.apple.imovielibrary") |Out-Null
				}

				"imoviemobile" {
					$fileTypeArrayList.Add("com.apple.imovie.imoviemobile") |Out-Null

					$fileTypeArrayList.Add("com.apple.imoviemobile") |Out-Null
				}

				"imovieother" {
					$fileTypeArrayList.Add("com.apple.imovie.imovieother") |Out-Null
				}

				"imovieproject" {
					$fileTypeArrayList.Add("com.apple.iwork.pages.pages") |Out-Null
				}

				"imovietrailer" {
					$fileTypeArrayList.Add("com.apple.imovie.imovietrailer") |Out-Null
				}

				"indb" {
					$fileTypeArrayList.Add("com.adobe.indesign-book") |Out-Null
				}

				"indd" {
					$fileTypeArrayList.Add("com.adobe.indesign-document") |Out-Null
				}

				"indesign" {
					$fileTypeArrayList.Add("com.adobe.indesign-document") |Out-Null
				}

				"indl" {
					$fileTypeArrayList.Add("com.adobe.indesign-library") |Out-Null
				}

				"indt" {
					$fileTypeArrayList.Add("com.adobe.indesign-template") |Out-Null
				}

				"ínet" {
					$fileTypeArrayList.Add("com.apple.legacy.finder-icon") |Out-Null

					$fileTypeArrayList.Add("com.apple.unknown-object") |Out-Null
				}

				"inetloc" {
					$fileTypeArrayList.Add("com.apple.generic-internet-location") |Out-Null
				}

				"ini" {
					$fileTypeArrayList.Add("com.barebones.bbedit.ini-configuration") |Out-Null
				}

				"inkt" {
					$fileTypeArrayList.Add("com.apple.ink.inktext") |Out-Null
				}

				"inl" {
					$fileTypeArrayList.Add("public.c-plus-plus-inline-header") |Out-Null
				}

				"ino" {
					$fileTypeArrayList.Add("com.barebones.bbedit.arduino-source") |Out-Null
				}

				"instrdst" {
					$fileTypeArrayList.Add("com.apple.instruments.instrdst") |Out-Null
				}

				"instrpkg" {
					$fileTypeArrayList.Add("com.apple.instruments.package-definition") |Out-Null
				}

				"intentdefinition" {
					$fileTypeArrayList.Add("com.apple.sirikit.intentdefinition") |Out-Null

					$fileTypeArrayList.Add("com.apple.sirikit.intentdefinition") |Out-Null
				}

				"internetconnect" {
					$fileTypeArrayList.Add("com.apple.podcasts.episode") |Out-Null

					$fileTypeArrayList.Add("com.apple.preference.network") |Out-Null
				}

				"intí" {
					$fileTypeArrayList.Add("com.apple.legacy.finder-icon") |Out-Null

					$fileTypeArrayList.Add("com.apple.unknown-object") |Out-Null
				}

				"introspection" {
					$fileTypeArrayList.Add("com.apple.quartzdebug.introspectiontrace") |Out-Null

					$fileTypeArrayList.Add("com.apple.settings.privacysecurity.extension.privacy-advertising") |Out-Null
				}

				"INX" {
					$fileTypeArrayList.Add("com.adobe.indesign-interchange") |Out-Null
				}

				"ioreg" {
					$fileTypeArrayList.Add("com.apple.ioregistryexplorer.archive") |Out-Null
				}

				"ipa" {
					$fileTypeArrayList.Add("com.apple.itunes.ipa") |Out-Null
				}

				"ipmeta" {
					$fileTypeArrayList.Add("com.apple.iphoto.ipmeta") |Out-Null
				}

				"íprd" {
					$fileTypeArrayList.Add("com.apple.legacy.finder-icon") |Out-Null

					$fileTypeArrayList.Add("com.apple.unknown-object") |Out-Null
				}

				"ips" {
					$fileTypeArrayList.Add("com.apple.ips") |Out-Null

					$fileTypeArrayList.Add("com.apple.printcenter.jobids") |Out-Null
				}

				"ipspot" {
					$fileTypeArrayList.Add("com.apple.iphoto.ipspot") |Out-Null
				}

				"ipsw" {
					$fileTypeArrayList.Add("com.apple.itunes.ipsw") |Out-Null
				}

				"íscr" {
					$fileTypeArrayList.Add("com.apple.legacy.finder-icon") |Out-Null

					$fileTypeArrayList.Add("com.apple.unknown-object") |Out-Null
				}

				"iso" {
					$fileTypeArrayList.Add("com.apple.disk-image") |Out-Null
				}

				"isrv" {
					$fileTypeArrayList.Add("com.apple.legacy.finder-icon") |Out-Null

					$fileTypeArrayList.Add("com.apple.unknown-object") |Out-Null
				}

				"issf" {
					$fileTypeArrayList.Add("com.apple.sites-folder") |Out-Null
				}

				"ite" {
					$fileTypeArrayList.Add("com.apple.tv.ite") |Out-Null
				}

				"ítex" {
					$fileTypeArrayList.Add("com.apple.legacy.finder-icon") |Out-Null

					$fileTypeArrayList.Add("com.apple.unknown-object") |Out-Null
				}

				"itimer" {
					$fileTypeArrayList.Add("com.fourthframe.intervals.itimer") |Out-Null
				}

				"itl" {
					$fileTypeArrayList.Add("com.apple.itunes.db") |Out-Null
				}

				"itlp" {
					$fileTypeArrayList.Add("com.apple.music.itlp") |Out-Null
				}

				"itms" {
					$fileTypeArrayList.Add("com.apple.itunes.store-url") |Out-Null

					$fileTypeArrayList.Add("com.apple.music.itms") |Out-Null

					$fileTypeArrayList.Add("com.apple.tv.itms") |Out-Null
				}

				"itun" {
					$fileTypeArrayList.Add("com.apple.music.metadata") |Out-Null

					$fileTypeArrayList.Add("com.apple.tv.metadata") |Out-Null
				}

				"j2c" {
					$fileTypeArrayList.Add("com.apple.live-photo") |Out-Null
				}

				"j2k" {
					$fileTypeArrayList.Add("com.apple.live-photo") |Out-Null
				}

				"jar" {
					$fileTypeArrayList.Add("com.sun.java-archive") |Out-Null
				}

				"jav" {
					$fileTypeArrayList.Add("com.sun.java-source") |Out-Null
				}

				"java" {
					$fileTypeArrayList.Add("com.sun.java-source") |Out-Null
				}

				"javascript" {
					$fileTypeArrayList.Add("com.netscape.javascript-source") |Out-Null
				}

				"jfx" {
					$fileTypeArrayList.Add("com.j2.jfx-fax") |Out-Null
				}

				"jnlp" {
					$fileTypeArrayList.Add("com.sun.java-web-start") |Out-Null
				}

				"jpeg" {
					$fileTypeArrayList.Add("public.jpeg") |Out-Null
				}

				"jpf" {
					$fileTypeArrayList.Add("com.apple.live-photo") |Out-Null
				}

				"jpg" {
					$fileTypeArrayList.Add("com.microsoft.ppt.export.ext.jpg") |Out-Null

					$fileTypeArrayList.Add("com.microsoft.ppt.export.jpg") |Out-Null

					$fileTypeArrayList.Add("public.heif-standard") |Out-Null

					$fileTypeArrayList.Add("public.jpeg") |Out-Null
				}

				"jpx" {
					$fileTypeArrayList.Add("com.apple.live-photo") |Out-Null
				}

				"js" {
					$fileTypeArrayList.Add("com.netscape.javascript-source") |Out-Null
				}

				"jscript" {
					$fileTypeArrayList.Add("com.netscape.javascript-source") |Out-Null
				}

				"json" {
					$fileTypeArrayList.Add("public.json") |Out-Null
				}

				"json_crash" {
					$fileTypeArrayList.Add("com.apple.json-crash") |Out-Null
				}

				"jsp" {
					$fileTypeArrayList.Add("com.barebones.bbedit.jsp-source") |Out-Null
				}

				"jxl" {
					$fileTypeArrayList.Add("public.jpeg-xl") |Out-Null
				}

				"kar" {
					$fileTypeArrayList.Add("public.midi-audio") |Out-Null
				}

				"kext" {
					$fileTypeArrayList.Add("com.apple.kernel-extension") |Out-Null
				}

				"key" {
					$fileTypeArrayList.Add("com.apple.iwork.keynote.key") |Out-Null

					$fileTypeArrayList.Add("com.apple.iwork.keynote.sffkey") |Out-Null
				}

				"key-tef" {
					$fileTypeArrayList.Add("com.apple.iwork.keynote.key-tef") |Out-Null

					$fileTypeArrayList.Add("com.apple.keynote.key") |Out-Null
				}

				"keychain" {
					$fileTypeArrayList.Add("com.apple.settings.privacysecurity.extension.filevault") |Out-Null

					$fileTypeArrayList.Add("com.rsa.pkcs-12") |Out-Null
				}

				"keychain-db" {
					$fileTypeArrayList.Add("com.apple.keychain") |Out-Null

					$fileTypeArrayList.Add("com.apple.settings.privacysecurity.extension.filevault") |Out-Null
				}

				"keynote" {
					$fileTypeArrayList.Add("com.apple.iwork.keynote.key") |Out-Null
				}

				"kpdc" {
					$fileTypeArrayList.Add("com.apple.iwork.keynote.kpdc") |Out-Null
				}

				"kpf" {
					$fileTypeArrayList.Add("com.apple.iwork.keynote.kpf") |Out-Null
				}

				"ksh" {
					$fileTypeArrayList.Add("com.apple.xcode.ksh-script") |Out-Null

					$fileTypeArrayList.Add("public.ksh-script") |Out-Null
				}

				"kth" {
					$fileTypeArrayList.Add("com.apple.iwork.keynote.kth") |Out-Null

					$fileTypeArrayList.Add("com.apple.iwork.keynote.sffkth") |Out-Null
				}

				"ktrace" {
					$fileTypeArrayList.Add("com.apple.ktrace") |Out-Null

					$fileTypeArrayList.Add("com.apple.pftmultiplerecordinginstrumenttype") |Out-Null
				}

				"ktx" {
					$fileTypeArrayList.Add("org.khronos.ktx") |Out-Null
				}

				"l" {
					$fileTypeArrayList.Add("public.lex-source") |Out-Null
				}

				"lasso" {
					$fileTypeArrayList.Add("com.barebones.bbedit.lasso-source") |Out-Null
				}

				"latex" {
					$fileTypeArrayList.Add("com.barebones.bbedit.tex-source") |Out-Null
				}

				"latm" {
					$fileTypeArrayList.Add("public.mp4a-latm") |Out-Null

					$fileTypeArrayList.Add("public.mp4a-loas") |Out-Null
				}

				"layerstyles" {
					$fileTypeArrayList.Add("com.pixelmatorteam.layerstyles") |Out-Null
				}

				"lbdg" {
					$fileTypeArrayList.Add("com.apple.icon-overlay.locked-badge") |Out-Null
				}

				"lcs" {
					$fileTypeArrayList.Add("com.apple.graphic-icon.accessories") |Out-Null

					$fileTypeArrayList.Add("com.microsoft.outlook15.icalendar") |Out-Null
				}

				"lid" {
					$fileTypeArrayList.Add("public.dylan-source") |Out-Null
				}

				"ll" {
					$fileTypeArrayList.Add("public.lex-source") |Out-Null
				}

				"lm" {
					$fileTypeArrayList.Add("public.lex-source") |Out-Null
				}

				"lmm" {
					$fileTypeArrayList.Add("public.lex-source") |Out-Null
				}

				"loas" {
					$fileTypeArrayList.Add("public.mp4a-loas") |Out-Null
				}

				"lock" {
					$fileTypeArrayList.Add("com.apple.legacy.locked") |Out-Null
				}

				"logarchive" {
					$fileTypeArrayList.Add("com.apple.logarchive") |Out-Null
				}

				"logic" {
					$fileTypeArrayList.Add("com.apple.logic.project") |Out-Null
				}

				"logicx" {
					$fileTypeArrayList.Add("com.apple.logicx.project") |Out-Null
				}

				"logikcs" {
					$fileTypeArrayList.Add("com.apple.logic.keycommand") |Out-Null
				}

				"loop" {
					$fileTypeArrayList.Add("com.apple.mach-o-executable") |Out-Null

					$fileTypeArrayList.Add("com.microsoft.onedrive.fluid") |Out-Null
				}

				"lpdf" {
					$fileTypeArrayList.Add("com.apple.localized-pdf-bundle") |Out-Null
				}

				"lpp" {
					$fileTypeArrayList.Add("public.lex-source") |Out-Null
				}

				"lso" {
					$fileTypeArrayList.Add("com.apple.logic-song") |Out-Null
				}

				"lsr" {
					$fileTypeArrayList.Add("com.apple.lsr-image") |Out-Null
				}

				"lua" {
					$fileTypeArrayList.Add("com.barebones.bbedit.lua-source") |Out-Null
				}

				"LWFN" {
					$fileTypeArrayList.Add("com.adobe.postscript-lwfn-font") |Out-Null
				}

				"lxx" {
					$fileTypeArrayList.Add("public.lex-source") |Out-Null
				}

				"m" {
					$fileTypeArrayList.Add("public.objective-c-plus-plus-source") |Out-Null

					$fileTypeArrayList.Add("public.objective-c-source") |Out-Null
				}

				"m15" {
					$fileTypeArrayList.Add("public.mpeg") |Out-Null
				}

				"m2ts" {
					$fileTypeArrayList.Add("public.avchd-mpeg-2-transport-stream") |Out-Null
				}

				"m2v" {
					$fileTypeArrayList.Add("public.audiovisual-content") |Out-Null

					$fileTypeArrayList.Add("public.mpeg-2-video") |Out-Null
				}

				"m3u" {
					$fileTypeArrayList.Add("com.apple.music.m3u-playlist") |Out-Null

					$fileTypeArrayList.Add("com.apple.tv.m3u-playlist") |Out-Null
				}

				"m3u8" {
					$fileTypeArrayList.Add("com.apple.music.m3u-playlist") |Out-Null

					$fileTypeArrayList.Add("com.apple.tv.m3u-playlist") |Out-Null
				}

				"m4a" {
					$fileTypeArrayList.Add("com.apple.m4a-audio") |Out-Null
				}

				"m4b" {
					$fileTypeArrayList.Add("com.apple.protected-mpeg-4-audio-b") |Out-Null
				}

				"m4p" {
					$fileTypeArrayList.Add("com.apple.protected-mpeg-4-audio") |Out-Null
				}

				"m4r" {
					$fileTypeArrayList.Add("com.apple.mpeg-4-ringtone") |Out-Null

					$fileTypeArrayList.Add("com.apple.protected-mpeg-4-audio") |Out-Null
				}

				"m4v" {
					$fileTypeArrayList.Add("com.apple.m4v-video") |Out-Null
				}

				"m75" {
					$fileTypeArrayList.Add("public.mpeg") |Out-Null
				}

				"M822" {
					$fileTypeArrayList.Add("com.apple.graphic-icon.game-controller") |Out-Null
				}

				"Mac" {
					$fileTypeArrayList.Add("com.apple.mac") |Out-Null
				}

				"macD" {
					$fileTypeArrayList.Add("com.apple.legacy.finder-icon") |Out-Null

					$fileTypeArrayList.Add("com.apple.unknown-object") |Out-Null
				}

				"Macintosh" {
					$fileTypeArrayList.Add("com.apple.mac") |Out-Null
				}

				"macs" {
					$fileTypeArrayList.Add("com.apple.document-type.system-folder") |Out-Null
				}

				"mailloc" {
					$fileTypeArrayList.Add("com.apple.mail-internet-location") |Out-Null
				}

				"mainstagegraph" {
					$fileTypeArrayList.Add("com.apple.logic.dpst") |Out-Null
				}

				"mak" {
					$fileTypeArrayList.Add("public.make-source") |Out-Null
				}

				"make" {
					$fileTypeArrayList.Add("public.make-source") |Out-Null
				}

				"markdown" {
					$fileTypeArrayList.Add("net.daringfireball.markdown") |Out-Null
				}

				"mbdg" {
					$fileTypeArrayList.Add("com.apple.legacy.finder-icon") |Out-Null

					$fileTypeArrayList.Add("com.apple.unknown-object") |Out-Null
				}

				"mbox" {
					$fileTypeArrayList.Add("com.apple.mail.mbox") |Out-Null

					$fileTypeArrayList.Add("com.microsoft.outlook15.mailbox") |Out-Null
				}

				"md" {
					$fileTypeArrayList.Add("net.daringfireball.markdown") |Out-Null
				}

				"mdimporter" {
					$fileTypeArrayList.Add("com.apple.metadata-importer") |Out-Null
				}

				"mdown" {
					$fileTypeArrayList.Add("net.daringfireball.markdown") |Out-Null
				}

				"memgraph" {
					$fileTypeArrayList.Add("com.apple.dt.ide.memorygraphdebuggercontenttype") |Out-Null
				}

				"menu" {
					$fileTypeArrayList.Add("com.apple.menu-extra") |Out-Null
				}

				"metal" {
					$fileTypeArrayList.Add("com.apple.metal") |Out-Null
				}

				"mht" {
					$fileTypeArrayList.Add("com.microsoft.word.mhtml") |Out-Null

					$fileTypeArrayList.Add("org.ietf.mhtml") |Out-Null
				}

				"mhtm" {
					$fileTypeArrayList.Add("com.microsoft.word.mhtml") |Out-Null

					$fileTypeArrayList.Add("org.ietf.mhtml") |Out-Null
				}

				"mhtml" {
					$fileTypeArrayList.Add("com.microsoft.word.mhtml") |Out-Null

					$fileTypeArrayList.Add("org.ietf.mhtml") |Out-Null
				}

				"mi" {
					$fileTypeArrayList.Add("public.objective-c-source.preprocessed") |Out-Null
				}

				"mid" {
					$fileTypeArrayList.Add("public.midi-audio") |Out-Null
				}

				"midi" {
					$fileTypeArrayList.Add("public.midi-audio") |Out-Null
				}

				"mig" {
					$fileTypeArrayList.Add("public.mig-source") |Out-Null
				}

				"mii" {
					$fileTypeArrayList.Add("public.objective-c-plus-plus-source.preprocessed") |Out-Null
				}

				"mime" {
					$fileTypeArrayList.Add("com.microsoft.outlook15.mime") |Out-Null
				}

				"minc" {
					$fileTypeArrayList.Add("ca.mcgill.mni.bic.mnc") |Out-Null
				}

				"mitm" {
					$fileTypeArrayList.Add("com.apple.legacy.multiple-items") |Out-Null
				}

				"mk" {
					$fileTypeArrayList.Add("public.make-source") |Out-Null
				}

				"mkdirectionsrequest" {
					$fileTypeArrayList.Add("com.apple.maps.directionsrequest") |Out-Null
				}

				"mlarchive" {
					$fileTypeArrayList.Add("com.apple.coreml.mlarchive") |Out-Null
				}

				"mlkitmodel" {
					$fileTypeArrayList.Add("com.apple.coreml.model") |Out-Null
				}

				"mlmodel" {
					$fileTypeArrayList.Add("com.apple.coreml.model") |Out-Null

					$fileTypeArrayList.Add("public.haptics-content") |Out-Null
				}

				"mlmodelc" {
					$fileTypeArrayList.Add("com.apple.coreml.mlmodelc") |Out-Null
				}

				"mlmodelkey" {
					$fileTypeArrayList.Add("com.apple.coreml.mlmodelkey") |Out-Null
				}

				"mlpackage" {
					$fileTypeArrayList.Add("com.apple.coreml.mlpackage") |Out-Null
				}

				"mlpd" {
					$fileTypeArrayList.Add("org.mono.profile") |Out-Null
				}

				"mlperf" {
					$fileTypeArrayList.Add("com.apple.coreml.mlperfreport") |Out-Null
				}

				"mlproj" {
					$fileTypeArrayList.Add("com.apple.createml.project") |Out-Null
				}

				"mm" {
					$fileTypeArrayList.Add("public.objective-c-plus-plus-source") |Out-Null
				}

				"mme" {
					$fileTypeArrayList.Add("com.microsoft.outlook15.mime") |Out-Null
				}

				"mnc" {
					$fileTypeArrayList.Add("ca.mcgill.mni.bic.mnc") |Out-Null
				}

				"mntd" {
					$fileTypeArrayList.Add("com.apple.legacy.finder-icon") |Out-Null

					$fileTypeArrayList.Add("com.apple.unknown-object") |Out-Null
				}

				"mobile" {
					$fileTypeArrayList.Add("com.apple.mobileconfig") |Out-Null
				}

				"mobileconfig" {
					$fileTypeArrayList.Add("com.apple.mobileconfig") |Out-Null
				}

				"mobileprovision" {
					$fileTypeArrayList.Add("com.apple.mobileprovision") |Out-Null
				}

				"mode0" {
					$fileTypeArrayList.Add("com.apple.xcode.projectdata") |Out-Null
				}

				"mode0v3" {
					$fileTypeArrayList.Add("com.apple.xcode.projectdata") |Out-Null
				}

				"mode1" {
					$fileTypeArrayList.Add("com.apple.xcode.projectdata") |Out-Null
				}

				"mode1v3" {
					$fileTypeArrayList.Add("com.apple.xcode.projectdata") |Out-Null
				}

				"mode2" {
					$fileTypeArrayList.Add("com.apple.xcode.projectdata") |Out-Null
				}

				"mode2v3" {
					$fileTypeArrayList.Add("com.apple.xcode.projectdata") |Out-Null
				}

				"mode3" {
					$fileTypeArrayList.Add("com.apple.xcode.projectdata") |Out-Null
				}

				"mode3v3" {
					$fileTypeArrayList.Add("com.apple.xcode.projectdata") |Out-Null
				}

				"modulemap" {
					$fileTypeArrayList.Add("public.module-map") |Out-Null
				}

				"mom" {
					$fileTypeArrayList.Add("com.apple.xcode.mom") |Out-Null
				}

				"MooV" {
					$fileTypeArrayList.Add("public.movie") |Out-Null
				}

				"morí" {
					$fileTypeArrayList.Add("com.apple.pictures-folder") |Out-Null
				}

				"mos" {
					$fileTypeArrayList.Add("com.leafamerica.raw-image") |Out-Null
				}

				"mov" {
					$fileTypeArrayList.Add("com.apple.private.photos.mail-movie-export") |Out-Null

					$fileTypeArrayList.Add("com.microsoft.ppt.export.mov") |Out-Null

					$fileTypeArrayList.Add("public.movie") |Out-Null
				}

				"quicktime" {
					$fileTypeArrayList.Add("com.apple.private.photos.mail-movie-export") |Out-Null

					$fileTypeArrayList.Add("com.microsoft.ppt.export.mov") |Out-Null

					$fileTypeArrayList.Add("public.movie") |Out-Null
				}

				"movpkg" {
					$fileTypeArrayList.Add("com.apple.tv.movpkg") |Out-Null
				}

				"mp2" {
					$fileTypeArrayList.Add("com.apple.music.mp2") |Out-Null

					$fileTypeArrayList.Add("public.audiovisual-content-collection") |Out-Null
				}

				"mp3" {
					$fileTypeArrayList.Add("com.apple.mediaextension-content") |Out-Null

					$fileTypeArrayList.Add("public.mp3") |Out-Null
				}

				"mp3!" {
					$fileTypeArrayList.Add("com.apple.mediaextension-content") |Out-Null

					$fileTypeArrayList.Add("public.mp3") |Out-Null
				}

				"mp3u" {
					$fileTypeArrayList.Add("com.apple.music.m3u-playlist") |Out-Null

					$fileTypeArrayList.Add("com.apple.tv.m3u-playlist") |Out-Null
				}

				"mp4" {
					$fileTypeArrayList.Add("com.microsoft.ppt.export.mp4") |Out-Null

					$fileTypeArrayList.Add("org.oasis-open.opendocument.presentation") |Out-Null

					$fileTypeArrayList.Add("public.mpeg-4") |Out-Null

					$fileTypeArrayList.Add("public.mpeg-4-audio") |Out-Null
				}

				"mpe" {
					$fileTypeArrayList.Add("public.mpeg") |Out-Null
				}

				"mpeg" {
					$fileTypeArrayList.Add("public.mpeg") |Out-Null
				}

				"mpg" {
					$fileTypeArrayList.Add("public.mpeg") |Out-Null
				}

				"MPG2" {
					$fileTypeArrayList.Add("com.apple.music.mp2") |Out-Null
				}

				"mpg3" {
					$fileTypeArrayList.Add("com.apple.mediaextension-content") |Out-Null

					$fileTypeArrayList.Add("public.mp3") |Out-Null
				}

				"mpg4" {
					$fileTypeArrayList.Add("public.mpeg-4") |Out-Null

					$fileTypeArrayList.Add("public.mpeg-4-audio") |Out-Null
				}

				"mpga" {
					$fileTypeArrayList.Add("com.apple.mediaextension-content") |Out-Null

					$fileTypeArrayList.Add("public.mp3") |Out-Null
				}

				"mpkg" {
					$fileTypeArrayList.Add("com.apple.installer-meta-package") |Out-Null

					$fileTypeArrayList.Add("com.apple.installer-package-archive") |Out-Null
				}

				"mpo" {
					$fileTypeArrayList.Add("public.mpo-image") |Out-Null
				}

				"mpsgraph" {
					$fileTypeArrayList.Add("com.apple.mps.graph") |Out-Null
				}

				"mpsgraphpackage" {
					$fileTypeArrayList.Add("com.apple.mps.graph.package") |Out-Null
				}

				"mrw" {
					$fileTypeArrayList.Add("com.konicaminolta.raw-image") |Out-Null
				}

				"musiclibrary" {
					$fileTypeArrayList.Add("com.apple.music.library") |Out-Null
				}

				"mwand" {
					$fileTypeArrayList.Add("com.apple.garageband.template.magicmentor") |Out-Null
				}

				"mxf" {
					$fileTypeArrayList.Add("org.smpte.mxf") |Out-Null
				}

				"myatt" {
					$fileTypeArrayList.Add("com.att.configuration.myatt") |Out-Null
				}

				"mymc" {
					$fileTypeArrayList.Add("public.file-sharepoint") |Out-Null
				}

				"mysql" {
					$fileTypeArrayList.Add("com.barebones.bbedit.sql-source") |Out-Null
				}

				"nasm" {
					$fileTypeArrayList.Add("public.nasm-assembly-source") |Out-Null
				}

				"navtrace" {
					$fileTypeArrayList.Add("com.apple.maps.navtracefile") |Out-Null
				}

				"nef" {
					$fileTypeArrayList.Add("com.nikon.raw-image") |Out-Null
				}

				"netB" {
					$fileTypeArrayList.Add("com.apple.storage-netboot") |Out-Null
				}

				"networkconnect" {
					$fileTypeArrayList.Add("com.apple.preference.network") |Out-Null
				}

				"newsloc" {
					$fileTypeArrayList.Add("com.apple.news-internet-location") |Out-Null
				}

				"nfbg" {
					$fileTypeArrayList.Add("com.apple.icon-overlay.new-folder-badge") |Out-Null
				}

				"nfil" {
					$fileTypeArrayList.Add("com.apple.legacy.finder-icon") |Out-Null

					$fileTypeArrayList.Add("com.apple.unknown-object") |Out-Null
				}

				"nfld" {
					$fileTypeArrayList.Add("com.apple.legacy.finder-icon") |Out-Null

					$fileTypeArrayList.Add("com.apple.unknown-object") |Out-Null
				}

				"nib" {
					$fileTypeArrayList.Add("com.apple.interfacebuilder.document") |Out-Null
				}

				"nii" {
					$fileTypeArrayList.Add("gov.nih.nifti-1") |Out-Null
				}

				"nldd" {
					$fileTypeArrayList.Add("com.apple.not-loaded") |Out-Null
				}

				"nmbtemplate" {
					$fileTypeArrayList.Add("com.apple.iwork.numbers.sfftemplate") |Out-Null

					$fileTypeArrayList.Add("com.apple.iwork.numbers.template") |Out-Null
				}

				"note" {
					$fileTypeArrayList.Add("com.apple.alert") |Out-Null

					$fileTypeArrayList.Add("com.gingerlabs.notability.notearchive") |Out-Null

					$fileTypeArrayList.Add("com.microsoft.onedrive.fluid") |Out-Null
				}

				"notesairdropdocument" {
					$fileTypeArrayList.Add("com.apple.notes.airdrop.document") |Out-Null

					$fileTypeArrayList.Add("com.apple.notes.inlinetextattachment.hashtag") |Out-Null
				}

				"notesarchive" {
					$fileTypeArrayList.Add("com.apple.notes.inlinetextattachment.calculategraphexpression") |Out-Null
				}

				"notesspotlightrecord" {
					$fileTypeArrayList.Add("com.apple.notes.note") |Out-Null
				}

				"nrw" {
					$fileTypeArrayList.Add("com.nikon.nrw-raw-image") |Out-Null
				}

				"numbers" {
					$fileTypeArrayList.Add("com.apple.iwork.numbers.numbers") |Out-Null

					$fileTypeArrayList.Add("com.apple.iwork.numbers.sffnumbers") |Out-Null
				}

				"numbers-tef" {
					$fileTypeArrayList.Add("com.apple.iwork.numbers.numbers-tef") |Out-Null
				}

				"nwrt" {
					$fileTypeArrayList.Add("com.apple.legacy.no-write") |Out-Null
				}

				"nyrc" {
					$fileTypeArrayList.Add("public.dvd-ram-media") |Out-Null
				}

				"o" {
					$fileTypeArrayList.Add("public.object-code") |Out-Null
				}

				"obj" {
					$fileTypeArrayList.Add("public.3d-content") |Out-Null
				}

				"objcap" {
					$fileTypeArrayList.Add("com.apple.rkassets") |Out-Null
				}

				"octest" {
					$fileTypeArrayList.Add("com.apple.dt.bundle.unit-test") |Out-Null
				}

				"odb" {
					$fileTypeArrayList.Add("org.oasis-open.opendocument.database") |Out-Null
				}

				"odc" {
					$fileTypeArrayList.Add("org.oasis-open.opendocument.chart") |Out-Null
				}

				"odf" {
					$fileTypeArrayList.Add("org.oasis-open.opendocument.formula") |Out-Null
				}

				"odg" {
					$fileTypeArrayList.Add("org.oasis-open.opendocument.graphics") |Out-Null
				}

				"odi" {
					$fileTypeArrayList.Add("com.apple.ibooksauthor.pkgbook") |Out-Null

					$fileTypeArrayList.Add("org.oasis-open.opendocument.image") |Out-Null
				}

				"odm" {
					$fileTypeArrayList.Add("org.oasis-open.opendocument.text-master") |Out-Null
				}

				"odp" {
					$fileTypeArrayList.Add("org.oasis-open.opendocument.presentation") |Out-Null
				}

				"ods" {
					$fileTypeArrayList.Add("org.oasis-open.opendocument.spreadsheet") |Out-Null
				}

				"odt" {
					$fileTypeArrayList.Add("org.oasis-open.opendocument.text") |Out-Null
				}

				"ofd" {
					$fileTypeArrayList.Add("org.webmproject.webm") |Out-Null
				}

				"ofld" {
					$fileTypeArrayList.Add("com.apple.legacy.open-folder") |Out-Null
				}

				"ogg" {
					$fileTypeArrayList.Add("org.xiph.ogg-audio") |Out-Null
				}

				"ogm" {
					$fileTypeArrayList.Add("org.xiph.ogv") |Out-Null
				}

				"olk15contact" {
					$fileTypeArrayList.Add("com.microsoft.outlook15.contact") |Out-Null
				}

				"olk15event" {
					$fileTypeArrayList.Add("com.microsoft.outlook15.event") |Out-Null
				}

				"olk15group" {
					$fileTypeArrayList.Add("com.microsoft.outlook15.group") |Out-Null
				}

				"olk15message" {
					$fileTypeArrayList.Add("com.microsoft.outlook15.message") |Out-Null
				}

				"olk15note" {
					$fileTypeArrayList.Add("com.microsoft.outlook15.note") |Out-Null
				}

				"olk15task" {
					$fileTypeArrayList.Add("com.microsoft.outlook15.task") |Out-Null
				}

				"omf" {
					$fileTypeArrayList.Add("com.avid.open-media-framework") |Out-Null

					$fileTypeArrayList.Add("org.aafassociation.advanced-authoring-format") |Out-Null
				}

				"omfi" {
					$fileTypeArrayList.Add("org.aafassociation.advanced-authoring-format") |Out-Null

					$fileTypeArrayList.Add("com.omnigroup.omnigraffle.omnijs.plugin") |Out-Null

					$fileTypeArrayList.Add("com.omnigroup.omnigraffle.omnijs.simple-plugin") |Out-Null
				}

				"omnigrafflejs" {
					$fileTypeArrayList.Add("com.omnigroup.omnigraffle.diagramstyle-package") |Out-Null
				}

				"omnigrafflejsz" {
					$fileTypeArrayList.Add("com.omnigroup.omnigraffle.omnijs.compressed-plugin") |Out-Null
				}

				"omnijs" {
					$fileTypeArrayList.Add("com.omnigroup.frameworks.omnijs.compressed-plugin") |Out-Null

					$fileTypeArrayList.Add("com.omnigroup.frameworks.omnijs.simple-plugin") |Out-Null

					$fileTypeArrayList.Add("com.omnigroup.frameworks.omnijs.wrapped-plugin") |Out-Null
				}

				"omnijsz" {
					$fileTypeArrayList.Add("com.omnigroup.frameworks.omnijs.compressed-simple-plugin") |Out-Null
				}

				"omnipresence-config" {
					$fileTypeArrayList.Add("com.omnigroup.omnipresence.config") |Out-Null
				}

				"onxofflinemap" {
					$fileTypeArrayList.Add("com.onx.offlinemap") |Out-Null
				}

				"oo3" {
					$fileTypeArrayList.Add("com.omnigroup.omnioutliner.oo3") |Out-Null

					$fileTypeArrayList.Add("com.omnigroup.omnioutliner.oo3-package") |Out-Null
				}

				"oo3template" {
					$fileTypeArrayList.Add("com.omnigroup.omnioutliner.oo3template") |Out-Null

					$fileTypeArrayList.Add("com.omnigroup.omnioutliner.oo3template-package") |Out-Null
				}

				"ooutline" {
					$fileTypeArrayList.Add("com.omnigroup.omnioutliner.xmlooutline") |Out-Null

					$fileTypeArrayList.Add("com.omnigroup.omnioutliner.xmlooutline-package") |Out-Null
				}

				"OPCD" {
					$fileTypeArrayList.Add("com.apple.disk-image-pc") |Out-Null
				}

				"order" {
					$fileTypeArrayList.Add("com.apple.finance.order") |Out-Null

					$fileTypeArrayList.Add("com.apple.finance.order-data") |Out-Null
				}

				"orf" {
					$fileTypeArrayList.Add("com.olympus.or-raw-image") |Out-Null

					$fileTypeArrayList.Add("com.olympus.raw-image") |Out-Null

					$fileTypeArrayList.Add("com.olympus.sr-raw-image") |Out-Null
				}

				"otc" {
					$fileTypeArrayList.Add("org.oasis-open.opendocument.chart-template") |Out-Null

					$fileTypeArrayList.Add("public.font") |Out-Null

					$fileTypeArrayList.Add("public.opentype-collection-font") |Out-Null
				}

				"otemplate" {
					$fileTypeArrayList.Add("com.omnigroup.omnioutliner.otemplate") |Out-Null

					$fileTypeArrayList.Add("com.omnigroup.omnioutliner.otemplate") |Out-Null
				}

				"otf" {
					$fileTypeArrayList.Add("org.oasis-open.opendocument.formula-template") |Out-Null

					$fileTypeArrayList.Add("public.opentype-font") |Out-Null
				}

				"otg" {
					$fileTypeArrayList.Add("org.oasis-open.opendocument.graphics-template") |Out-Null
				}

				"oth" {
					$fileTypeArrayList.Add("org.oasis-open.opendocument.text-web") |Out-Null
				}

				"oti" {
					$fileTypeArrayList.Add("com.apple.ibooksauthor.book") |Out-Null

					$fileTypeArrayList.Add("org.oasis-open.opendocument.image-template") |Out-Null
				}

				"otp" {
					$fileTypeArrayList.Add("org.oasis-open.opendocument.presentation-template") |Out-Null
				}

				"ots" {
					$fileTypeArrayList.Add("org.oasis-open.opendocument.spreadsheet-template") |Out-Null
				}

				"ott" {
					$fileTypeArrayList.Add("org.oasis-open.opendocument.text-template") |Out-Null
				}

				"otto" {
					$fileTypeArrayList.Add("public.opentype-font") |Out-Null
				}

				"outline" {
					$fileTypeArrayList.Add("com.omnigroup.omnioutliner.ooutline") |Out-Null
				}

				"ova" {
					$fileTypeArrayList.Add("com.vmware.foreign.ovf") |Out-Null
				}

				"ovf" {
					$fileTypeArrayList.Add("com.vmware.foreign.ovf") |Out-Null
				}

				"owl" {
					$fileTypeArrayList.Add("com.adobe.indesign-import-owl") |Out-Null
				}

				"ownd" {
					$fileTypeArrayList.Add("com.apple.legacy.finder-icon") |Out-Null

					$fileTypeArrayList.Add("com.apple.unknown-object") |Out-Null
				}

				"p12" {
					$fileTypeArrayList.Add("com.apple.data-container") |Out-Null

					$fileTypeArrayList.Add("com.rsa.pkcs-12") |Out-Null
				}

				"p12_key" {
					$fileTypeArrayList.Add("com.comcsoft.iterminal.ppk") |Out-Null
				}

				"p7c" {
					$fileTypeArrayList.Add("public.x509-certificate") |Out-Null
				}

				"pages" {
					$fileTypeArrayList.Add("com.apple.iwork.pages.pages") |Out-Null

					$fileTypeArrayList.Add("com.apple.iwork.pages.sffpages") |Out-Null
				}

				"pages-tef" {
					$fileTypeArrayList.Add("com.apple.iwork.pages.pages-tef") |Out-Null
				}

				"panic" {
					$fileTypeArrayList.Add("com.apple.panicreport") |Out-Null
				}

				"papp" {
					$fileTypeArrayList.Add("com.apple.legacy.finder-icon") |Out-Null

					$fileTypeArrayList.Add("com.apple.unknown-object") |Out-Null
				}

				"pas" {
					$fileTypeArrayList.Add("public.pascal-source") |Out-Null
				}

				"patch" {
					$fileTypeArrayList.Add("public.patch-file") |Out-Null
				}

				"pax" {
					$fileTypeArrayList.Add("public.cpio-archive") |Out-Null
				}

				"pbcl" {
					$fileTypeArrayList.Add("com.apple.profile-background-color") |Out-Null
				}

				"pbm" {
					$fileTypeArrayList.Add("public.pbm") |Out-Null
				}

				"pbproj" {
					$fileTypeArrayList.Add("com.apple.xcode.project") |Out-Null
				}

				"pbxproj" {
					$fileTypeArrayList.Add("com.apple.xcode.projectdata") |Out-Null
				}

				"pbxuser" {
					$fileTypeArrayList.Add("com.apple.xcode.usersettings") |Out-Null
				}

				"pch" {
					$fileTypeArrayList.Add("public.precompiled-c-header") |Out-Null
				}

				"pch++" {
					$fileTypeArrayList.Add("public.precompiled-c-plus-plus-header") |Out-Null
				}

				"pct" {
					$fileTypeArrayList.Add("com.apple.pict") |Out-Null
				}

				"pdf" {
					$fileTypeArrayList.Add("com.adobe.pdf") |Out-Null

					$fileTypeArrayList.Add("com.microsoft.ppt.export.pdf") |Out-Null
				}

				"pef" {
					$fileTypeArrayList.Add("com.pentax.raw-image") |Out-Null
				}

				"pem" {
					$fileTypeArrayList.Add("public.x509-printable-encoded-archive") |Out-Null
				}

				"perspectivev3" {
					$fileTypeArrayList.Add("com.apple.xcode.projectdata") |Out-Null
				}

				"pf" {
					$fileTypeArrayList.Add("clsp") |Out-Null

					$fileTypeArrayList.Add("com.apple.colorsync-profile") |Out-Null
				}

				"pfa" {
					$fileTypeArrayList.Add("com.adobe.postscript-pfa-font") |Out-Null
				}

				"pfb" {
					$fileTypeArrayList.Add("com.adobe.postscript-pfb-font") |Out-Null
				}

				"pfcl" {
					$fileTypeArrayList.Add("com.apple.profile-font-and-color") |Out-Null
				}

				"pfm" {
					$fileTypeArrayList.Add("public.pbm") |Out-Null
				}

				"pfnt" {
					$fileTypeArrayList.Add("com.apple.profile-font-icon") |Out-Null
				}

				"pgm" {
					$fileTypeArrayList.Add("public.pbm") |Out-Null
				}

				"pgn" {
					$fileTypeArrayList.Add("com.apple.chess.pgn") |Out-Null
				}

				"pgsql" {
					$fileTypeArrayList.Add("com.barebones.bbedit.sql-source") |Out-Null
				}

				"ph3" {
					$fileTypeArrayList.Add("public.php-script") |Out-Null
				}

				"ph4" {
					$fileTypeArrayList.Add("public.php-script") |Out-Null
				}

				"phfs" {
					$fileTypeArrayList.Add("com.adobe.indesign-import-phfs") |Out-Null
				}

				"photo" {
					$fileTypeArrayList.Add("com.pixelmatorteam.pixelmator-photo.document.binary") |Out-Null

					$fileTypeArrayList.Add("com.pixelmatorteam.pixelmator-photo.document.package") |Out-Null
				}

				"photobooth" {
					$fileTypeArrayList.Add("com.apple.photo-booth-library") |Out-Null	
				}	

				"photo-edit" {
					$fileTypeArrayList.Add("com.pixelmatorteam.pixelmator-photo-edit.document.binary") |Out-Null

					$fileTypeArrayList.Add("com.pixelmatorteam.pixelmator-photo-edit.document.package") |Out-Null
				}

				"photosasset" {
					$fileTypeArrayList.Add("com.apple.photos.asset-bundle") |Out-Null
				}

				"photoshop" {
					$fileTypeArrayList.Add("com.adobe.photoshop-image") |Out-Null
				}

				"photoslibrary" {
					$fileTypeArrayList.Add("com.apple.photos.library") |Out-Null
				}

				"php" {
					$fileTypeArrayList.Add("public.php-script") |Out-Null
				}

				"php3" {
					$fileTypeArrayList.Add("public.php-script") |Out-Null
				}

				"php4" {
					$fileTypeArrayList.Add("public.php-script") |Out-Null
				}

				"phtml" {
					$fileTypeArrayList.Add("public.php-script") |Out-Null
				}

				"pic" {
					$fileTypeArrayList.Add("com.apple.pict") |Out-Null

					$fileTypeArrayList.Add("public.radiance") |Out-Null
				}

				"pict" {
					$fileTypeArrayList.Add("com.apple.pict") |Out-Null
				}

				"pictclipping" {
					$fileTypeArrayList.Add("com.apple.finder.pictclipping") |Out-Null
				}

				"pisn" {
					$fileTypeArrayList.Add("com.adobe.pageitem-xml-snippet") |Out-Null
				}

				"pkcs12" {
					$fileTypeArrayList.Add("com.rsa.pkcs-12") |Out-Null
				}

				"pkg" {
					$fileTypeArrayList.Add("com.apple.installer-package") |Out-Null

					$fileTypeArrayList.Add("com.apple.installer-package-archive") |Out-Null
				}

				"pkpass" {
					$fileTypeArrayList.Add("com.apple.pkpass") |Out-Null

					$fileTypeArrayList.Add("com.apple.pkpass-data") |Out-Null
				}

				"pkpasses" {
					$fileTypeArrayList.Add("com.apple.pkpasses-data") |Out-Null
				}

				"pl" {
					$fileTypeArrayList.Add("public.perl-script") |Out-Null
				}

				"placeholder" {
					$fileTypeArrayList.Add("com.apple.application-placeholder") |Out-Null
				}

				"playground" {
					$fileTypeArrayList.Add("com.apple.dt.playground") |Out-Null
				}

				"playgroundbook" {
					$fileTypeArrayList.Add("com.apple.playgroundbook") |Out-Null
				}

				"plist" {
					$fileTypeArrayList.Add("com.apple.ascii-property-list") |Out-Null

					$fileTypeArrayList.Add("com.apple.binary-property-list") |Out-Null

					$fileTypeArrayList.Add("com.apple.property-list") |Out-Null

					$fileTypeArrayList.Add("com.apple.xml-property-list") |Out-Null
				}

				"pls" {
					$fileTypeArrayList.Add("com.apple.music.pls-playlist") |Out-Null

					$fileTypeArrayList.Add("com.barebones.bbedit.sql-source") |Out-Null

					$fileTypeArrayList.Add("public.playlist") |Out-Null
				}

				"plugin" {
					$fileTypeArrayList.Add("com.apple.plugin") |Out-Null
				}

				"plugindata" {
					$fileTypeArrayList.Add("com.apple.xcode.plugindata") |Out-Null
				}

				"pluginkit" {
					$fileTypeArrayList.Add("com.apple.pluginkit") |Out-Null
				}

				"ply" {
					$fileTypeArrayList.Add("com.apple.swiftpm-playgrounds-project") |Out-Null

					$fileTypeArrayList.Add("public.polygon-file-format") |Out-Null
				}

				"pm" {
					$fileTypeArrayList.Add("public.perl-script") |Out-Null
				}

				"pmcl" {
					$fileTypeArrayList.Add("com.adobe.pm-color") |Out-Null
				}

				"png" {
					$fileTypeArrayList.Add("com.microsoft.ppt.export.ext.png") |Out-Null

					$fileTypeArrayList.Add("com.microsoft.ppt.export.png") |Out-Null

					$fileTypeArrayList.Add("public.png") |Out-Null
				}

				"PNGf" {
					$fileTypeArrayList.Add("public.png") |Out-Null
				}

				"PNRA" {
					$fileTypeArrayList.Add("com.real.realaudio") |Out-Null
				}

				"PNRM" {
					$fileTypeArrayList.Add("com.real.realmedia") |Out-Null
				}

				"pntg" {
					$fileTypeArrayList.Add("com.apple.macpaint-image") |Out-Null
				}

				"pot" {
					$fileTypeArrayList.Add("com.microsoft.powerpoint.pot") |Out-Null
				}

				"potm" {
					$fileTypeArrayList.Add("com.microsoft.powerpoint.openxmlformats.presentationml.template.macroenabled") |Out-Null

					$fileTypeArrayList.Add("org.openxmlformats.presentationml.template.macroenabled") |Out-Null
				}

				"potx" {
					$fileTypeArrayList.Add("com.microsoft.powerpoint.openxmlformats.presentationml.template") |Out-Null

					$fileTypeArrayList.Add("org.openxmlformats.presentationml.template") |Out-Null
				}

				"ppa" {
					$fileTypeArrayList.Add("com.microsoft.powerpoint.ppa") |Out-Null
				}

				"ppam" {
					$fileTypeArrayList.Add("com.microsoft.powerpoint.ppam") |Out-Null
				}

				"ppdf" {
					$fileTypeArrayList.Add("com.apple.legacy.finder-icon") |Out-Null

					$fileTypeArrayList.Add("com.apple.unknown-object") |Out-Null
				}

				"ppm" {
					$fileTypeArrayList.Add("public.pbm") |Out-Null
				}

				"ppot" {
					$fileTypeArrayList.Add("com.microsoft.powerpoint.pot") |Out-Null
				}

				"ppp" {
					$fileTypeArrayList.Add("com.apple.ppp-plug-in") |Out-Null
				}

				"pps" {
					$fileTypeArrayList.Add("com.microsoft.powerpoint.pps") |Out-Null
				}

				"ppsm" {
					$fileTypeArrayList.Add("com.microsoft.powerpoint.openxmlformats.presentationml.slideshow.macroenabled") |Out-Null

					$fileTypeArrayList.Add("org.openxmlformats.presentationml.slideshow.macroenabled") |Out-Null
				}

				"PPSS" {
					$fileTypeArrayList.Add("com.microsoft.powerpoint.pps") |Out-Null
				}

				"ppsx" {
					$fileTypeArrayList.Add("com.microsoft.powerpoint.openxmlformats.presentationml.slideshow") |Out-Null

					$fileTypeArrayList.Add("org.openxmlformats.presentationml.slideshow") |Out-Null
				}

				"ppt" {
					$fileTypeArrayList.Add("com.hp.remote.control.scanpage") |Out-Null

					$fileTypeArrayList.Add("com.microsoft.powerpoint.pps") |Out-Null

					$fileTypeArrayList.Add("com.microsoft.powerpoint.ppt") |Out-Null
				}

				"pptm" {
					$fileTypeArrayList.Add("com.microsoft.powerpoint.openxmlformats.presentationml.presentation.macroenabled") |Out-Null

					$fileTypeArrayList.Add("org.openxmlformats.presentationml.presentation.macroenabled") |Out-Null
				}

				"pptx" {
					$fileTypeArrayList.Add("com.microsoft.powerpoint.openxmlformats.presentationml.presentation") |Out-Null

					$fileTypeArrayList.Add("org.openxmlformats.presentationml.presentation") |Out-Null
				}

				"powerpoint" {
					$fileTypeArrayList.Add("com.microsoft.powerpoint.openxmlformats.presentationml.presentation") |Out-Null

					$fileTypeArrayList.Add("org.openxmlformats.presentationml.presentation") |Out-Null
				}

				"pref" {
					$fileTypeArrayList.Add("com.apple.legacy.finder-icon") |Out-Null

					$fileTypeArrayList.Add("com.apple.unknown-object") |Out-Null
				}

				"prefpane" {
					$fileTypeArrayList.Add("com.apple.package") |Out-Null

					$fileTypeArrayList.Add("com.apple.systempreference.prefpane") |Out-Null
				}

				"prfb" {
					$fileTypeArrayList.Add("com.apple.icon-overlay.private-folder-badge") |Out-Null
				}

				"prfí" {
					$fileTypeArrayList.Add("com.apple.legacy.finder-icon") |Out-Null

					$fileTypeArrayList.Add("com.apple.unknown-object") |Out-Null
				}

				"prm" {
					$fileTypeArrayList.Add("org.fsharp.f-sharp") |Out-Null
				}

				"prn" {
					$fileTypeArrayList.Add("com.microsoft.excel.space-separated-values-text") |Out-Null
				}

				"prnt" {
					$fileTypeArrayList.Add("com.apple.legacy.finder-icon") |Out-Null

					$fileTypeArrayList.Add("com.apple.unknown-object") |Out-Null
				}

				"proto" {
					$fileTypeArrayList.Add("public.protobuf-source") |Out-Null
				}

				"provisionprofile" {
					$fileTypeArrayList.Add("com.apple.provisionprofile") |Out-Null
				}

				"prvf" {
					$fileTypeArrayList.Add("com.apple.icon-overlay.private-folder") |Out-Null
				}

				"ps" {
					$fileTypeArrayList.Add("com.adobe.postscript") |Out-Null
				}

				"psb" {
					$fileTypeArrayList.Add("com.adobe.photoshop-large-image") |Out-Null

					$fileTypeArrayList.Add("com.microsoft.powerpoint.ppa") |Out-Null
				}

				"psd" {
					$fileTypeArrayList.Add("com.microsoft.powerpoint.openxmlformats.presentationml.template.macroenabled") |Out-Null

					$fileTypeArrayList.Add("com.adobe.photoshop-image") |Out-Null
				}

				"pset" {
					$fileTypeArrayList.Add("com.apple.pdf-printer-settings") |Out-Null
				}

				"psys" {
					$fileTypeArrayList.Add("com.apple.legacy.finder-icon") |Out-Null

					$fileTypeArrayList.Add("com.apple.unknown-object") |Out-Null
				}

				"pvm" {
					$fileTypeArrayList.Add("com.vmware.foreign.pvm") |Out-Null
				}

				"pvr" {
					$fileTypeArrayList.Add("public.pvr") |Out-Null
				}

				"pvs" {
					$fileTypeArrayList.Add("com.vmware.foreign.pvs") |Out-Null
				}

				"pvt" {
					$fileTypeArrayList.Add("com.apple.live-photo-bundle") |Out-Null

					$fileTypeArrayList.Add("com.apple.private.photos.live-wallpaper") |Out-Null

					$fileTypeArrayList.Add("public.image") |Out-Null
				}

				"pwl" {
					$fileTypeArrayList.Add("com.leica.pwl-raw-image") |Out-Null

					$fileTypeArrayList.Add("com.leica.pwl-raw-image") |Out-Null
				}

				"pxb" {
					$fileTypeArrayList.Add("com.pixelmator.pxb") |Out-Null

					$fileTypeArrayList.Add("com.pixelmatorteam.legacy-touch-brushes") |Out-Null
				}

				"pxd" {
					$fileTypeArrayList.Add("com.pixelmatorteam.pixelmator.document.binary") |Out-Null

					$fileTypeArrayList.Add("com.pixelmatorteam.pixelmator.document.package") |Out-Null
				}

				"pxd-sidecar" {
					$fileTypeArrayList.Add("com.pixelmatorteam.pixelmator.document-pro-sidecar.binary") |Out-Null

					$fileTypeArrayList.Add("com.pixelmatorteam.pixelmator.document-pro-sidecar.package") |Out-Null
				}

				"pxm" {
					$fileTypeArrayList.Add("com.pixelmator.pxm") |Out-Null

					$fileTypeArrayList.Add("com.pixelmatorteam.pixelmator.document-package") |Out-Null
				}

				"pxs" {
					$fileTypeArrayList.Add("com.pixelmator.pxs") |Out-Null
				}

				"py" {
					$fileTypeArrayList.Add("public.python-script") |Out-Null
				}

				"pyc" {
					$fileTypeArrayList.Add("public.python-bytecode") |Out-Null
				}

				"qlgenerator" {
					$fileTypeArrayList.Add("com.apple.quicklook-generator") |Out-Null
				}

				"qt" {
					$fileTypeArrayList.Add("public.movie") |Out-Null
				}

				"qta" {
					$fileTypeArrayList.Add("com.apple.photos.object-reference.collection") |Out-Null

					$fileTypeArrayList.Add("com.apple.quicktime-audio") |Out-Null
				}

				"qtif" {
					$fileTypeArrayList.Add("com.apple.quicktime-image") |Out-Null
				}

				"qtpxcomposition" {
					$fileTypeArrayList.Add("com.apple.quicktimeplayerx-composition") |Out-Null

					$fileTypeArrayList.Add("com.apple.quicktimeplayerx-composition-bundle") |Out-Null
				}

				"qtz" {
					$fileTypeArrayList.Add("com.apple.quartz-composer-composition") |Out-Null
				}

				"ques" {
					$fileTypeArrayList.Add("com.apple.legacy.question-mark") |Out-Null
				}

				"r" {
					$fileTypeArrayList.Add("com.apple.rez-source") |Out-Null

					$fileTypeArrayList.Add("com.barebones.bbedit.r-source") |Out-Null

					$fileTypeArrayList.Add("com.barebones.bbedit.r-source") |Out-Null

					$fileTypeArrayList.Add("public.script") |Out-Null
				}

				"ra" {
					$fileTypeArrayList.Add("com.real.realaudio") |Out-Null
				}

				"raf" {
					$fileTypeArrayList.Add("com.fuji.raw-image") |Out-Null
				}

				"ram" {
					$fileTypeArrayList.Add("com.real.realaudio") |Out-Null
				}

				"ramd" {
					$fileTypeArrayList.Add("com.apple.legacy.finder-icon") |Out-Null

					$fileTypeArrayList.Add("com.apple.unknown-object") |Out-Null
				}

				"rapp" {
					$fileTypeArrayList.Add("com.apple.legacy.finder-icon") |Out-Null

					$fileTypeArrayList.Add("com.apple.unknown-object") |Out-Null
				}

				"raw" {
					$fileTypeArrayList.Add("com.leica.raw-image") |Out-Null

					$fileTypeArrayList.Add("com.panasonic.raw-image") |Out-Null
				}

				"rb" {
					$fileTypeArrayList.Add("public.ruby-script") |Out-Null
				}

				"rbw" {
					$fileTypeArrayList.Add("public.ruby-script") |Out-Null
				}

				"rcar" {
					$fileTypeArrayList.Add("com.apple.legacy.right-container-arrow") |Out-Null
				}

				"rcnt" {
					$fileTypeArrayList.Add("com.apple.finder.recent-items") |Out-Null
				}

				"rdfe" {
					$fileTypeArrayList.Add("com.lemonmojo.rdfe") |Out-Null
				}

				"rdoc" {
					$fileTypeArrayList.Add("com.apple.legacy.finder-icon") |Out-Null

					$fileTypeArrayList.Add("com.apple.unknown-object") |Out-Null
				}

				"rdp" {
					$fileTypeArrayList.Add("com.apple.homekit-accessory-simulator.state") |Out-Null

					$fileTypeArrayList.Add("com.microsoft.uti.rdpfile") |Out-Null

					$fileTypeArrayList.Add("org.appextension.find-login-action") |Out-Null
				}

				"reality" {
					$fileTypeArrayList.Add("com.apple.reality") |Out-Null

					$fileTypeArrayList.Add("public.character-special") |Out-Null
				}

				"realitycomposerpro" {
					$fileTypeArrayList.Add("com.apple.realitycomposerpro") |Out-Null
				}

				"realityenv" {
					$fileTypeArrayList.Add("com.apple.realitycomposerpro.treenodeidentifier") |Out-Null
				}

				"redditvault" {
					$fileTypeArrayList.Add("com.reddit.vault.backup") |Out-Null
				}

				"referenceobject" {
					$fileTypeArrayList.Add("com.apple.arkit.referenceobject") |Out-Null

					$fileTypeArrayList.Add("public.media-streaming-protocol") |Out-Null
				}

				"rgb" {
					$fileTypeArrayList.Add("com.adobe.rgb-color") |Out-Null
				}

				"rge" {
					$fileTypeArrayList.Add("com.apple.graphic-icon.data-and-sensors") |Out-Null

					$fileTypeArrayList.Add("com.microsoft.outlook15.archive") |Out-Null
				}

				"rhtml" {
					$fileTypeArrayList.Add("com.barebones.bbedit.erb-source") |Out-Null
				}

				"rjson" {
					$fileTypeArrayList.Add("com.lemonmojo.rjsondocument") |Out-Null
				}

				"rm" {
					$fileTypeArrayList.Add("com.real.realmedia") |Out-Null
				}

				"rmp" {
					$fileTypeArrayList.Add("com.apple.music.rmp-playlist") |Out-Null
				}

				"rmvb" {
					$fileTypeArrayList.Add("com.real.realmedia-vbr") |Out-Null
				}

				"root" {
					$fileTypeArrayList.Add("com.apple.mac") |Out-Null
				}

				"rpp" {
					$fileTypeArrayList.Add("com.lemonmojo.rtsxdmgpluginpackage") |Out-Null
				}

				"rs" {
					$fileTypeArrayList.Add("com.barebones.bbedit.rust-source") |Out-Null
				}

				"rsrv" {
					$fileTypeArrayList.Add("com.apple.legacy.finder-icon") |Out-Null

					$fileTypeArrayList.Add("com.apple.unknown-object") |Out-Null
				}

				"rss" {
					$fileTypeArrayList.Add("public.rss") |Out-Null
				}

				"rtf" {
					$fileTypeArrayList.Add("com.microsoft.ppt.export.rtf") |Out-Null

					$fileTypeArrayList.Add("public.rtf") |Out-Null
				}

				"rtfd" {
					$fileTypeArrayList.Add("com.apple.flat-rtfd") |Out-Null

					$fileTypeArrayList.Add("com.apple.rtfd") |Out-Null
				}

				"rtsl" {
					$fileTypeArrayList.Add("com.lemonmojo.rtslog") |Out-Null
				}

				"rtsx" {
					$fileTypeArrayList.Add("com.code4ward.rtsxdocument") |Out-Null
				}

				"rw2" {
					$fileTypeArrayList.Add("com.panasonic.rw2-raw-image") |Out-Null
				}

				"rwl" {
					$fileTypeArrayList.Add("com.leica.rwl-raw-image") |Out-Null
				}

				"s" {
					$fileTypeArrayList.Add("public.assembly-source") |Out-Null

					$fileTypeArrayList.Add("public.script") |Out-Null
				}

				"sabundle" {
					$fileTypeArrayList.Add("com.sequel-ace.sequel-ace.sabundle") |Out-Null
				}

				"safariextz" {
					$fileTypeArrayList.Add("com.apple.safari.extension") |Out-Null
				}

				"sample.txt" {
					$fileTypeArrayList.Add("com.apple.dt.sample.txt") |Out-Null

					$fileTypeArrayList.Add("com.apple.instruments.instrdst") |Out-Null
				}

				"sapl" {
					$fileTypeArrayList.Add("com.apple.legacy.finder-icon") |Out-Null

					$fileTypeArrayList.Add("com.apple.unknown-object") |Out-Null
				}

				"sapp" {
					$fileTypeArrayList.Add("com.apple.server-applications-folder") |Out-Null
				}

				"savedsearch" {
					$fileTypeArrayList.Add("com.apple.finder.smart-folder") |Out-Null
				}

				"saver" {
					$fileTypeArrayList.Add("com.apple.systempreference.screen-saver") |Out-Null
				}

				"sbdg" {
					$fileTypeArrayList.Add("com.apple.legacy.finder-icon") |Out-Null

					$fileTypeArrayList.Add("com.apple.unknown-object") |Out-Null
				}

				"sbDp" {
					$fileTypeArrayList.Add("public.display") |Out-Null
				}

				"sbFl" {
					$fileTypeArrayList.Add("public.data") |Out-Null
				}

				"sbIC" {
					$fileTypeArrayList.Add("public.spreadsheet") |Out-Null
				}

				"sbk" {
					$fileTypeArrayList.Add("com.apple.logic.exs") |Out-Null
				}

				"sbNC" {
					$fileTypeArrayList.Add("com.apple.airdrop") |Out-Null
				}

				"sbPC" {
					$fileTypeArrayList.Add("public.computer") |Out-Null
				}

				"sbRc" {
					$fileTypeArrayList.Add("com.apple.finder.recent-items") |Out-Null
				}

				"scc" {
					$fileTypeArrayList.Add("com.scenarist.closed-caption") |Out-Null
				}

				"scmp" {
					$fileTypeArrayList.Add("com.apple.legacy.finder-icon") |Out-Null

					$fileTypeArrayList.Add("com.apple.unknown-object") |Out-Null
				}

				"scn" {
					$fileTypeArrayList.Add("com.apple.scenekit.scene") |Out-Null
				}

				"scnassets" {
					$fileTypeArrayList.Add("com.apple.dt.xctest.element-snapshot") |Out-Null

					$fileTypeArrayList.Add("com.apple.scenekit.assetcatalog") |Out-Null
				}

				"scncache" {
					$fileTypeArrayList.Add("com.apple.scenekit.shadercache") |Out-Null
				}

				"scnp" {
					$fileTypeArrayList.Add("com.apple.scenekit.particlesystem") |Out-Null
				}

				"scnz" {
					$fileTypeArrayList.Add("com.apple.scenekit.scene") |Out-Null

					$fileTypeArrayList.Add("com.apple.scenekit.scene.zip") |Out-Null
				}

				"scpt" {
					$fileTypeArrayList.Add("com.apple.applescript.script") |Out-Null
				}

				"scptd" {
					$fileTypeArrayList.Add("com.apple.applescript.script-bundle") |Out-Null

					$fileTypeArrayList.Add("com.latenightsw.osa.bundle") |Out-Null
				}

				"scrí" {
					$fileTypeArrayList.Add("com.apple.legacy.finder-icon") |Out-Null

					$fileTypeArrayList.Add("com.apple.unknown-object") |Out-Null
				}

				"script" {
					$fileTypeArrayList.Add("com.apple.applescript.script") |Out-Null
				}

				"scriptterminology" {
					$fileTypeArrayList.Add("com.apple.dt.document.ascii-property-list") |Out-Null
				}

				"scrp" {
					$fileTypeArrayList.Add("com.apple.legacy.finder-icon") |Out-Null

					$fileTypeArrayList.Add("com.apple.unknown-object") |Out-Null
				}

				"scsh" {
					$fileTypeArrayList.Add("com.apple.legacy.finder-icon") |Out-Null

					$fileTypeArrayList.Add("com.apple.unknown-object") |Out-Null
				}

				"scss" {
					$fileTypeArrayList.Add("com.barebones.bbedit.scss-source") |Out-Null
				}

				"sd2" {
					$fileTypeArrayList.Add("com.digidesign.sd2-audio") |Out-Null
				}

				"sdbp" {
					$fileTypeArrayList.Add("com.apple.legacy.sidebar-prefs-icon") |Out-Null
				}

				"sdd" {
					$fileTypeArrayList.Add("org.openoffice.presentation") |Out-Null
				}

				"sdef" {
					$fileTypeArrayList.Add("com.apple.scripting-definition") |Out-Null
				}

				"sdoc" {
					$fileTypeArrayList.Add("com.apple.generic-stationery") |Out-Null
				}

				"sdv" {
					$fileTypeArrayList.Add("public.3gpp") |Out-Null
				}

				"sea" {
					$fileTypeArrayList.Add("com.stuffit.archive.sit") |Out-Null
				}

				"service" {
					$fileTypeArrayList.Add("com.apple.service-application") |Out-Null
				}

				"setext" {
					$fileTypeArrayList.Add("com.barebones.bbedit.setext-source") |Out-Null
				}

				"sf2" {
					$fileTypeArrayList.Add("com.soundblaster.soundfont") |Out-Null
				}

				"sfld" {
					$fileTypeArrayList.Add("com.apple.finder.smart-folder") |Out-Null
				}

				"sfnt" {
					$fileTypeArrayList.Add("com.apple.font-suitcase") |Out-Null
				}

				"sfont" {
					$fileTypeArrayList.Add("com.apple.cfr-font") |Out-Null
				}

				"sgi" {
					$fileTypeArrayList.Add("com.microsoft.powerpoint.pot") |Out-Null
				}

				"sh" {
					$fileTypeArrayList.Add("public.shell-script") |Out-Null
				}

				"shapes" {
					$fileTypeArrayList.Add("com.pixelmatorteam.shapes") |Out-Null
				}

				"shazamcatalog" {
					$fileTypeArrayList.Add("com.apple.shazamcatalog") |Out-Null
				}

				"shdD" {
					$fileTypeArrayList.Add("com.apple.legacy.finder-icon") |Out-Null

					$fileTypeArrayList.Add("com.apple.unknown-object") |Out-Null
				}

				"shdf" {
					$fileTypeArrayList.Add("com.apple.legacy.finder-icon") |Out-Null

					$fileTypeArrayList.Add("com.apple.unknown-object") |Out-Null
				}

				"shfl" {
					$fileTypeArrayList.Add("com.apple.legacy.finder-icon") |Out-Null

					$fileTypeArrayList.Add("com.apple.unknown-object") |Out-Null
				}

				"shlb" {
					$fileTypeArrayList.Add("com.apple.legacy.finder-icon") |Out-Null

					$fileTypeArrayList.Add("com.apple.unknown-object") |Out-Null
				}

				"shna" {
					$fileTypeArrayList.Add("com.apple.legacy.finder-icon") |Out-Null

					$fileTypeArrayList.Add("com.apple.unknown-object") |Out-Null
				}

				"shortcut" {
					$fileTypeArrayList.Add("com.apple.shortcut") |Out-Null
				}

				"shpt" {
					$fileTypeArrayList.Add("com.apple.servers-folder") |Out-Null
				}

				"shro" {
					$fileTypeArrayList.Add("com.apple.legacy.finder-icon") |Out-Null

					$fileTypeArrayList.Add("com.apple.unknown-object") |Out-Null
				}

				"shrt" {
					$fileTypeArrayList.Add("com.apple.legacy.finder-icon") |Out-Null

					$fileTypeArrayList.Add("com.apple.unknown-object") |Out-Null
				}

				"shrw" {
					$fileTypeArrayList.Add("com.apple.legacy.finder-icon") |Out-Null

					$fileTypeArrayList.Add("com.apple.unknown-object") |Out-Null
				}

				"shtm" {
					$fileTypeArrayList.Add("public.html") |Out-Null
				}

				"shuk" {
					$fileTypeArrayList.Add("com.apple.legacy.finder-icon") |Out-Null

					$fileTypeArrayList.Add("com.apple.unknown-object") |Out-Null
				}

				"shutdownstall" {
					$fileTypeArrayList.Add("public.case-insensitive-text") |Out-Null
				}

				"sidx" {
					$fileTypeArrayList.Add("com.allume.stuffit-archive") |Out-Null

					$fileTypeArrayList.Add("com.stuffit.archive.sidx") |Out-Null
				}

				"simruntime" {
					$fileTypeArrayList.Add("com.apple.coresimulator.bundle") |Out-Null
				}

				"sit" {
					$fileTypeArrayList.Add("com.stuffit.archive.sit") |Out-Null
				}

				"SIT5" {
					$fileTypeArrayList.Add("com.stuffit.archive.sit") |Out-Null
				}

				"sitx" {
					$fileTypeArrayList.Add("com.allume.stuffit-archive") |Out-Null
				}

				"sks" {
					$fileTypeArrayList.Add("com.apple.spritekit.serialized") |Out-Null
				}

				"sld8" {
					$fileTypeArrayList.Add("com.microsoft.powerpoint.pps") |Out-Null

					$fileTypeArrayList.Add("com.microsoft.powerpoint.ppt") |Out-Null
				}

				"slidesaver" {
					$fileTypeArrayList.Add("com.apple.systempreference.screen-slide-saver") |Out-Null
				}

				"slk" {
					$fileTypeArrayList.Add("com.microsoft.excel.slk") |Out-Null
				}

				"slm" {
					$fileTypeArrayList.Add("com.apple.photos.slow-motion-video-sidecar") |Out-Null
				}

				"sln" {
					$fileTypeArrayList.Add("com.microsoft.solution") |Out-Null
				}

				"slnf" {
					$fileTypeArrayList.Add("com.microsoft.filtered-solution") |Out-Null
				}

				"sLS8" {
					$fileTypeArrayList.Add("com.microsoft.excel.xlt") |Out-Null
				}

				"smart-health-card" {
					$fileTypeArrayList.Add("cards.smarthealth.smart-health-card") |Out-Null
				}

				"smf" {
					$fileTypeArrayList.Add("public.midi-audio") |Out-Null
				}

				"sndclipping" {
					$fileTypeArrayList.Add("com.apple.finder.sound-clipping") |Out-Null
				}

				"son" {
					$fileTypeArrayList.Add("com.apple.logic.pluginsetting") |Out-Null
				}

				"sparsebundle" {
					$fileTypeArrayList.Add("com.apple.disk-image-sparse-bundle") |Out-Null
				}

				"sparseimage" {
					$fileTypeArrayList.Add("com.apple.disk-image-sparse") |Out-Null
				}

				"spbundle" {
					$fileTypeArrayList.Add("com.sequel-ace.sequel-ace.spbundle") |Out-Null
				}

				"spf" {
					$fileTypeArrayList.Add("com.sequel-ace.sequel-ace.spf") |Out-Null
				}

				"spfs" {
					$fileTypeArrayList.Add("com.sequel-ace.sequel-ace.spfs") |Out-Null
				}

				"spin" {
					$fileTypeArrayList.Add("com.apple.spinreport") |Out-Null
				}

				"spki" {
					$fileTypeArrayList.Add("com.apple.music-folder") |Out-Null
				}

				"sptheme" {
					$fileTypeArrayList.Add("com.sequel-ace.sequel-ace.sptheme") |Out-Null
				}

				"spx" {
					$fileTypeArrayList.Add("com.apple.screensharing.draggableconnectionsitem") |Out-Null

					$fileTypeArrayList.Add("com.apple.systemprofiler.document") |Out-Null
				}

				"sql" {
					$fileTypeArrayList.Add("com.barebones.bbedit.sql-source") |Out-Null

					$fileTypeArrayList.Add("com.hyperobjc.sqliteflow.sqlscript") |Out-Null

					$fileTypeArrayList.Add("com.sequel-ace.sequel-ace.sql") |Out-Null
				}

				"sqlite" {
					$fileTypeArrayList.Add("com.hyperobjc.sqliteflow.db") |Out-Null
				}

				"sqlite3" {
					$fileTypeArrayList.Add("com.hyperobjc.sqliteflow.db") |Out-Null
				}

				"sr2" {
					$fileTypeArrayList.Add("com.sony.sr2-raw-image") |Out-Null
				}

				"srf" {
					$fileTypeArrayList.Add("com.sony.raw-image") |Out-Null
				}

				"srvr" {
					$fileTypeArrayList.Add("com.apple.file-server") |Out-Null
				}

				"srw" {
					$fileTypeArrayList.Add("com.samsung.raw-image") |Out-Null
				}

				"stc" {
					$fileTypeArrayList.Add("org.openoffice.spreadsheet-template") |Out-Null
				}

				"std" {
					$fileTypeArrayList.Add("org.openoffice.graphics-template") |Out-Null
				}

				"sti" {
					$fileTypeArrayList.Add("org.openoffice.presentation-template") |Out-Null
				}

				"stickerpack" {
					$fileTypeArrayList.Add("com.apple.dt.messages-sticker-pack") |Out-Null
				}

				"stl" {
					$fileTypeArrayList.Add("com.apple.swiftpm-playgrounds-project") |Out-Null

					$fileTypeArrayList.Add("public.standard-tesselated-geometry-format") |Out-Null
				}

				"stop" {
					$fileTypeArrayList.Add("com.apple.alert") |Out-Null

					$fileTypeArrayList.Add("com.apple.alert-stop") |Out-Null
				}

				"storekit" {
					$fileTypeArrayList.Add("com.apple.dt.storekitbundle") |Out-Null

					$fileTypeArrayList.Add("com.apple.xcframework") |Out-Null
				}

				"storyboard" {
					$fileTypeArrayList.Add("com.apple.dt.interfacebuilder.document.storyboard") |Out-Null
				}

				"storyboardc" {
					$fileTypeArrayList.Add("com.apple.dt.interfacebuilder.document.storyboard.package") |Out-Null
				}

				"strD" {
					$fileTypeArrayList.Add("com.apple.legacy.finder-icon") |Out-Null

					$fileTypeArrayList.Add("com.apple.unknown-object") |Out-Null
				}

				"strings" {
					$fileTypeArrayList.Add("com.apple.xcode.strings-text") |Out-Null
				}

				"stringsdict" {
					$fileTypeArrayList.Add("com.apple.xcode.strings-dictionary") |Out-Null
				}

				"strt" {
					$fileTypeArrayList.Add("com.apple.legacy.finder-icon") |Out-Null

					$fileTypeArrayList.Add("com.apple.unknown-object") |Out-Null
				}

				"stsn" {
					$fileTypeArrayList.Add("com.adobe.structure-xml-snippet") |Out-Null
				}

				"stw" {
					$fileTypeArrayList.Add("org.openoffice.text-template") |Out-Null
				}

				"stx" {
					$fileTypeArrayList.Add("com.barebones.bbedit.setext-source") |Out-Null
				}

				"styl" {
					$fileTypeArrayList.Add("com.adobe.indesign-import-styl") |Out-Null
				}

				"suggestionsassets" {
					$fileTypeArrayList.Add("com.apple.intelligentsuggestions.assets") |Out-Null
				}

				"suit" {
					$fileTypeArrayList.Add("com.apple.font-suitcase") |Out-Null
				}

				"susr" {
					$fileTypeArrayList.Add("com.apple.legacy.finder-icon") |Out-Null

					$fileTypeArrayList.Add("com.apple.unknown-object") |Out-Null
				}

				"svg" {
					$fileTypeArrayList.Add("public.svg-image") |Out-Null
				}

				"svgz" {
					$fileTypeArrayList.Add("public.svg-image") |Out-Null
				}

				"swift" {
					$fileTypeArrayList.Add("cc.utis.paths-file") |Out-Null

					$fileTypeArrayList.Add("public.swift-source") |Out-Null
				}

				"swiftpm" {
					$fileTypeArrayList.Add("com.apple.swiftpm") |Out-Null
				}

				"sxc" {
					$fileTypeArrayList.Add("org.openoffice.spreadsheet") |Out-Null
				}

				"sxd" {
					$fileTypeArrayList.Add("org.openoffice.graphics") |Out-Null
				}

				"sxg" {
					$fileTypeArrayList.Add("org.openoffice.text-master") |Out-Null
				}

				"sxi" {
					$fileTypeArrayList.Add("org.openoffice.presentation") |Out-Null
				}

				"sxm" {
					$fileTypeArrayList.Add("org.openoffice.formula") |Out-Null
				}

				"sxw" {
					$fileTypeArrayList.Add("org.openoffice.text") |Out-Null
				}

				"sync" {
					$fileTypeArrayList.Add("com.apple.legacy.synchronize") |Out-Null
				}

				"sysprefex" {
					$fileTypeArrayList.Add("com.apple.systempreference.prefpane.extension") |Out-Null
				}

				"systemextension" {
					$fileTypeArrayList.Add("com.apple.system-extension") |Out-Null
				}

				"tags" {
					$fileTypeArrayList.Add("com.barebones.bbedit.ctags-data") |Out-Null
				}

				"tailspin" {
					$fileTypeArrayList.Add("com.apple.tailspin") |Out-Null
				}

				"tAps" {
					$fileTypeArrayList.Add("com.apple.applications-folder") |Out-Null
				}

				"tar" {
					$fileTypeArrayList.Add("com.apple.bom-archive") |Out-Null

					$fileTypeArrayList.Add("public.disk-image") |Out-Null

					$fileTypeArrayList.Add("public.tar-archive") |Out-Null
				}

				"tbav" {
					$fileTypeArrayList.Add("com.apple.legacy.toolbar-advanced-icon") |Out-Null
				}

				"tbd" {
					$fileTypeArrayList.Add("com.apple.text-based-dylib") |Out-Null
				}

				"tblb" {
					$fileTypeArrayList.Add("com.apple.application-icon.icloud-homekit-secure-video") |Out-Null

					$fileTypeArrayList.Add("com.apple.legacy.toolbar-labels-icon") |Out-Null
				}

				"tbz" {
					$fileTypeArrayList.Add("public.tar-bzip2-archive") |Out-Null
				}

				"tbz2" {
					$fileTypeArrayList.Add("public.tar-bzip2-archive") |Out-Null
				}

				"tcl" {
					$fileTypeArrayList.Add("com.barebones.bbedit.tcl-source") |Out-Null
				}

				"tcsh" {
					$fileTypeArrayList.Add("com.apple.xcode.tcsh-script") |Out-Null

					$fileTypeArrayList.Add("public.tcsh-script") |Out-Null
				}

				"tcus" {
					$fileTypeArrayList.Add("com.apple.legacy.customize-toolbar") |Out-Null
				}

				"tdel" {
					$fileTypeArrayList.Add("com.apple.legacy.delete-toolbar") |Out-Null
				}

				"tDoc" {
					$fileTypeArrayList.Add("com.apple.documents-folder") |Out-Null
				}

				"tDsk" {
					$fileTypeArrayList.Add("com.apple.desktop-folder") |Out-Null
				}

				"tDwn" {
					$fileTypeArrayList.Add("com.apple.downloads-folder") |Out-Null
				}

				"template" {
					$fileTypeArrayList.Add("com.apple.icon-decoration.badge.comments") |Out-Null

					$fileTypeArrayList.Add("com.apple.iwork.pages.sfftemplate") |Out-Null

					$fileTypeArrayList.Add("com.apple.iwork.pages.template") |Out-Null
				}

				"term" {
					$fileTypeArrayList.Add("com.apple.terminal.session") |Out-Null
				}

				"terminal" {
					$fileTypeArrayList.Add("com.apple.terminal.settings") |Out-Null
				}

				"tex" {
					$fileTypeArrayList.Add("com.barebones.bbedit.tex-source") |Out-Null
				}

				"text" {
					$fileTypeArrayList.Add("com.apple.traditional-mac-plain-text") |Out-Null

					$fileTypeArrayList.Add("public.text") |Out-Null
				}

				"textclipping" {
					$fileTypeArrayList.Add("com.apple.finder.textclipping") |Out-Null
				}

				"textfactory" {
					$fileTypeArrayList.Add("com.barebones.bbedit.text-factory") |Out-Null
				}

				"textile" {
					$fileTypeArrayList.Add("com.barebones.bbedit.textile-source") |Out-Null
				}

				"textstyles" {
					$fileTypeArrayList.Add("com.pixelmatorteam.textstyles") |Out-Null
				}

				"tfil" {
					$fileTypeArrayList.Add("com.apple.fontbook.draggablefont") |Out-Null
				}

				"tga" {
					$fileTypeArrayList.Add("com.microsoft.office.openxml.theme") |Out-Null

					$fileTypeArrayList.Add("com.truevision.tga-image") |Out-Null
				}

				"tgz" {
					$fileTypeArrayList.Add("org.gnu.gnu-zip-tar-archive") |Out-Null
				}

				"theater" {
					$fileTypeArrayList.Add("com.apple.imovietheater") |Out-Null

					$fileTypeArrayList.Add("com.apple.iwork.pages.sffpages") |Out-Null
				}

				"thmx" {
					$fileTypeArrayList.Add("com.microsoft.office.openxml.theme") |Out-Null
				}

				"thom" {
					$fileTypeArrayList.Add("com.apple.home-folder") |Out-Null
				}

				"thumb.low" {
					$fileTypeArrayList.Add("com.apple.private.photos.thumbnail.low") |Out-Null
				}

				"thumb.standard" {
					$fileTypeArrayList.Add("com.apple.private.photos.thumbnail.standard") |Out-Null
				}

				"tif" {
					$fileTypeArrayList.Add("com.canon.tif-raw-image") |Out-Null

					$fileTypeArrayList.Add("public.fax") |Out-Null

					$fileTypeArrayList.Add("public.jpeg-xl") |Out-Null

					$fileTypeArrayList.Add("public.tiff") |Out-Null

					$fileTypeArrayList.Add("com.microsoft.ppt.export.ext.tiff") |Out-Null

					$fileTypeArrayList.Add("com.microsoft.ppt.export.tiff") |Out-Null
				}

				"tiff" {
					$fileTypeArrayList.Add("com.canon.tif-raw-image") |Out-Null

					$fileTypeArrayList.Add("public.fax") |Out-Null

					$fileTypeArrayList.Add("public.jpeg-xl") |Out-Null

					$fileTypeArrayList.Add("public.tiff") |Out-Null

					$fileTypeArrayList.Add("com.microsoft.ppt.export.ext.tiff") |Out-Null

					$fileTypeArrayList.Add("com.microsoft.ppt.export.tiff") |Out-Null
				}


				"tightbeam" {
					$fileTypeArrayList.Add("com.apple.tightbeam-source") |Out-Null
				}

				"tl" {
					$fileTypeArrayList.Add("com.tascam.opentl") |Out-Null
				}

				"tlb" {
					$fileTypeArrayList.Add("com.microsoft.excel.tlb") |Out-Null
				}

				"tMov" {
					$fileTypeArrayList.Add("com.apple.movie-folder") |Out-Null
				}

				"tMus" {
					$fileTypeArrayList.Add("com.apple.music-folder") |Out-Null
				}

				"toast" {
					$fileTypeArrayList.Add("com.roxio.disk-image-toast") |Out-Null
				}

				"toml" {
					$fileTypeArrayList.Add("com.barebones.bbedit.toml-source") |Out-Null
				}

				"tool" {
					$fileTypeArrayList.Add("com.apple.terminal.shell-script") |Out-Null
				}

				"tpic" {
					$fileTypeArrayList.Add("com.apple.pictures-folder") |Out-Null

					$fileTypeArrayList.Add("com.microsoft.office.openxml.theme") |Out-Null

					$fileTypeArrayList.Add("com.truevision.tga-image") |Out-Null
				}

				"tPub" {
					$fileTypeArrayList.Add("com.apple.public-folder") |Out-Null
				}

				"tql" {
					$fileTypeArrayList.Add("com.barebones.bbedit.sql-source") |Out-Null
				}

				"trace" {
					$fileTypeArrayList.Add("com.apple.instruments.trace") |Out-Null
				}

				"tracetemplate" {
					$fileTypeArrayList.Add("com.apple.instruments.tracetemplate") |Out-Null
				}

				"trsh" {
					$fileTypeArrayList.Add("com.apple.trash-empty") |Out-Null
				}

				"ts" {
					$fileTypeArrayList.Add("com.barebones.bbedit.typescript-source") |Out-Null

					$fileTypeArrayList.Add("com.microsoft.typescript") |Out-Null

					$fileTypeArrayList.Add("org.typescriptlang.typescript") |Out-Null

					$fileTypeArrayList.Add("public.mpeg-2-transport-stream") |Out-Null
				}

				"tsv" {
					$fileTypeArrayList.Add("public.tab-separated-values-text") |Out-Null

					$fileTypeArrayList.Add("public.delimited-values-text") |Out-Null
				}

				"tsx" {
					$fileTypeArrayList.Add("com.microsoft.typescript") |Out-Null
				}

				"ttc" {
					$fileTypeArrayList.Add("public.truetype-collection-font") |Out-Null
				}

				"ttf" {
					$fileTypeArrayList.Add("public.truetype-ttf-font") |Out-Null
				}

				"tUtl" {
					$fileTypeArrayList.Add("com.apple.utilities-folder") |Out-Null
				}

				"tutorial" {
					$fileTypeArrayList.Add("com.apple.documentation.tutorial") |Out-Null
				}

				"tvdb" {
					$fileTypeArrayList.Add("com.apple.tv.database") |Out-Null
				}

				"TVLb" {
					$fileTypeArrayList.Add("com.apple.settings.section.icon.privacy") |Out-Null

					$fileTypeArrayList.Add("com.apple.tv.library") |Out-Null
				}

				"tvlibrary" {
					$fileTypeArrayList.Add("com.apple.settings.section.icon.privacy") |Out-Null

					$fileTypeArrayList.Add("com.apple.tv.library") |Out-Null
				}

				"txt" {
					$fileTypeArrayList.Add("com.apple.traditional-mac-plain-text") |Out-Null

					$fileTypeArrayList.Add("public.plain-text") |Out-Null

					$fileTypeArrayList.Add("public.text") |Out-Null
				}

				"txtn" {
					$fileTypeArrayList.Add("com.apple.txn.text-multimedia-data") |Out-Null
				}

				"txz" {
					$fileTypeArrayList.Add("org.tukaani.tar-xz-archive") |Out-Null
				}

				"ubdg" {
					$fileTypeArrayList.Add("com.apple.icon-overlay.unsupported-badge") |Out-Null
				}

				"udif" {
					$fileTypeArrayList.Add("com.apple.disk-image") |Out-Null
				}

				"udsk" {
					$fileTypeArrayList.Add("com.apple.user-idisk") |Out-Null
				}

				"ufld" {
					$fileTypeArrayList.Add("com.apple.home-folder") |Out-Null
				}

				"ul" {
					$fileTypeArrayList.Add("public.ulaw-audio") |Out-Null
				}

				"ulaw" {
					$fileTypeArrayList.Add("public.ulaw-audio") |Out-Null
				}

				"ulck" {
					$fileTypeArrayList.Add("com.apple.legacy.unlocked") |Out-Null
				}

				"ulw" {
					$fileTypeArrayList.Add("public.ulaw-audio") |Out-Null
				}

				"unfs" {
					$fileTypeArrayList.Add("com.apple.unknown-object") |Out-Null
				}

				"unus" {
					$fileTypeArrayList.Add("com.apple.user-unknown") |Out-Null
				}

				"url" {
					$fileTypeArrayList.Add("com.codeweavers.crossoverhelper.menudummytype") |Out-Null

					$fileTypeArrayList.Add("com.microsoft.internet-shortcut") |Out-Null

					$fileTypeArrayList.Add("public.url") |Out-Null
				}

				"urln" {
					$fileTypeArrayList.Add("public.url-name") |Out-Null
				}

				"usd" {
					$fileTypeArrayList.Add("com.pixar.universal-scene-description") |Out-Null
				}

				"usdz" {
					$fileTypeArrayList.Add("com.pixar.universal-scene-description-mobile") |Out-Null

					$fileTypeArrayList.Add("com.pixar.universal-scene-description-utf8") |Out-Null
				}

				"user" {
					$fileTypeArrayList.Add("com.apple.user") |Out-Null
				}

				"ustl" {
					$fileTypeArrayList.Add("com.adobe.indesign-import-ustl") |Out-Null
				}

				"ut16" {
					$fileTypeArrayList.Add("public.utf16-external-plain-text") |Out-Null
				}

				"utf8" {
					$fileTypeArrayList.Add("public.text") |Out-Null

					$fileTypeArrayList.Add("public.utf8-plain-text") |Out-Null
				}

				"utií" {
					$fileTypeArrayList.Add("com.apple.utilities-folder") |Out-Null
				}

				"utxt" {
					$fileTypeArrayList.Add("public.utf16-plain-text") |Out-Null
				}

				"uu" {
					$fileTypeArrayList.Add("public.uuencoded-archive") |Out-Null
				}

				"v" {
					$fileTypeArrayList.Add("com.barebones.bbedit.verilog-hdl-source") |Out-Null
				}

				"vbs" {
					$fileTypeArrayList.Add("com.barebones.bbedit.vbscript-source") |Out-Null
				}

				"vcal" {
					$fileTypeArrayList.Add("com.apple.ical.ics.event") |Out-Null
				}

				"vcard" {
					$fileTypeArrayList.Add("com.apple.graphic-icon.account.payment") |Out-Null

					$fileTypeArrayList.Add("public.vcard") |Out-Null
				}

				"vcf" {
					$fileTypeArrayList.Add("com.apple.graphic-icon.account.payment") |Out-Null

					$fileTypeArrayList.Add("public.vcard") |Out-Null
				}

				"vCrd" {
					$fileTypeArrayList.Add("com.apple.graphic-icon.account.payment") |Out-Null

					$fileTypeArrayList.Add("public.vcard") |Out-Null
				}

				"vcs" {
					$fileTypeArrayList.Add("com.apple.graphic-icon.satellite") |Out-Null

					$fileTypeArrayList.Add("com.apple.ical.ics.event") |Out-Null

					$fileTypeArrayList.Add("com.microsoft.outlook15.vcalendar") |Out-Null
				}

				"vdx" {
					$fileTypeArrayList.Add("com.omnigroup.foreign-types.ms-visio.xml") |Out-Null

					$fileTypeArrayList.Add("com.pkware.zip-archive") |Out-Null
				}

				"vert" {
					$fileTypeArrayList.Add("org.khronos.glsl.vertex-shader") |Out-Null
				}

				"vertex" {
					$fileTypeArrayList.Add("org.khronos.glsl.vertex-shader") |Out-Null
				}

				"vfw" {
					$fileTypeArrayList.Add("com.apple.protected-mpeg-4-video") |Out-Null

					$fileTypeArrayList.Add("public.avi") |Out-Null
				}

				"vhd" {
					$fileTypeArrayList.Add("com.barebones.bbedit.vhdl-source") |Out-Null

					$fileTypeArrayList.Add("com.vmware.foreign.vhd") |Out-Null
				}

				"vhdl" {
					$fileTypeArrayList.Add("com.barebones.bbedit.vhdl-source") |Out-Null
				}

				"videoslibrary" {
					$fileTypeArrayList.Add("com.apple.tv.library") |Out-Null
				}

				"viewhierarchy" {
					$fileTypeArrayList.Add("com.apple.dt.ide.debughierarchycontenttype") |Out-Null
				}

				"VirtualMac" {
					$fileTypeArrayList.Add("com.apple.virtual-machine") |Out-Null
				}

				"vl" {
					$fileTypeArrayList.Add("com.barebones.bbedit.verilog-hdl-source") |Out-Null
				}

				"vmsn" {
					$fileTypeArrayList.Add("com.apple.graphic-icon.auto-lock") |Out-Null

					$fileTypeArrayList.Add("com.apple.graphic-icon.hearing") |Out-Null

					$fileTypeArrayList.Add("com.apple.graphic-icon.safety-check") |Out-Null

					$fileTypeArrayList.Add("com.apple.graphic-icon.wallet") |Out-Null

					$fileTypeArrayList.Add("com.vmware.vm-snapshot") |Out-Null
				}

				"vmtm" {
					$fileTypeArrayList.Add("com.apple.graphic-icon.auto-brightness") |Out-Null

					$fileTypeArrayList.Add("com.apple.graphic-icon.dark-mode") |Out-Null

					$fileTypeArrayList.Add("com.apple.graphic-icon.voice-memos") |Out-Null

					$fileTypeArrayList.Add("com.vmware.vm-disk") |Out-Null

					$fileTypeArrayList.Add("com.apple.graphic-icon.motion-and-fitness") |Out-Null
				}

				"VMWare" {
					$fileTypeArrayList.Add("com.apple.virtual-machine") |Out-Null
				}

				"vmx" {
					$fileTypeArrayList.Add("com.vmware.vm-config") |Out-Null
				}

				"vmxf" {
					$fileTypeArrayList.Add("com.vmware.vm-foundry") |Out-Null
				}

				"vncloc" {
					$fileTypeArrayList.Add("com.apple.vnc-internet-location") |Out-Null
				}

				"voicecontrolcommands" {
					$fileTypeArrayList.Add("com.apple.voicecontrolcommands") |Out-Null
				}

				"voprefs" {
					$fileTypeArrayList.Add("com.apple.voiceover-preferences") |Out-Null
				}

				"vpc7" {
					$fileTypeArrayList.Add("com.vmware.foreign.vpc7") |Out-Null
				}

				"vs" {
					$fileTypeArrayList.Add("com.barebones.bbedit.vectorscript-source") |Out-Null

					$fileTypeArrayList.Add("org.khronos.glsl.vertex-shader") |Out-Null
				}

				"vsd" {
					$fileTypeArrayList.Add("com.apple.storage-internal") |Out-Null

					$fileTypeArrayList.Add("com.microsoft.visio.legacyformats.visioml.document") |Out-Null
				}

				"vsdx" {
					$fileTypeArrayList.Add("com.apple.storage-removable") |Out-Null

					$fileTypeArrayList.Add("com.microsoft.visio.openxmlformats.visioml.document") |Out-Null
				}

				"vsh" {
					$fileTypeArrayList.Add("org.khronos.glsl.vertex-shader") |Out-Null
				}

				"vss" {
					$fileTypeArrayList.Add("com.barebones.bbedit.vectorscript-source") |Out-Null

					$fileTypeArrayList.Add("com.omnigroup.foreign-types.ms-visio.stencil") |Out-Null

					$fileTypeArrayList.Add("public.optical-storage-media") |Out-Null
				}

				"vssm" {
					$fileTypeArrayList.Add("com.omnigroup.foreign-types.ms-visio.stencil") |Out-Null

					$fileTypeArrayList.Add("public.optical-storage-media") |Out-Null
				}

				"vssx" {
					$fileTypeArrayList.Add("com.omnigroup.foreign-types.ms-visio.new-xml.stencil") |Out-Null

					$fileTypeArrayList.Add("public.cd-based-media") |Out-Null
				}

				"vst" {
					$fileTypeArrayList.Add("com.omnigroup.foreign-types.ms-visio.template") |Out-Null
				}

				"vstm" {
					$fileTypeArrayList.Add("com.omnigroup.foreign-types.ms-visio.template") |Out-Null

					$fileTypeArrayList.Add("public.cd-based-media") |Out-Null
				}

				"vstx" {
					$fileTypeArrayList.Add("com.omnigroup.foreign-types.ms-visio.new-xml.template") |Out-Null
				}

				"vsx" {
					$fileTypeArrayList.Add("com.omnigroup.foreign-types.ms-visio.xml.stencil") |Out-Null
				}

				"vtt" {
					$fileTypeArrayList.Add("org.w3.webvtt") |Out-Null
				}

				"vtx" {
					$fileTypeArrayList.Add("com.omnigroup.foreign-types.ms-visio.xml.template") |Out-Null
				}

				"w64" {
					$fileTypeArrayList.Add("com.sony.wave64") |Out-Null
				}

				"W8BN" {
					$fileTypeArrayList.Add("com.microsoft.word.doc") |Out-Null

					$fileTypeArrayList.Add("com.microsoft.word.openxmlformats.wordprocessingml.document") |Out-Null
				}

				"W8TN" {
					$fileTypeArrayList.Add("com.microsoft.word.dot") |Out-Null
				}

				"waa" {
					$fileTypeArrayList.Add("net.whatsapp.audio") |Out-Null

					$fileTypeArrayList.Add("tv.twitch.uti.core.channel") |Out-Null
				}

				"wai" {
					$fileTypeArrayList.Add("net.whatsapp.image") |Out-Null
				}

				"wam" {
					$fileTypeArrayList.Add("com.tinyspeck.slack.file") |Out-Null

					$fileTypeArrayList.Add("net.whatsapp.movie") |Out-Null
				}

				"wand" {
					$fileTypeArrayList.Add("com.apple.garageband.template.magic") |Out-Null
				}

				"war" {
					$fileTypeArrayList.Add("com.sun.web-application-archive") |Out-Null
				}

				"wasm" {
					$fileTypeArrayList.Add("com.eab.se") |Out-Null
				}

				"Watch" {
					$fileTypeArrayList.Add("com.apple.watch") |Out-Null
				}

				"watchface" {
					$fileTypeArrayList.Add("com.apple.watchface") |Out-Null
				}

				"wav" {
					$fileTypeArrayList.Add("com.microsoft.waveform-audio") |Out-Null
				}

				"wave" {
					$fileTypeArrayList.Add("com.microsoft.waveform-audio") |Out-Null
				}

				"wax" {
					$fileTypeArrayList.Add("com.microsoft.windows-media-wax") |Out-Null
				}

				"WDCD" {
					$fileTypeArrayList.Add("com.microsoft.word.dictionary") |Out-Null
				}

				"wdgt" {
					$fileTypeArrayList.Add("com.apple.dashboard-widget") |Out-Null
				}

				"wdmon" {
					$fileTypeArrayList.Add("com.apple.wireless-diagnostics.wdmon") |Out-Null
				}

				"wdsidecar" {
					$fileTypeArrayList.Add("com.apple.wireless-diagnostics.wdsidecar") |Out-Null
				}

				"weba" {
					$fileTypeArrayList.Add("com.apple.webarchive") |Out-Null
				}

				"webarchive" {
					$fileTypeArrayList.Add("com.apple.webarchive") |Out-Null
				}

				"webbookmark" {
					$fileTypeArrayList.Add("com.apple.safari.bookmark") |Out-Null
				}

				"webhistory" {
					$fileTypeArrayList.Add("com.apple.safari.history") |Out-Null
				}

				"webloc" {
					$fileTypeArrayList.Add("public.stored-url") |Out-Null
				}

				"webm" {
					$fileTypeArrayList.Add("org.webmproject.webm") |Out-Null
				}

				"webp" {
					$fileTypeArrayList.Add("com.google.webp") |Out-Null
				}

				"webplugin" {
					$fileTypeArrayList.Add("com.apple.webkit-plugin") |Out-Null
				}

				"wfld" {
					$fileTypeArrayList.Add("com.apple.users-folder") |Out-Null
				}

				"wflow" {
					$fileTypeArrayList.Add("com.apple.shortcuts.workflow-file") |Out-Null
				}

				"whiteboard" {
					$fileTypeArrayList.Add("com.apple.mach-o-executable") |Out-Null
				}

				"widgetkitsim" {
					$fileTypeArrayList.Add("com.apple.widgetkit.simulator.document") |Out-Null
				}

				"Windows" {
					$fileTypeArrayList.Add("public.computer") |Out-Null
				}

				"Windows2000" {
					$fileTypeArrayList.Add("public.computer") |Out-Null
				}

				"Windows2003" {
					$fileTypeArrayList.Add("public.computer") |Out-Null
				}

				"Windows2008" {
					$fileTypeArrayList.Add("public.computer") |Out-Null
				}

				"Windows7" {
					$fileTypeArrayList.Add("public.computer") |Out-Null
				}

				"WindowsVista" {
					$fileTypeArrayList.Add("public.computer") |Out-Null
				}

				"WindowsXP" {
					$fileTypeArrayList.Add("public.computer") |Out-Null
				}

				"wm" {
					$fileTypeArrayList.Add("com.microsoft.windows-media-wm") |Out-Null
				}

				"wma" {
					$fileTypeArrayList.Add("com.microsoft.windows-media-wma") |Out-Null
				}

				"wmp" {
					$fileTypeArrayList.Add("com.microsoft.windows-media-wmp") |Out-Null
				}

				"wmv" {
					$fileTypeArrayList.Add("com.microsoft.windows-media-wmv") |Out-Null
				}

				"wmx" {
					$fileTypeArrayList.Add("com.microsoft.windows-media-wmx") |Out-Null
				}

				"workflow" {
					$fileTypeArrayList.Add("com.apple.applescript.data-object") |Out-Null

					$fileTypeArrayList.Add("com.apple.automator-workflow") |Out-Null
				}

				"workout" {
					$fileTypeArrayList.Add("com.apple.workout") |Out-Null
				}

				"worksheet" {
					$fileTypeArrayList.Add("com.barebones.bbedit.legacy-project") |Out-Null
				}

				"wprd" {
					$fileTypeArrayList.Add("com.microsoft.word.dictionary") |Out-Null
				}

				"writ" {
					$fileTypeArrayList.Add("com.apple.legacy.finder-icon") |Out-Null

					$fileTypeArrayList.Add("com.apple.unknown-object") |Out-Null
				}

				"wvx" {
					$fileTypeArrayList.Add("com.microsoft.windows-media-wvx") |Out-Null
				}

				"wxbn" {
					$fileTypeArrayList.Add("org.openxmlformats.wordprocessingml.document") |Out-Null
				}

				"xar" {
					$fileTypeArrayList.Add("com.apple.xar-archive") |Out-Null
				}

				"xbm" {
					$fileTypeArrayList.Add("public.xbitmap-image") |Out-Null
				}

				"xcappdata" {
					$fileTypeArrayList.Add("com.apple.xcode.appdata") |Out-Null
				}

				"xcarchive" {
					$fileTypeArrayList.Add("com.apple.xcode.archive") |Out-Null
				}

				"xcassets" {
					$fileTypeArrayList.Add("com.apple.dt.assetcatalog") |Out-Null
				}

				"xcbuildmetrics" {
					$fileTypeArrayList.Add("com.apple.xcode.buildmetrics") |Out-Null
				}

				"xcconfig" {
					$fileTypeArrayList.Add("com.apple.xcode.configsettings") |Out-Null
				}

				"xccrashpoint" {
					$fileTypeArrayList.Add("com.apple.dt.document.xccrashpoint") |Out-Null
				}

				"xcdatamodel" {
					$fileTypeArrayList.Add("com.apple.xcode.model") |Out-Null
				}

				"xcdatamodeld" {
					$fileTypeArrayList.Add("com.apple.xcode.model.data-version") |Out-Null
				}

				"xcdiskwritelog" {
					$fileTypeArrayList.Add("com.apple.dt.document.xcdiskwritelog") |Out-Null
				}

				"xcdiskwritepoint" {
					$fileTypeArrayList.Add("com.apple.dt.document.xcdiskwritepoint") |Out-Null
				}

				"xcfeedbackpoint" {
					$fileTypeArrayList.Add("com.apple.dt.document.xcfeedbackpoint") |Out-Null
				}

				"xcfilelist" {
					$fileTypeArrayList.Add("com.apple.xcode.xcfilelist") |Out-Null
				}

				"xcframework" {
					$fileTypeArrayList.Add("com.apple.xcframework") |Out-Null
				}

				"xchanglog" {
					$fileTypeArrayList.Add("com.apple.dt.document.xchanglog") |Out-Null
				}

				"xchangpoint" {
					$fileTypeArrayList.Add("com.apple.dt.document.xchangpoint") |Out-Null
				}

				"xclaunchlog" {
					$fileTypeArrayList.Add("com.apple.dt.document.xclaunchlog") |Out-Null
				}

				"xclaunchpoint" {
					$fileTypeArrayList.Add("com.apple.dt.document.xclaunchpoint") |Out-Null
				}

				"xcmappingmodel" {
					$fileTypeArrayList.Add("com.apple.xcode.model.data-mapping") |Out-Null
				}

				"xcmetricsdata" {
					$fileTypeArrayList.Add("com.apple.dt.document.xcmetricsdata") |Out-Null
				}

				"xcode" {
					$fileTypeArrayList.Add("com.apple.xcode.project") |Out-Null
				}

				"xcplaygroundpage" {
					$fileTypeArrayList.Add("com.apple.dt.playgroundpage") |Out-Null
				}

				"xcplugin" {
					$fileTypeArrayList.Add("com.apple.xcode.plugin") |Out-Null
				}

				"xcplugindata" {
					$fileTypeArrayList.Add("com.apple.xcode.plugindata.compiled") |Out-Null
				}

				"xcprivacy" {
					$fileTypeArrayList.Add("com.apple.xcode.app-privacy-property-list") |Out-Null
				}

				"xcprocessorusagelog" {
					$fileTypeArrayList.Add("com.apple.dt.document.xcprocessorusagelog") |Out-Null
				}

				"xcprocessorusagepoint" {
					$fileTypeArrayList.Add("com.apple.dt.document.xcprocessorusagepoint") |Out-Null
				}

				"xcresult" {
					$fileTypeArrayList.Add("com.apple.xcode.resultbundle") |Out-Null
				}

				"xcscheme" {
					$fileTypeArrayList.Add("com.apple.dt.document.scheme") |Out-Null
				}

				"xcsnapshots" {
					$fileTypeArrayList.Add("com.apple.dt.document.snapshot") |Out-Null
				}

				"xcstickers" {
					$fileTypeArrayList.Add("com.apple.dt.stickers") |Out-Null
				}

				"xcstrings" {
					$fileTypeArrayList.Add("com.apple.xcode.xcstrings") |Out-Null
				}

				"xctest" {
					$fileTypeArrayList.Add("com.apple.dt.bundle.unit-test") |Out-Null
				}

				"xctestplan" {
					$fileTypeArrayList.Add("com.apple.dt.xctestplancontenttype") |Out-Null
				}

				"xctestproducts" {
					$fileTypeArrayList.Add("com.apple.dt.xctestproductscontenttype") |Out-Null
				}

				"xctestrun" {
					$fileTypeArrayList.Add("com.apple.dt.xctestruncontenttype") |Out-Null
				}

				"xctoolchain" {
					$fileTypeArrayList.Add("com.apple.dt.document.toolchain") |Out-Null
				}

				"xcworkspace" {
					$fileTypeArrayList.Add("com.apple.dt.document.workspace") |Out-Null
				}

				"xfd" {
					$fileTypeArrayList.Add("public.xfd") |Out-Null
				}

				"xfdf" {
					$fileTypeArrayList.Add("com.adobe.xfdf") |Out-Null
				}

				"xhtm" {
					$fileTypeArrayList.Add("public.xhtml") |Out-Null
				}

				"xhtml" {
					$fileTypeArrayList.Add("public.xhtml") |Out-Null

					$fileTypeArrayList.Add("public.xml") |Out-Null
				}

				"xib" {
					$fileTypeArrayList.Add("com.apple.interfacebuilder.document.cocoa") |Out-Null
				}

				"xip" {
					$fileTypeArrayList.Add("com.apple.xip-archive") |Out-Null
				}

				"xla" {
					$fileTypeArrayList.Add("com.microsoft.excel.xla") |Out-Null

					$fileTypeArrayList.Add("com.microsoft.excel.xla.biff2") |Out-Null

					$fileTypeArrayList.Add("com.microsoft.excel.xla.biff4") |Out-Null
				}

				"xlam" {
					$fileTypeArrayList.Add("com.microsoft.excel.openxml.addin") |Out-Null
				}

				"xlb" {
					$fileTypeArrayList.Add("com.microsoft.excel.xlb") |Out-Null
				}

				"xliff" {
					$fileTypeArrayList.Add("org.oasis-open.xliff") |Out-Null
				}

				"xll" {
					$fileTypeArrayList.Add("com.microsoft.excel.xll") |Out-Null
				}

				"xlm" {
					$fileTypeArrayList.Add("com.microsoft.excel.xlm") |Out-Null

					$fileTypeArrayList.Add("com.microsoft.excel.xlm.biff2") |Out-Null

					$fileTypeArrayList.Add("com.microsoft.excel.xlm.biff3") |Out-Null

					$fileTypeArrayList.Add("com.microsoft.excel.xlm.biff4") |Out-Null

					$fileTypeArrayList.Add("com.microsoft.excel.xlm.stationery.biff3") |Out-Null

					$fileTypeArrayList.Add("com.microsoft.excel.xlm.stationery.biff4") |Out-Null
				}

				"xlp9" {
					$fileTypeArrayList.Add("com.microsoft.excel.plugin") |Out-Null
				}

				"xls" {
					$fileTypeArrayList.Add("com.microsoft.excel.xls") |Out-Null

					$fileTypeArrayList.Add("com.microsoft.excel.xls.biff2") |Out-Null

					$fileTypeArrayList.Add("com.microsoft.excel.xls.biff3") |Out-Null

					$fileTypeArrayList.Add("com.microsoft.excel.xls.biff4") |Out-Null

					$fileTypeArrayList.Add("com.microsoft.excel.xls.biff5") |Out-Null

					$fileTypeArrayList.Add("com.microsoft.excel.xls.stationery.biff3") |Out-Null

					$fileTypeArrayList.Add("com.microsoft.excel.xls.stationery.biff4") |Out-Null

					$fileTypeArrayList.Add("com.microsoft.excel.xls.stationery.biff4") |Out-Null

					$fileTypeArrayList.Add("com.microsoft.onedrive.exportedbadges.tagged.shared") |Out-Null
				}

				"xls8" {
					$fileTypeArrayList.Add("com.microsoft.excel.xls") |Out-Null

					$fileTypeArrayList.Add("com.microsoft.onedrive.exportedbadges.tagged.shared") |Out-Null
				}

				"xlsb" {
					$fileTypeArrayList.Add("com.microsoft.excel.sheet.binary.macroenabled") |Out-Null
				}

				"xlsm" {
					$fileTypeArrayList.Add("com.microsoft.excel.openxmlformats.spreadsheetml.sheet.macroenabled") |Out-Null

					$fileTypeArrayList.Add("org.openxmlformats.spreadsheetml.sheet.macroenabled") |Out-Null
				}

				"xlsx" {
					$fileTypeArrayList.Add("com.microsoft.excel.openxmlformats.spreadsheetml.sheet") |Out-Null

					$fileTypeArrayList.Add("com.microsoft.excel.pref") |Out-Null

					$fileTypeArrayList.Add("org.openxmlformats.spreadsheetml.sheet") |Out-Null
				}

				"excel" {
					$fileTypeArrayList.Add("com.microsoft.excel.openxmlformats.spreadsheetml.sheet") |Out-Null

					$fileTypeArrayList.Add("com.microsoft.excel.pref") |Out-Null

					$fileTypeArrayList.Add("org.openxmlformats.spreadsheetml.sheet") |Out-Null
				}

				"xltm" {
					$fileTypeArrayList.Add("com.microsoft.excel.openxmlformats.spreadsheetml.template.macroenabled") |Out-Null

					$fileTypeArrayList.Add("org.openxmlformats.spreadsheetml.template.macroenabled") |Out-Null
				}

				"xltx" {
					$fileTypeArrayList.Add("com.microsoft.excel.openxmlformats.spreadsheetml.template") |Out-Null

					$fileTypeArrayList.Add("org.openxmlformats.spreadsheetml.template") |Out-Null
				}

				"xlw" {
					$fileTypeArrayList.Add("com.microsoft.excel.xld") |Out-Null

					$fileTypeArrayList.Add("com.microsoft.excel.xlw") |Out-Null

					$fileTypeArrayList.Add("com.microsoft.excel.xlw.biff2") |Out-Null

					$fileTypeArrayList.Add("com.microsoft.excel.xlw.biff3") |Out-Null

					$fileTypeArrayList.Add("com.microsoft.excel.xlw.biff4") |Out-Null

					$fileTypeArrayList.Add("com.microsoft.excel.xlw.biff5") |Out-Null
				}

				"xlw8" {
					$fileTypeArrayList.Add("com.microsoft.excel.xlw") |Out-Null
				}

				"xml" {
					$fileTypeArrayList.Add("com.microsoft.excel.xml") |Out-Null

					$fileTypeArrayList.Add("com.microsoft.word.openxmlformats.wordprocessingml.template.macroenabled") |Out-Null

					$fileTypeArrayList.Add("com.microsoft.word.wordml") |Out-Null

					$fileTypeArrayList.Add("public.xml") |Out-Null
				}

				"xpc" {
					$fileTypeArrayList.Add("com.apple.xpc-service") |Out-Null
				}

				"xpl" {
					$fileTypeArrayList.Add("com.morriscooke.xpl") |Out-Null
				}

				"xz" {
					$fileTypeArrayList.Add("org.tukaani.xz-archive") |Out-Null
				}

				"y" {
					$fileTypeArrayList.Add("public.yacc-source") |Out-Null
				}

				"yaa" {
					$fileTypeArrayList.Add("com.apple.archive") |Out-Null
				}

				"yaml" {
					$fileTypeArrayList.Add("public.ndjson") |Out-Null

					$fileTypeArrayList.Add("public.yaml") |Out-Null
				}

				"ym" {
					$fileTypeArrayList.Add("public.yacc-source") |Out-Null
				}

				"yml" {
					$fileTypeArrayList.Add("public.ndjson") |Out-Null

					$fileTypeArrayList.Add("public.yaml") |Out-Null
				}

				"ymm" {
					$fileTypeArrayList.Add("public.yacc-source") |Out-Null
				}

				"yxx" {
					$fileTypeArrayList.Add("public.yacc-source") |Out-Null
				}

				"z" {
					$fileTypeArrayList.Add("public.z-archive") |Out-Null
				}

				"zettingz" {
					$fileTypeArrayList.Add("com.tinyspeck.slack.file") |Out-Null

					$fileTypeArrayList.Add("com.zillow.re.zettingz") |Out-Null
				}

				"zip" {
					$fileTypeArrayList.Add("com.apple.pftmultiplerecordinginstrumenttype") |Out-Null

					$fileTypeArrayList.Add("public.zip-archive") |Out-Null
				}

				"zsh" {
					$fileTypeArrayList.Add("com.apple.xcode.zsh-script") |Out-Null

					$fileTypeArrayList.Add("public.zsh-script") |Out-Null
				}
				Default {
					$fileTypeArrayList.Add("") |Out-Null
				}
			}
		}
		
		#now we build the applescript list of type identifiers
		$typeIdentifierASList = "{"

		#loop through $fileTypeArrayList and add the type (identifier) of each entry on to the end of the list,
		#with enclosing quotes in the list (necessary for an AppleScript list of text items) and a trailing comma
		foreach($item in $fileTypeArrayList) {
			#$item.type 
			$typeIdentifierASList = $typeIdentifierASList + "`"" + $item +"`","
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
function Get-ChooseFile {
	Param (
		[Parameter(Mandatory = $false)][string] $chooseFilePrompt, #optional, default is nothing
		[Parameter(Mandatory = $false)][string] $defaultLocation, #the dictionary says this has to be an alias, setting it to POSIX file works too. 
		[Parameter(Mandatory = $false)][bool] $showInvisibles, #the default is false, so we only care if it's true
		[Parameter(Mandatory = $false)][bool] $multipleSelectionsAllowed, #same as for show invisibles
		[Parameter(Mandatory = $false)][string[]] $fileTypes, #this is going to be an array
		[Parameter(Mandatory = $false)][bool] $showPackageContents #default is false
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

	#if it's zero, we don't care
	if($fileTypes.Count -gt 0) {
	
		#get the AppleScript List of Type Identifiers
		$appleScriptTypeIdentifierList = buildASTypeIdentifierList -fileTypes $fileTypes

		#add this to the choose file command
		$chooseFileCommand = $chooseFileCommand + "of type $appleScriptTypeIdentifierList "
	} 

	if($showPackageContents) {
		#we only care if showing package contents is true, the default is false, so we don't need to gode for that
		$chooseFileCommand = $chooseFileCommand + "with showing package contents "
	}

	#run the command
	$chooseFileString = $chooseFileCommand|/usr/bin/osascript -so

	#deal with cancel
	if($chooseFileString.Contains("execution error: User canceled. `(-128`)")) {
		#Write-Output "user hit cancel button"
		return "userCancelError"
	}

	#build the output array
	$chooseFileArray = $chooseFileString.Split(",")
	#we need an arrayList here to shove the processed entries into.
	#we have to use a separate arraylist,
	#since we can't modify an array we're iterating through
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

	#this is what we return
	return $chooseFileArrayList
}

Export-ModuleMember -Function Get-ChooseFile
# SIG # Begin signature block
# MIIMgAYJKoZIhvcNAQcCoIIMcTCCDG0CAQMxDTALBglghkgBZQMEAgEwewYKKwYB
# BAGCNwIBBKBtBGswaTA0BgorBgEEAYI3AgEeMCYCAwEAAAQQH8w7YFlLCE63JNLG
# KX7zUQIBAAIBAAIBAAIBAAIBADAxMA0GCWCGSAFlAwQCAQUABCC5dgj31dqR06Lc
# Dwi5cOGvNPsR89LMYxtes8lYhSeb16CCCaswggQEMIIC7KADAgECAggYeqmowpYh
# DDANBgkqhkiG9w0BAQsFADBiMQswCQYDVQQGEwJVUzETMBEGA1UEChMKQXBwbGUg
# SW5jLjEmMCQGA1UECxMdQXBwbGUgQ2VydGlmaWNhdGlvbiBBdXRob3JpdHkxFjAU
# BgNVBAMTDUFwcGxlIFJvb3QgQ0EwHhcNMTIwMjAxMjIxMjE1WhcNMjcwMjAxMjIx
# MjE1WjB5MS0wKwYDVQQDDCREZXZlbG9wZXIgSUQgQ2VydGlmaWNhdGlvbiBBdXRo
# b3JpdHkxJjAkBgNVBAsMHUFwcGxlIENlcnRpZmljYXRpb24gQXV0aG9yaXR5MRMw
# EQYDVQQKDApBcHBsZSBJbmMuMQswCQYDVQQGEwJVUzCCASIwDQYJKoZIhvcNAQEB
# BQADggEPADCCAQoCggEBAIl2TwZbmkHupSMrAqNf13M/wDWwi4QKPwYkf6eVP+tP
# DpOvtA7QyD7lbRizH+iJR7/XCQjk/1aYKRXnlJ25NaMKzbTA4eJg9MrsKXhFaWlg
# a1+KkvyeI+Y6wiKzMU8cuvK2NFlC7rCpAgMYkQS2s3guMx+ARQ1Fb7sOWlt/OufY
# CNcLDjJt+4Y25GyrxBGKcIQmqp9E0fG4xnuUF5tI9wtYFrojxZ8VOX7KXcMyXw/g
# Un9A6r6sCGSVW8kanOWAyh9qRBxsPsSwJh8d7HuvXqBqPUepWBIxPyB2KG0dHLDC
# ThFpJovL1tARgslOD/FWdNDZCEtmeKKrrKfi0kyHWckCAwEAAaOBpjCBozAdBgNV
# HQ4EFgQUVxftos/cfJihEOD8voctLPLjF1QwDwYDVR0TAQH/BAUwAwEB/zAfBgNV
# HSMEGDAWgBQr0GlHlHYJ/vRrjS5ApvdHTX8IXjAuBgNVHR8EJzAlMCOgIaAfhh1o
# dHRwOi8vY3JsLmFwcGxlLmNvbS9yb290LmNybDAOBgNVHQ8BAf8EBAMCAYYwEAYK
# KoZIhvdjZAYCBgQCBQAwDQYJKoZIhvcNAQELBQADggEBAEI5dGuh3MakjzcqjLMd
# CkS8lSx/vFm4rGH7B5CSMrnUvzvBUDlqRHSi7FsfcOWq3UtsHCNxLV/RxZO+7puK
# cGWCnRbjGhAXiS2ozf0MeFhJDCh/M+4Aehu0dqy2tbtP36gbncgZl0oLVmcvwj62
# s8SDOvB3bXTELiNR7pqlA29g9KVIpwbCu1riHx9GRX7kl/UnELcgInJvctrGUHXF
# PSWPXaMA6Z82jEg5j7M76pCALpWaYPR4zvQOClM+ovpP2B6uhJWNMrxWTYnpeBjg
# rJpCunpGG4Siic4U6IjRWIv2rlbELAUqRa8L2UupAg80rIjHYVWJRMkncwfuguVO
# 9XAwggWfMIIEh6ADAgECAggGHmabX9eOKjANBgkqhkiG9w0BAQsFADB5MS0wKwYD
# VQQDDCREZXZlbG9wZXIgSUQgQ2VydGlmaWNhdGlvbiBBdXRob3JpdHkxJjAkBgNV
# BAsMHUFwcGxlIENlcnRpZmljYXRpb24gQXV0aG9yaXR5MRMwEQYDVQQKDApBcHBs
# ZSBJbmMuMQswCQYDVQQGEwJVUzAeFw0yMDA5MTYwMzU4MzBaFw0yNTA5MTcwMzU4
# MzBaMIGNMRowGAYKCZImiZPyLGQBAQwKNzk2NDg4Vkc5NTE4MDYGA1UEAwwvRGV2
# ZWxvcGVyIElEIEluc3RhbGxlcjogSm9obiBXZWxjaCAoNzk2NDg4Vkc5NSkxEzAR
# BgNVBAsMCjc5NjQ4OFZHOTUxEzARBgNVBAoMCkpvaG4gV2VsY2gxCzAJBgNVBAYT
# AlVTMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAw0uP+x8FCIpcy4DJ
# xqWRX3Pdtr55nnka0f22c7Ko+IAC//91iQxQLuz8fqbe4b3pEyemzfDB0GSVyhnY
# AYLVYMjVaUamr2j7apX8M3QxIcxrlHAJte1Mo+ntsQic4+syz5HZm87ew4R/52T3
# zzvtsjaKRIfy0VT35E9T4zVhpq3vdJkUCuQrHrXljxXhOEzJrJ9XllDDJ2QmYZc0
# K29YE9pVPFiZxkbf5xmtx1CZhiUulCI0ypnj7dGxLJxRtJhsFChzeSflkOBtn9H/
# RVuBjb0DaRib/mEK7FCbYgEbcIL5QcO3pUlIyghXaQoZsNaViszg7Xzfdh16efby
# y+JLaQIDAQABo4ICFDCCAhAwDAYDVR0TAQH/BAIwADAfBgNVHSMEGDAWgBRXF+2i
# z9x8mKEQ4Py+hy0s8uMXVDBABggrBgEFBQcBAQQ0MDIwMAYIKwYBBQUHMAGGJGh0
# dHA6Ly9vY3NwLmFwcGxlLmNvbS9vY3NwMDMtZGV2aWQwNzCCAR0GA1UdIASCARQw
# ggEQMIIBDAYJKoZIhvdjZAUBMIH+MIHDBggrBgEFBQcCAjCBtgyBs1JlbGlhbmNl
# IG9uIHRoaXMgY2VydGlmaWNhdGUgYnkgYW55IHBhcnR5IGFzc3VtZXMgYWNjZXB0
# YW5jZSBvZiB0aGUgdGhlbiBhcHBsaWNhYmxlIHN0YW5kYXJkIHRlcm1zIGFuZCBj
# b25kaXRpb25zIG9mIHVzZSwgY2VydGlmaWNhdGUgcG9saWN5IGFuZCBjZXJ0aWZp
# Y2F0aW9uIHByYWN0aWNlIHN0YXRlbWVudHMuMDYGCCsGAQUFBwIBFipodHRwOi8v
# d3d3LmFwcGxlLmNvbS9jZXJ0aWZpY2F0ZWF1dGhvcml0eS8wFwYDVR0lAQH/BA0w
# CwYJKoZIhvdjZAQNMB0GA1UdDgQWBBRdVgk/6FL+2RJDsLeMey31Hn+TBzAOBgNV
# HQ8BAf8EBAMCB4AwHwYKKoZIhvdjZAYBIQQRDA8yMDE5MDIwNjAwMDAwMFowEwYK
# KoZIhvdjZAYBDgEB/wQCBQAwDQYJKoZIhvcNAQELBQADggEBAHdfmGHh7XOchb/f
# reKxq4raNtrvb7DXJaubBNSwCjI9GhmoAJIQvqtAHSSt4CHsffoekPkWRWaJKgbk
# +UTCZLMy712KfWtRcaSNNzOp+5euXkEsrCurBm/Piua+ezeQWt6RzGNM86bOa34W
# 4r6jdYm8ta9ql4So07Z4kz3y5QN7fI20B8kG5JFPeN88pZFLUejGwUpshXFO+gbk
# GrojkwbpFuRAsiEZ1ngeqtObaO8BRKHahciFNpuTXk1I0o0XBZ2JmCUWzx3a6T4u
# fME1heNtNLRptGYMtZXH4tboV39Wf5lgHc4KR85Mbw52srsRU22NE8JWAvgFp/Qz
# qX5rmVIxggIrMIICJwIBATCBhTB5MS0wKwYDVQQDDCREZXZlbG9wZXIgSUQgQ2Vy
# dGlmaWNhdGlvbiBBdXRob3JpdHkxJjAkBgNVBAsMHUFwcGxlIENlcnRpZmljYXRp
# b24gQXV0aG9yaXR5MRMwEQYDVQQKDApBcHBsZSBJbmMuMQswCQYDVQQGEwJVUwII
# Bh5mm1/XjiowCwYJYIZIAWUDBAIBoHwwEAYKKwYBBAGCNwIBDDECMAAwGQYJKoZI
# hvcNAQkDMQwGCisGAQQBgjcCAQQwHAYKKwYBBAGCNwIBCzEOMAwGCisGAQQBgjcC
# ARUwLwYJKoZIhvcNAQkEMSIEIDP6Y/Z0TXCVhS1fgmMVL8ygTp2om1wbYDd3y4/v
# aijrMAsGCSqGSIb3DQEBAQSCAQA1JAoQ3UCU1yZikqtq9v0xfCsPwfdSSUCgPGGT
# wHfqW6jH+jZhyRf+q6/iqZGAXjSvZ79E89ejqNJdR/V6zSAAJjRN0xtEfYEQTR/1
# ZmSiGSrVRaHQ8ayFLNV60xAfSZEpaFoLcpZHSpEkV0rsHm+N/JYt5ZVg+dO8zFzw
# ume6/w9233ETPZdVXcT7/hR5t/+Cl17G8ZsE1woHzAyNcfiPWkxGODS8QqMw5ve9
# 3YW+DUzija08KPEZwiNYRbSVrlXCW3S/HXeOBCd+vH4cXfeURIBnHjQJ3Mg0Hzeq
# 2HsMaLP+jPd/RpbkbItMwnTVGtQDHTLNO7SVgFIngaVMu+cZ
# SIG # End signature block
