#!/bin/bash

# Exit with nonzero exit code if anything fails
set -e

DEACTIVATION_DATE=$1
WORKFLOW_NAME=$2
CURRENT_DATE=$(date +'%Y-%m-%d')

echo "Deactivation Date: $DEACTIVATION_DATE"
echo "Current Date: $CURRENT_DATE"

if [[ "$CURRENT_DATE" > "$DEACTIVATION_DATE" ]]; then
  echo "This workflow is deactivated as of $DEACTIVATION_DATE."
  gh api -X PUT /repos/${GITHUB_REPOSITORY}/actions/workflows/${WORKFLOW_NAME}/disable -H "Authorization: token ${GH_TOKEN}"
  exit 0
fi
