# Declara um parâmetro de entrada chamado $vm, que representa o nome da VM
param(
    [string]$vm
)

# Obtém o estado atual da VM especificada e converte para string
# Possíveis valores: Running, Off, Paused, Saved, etc.
$status = (Get-VM -Name $vm).State.ToString()

# Usa a estrutura 'switch' para decidir o valor de saída com base no estado da VM
switch ($status) {
    "Running" { Write-Output 1 }   # VM está ligada → retorna 1
    "Off"     { Write-Output 0 }   # VM está desligada → retorna 0
    "Paused"  { Write-Output 2 }   # VM está pausada → retorna 2
    default   { Write-Output 99 }  # Qualquer outro estado (ex: Saved, Starting) → retorna 99
}

### Função: Retorna o estado da VM como número:
#    1: Ligada
#    0: Desligada
#    2: Pausada
#    99: Outro estado
#    Uso: Ideal para monitorar se a VM está ativa.


#para testar via PS ISE: & "C:\scripts\hyperv_vm_status.ps1" -vm "Gitlab" (altere o nome da VM entre aspas")