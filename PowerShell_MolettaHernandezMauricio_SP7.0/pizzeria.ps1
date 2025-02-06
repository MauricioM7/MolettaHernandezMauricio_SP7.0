Write-Host "¿Quieres una pizza vegetariana? (Sí/No)"
$tipoPizza = Read-Host

if ($tipoPizza -eq "Sí") {
    $ingredientes = @("Pimiento", "Tofu")
    $tipo = "vegetariana"
} elseif ($tipoPizza -eq "No") {
    $ingredientes = @("Peperoni", "Jamón", "Salmón")
    $tipo = "no vegetariana"
} else {
    Write-Host "Respuesta no válida. Escribe 'Sí' o 'No'."
    exit
}

Write-Host "Elige un ingrediente: $($ingredientes -join ', ')"
$ingrediente = Read-Host

if ($ingredientes -contains $ingrediente) {
    Write-Host "Tu pizza es $tipo y lleva: Mozzarella, Tomate y $ingrediente."
} else {
    Write-Host "Ingrediente no válido. Debes elegir entre: $($ingredientes -join ', ')"
}