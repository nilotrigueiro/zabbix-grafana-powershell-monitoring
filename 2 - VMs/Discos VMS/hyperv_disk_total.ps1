# Declara um parâmetro de entrada chamado $vm (nome da máquina virtual)
param([string]$vm)

try {
    # Tenta obter os discos virtuais (VHD/VHDX) associados à VM pelo nome
    # O comando retorna os caminhos dos arquivos de disco virtual
    $vmDrive = Get-VMHardDiskDrive -VMName $vm | Select-Object -ExpandProperty Path

    # Inicializa uma variável para armazenar o tamanho total dos discos
    $totalSize = 0

    # Para cada disco virtual associado à VM
    foreach ($disk in $vmDrive) {
        # Obtém informações detalhadas do VHD/VHDX usando o caminho
        $vhd = Get-VHD -Path $disk

        # Soma o tamanho total do disco (em bytes) à variável acumuladora
        $totalSize += $vhd.Size
    }

    # Exibe o tamanho total (em bytes) dos discos virtuais da VM
    Write-Output $totalSize
} catch {
    # Caso ocorra qualquer erro (ex: VM não encontrada, disco inacessível), retorna 0
    Write-Output 0
}


### Função: Retorna o tamanho total provisionado dos discos da VM (em bytes).
### Uso: Avaliar quanto espaço foi alocado virtualmente.

#Testar no PS : & "C:\scripts\hyperv_disk_total.ps1" -vm "Gitlab"