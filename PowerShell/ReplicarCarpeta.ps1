# Replicar el contenido de una carpeta dentro de la red

$carpetaOrigen = "C:\Carpeta\"
$carpetaDestino = "\\server\shared\Carpeta\"

# Robocopy MIR
Robocopy.exe $carpetaOrigen $carpetaDestino /MIR /XD ".svn" ".vs" /XF "*.TMP"

$pausa = Read-Host "Escribir cualquier cosa para continuar"
Write-Host $pausa