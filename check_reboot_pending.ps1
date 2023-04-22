<#
.VERSION
1.0.0

.AUTOR
John Gonzalez
#>

$script = "check_reboot_pending.ps1"
$version = "1.0.0"
$author = "John Gonzalez"

if ($args.Contains("-v")) {
    Write-Host "$script - $author - $version"
    exit 0
}

$rebootRequired = Get-Item -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate\Auto Update\RebootRequired' -ErrorAction SilentlyContinue

if ($rebootRequired -ne $null) {
    Write-Host "WARNING - A reboot is pending."
    exit 1
}
else {
    Write-Host "OK - No reboot required."
    exit 0
}