# This file is included in profile.ps1 #


### Alias ###
#toggl
Set-Alias -Name t -Value toggl

#rm -rf
Set-Alias -Name rm-rf -Value "rm -r -fo"


### Functions ###
#> sudo [application/command]
function sudo {
	$file, [string]$arguments = $args;
	$psi = new-object System.Diagnostics.ProcessStartInfo $file;
	$psi.Arguments = $arguments;
	$psi.Verb = "runas";
	$psi.WorkingDirectory = get-location;
	[System.Diagnostics.Process]::Start($psi) >> $null
}

#> touch [filename]
function touch($file) {
	"" | Out-File $file -Encoding ASCII
}

# Toggl
Function tstart {
	toggl start
}
Function tstop {
	toggl stop
}
Function tls {
	toggl ls
}

# Done
Write-Output "$($PSScriptRoot)\includes\aliases.ps1 loaded";