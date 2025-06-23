# Declara um parâmetro de entrada do tipo string chamado $vm (nome da VM)
param([string]$vm)

try {
    # Tenta obter os caminhos dos discos virtuais conectados à VM
    $vmDrive = Get-VMHardDiskDrive -VMName $vm | Select-Object -ExpandProperty Path

    # Inicializa uma variável para armazenar o total de espaço usado (em bytes)
    $usedSize = 0

    # Para cada disco virtual encontrado
    foreach ($disk in $vmDrive) {
        # Obtém as informações do disco virtual no caminho especificado
        $vhd = Get-VHD -Path $disk

        # Soma o tamanho real ocupado no disco (em bytes)
        # 'FileSize' representa o tamanho atual que o arquivo de disco ocupa no host
        $usedSize += $vhd.FileSize
    }

    # Retorna o total de espaço utilizado (em bytes)
    Write-Output $usedSize
}
catch {
    # Se ocorrer algum erro (ex: VM não existe, caminho inválido), retorna 0
    Write-Output 0
}


### Função: Retorna o espaço efetivamente usado nos arquivos VHD/VHDX (em bytes).
### Uso: Monitorar o uso real de disco no host.

#para testar no PS: & "C:\scripts\hyperv_disk_total.ps1" -vm "Gitlab" : Coloque o nome de sua VM nestas aspas.
