#!/bin/bash
set -euo pipefail

echo "===== Cloud Shell Init Start (bash) ====="

USER=$(az account show --query "user.name" -o tsv 2>/dev/null) || {
  echo "[ERROR] Not logged in. Please run 'az login' first."
  exit 1
}
echo "[INFO] Current user: $USER"

case "$USER" in
  LabRunner[0-9]*@MngEnvMCAP825705.onmicrosoft.com)
    SUB_ID="8da443ca-8590-4e4c-bc26-defea6467f50" ;;
  LabRunnerPPE[0-9]*@MngEnvMCAP825705.onmicrosoft.com)
    SUB_ID="e90f488d-02c7-4c79-a332-523afd8d1a44" ;;
  LabRunnerDevPPE[0-9]*@MngEnvMCAP825705.onmicrosoft.com)
    SUB_ID="d470c937-42bc-4a9c-9831-116799e343d9" ;;
  *)
    echo "[ERROR] Unknown account: $USER"
    exit 1 ;;
esac

az account set --subscription "$SUB_ID"
az account show --query name -o tsv
echo "===== Init Done ====="
