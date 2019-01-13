# Replicar una Carpeta entre varios Ordenadores dentro de la RED

$localRelease = "C:\Users\usuario\Documents\Visual Studio 2017\Projects\MiWinForms\MiWinForms\bin\Release"
$localBase = "C:\Aplicaciones"
$localProyecto = "$localBase\MiWinForms"

# 1. Sincronizamos la carpeta Release con la carpeta Base

Robocopy.exe $localRelease $localProyecto /MIR /R:3 /W:5

# 2. Por cada uno de los Ordenadores replicamos la Carpeta

$ordenadores = @("Ordenador01", "Ordenador02", "Ordenador03")
foreach ($ordenador in $ordenadores) {
    if (Test-Connection -ComputerName $ordenador -BufferSize 16 -Count 1 -Quiet) {
        $remotoBase = "\\$ordenador\c$\Aplicaciones"
        $remotoProyecto = "$remotoBase\MiWinForms"
        $remotoDesktop = "\\$ordenador\c$\Users\Public\Desktop"
        # Vaciar carpetas...
        Get-ChildItem -Path $remotoProyecto -Recurse -Verbose | Remove-Item -Force -Recurse -Verbose
        # Replicar la carpeta del proyecto a la carpeta remota
        Robocopy.exe $localProyecto $remotoProyecto /MIR /R:3 /W:5
        # Copiar acceso directo en la carpeta base y en el escritorio para todos los usuarios
        Copy-Item -Path "$localBase\MiWinForms.lnk" -Destination "$remotoBase\MiWinForms.lnk" -Force -Verbose
        Copy-Item -Path "$localBase\MiWinForms.lnk" -Destination "$remotoDesktop\MiWinForms.lnk" -Force -Verbose
    }
}

$pausa = Read-Host "Escribir cualquier cosa para continuar"
Write-Host $pausa