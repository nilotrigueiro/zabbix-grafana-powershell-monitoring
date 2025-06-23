# 🖥️ Projeto de Monitoramento de Hyper-V com PowerShell, Zabbix e Grafana

Este repositório contém um pacote completo para **monitoramento de servidores Hyper-V** e suas **máquinas virtuais (VMs)**, utilizando **scripts PowerShell**, **Zabbix** e **Grafana**.

---
```
## 📂 Estrutura do Repositório

├── 1.PowerShell-zabbix_agentd.conf
│ ├── 1 - Hypervisor
│ └── 2 - VMs
│ ├── Discos VMS
│ ├── Discovery das VMs
│ ├── Memorias VMS
│ ├── Processadores Vm_contagemVCPu
│ ├── Status da Vm
│ └── Uptime da VM
├── 2.Template Zabbix
├── 3.JSON Grafana
└── 4.Imagens
```

### ✅ Descrição das Pastas:

| Pasta | Conteúdo |
|----|----|
| **PowerShell-zabbix_agentd.conf** | Scripts de coleta (PowerShell) + Exemplo de configuração do `zabbix_agentd.conf` |
| **Template Zabbix** | Arquivo de exportação da Template (formato `.yaml`) + Documentação detalhada |
| **JSON Grafana** | JSON do painel de monitoramento + Documentação de importação/configuração |
| **Imagens** | Imagens utilizadas no dashboard do Grafana |
| **Orientações Extras** | Dicas e ajustes adicionais para configuração e troubleshooting |

---

## 🖼️ Observação sobre as Imagens no Grafana

As imagens usadas nos dashboards foram armazenadas no seguinte caminho:

/usr/share/grafana/public/img/nilo/servidores


> ⚠️ **Importante:**  
Se você for utilizar as imagens em um ambiente diferente, ajuste o caminho de acordo com a estrutura do seu servidor Grafana.

---

## ⚙️ Ambiente Utilizado

- **Sistema Operacional:** Ubuntu 24.04.2 LTS
- **Grafana:** v12.0.0 (4c0e7045f9)
- **Zabbix Agent:** Versão compatível com Ubuntu 24.04
- **PowerShell:** Scripts executados localmente no Hyper-V

---

## ✅ Principais Funcionalidades Monitoradas

- Status das VMs (Ligada/Desligada)
- Uso de CPU
- Memória Atribuída e Memória Utilizada
- Espaço em Disco
- Uptime das VMs
- Personalizações com imagens no Grafana
- Integração de Scripts PowerShell com o Zabbix via UserParameters

---

## 🚀 Passos Básicos de Implantação

1. Copie os **scripts PowerShell** para o servidor Hyper-V.
2. Edite o arquivo **zabbix_agentd.conf**, adicionando os UserParameters conforme exemplo.
3. Reinicie o serviço do agente Zabbix.
4. Importe o **template YAML** no Zabbix.
5. Importe o **JSON do painel** no Grafana.
6. Ajuste o caminho das imagens se necessário.

---

## 👨‍💻 Autor

**Nilo Trigueiro**  
[www.linkedin.com/in/nilotrigueiro](https://www.linkedin.com/in/nilotrigueiro)

---
