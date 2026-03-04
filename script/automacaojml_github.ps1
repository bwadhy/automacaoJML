# Garante que o módulo de usuários está carregado
Import-Module Microsoft.Graph

# Conectar com App Registration
$tenantId = "ID DO TENANT"
$clientId = "COLOQUE O ID DO APP REGRISTRATION"
$clientSecret = "COLOQUE O SECRET"

$secureSecret = ConvertTo-SecureString $clientSecret -AsPlainText -Force
$credential = New-Object System.Management.Automation.PSCredential($clientId, $secureSecret)
Connect-MgGraph -TenantId $tenantId -ClientSecretCredential $credential

# Ler CSV corretamente
$csvPath = "C:\Bruno\usuarios.csv"
$usuarios = Import-Csv $csvPath -Delimiter ";"

# Criar usuários automaticamente
foreach ($usuario in $usuarios) {

    if ([string]::IsNullOrWhiteSpace($usuario.Nome)) {
        Write-Host "Linha vazia ignorada..."
        continue
    }

    $upn = $usuario.Email
    $mailNickname = ($upn.Split("@")[0])

    Write-Host "Processando $($usuario.Nome)..."

    # 🔎 Verifica se já existe
    $existe = Get-MgUser -Filter "userPrincipalName eq '$upn'" -ErrorAction SilentlyContinue

    if ($existe) {
        Write-Host "Usuario ja existe. Pulando..."
    }
    else {
        try {
            New-MgUser `
                -DisplayName $usuario.Nome `
                -UserPrincipalName $upn `
                -MailNickname $mailNickname `
                -Department $usuario.Departamento `
                -AccountEnabled `
                -PasswordProfile @{
                    Password = "Senha@123"
                    ForceChangePasswordNextSignIn = $true
                }

            Write-Host "Usuario criado!"
        }
        catch {
            Write-Host "Erro ao criar usuario: $($_.Exception.Message)"
        }
    }
}


Write-Host "Todos os usuarios foram processados!"
