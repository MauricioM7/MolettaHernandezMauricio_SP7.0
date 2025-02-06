# Inicializamos los contadores
$diasPares = 0
$diasImpares = 0

# Iteramos por todos los días del año
0..365 | ForEach-Object {
    $dia = ([datetime]"01/01/2025 00:00").AddDays($_).Day
    
    if ($dia % 2) {
        $diasImpares++
    } else {
        $diasPares++
    }
}

# Mostramos los resultados
Write-Host "Días pares: $diasPares"
Write-Host "Días impares: $diasImpares"