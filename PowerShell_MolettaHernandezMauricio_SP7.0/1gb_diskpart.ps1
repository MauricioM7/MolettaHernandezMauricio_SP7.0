# Pedir número de disco
$diskNumber = Read-Host "Introduce el número del disco"

# Obtener y mostrar tamaño del disco en GB
$tamanoGB = [math]::Floor((Get-Disk -Number $diskNumber).Size / 1GB)
Write-Host "El disco tiene $tamanoGB GB"

# Limpiar el disco
@"
select disk $diskNumber
clean
"@ | diskpart

# Crear particiones de 1GB hasta llenar el disco
for ($i = 1; $i -le $tamanoGB; $i++) {
    @"
select disk $diskNumber
create partition primary size=1024
format quick fs=ntfs
"@ | diskpart
    Write-Host "Creada partición $i de $tamanoGB"
}

Write-Host "Proceso completado. Se han creado $tamanoGB particiones de 1GB"