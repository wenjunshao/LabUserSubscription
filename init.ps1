# === POWERSHELL branch (called by the one-line dispatcher) ===
# Runs in YOUR current PowerShell session via `iex`, so Set-AzContext actually
# takes effect for Get-Az* / New-Az* / *-Az* cmdlets used later in the lab.

Write-Host "===== Cloud Shell Init Start (powershell) ====="

# Get the current logged-in account
$user = az account show --query "user.name" -o tsv
Write-Host "[INFO] Current user: $user"

# ===== mapping relationship =====
switch ($user) {
    "LabRunner1@MngEnvMCAP825705.onmicrosoft.com" {
        $subId = "8da443ca-8590-4e4c-bc26-defea6467f50"
    }
    "LabRunner2@MngEnvMCAP825705.onmicrosoft.com" {
        $subId = "8da443ca-8590-4e4c-bc26-defea6467f50"
    }
    "LabRunner3@MngEnvMCAP825705.onmicrosoft.com" {
        $subId = "8da443ca-8590-4e4c-bc26-defea6467f50"
    }
    "LabRunner4@MngEnvMCAP825705.onmicrosoft.com" {
        $subId = "8da443ca-8590-4e4c-bc26-defea6467f50"
    }
    "LabRunner5@MngEnvMCAP825705.onmicrosoft.com" {
        $subId = "8da443ca-8590-4e4c-bc26-defea6467f50"
    }
    "LabRunner6@MngEnvMCAP825705.onmicrosoft.com" {
        $subId = "8da443ca-8590-4e4c-bc26-defea6467f50"
    }


    "LabRunnerPPE1@MngEnvMCAP825705.onmicrosoft.com" {
        $subId = "e90f488d-02c7-4c79-a332-523afd8d1a44"
    }
    "LabRunnerPPE2@MngEnvMCAP825705.onmicrosoft.com" {
        $subId = "e90f488d-02c7-4c79-a332-523afd8d1a44"
    }
    "LabRunnerPPE3@MngEnvMCAP825705.onmicrosoft.com" {
        $subId = "e90f488d-02c7-4c79-a332-523afd8d1a44"
    }
    "LabRunnerPPE4@MngEnvMCAP825705.onmicrosoft.com" {
        $subId = "e90f488d-02c7-4c79-a332-523afd8d1a44"
    }

    "LabRunnerDevPPE1@MngEnvMCAP825705.onmicrosoft.com" {
        $subId = "d470c937-42bc-4a9c-9831-116799e343d9"
    } 
    "LabRunnerDevPPE2@MngEnvMCAP825705.onmicrosoft.com" {
        $subId = "d470c937-42bc-4a9c-9831-116799e343d9"
    }  
    "LabRunnerDevPPE3@MngEnvMCAP825705.onmicrosoft.com" {
        $subId = "d470c937-42bc-4a9c-9831-116799e343d9"
    }  
    "LabRunnerDevPPE4@MngEnvMCAP825705.onmicrosoft.com" {
        $subId = "d470c937-42bc-4a9c-9831-116799e343d9"
    }     
    
    default {
        Write-Error "[ERROR] Unknown account: $user"
        return
    }
}

# Pin the Az PowerShell subscription (for Set-AzContext / Get-Az* / New-Az* cmdlets)
Set-AzContext -SubscriptionId $subId | Out-Null

# Pin the Azure CLI subscription too (for `az` commands)
az account set --subscription $subId 2>$null
az account show --query name -o tsv

Write-Host "===== Init Done ====="
