param([string] $Filter,
	[switch] $ShowAll);

ps | .((Split-Path -Parent ($MyInvocation.MyCommand.Path)) + "\Get-ProcessPackageFullName.ps1") | ?{
	!$Filter -or $_.Name -match $Filter -or $_.PackageFullName -match $Filter -or $_.Id -eq $Filter; 
} | ?{
	$_.PackageFullName -or $ShowAll;
} | %{
	[pscustomobject]@{PackageFullName = $_.PackageFullName; Name = $_.Name; Id = $_.Id};
};