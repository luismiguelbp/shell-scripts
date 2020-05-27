# Simular que se presiona una tecla concreta del teclado cada x tiempo.

$sScriptName = "Cuban Coffee"

$sVersion = Get-Host | Select-Object Version
Write-Host "PowerShell version: " $sVersion

$iMinutes = $args[0]
$wsh = New-Object -ComObject WScript.Shell

Write-Host "Begin " $sScriptName
Write-Host "Minutes: " $iMinutes
for ($i = 0; $i -le $iMinutes; $i++)
{
	$wsh.SendKeys('+{F15}')
	Start-Sleep -Seconds 59
	Write-Host " Minute: " $i
}
Write-Host "End " $sScriptName
