#!/usr/bin/env bash

set -eo pipefail

# Call me with `-d -n` to run unattended.

source demo-magic.sh
source ~/.profile

DEMO_PROMPT="⛅ ❯ "
: "${DEMO_DIR:="$(mktemp -d "$(pwd)"/animal-api-demo-cf-XXXX)"}"

if ! cf target > /dev/null; then
  echo "not logged into cf"
  exit 1;
fi

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

cf delete -f animal-api
cf delete-service -f animal-db

clear

#########
# Intro #
#########

pe "# Picking up where we left off"
p "cd animal-api"
cp -r animal-api-reference-tdd/* $DEMO_DIR
rm -rf **/bin **/obj
cd "$DEMO_DIR"
pe "tree"
pe ""

pe "# Let's start a Postgres instance"
pe "docker run --detach --rm --name animaldb --publish 5432:5432 --env POSTGRES_PASSWORD=secret postgres:13.1-alpine"
pe "# Is it running?"
pe "docker run --rm -it --network host --env PGPASSWORD=secret --env PGUSER=postgres --env PGHOST=127.0.0.1 postgres:13.1-alpine psql --command '\l'"
pe ""

pe "# Are we green still?"
pe "dotnet test"
pe ""

pe "# Let's see it in action"
pe "dotnet run --project AnimalApi"
pe ""

#####################################################
# Demonstrate unsuccessful Cloud Foundry deployment #
#####################################################

pe "cf create-service elephantsql turtle animal-db"
pe "cf push animal-api -p AnimalApi --no-start"
pe "cf start animal-api"

########################################
# Prepare for Cloud Foundry deployment #
########################################

pe "# We need packages!"
pe "dotnet add AnimalApi package Steeltoe.CloudFoundry.Connector.EFCore --version 2.5.1"
pe "dotnet add AnimalApi package Steeltoe.Common.Hosting --version 2.5.1"

# Add config provider
# Add CF hosting

# Update services.AddDbContext

# Update appsettings.json

###########################
# Deploy to Cloud Foundry #
###########################

cf push animal-api -p AnimalApi

# connect to db

############
# The end. #
############

pe "# We're done"
pei "# Thank you 🙇"

