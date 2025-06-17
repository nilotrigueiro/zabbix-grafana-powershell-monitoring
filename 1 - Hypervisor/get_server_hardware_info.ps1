# Coleta informações do sistema físico usando WMI (Windows Management Instrumentation)

# Informações gerais do sistema, como fabricante, modelo e memória
$compSys = Get-WmiObject -Class Win32_ComputerSystem

# Informações da BIOS, como número de série
$bios = Get-WmiObject -Class Win32_BIOS

# Informações do processador, como nome, núcleos e threads
$proc = Get-WmiObject -Class Win32_Processor


# Cria um objeto personalizado (PSCustomObject) com as propriedades desejadas
$result = [PSCustomObject]@{
    Model                = $compSys.Model                     # Modelo da máquina
    Manufacturer         = $compSys.Manufacturer              # Fabricante
    SerialNumber         = $bios.SerialNumber                 # Número de série da BIOS
    Processor            = $proc.Name                         # Nome do processador
    ProcessorCores       = $proc.NumberOfCores                # Quantidade de núcleos físicos
    ProcessorThreads     = $proc.ThreadCount                  # Quantidade total de threads (núcleos lógicos)
    TotalPhysicalMemoryGB = [math]::Round($compSys.TotalPhysicalMemory / 1GB, 2)  # Memória RAM total em GB, arredondada com 2 casas decimais
}

# Converte o objeto para JSON (estrutura legível e tratável por APIs ou sistemas de monitoramento)
# O parâmetro -Depth 3 garante que estruturas aninhadas também sejam convertidas corretamente
$result | ConvertTo-Json -Depth 3


#Testar no PS ISE: & "C:\scripts\get_server_hardware_info.ps1" -vm

