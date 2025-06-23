# Declaração de parâmetro:
param([string]$vm)
# Este bloco define um parâmetro chamado $vm, que será passado quando o script for executado.
# Este parâmetro deve ser uma string, representando o nome da máquina virtual a ser consultada.

try {
    # Tenta obter informações sobre a máquina virtual com o nome especificado
    $vmInfo = Get-VM -Name $vm

    # Calcula a quantidade de memória atribuída à VM em gigabytes, com 2 casas decimais
    $memAssignedGB = [math]::Round($vmInfo.MemoryAssigned / 1GB, 2)

    # Exibe a quantidade de memória atribuída em GB
    Write-Output $memAssignedGB

} catch {
    # Caso ocorra algum erro (por exemplo, a VM não existir), exibe 0
    Write-Output 0
}


### Função: Retorna a quantidade de memória atribuída à VM, em GB.
### Uso: Monitorar a configuração de memória da VM, não o consumo real.



#para testar, utilize & "C:\scripts\hyperv_memory_assigned.ps1" -vm "Gitlab" (entre aspas coloque o nome da VM que deseja testar)
