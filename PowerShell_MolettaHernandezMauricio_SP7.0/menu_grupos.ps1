# Función para mostrar el menú
function Show-Menu {
    Clear-Host
    Write-Host "=== MENU DE GRUPOS ==="
    Write-Host "1. Listar grupos"
    Write-Host "2. Ver miembros de un grupo"
    Write-Host "3. Crear grupo"
    Write-Host "4. Eliminar grupo"
    Write-Host "5. Añadir miembro a grupo"
    Write-Host "6. Eliminar miembro de grupo"
    Write-Host "7. Salir"
    Write-Host "======================"
}

# Bucle principal del menú
do {
    Show-Menu
    $opcion = Read-Host "Seleccione una opción"
    
    switch ($opcion) {
        1 {
            Write-Host "Listando grupos..."
            Get-LocalGroup | Select-Object Name
            pause
        }
        2 {
            $grupo = Read-Host "Ingrese nombre del grupo"
            Write-Host "Miembros del grupo $grupo :"
            Get-LocalGroupMember -Group $grupo | Select-Object Name
            pause
        }
        3 {
            $grupo = Read-Host "Ingrese nombre del nuevo grupo"
            New-LocalGroup -Name $grupo
            Write-Host "Grupo creado con éxito"
            pause
        }
        4 {
            $grupo = Read-Host "Ingrese nombre del grupo a eliminar"
            Remove-LocalGroup -Name $grupo
            Write-Host "Grupo eliminado con éxito"
            pause
        }
        5 {
            $grupo = Read-Host "Ingrese nombre del grupo"
            $usuario = Read-Host "Ingrese nombre del usuario"
            Add-LocalGroupMember -Group $grupo -Member $usuario
            Write-Host "Usuario añadido al grupo con éxito"
            pause
        }
        6 {
            $grupo = Read-Host "Ingrese nombre del grupo"
            $usuario = Read-Host "Ingrese nombre del usuario"
            Remove-LocalGroupMember -Group $grupo -Member $usuario
            Write-Host "Usuario eliminado del grupo con éxito"
            pause
        }
        7 {
            Write-Host "Saliendo..."
            break
        }
        default {
            Write-Host "Opción no válida"
            pause
        }
    }
} while ($opcion -ne 7)