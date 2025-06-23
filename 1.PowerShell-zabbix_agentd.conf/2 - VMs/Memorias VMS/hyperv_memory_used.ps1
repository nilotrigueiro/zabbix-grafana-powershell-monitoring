# Declara um parâmetro de entrada chamado $vm (nome da máquina virtual)
param([string]$vm)

try {
    # Tenta executar o bloco de código a seguir

    # Obtém as informações da máquina virtual com o nome fornecido
    $vmInfo = Get-VM -Name $vm

    # Obtém o consumo atual de memória da VM (MemoryDemand) em gigabytes
    # Divide o valor por 1GB e arredonda para 2 casas decimais
    $memUsedGB = [math]::Round($vmInfo.MemoryDemand / 1GB, 2)

    # Converte o valor numérico para string com ponto decimal (formato invariante, padrão "en-US")
    # Isso evita problemas de formatação em sistemas com localizações diferentes (por exemplo, vírgula em vez de ponto)
    $memUsedGBStr = $memUsedGB.ToString([System.Globalization.CultureInfo]::InvariantCulture)

    # Envia a saída formatada para o Zabbix (ou outro sistema de monitoramento)
    Write-Output $memUsedGBStr
}
catch {
    # Se ocorrer qualquer erro (por exemplo, VM não encontrada), retorna "0"
    Write-Output 0
}

### Função: Retorna o uso real de memória da VM (em GB).
### Uso: Ideal para monitorar o consumo em tempo real no Zabbix ou outro sistema.

#para testar, utilize & "C:\scripts\hyperv_memory_used.ps1" -vm "Gitlab" (entre aspas coloque o nome da VM que deseja testar)