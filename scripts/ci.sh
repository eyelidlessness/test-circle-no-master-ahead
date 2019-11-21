#!/usr/bin/env bash

if [[ "$DEPLOYMENT_BRANCH" == "" ]]; then
    echo "Environment variable \$DEPLOYMENT_BRANCH must be configured"
    exit 1
fi

CURRENT_BRANCH=$(git rev-parse --abbrev-ref HEAD)
CHANGES=$(git rev-list --left-right --count $DEPLOYMENT_BRANCH...$CURRENT_BRANCH --count)
BEHIND_ZERO=$(echo $CHANGES | grep '^0\s')

if [[ "$BEHIND_ZERO" == "" ]]; then
    echo "Unable to merge when behind master"
    exit 1
fi

exit 0
