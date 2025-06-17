# Obtém informações gerais sobre o array de memória (slots físicos na placa-mãe)
$memoryArray = Get-WmiObject -Class Win32_PhysicalMemoryArray

# Obtém informações detalhadas sobre os módulos de memória instalados
$memoryInfo  = Get-WmiObject -Class Win32_PhysicalMemory


# Verifica se houve erro na coleta de dados
# Se não houver dados nem do array nem dos módulos, retorna um JSON vazio "{}" e encerra com código de erro 1
if (-not $memoryArray -or -not $memoryInfo) {
    Write-Output "{}"
    exit 1
}


# Mapeia os códigos do tipo de memória (SMBIOSMemoryType) para nomes legíveis
$memoryTypeMap = @{
    20 = 'DDR'
    21 = 'DDR2'
    24 = 'DDR3'
    26 = 'DDR4'
    30 = 'DDR5'
}

# Cria um objeto para armazenar as informações agregadas
$memoryInfoObj = @{
    totalSlots = $memoryArray.MemoryDevices  # Quantidade total de slots físicos disponíveis
    usedSlots  = $memoryInfo.Count           # Quantidade de slots atualmente ocupados com módulos de memória
    modules    = @()                         # Lista onde serão adicionadas as informações de cada módulo
}

# Percorre todos os módulos de memória encontrados
foreach ($module in $memoryInfo) {
    # Tenta obter o tipo da memória baseado no código SMBIOS
    $type = $memoryTypeMap[[int]$module.SMBIOSMemoryType]

    # Se o tipo não estiver mapeado, define como "Desconhecido"
    if (-not $type) { $type = "Desconhecido" }

    # Adiciona os dados do módulo atual à lista: tamanho, velocidade e tipo
    $memoryInfoObj.modules += @{
        sizeGB   = [math]::round($module.Capacity / 1GB, 2)  # Tamanho em GB, com duas casas decimais
        speedMHz = $module.Speed                              # Velocidade do módulo em MHz
        type     = $type                                      # Tipo da memória (DDR, DDR4, etc.)
    }
}


# Converte o objeto final para JSON com profundidade 5 para garantir que tudo seja exibido corretamente
$memoryInfoObj | ConvertTo-Json -Depth 5


### para testar em PS ISE: & "C:\scripts\GetMemoryInfo.ps1" -vm

