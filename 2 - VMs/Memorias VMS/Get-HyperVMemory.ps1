# Define um parâmetro obrigatório chamado 'vmname', que será o nome da VM a consultar
param(
    [Parameter(Mandatory=$true)]
    [string]$vmname
)

try {
    # Tenta importar o módulo do Hyper-V para garantir acesso aos cmdlets como Get-VM
    # Se o módulo não estiver disponível, lança erro e vai para o bloco catch
    Import-Module Hyper-V -ErrorAction Stop

    # Tenta obter a VM com o nome fornecido
    # Se não encontrar, lança erro e vai para o bloco catch
    $vm = Get-VM -Name $vmname -ErrorAction Stop

    # Verifica se a VM foi realmente encontrada (por segurança)
    if ($vm -ne $null) {
        # Obtém a memória atribuída à VM em bytes
        $memAssignedBytes = $vm.MemoryAssigned

        # Converte a memória de bytes para megabytes (MB) e arredonda com 2 casas decimais
        $memAssignedMB = [math]::Round($memAssignedBytes / 1MB, 2)

        # Exibe o valor final da memória atribuída em MB
        Write-Output $memAssignedMB
    } else {
        # Caso a VM não exista, retorna -1 como valor de erro
        Write-Output "-1"
    }
}
catch {
    # Em caso de qualquer erro (módulo ausente, VM inexistente, etc.), retorna -1
    Write-Output "-1"
}


### Função: Este script retorna a quantidade de memória atribuída (alocada) em megabytes (MB) para uma máquina virtual específica no Hyper-V.
### Uso: Obter informações de memória alocada de forma rápida e automática.


### Para realizar este no PS ISE : & "C:\scripts\GetMemoryInfo.ps1" -vmname "Gitlab"
