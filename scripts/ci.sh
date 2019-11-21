#!/usr/bin/env bash

CURRENT_BRANCH=$(git rev-parse --abbrev-ref HEAD)
CHANGES=$(git rev-list --left-right --count master...$CURRENT_BRANCH --count)
BEHIND_ZERO=$(echo $CHANGES | grep '^0\s')

if [[ "$BEHIND_ZERO" == "" ]]; then
  echo "Cannot merge behind master"
  exit 1
fi

exit 0
