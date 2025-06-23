# Obtém todas as VMs no Hyper-V e percorre cada uma delas
Get-VM | ForEach-Object {
    # Para cada VM, exibe uma string com o nome da VM seguido do número de vCPUs atribuídas
    "$($_.Name):$($_.ProcessorCount)"
}


###Função : Exibir no terminal uma lista com o nome de cada VM do Hyper-V seguido pela quantidade de processadores virtuais (vCPUs) atribuídos a ela.
### Uso: Fazer um inventário rápido dos recursos de CPU atribuídos às VMs.