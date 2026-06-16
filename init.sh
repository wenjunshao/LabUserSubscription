#!/bin/bash

echo "===== Cloud Shell Init Start ====="

# Get the current logged-in account
USER=$(az account show --query "user.name" -o tsv)

echo "[INFO] Current user: $USER"

# ===== mapping relationship =====
case $USER in
  "LabRunnerPPE1@MngEnvMCAP825705.onmicrosoft.com")
    SUB_ID="LabRunnerPPE1@MngEnvMCAP825705.onmicrosoft.com"
    ;;
  
  "wenjun@MngEnvMCAP825705.onmicrosoft.com")
    SUB_ID="d470c937-42bc-4a9c-9831-116799e343d9"
    ;;

  *)
    echo "[ERROR] Unknown account: $USER"
    exit 1
    ;;
esac

# ===== switch subscription =====
echo "[INFO] Switching subscription..."
az account set --subscription $SUB_ID > /dev/null 2>&1

# ===== output result =====
echo "[INFO] Current subscription:"
az account show --query name -o tsv

echo "===== Init Done ====="
