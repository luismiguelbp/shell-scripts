<#
  # Running PowerShell Scripts
  # Get-ExecutionPolicy
  # Set-ExecutionPolicy RemoteSigned
#>
# Comment
# Simular que se presiona una tecla concreta del teclado cada x tiempo.

$sVersion = Get-Host | Select-Object Version
Write-Host "PowerShell version: " $sVersion

#Start-Sleep –Seconds 5

#$iMinutes = $args[0]

<#
Write-Host –NoNewLine "Counting from 1 to 9 (in seconds): "
foreach ($element in 1..10) {
	Write-Host –NoNewLine  "${element} "
	Start-Sleep –Seconds 1
}
Write-Host ""
#>

<#
$wsh = New-Object -ComObject WScript.Shell
for ($i = 0; $i -lt $iMinutes; $i++) {
	Start-Sleep -Seconds 59
	#$myshell.sendkeys(".")
	$wsh.SendKeys('+{F15}')
	Write-Host " i: " $i " " $wsh
}
#>

#$localRelease = "C:\Users\usuario\Documents\Visual Studio 2017\Projects\MiWinForms\MiWinForms\bin\Release"
#$localBase = "C:\Aplicaciones"
#$localProyecto = "$localBase\MiWinForms"


$pausa = Read-Host "Escribir cualquier cosa para continuar"
Write-Host $pausa
