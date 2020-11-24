#!/usr/bin/env bash

set -eo pipefail

# Call me with `-d -n` to run unattended.

source demo-magic.sh
source ~/.profile

DEMO_PROMPT="⛅ ❯ "
: "${DEMO_DIR:="$(mktemp -d "$(pwd)"/animal-api-demo-cf-XXXX)"}"

docker rm -f animaldb || true

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

clear

#########
# Intro #
#########

pe "# Picking up where we left off"
p "cd animal-api"
cp -r animal-api-reference-tdd/* $DEMO_DIR
cd "$DEMO_DIR"
rm -rf **/bin **/obj
pe "tree"
pe ""

pe "# Let's start a Postgres instance"
pe "docker run --detach --rm --name animaldb --publish 5432:5432 --env POSTGRES_PASSWORD=secret postgres:13.1-alpine"
pe "# Is it running?"
pe "docker run --rm -it --network host --env PGPASSWORD=secret --env PGUSER=postgres --env PGHOST=127.0.0.1 postgres:13.1-alpine psql --command '\l'"
pe ""

clear
pe "# Are we green still?"
pe "dotnet test"
pe ""

clear
pe "# Let's see it in action"
pe "dotnet run --project AnimalApi"
pe ""

#####################################################
# Demonstrate unsuccessful Cloud Foundry deployment #
#####################################################

clear
pe "# Let's deploy the animal API to CF."
pe "cf apps"
pe "cf push animal-api -p AnimalApi --no-start"
pe "cf services"
pe "cf bind-service animal-api animal-db"
pe "cf start animal-api || true"
pe "cf apps"
pe "# The app does not start. 🤔"
pe "cf logs animal-api --recent"
pe "# It can't connect to the database. 🔌"
pe ""

########################################
# Prepare for Cloud Foundry deployment #
########################################

clear
pe "# Let's fix that by making the animal API fit for the cloud."
pe "# We need packages!"
pe "dotnet add AnimalApi package Steeltoe.CloudFoundry.Connector.EFCore --version 2.5.1"
pe "dotnet add AnimalApi package Steeltoe.Common.Hosting --version 2.5.1"
pe "# visit https://steeltoe.io 🔨🦶"
pe ""

pe "# We need to make a few code changes too. 🚁"
pe "rider AnimalApi.sln"
pe ""

# notes:
#  * Add config provider
#  * Add CF hosting
#  * Update services.AddDbContext
#  * Update appsettings.json

###########################
# Deploy to Cloud Foundry #
###########################

pe "# Now with the changes in place, let's deploy again."
pe "cf push animal-api -p AnimalApi"
pe "# And GET /api/animals"
pe "http https://animal-api.apps.pcfone.io/api/animals"
pei "# 🐶 & 🐱 in the ⛅ !"
pe ""

pe "# Wait! The 🐙 is missing!"
pe "cf env animal-api | grep -i 'db_host\|password\|username'"
pe ""

clear
pe "# This is our one and only commit 💪"
pe "git add ."
pe "git commit --message \"Make fit for cloud\""
git clean -fxd
pei ""

############
# The end. #
############

pe "# We're done"
pei "# Thank you 🙇"

