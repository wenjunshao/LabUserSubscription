Write-Host "===== Cloud Shell Init Start (powershell) ====="

$user = az account show --query "user.name" -o tsv 2>$null
if (-not $user) {
    Write-Error "[ERROR] Not logged in. Please run 'az login' first."
    return
}
Write-Host "[INFO] Current user: $user"

$subId = switch -Wildcard ($user) {
    "LabRunner[0-9]*@MngEnvMCAP825705.onmicrosoft.com"    { "8da443ca-8590-4e4c-bc26-defea6467f50" }
    "LabRunnerPPE[0-9]*@MngEnvMCAP825705.onmicrosoft.com" { "e90f488d-02c7-4c79-a332-523afd8d1a44" }
    "LabRunnerDevPPE[0-9]*@MngEnvMCAP825705.onmicrosoft.com" { "d470c937-42bc-4a9c-9831-116799e343d9" }
    default { Write-Error "[ERROR] Unknown account: $user"; return }
}

Set-AzContext -SubscriptionId $subId | Out-Null
az account set --subscription $subId 2>$null
az account show --query name -o tsv
Write-Host "===== Init Done ====="
