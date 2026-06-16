#!/bin/bash
# === BASH branch (called by the one-line dispatcher) ===
# Pins the Azure CLI subscription. The ~/.azure config is shared by both
# the Bash and PowerShell Cloud Shell, so `az` commands in either UI will use it.

echo "===== Cloud Shell Init Start (bash) ====="

# Get the current logged-in account
USER=$(az account show --query "user.name" -o tsv)
echo "[INFO] Current user: $USER"

# ===== mapping relationship =====
case $USER in
  "LabRunnerPPE1@MngEnvMCAP825705.onmicrosoft.com")
    SUB_ID="e90f488d-02c7-4c79-a332-523afd8d1a44"
    ;;

  "wenjun@MngEnvMCAP825705.onmicrosoft.com")
    SUB_ID="d470c937-42bc-4a9c-9831-116799e343d9"
    ;;

  *)
    echo "[ERROR] Unknown account: $USER"
    exit 1
    ;;
esac

# Pin the Azure CLI subscription
az account set --subscription "$SUB_ID" > /dev/null 2>&1
az account show --query name -o tsv

echo "===== Init Done ====="
