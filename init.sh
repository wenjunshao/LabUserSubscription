#!/bin/bash

echo "===== Cloud Shell Init Start ====="


# confirm shell type
if [ -n "$PSVersionTable" ] || [ -n "$PSModulePath" ]; then
    SHELL_TYPE="powershell"
else
    SHELL_TYPE="bash"
fi

echo "[INFO] Detected shell: $SHELL_TYPE"


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


# Execute different logics based on the shell
if [ "$SHELL_TYPE" == "bash" ]; then
  az account set --subscription $SUB_ID > /dev/null 2>&1
  az account show --query name -o tsv
elif [ "$SHELL_TYPE" == "powershell" ]; then
  pwsh -Command "Set-AzContext -SubscriptionId '$SUB_ID' | Out-Null"
  
  az account set --subscription $SUB_ID > /dev/null 2>&1
  az account show --query name -o tsv
else
  echo "[ERROR] Unknown shell type"
  exit 1
fi


echo "===== Init Done ====="
