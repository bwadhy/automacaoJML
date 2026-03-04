🚀 Automação de Criação de Usuários no Microsoft Entra ID

Este projeto demonstra a automação de provisionamento de usuários no Microsoft Entra ID utilizando:

PowerShell

Microsoft Graph API

App Registration (Client Credentials Flow)

Importação via CSV

🎯 Objetivo

Simular um processo de onboarding (JML - Joiner/Mover/Leaver) onde:

Usuários são criados automaticamente

Validação de duplicidade (idempotência)

Suporte a CSV com delimitador ; (padrão Brasil)

🛠 Tecnologias utilizadas

PowerShell

Microsoft Graph SDK

Microsoft Entra ID

App Registration (Application Permissions)

📄 Estrutura do CSV
Nome;Email;Departamento
Joao Silva;joaosilva@empresa.onmicrosoft.com;Financeiro
Maria Souza;mariasouza@empresa.onmicrosoft.com;TI
🔐 Autenticação

Utiliza fluxo Client Credentials via:

Tenant ID

Client ID

Client Secret

🔁 Idempotência

O script:

Verifica se o usuário já existe

Só cria se não existir

Pode ser executado múltiplas vezes com segurança

▶ Como executar
.\automacaojml.ps1
📌 Possíveis evoluções

Atribuição automática de licença

Inclusão em grupos

Geração de log em arquivo

Integração com Service Desk (ex: GLPI)

Pipeline CI/CD
