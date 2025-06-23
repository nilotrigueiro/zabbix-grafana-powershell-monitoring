# Obtém todas as VMs do Hyper-V e seleciona apenas o campo 'Name', mantendo como objeto (não expande o valor)
$vms = Get-VM | Select-Object -Property Name

# Cria uma hashtable (dicionário) com uma chave "data", cujo valor é um array vazio
# Essa estrutura segue o formato esperado pelo Zabbix para Low-Level Discovery (LLD)
$result = @{ data = @() }

# Itera sobre cada VM da lista
foreach ($vm in $vms) {
    # Para cada VM, adiciona um novo objeto com a chave "{#VMNAME}" e o valor do nome da VM
    # Essa chave deve estar em letras maiúsculas e com colchetes para o Zabbix reconhecer
    $result.data += @{ "{#VMNAME}" = $vm.Name }
}

# Converte o resultado final para JSON com profundidade 3 para garantir que toda a estrutura seja incluída corretamente
$result | ConvertTo-Json -Depth 3


### Função: Descobrir automaticamente todas as máquinas virtuais do Hyper-V e gerar uma estrutura em JSON compatível com o Zabbix Low-Level Discovery (LLD).
### Uso: Permitir que o Zabbix reconheça dinamicamente as VMs sem precisar configurá-las manualmente.

#para testar via PS ISE: & "C:\scripts\hyperv_vm_uptime.ps1" -vm "Gitlab" (altere o nome da VM entre "aspas")