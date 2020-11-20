#!/usr/bin/env bash

set -eo pipefail

# Call me with `-d -n` to run unattended.

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

source demo-magic.sh
source ~/.profile

clear

# Intro
pe "# Let's build something with .NET!"
pe "# We want to build an API that gives us animals"
pei "# 🐶 🐱"
pei ""

###############################
# Create the project skeleton #
###############################

# Create the project dir.
pe "# We need a place for the project"
p "mkdir animal-api"
p "cd animal-api"
cd "$DEMO_DIR"
pe "git init"
pei ""

# Create the .NET solution.
pe "# We begin by creating a \"solution\"."
pe "dotnet new solution --name AnimalApi"
pei ""
clear

# Create the web API project.
pe "# Now we create a web API project ..."
pe "dotnet new webapi --name AnimalApi --no-https --framework netcoreapp3.1"
rm AnimalApi/WeatherForecast.cs
rm AnimalApi/Controllers/WeatherForecastController.cs
pe "# ... and add it to the solution."
pe "dotnet sln AnimalApi.sln add AnimalApi"
pei ""
clear

# Run the app for the 1st time.
pei "# We've got a skeleton app."
pe "# Let's run it 🏃"
pe "dotnet run --project AnimalApi"
pei ""
clear

# Explore the skeleton within Jetbrains' Rider.
pe "# Let's explore the skeleton app."
rm -rf AnimalApi/bin AnimalApi/obj
pe "tree"
pe "rider AnimalApi.sln"
pei ""
clear

# notes:
# * talk about Program & Startup

# Commit project skeleton.
pe "# This is our 1st commit"
pe "dotnet new gitignore"
pe "git add ."
pe "git commit --message \"Bootstrap Animal API\""
git clean -fxd
pei ""
clear

####################################################
# Implement GET /api/animals with a fixed response #
####################################################

pe "# Let's say we want to return animals now."
pei "# Our API should look like this:"
pei "# GET /api/animals"
pei "# -> 🐶 & 🐱"
pei ""
clear

pe "# We need tests."
pe "dotnet test"
pe "# No tests 🤷 We must create an integration test suite."
pe "dotnet new xunit --name AnimalApiIntegrationTests"
pe "dotnet sln AnimalApi.sln add AnimalApiIntegrationTests"
pe "dotnet add AnimalApiIntegrationTests package Microsoft.AspNetCore.Mvc.Testing --version 3.1"
pe "dotnet add AnimalApiIntegrationTests package Quibble.Xunit"
pe "dotnet add AnimalApiIntegrationTests reference AnimalApi"
pe "dotnet test"
pei ""
clear

pe "# Let's express our expectations through an integration test."
pei ""
clear

# notes:
# * create integration test inheriting from IClassFixture<WebApplicationFactory<Startup>>
# * create controller
# * create Animal {ID, Name}

pe "# Let's see the app in action."
pe "dotnet run --project AnimalApi"
pei ""
clear

# Commit GET /api/animals with fixed response.
pe "# This is our 2nd commit"
pe "git add ."
pe "git commit --message \"Return dog and cat on GET /api/animals\""
pei ""
clear

##########################
# Return animals from DB #
##########################

pe "# Now that we can return static animals,"
pei "# how about reading them from a database?"
pei ""
clear

pe "# We need a couple of things for that:"
pei "# * a unit test for our controller"
pei "# * a DbContext<Animal>"
pei "# * something that creates a database and loads animal on application startup"
pei "# * a running database server"
pei "# * a connection to the database server"
pei ""
clear

pe "# We need a new project for our unit testing things"
pe "dotnet new xunit --name AnimalApiTests --framework netcoreapp3.1"
pe "dotnet add AnimalApiTests reference AnimalApi"
pe "dotnet sln AnimalApi.sln add AnimalApiTests"
pe "# ... and we need packages for speaking to Postgres"
pe "dotnet add AnimalApi package Microsoft.EntityFrameworkCore.InMemory"
pe "dotnet add AnimalApi package Npgsql.EntityFrameworkCore.PostgreSQL"
pei ""
clear

pe "# Off to the IDE! 🚁"
pei ""
clear

# notes:
# * create DbContext<Animal>
# * register with DI container
# * create IStartupFilter
# * register with DI container
# * create Animal {ID, Name}

pe "# Let's start a Postgres instance"
pe "docker run --detach --rm --name animaldb --publish 5432:5432 --env POSTGRES_PASSWORD=secret postgres:13.1-alpine"
pe "# Is it running?"
pe "docker run --rm -it --network host --env PGPASSWORD=secret --env PGUSER=postgres --env PGHOST=127.0.0.1 postgres:13.1-alpine psql --command '\l'"
pei ""
clear

pe "# Off to the IDE again! 🚁"
pei ""
clear

pe "# Let's see the app in action."
pe "dotnet run --project AnimalApi"
pei ""
clear

# Commit GET /api/animals from DB.
pe "# This is our 3rd commit"
pe "git add ."
pe "git commit --message \"Read animals from DB\""
pei ""
clear

############
# The end. #
############

pe "# We\'re done"
pei "# Thank you 🙇"

