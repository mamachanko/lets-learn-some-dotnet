#!/usr/bin/env bash

set -eo pipefail

# Call me with `-d -n` to run unattended.

source demo-magic.sh
source ~/.profile

DEMO_PROMPT="📚 ❯ "
: "${DEMO_DIR:="$(mktemp -d "$(pwd)"/basics-demo-XXXX)"}"

if ! which dotnet > /dev/null; then
  echo "dotnet is not on the PATH"
  exit 1;
fi

if ! which rider > /dev/null; then
  echo "rider is not on the PATH"
  exit 1;
fi

clear

#########
# Intro #
#########

pe "echo hello"

############
# The end. #
############

pe "# We're done"
pei "# Thank you 🙇"

