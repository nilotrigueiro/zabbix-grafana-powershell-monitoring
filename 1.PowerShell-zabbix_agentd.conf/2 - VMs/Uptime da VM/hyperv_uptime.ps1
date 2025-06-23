# Define um parâmetro de entrada chamado $vm (nome da VM a ser verificada)
param([string]$vm)


try {
    # Tenta obter as informações da VM pelo nome
    $vmInfo = Get-VM -Name $vm

    # Obtém o tempo de atividade (uptime) da VM em segundos
    $uptime = $vmInfo.Uptime.TotalSeconds

    # Converte para inteiro e exibe o resultado
    Write-Output ([int]$uptime)
}


catch {
    # Se houver erro (por exemplo, a VM não existir), retorna 0
    Write-Output 0
}



#O que esse script faz:

#    Recebe o nome de uma VM como parâmetro.
#    Usa Get-VM para obter as informações da VM.
#    Lê o campo .Uptime, que é um TimeSpan.
#    Converte esse tempo de atividade para segundos inteiros.
#    Se houver erro (nome incorreto, VM inexistente, etc.), retorna 0.