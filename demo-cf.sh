#!/usr/bin/env bash

set -eo pipefail

# Call me with `-d -n` to run unattended.

source demo-magic.sh
source ~/.profile

: ${DEMO_DIR:="$(mktemp -d "$(pwd)"/animal-api-demo-XXXX)"}

if ! docker ps > /dev/null; then
  echo "docker is not running"
  exit 1;
fi

if [ "$( docker container inspect -f '{{.State.Running}}' animaldb )" == "true" ]; then
  echo "animaldb is already running"
  exit 1;
fi

if ! which dotnet > /dev/null; then
  echo "dotnet is not on the PATH"
  exit 1;
fi

if ! which rider > /dev/null; then
  echo "rider is not on the PATH"
  exit 1;
fi

# TODO
# test cf logged in

# TODO
# test cf logged in

#########
# Intro #
#########

pe "# We need packages!"
pe "dotnet add AnimalApi package Steeltoe.CloudFoundry.Connector.EFCore --version 2.5.1"
pe "dotnet add AnimalApi package Steeltoe.Common.Hosting --version 2.5.1"

# Add config provider
# Add CF hosting

# Update AddDbContext

# Update appsettings.json


############
# The end. #
############

pe "# We're done"
pei "# Thank you 🙇"

