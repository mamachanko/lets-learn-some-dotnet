#!/usr/bin/env bash

set -eo pipefail

# Call me with `-d -n` to run unattended.

: ${DEMO_DIR:="$(mktemp -d "$(pwd)"/animal-api-demo-XXXX)"}

source demo-magic.sh
source ~/.profile

clear

# Intro
pe "# Let's build something with .NET!"
pe "# We want to build an API that gives us animals"
pei "# 🐶 🐱"
pei ""

###############################
# Create the skeleton project #
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

# Create the web API project.
pe "# Now we create a web API project ..."
pe "dotnet new webapi --name AnimalApi --no-https --framework netcoreapp3.1"
rm AnimalApi/WeatherForecast.cs
rm AnimalApi/Controllers/WeatherForecastController.cs
pe "# ... and add it to the solution."
pe "dotnet sln AnimalApi.sln add AnimalApi"
pei ""

# Run the app for the 1st time.
pei "# We've got a skeleton app."
pe "# Let's run it 🏃"
pe "dotnet run --project AnimalApi"
pei ""

# Commit skeleton project.
pe "# This is our 1st commit"
pe "dotnet new gitignore"
pe "git add ."
pe "git commit --message \"Bootstrap Animal API\""
git clean -fxd
pei ""

# Explore the skeleton within Jetbrains' Rider.
pe "# Let's explore the skeleton app."
pe "tree"
pe "rider AnimalApi.sln"
pei ""

####################################################
# Implement GET /api/animals with a fixed response #
####################################################

pe "# Let's say we want to return animals now."
pei "# Our API should look like this:
pei "# GET /api/animals"
pei "# -> 🐶 & 🐱"
pei ""

pe "# We need tests."
pe "dotnet test"
pe "# No tests. We must create an integration test suite."
pe "dotnet new xunit --name AnimalApiIntegrationTests"
pe "dotnet sln AnimalApi.sln add AnimalApiIntegrationTests"
pe "dotnet add AnimalApiIntegrationTests package Microsoft.AspNetCore.Mvc.Testing --version 3.1"
pe "dotnet add AnimalApiIntegrationTests reference AnimalApi"
pe "dotnet test"
pei ""

pe "# Let's express our expectations through an integration test."
pe "dotnet add AnimalApiIntegrationTests package Quibble.Xunit"
pei ""

pe "# Let's see it in action."
pe "dotnet run --project AnimalApi"

# Commit GET /api/animals with fixed response.
pe "# This is our 2nd commit"
pe "git add ."
pe "git commit --message \"Return dog and cat on GET /api/animals\""
pei ""

################################
# Return animals from database #
################################

pe "# Now that we can return static animals,"
pei "# how about reading them from a database?"
pei ""

pe "# We need a couple of things for that:"
pei "# * a test for our controller"
pei "# * a DbContext<Animal>"
pei "# * a running database server"
pei "# * a connection to the database server"
pei "# * something that creates a database and loads it with animals"
pei ""

pe "# We need a project for our unit testing our controller"
pe "dotnet new xunit --name AnimalApiTests --framework netcoreapp3.1"
pe "dotnet add AnimalApiTests reference AnimalApi"
pe "dotnet sln AnimalApi.sln add AnimalApiTests"
pei ""

pe "# Off to the IDE! 🚁"

pe "# We need a DbContext<Animal>"
pe "dotnet add AnimalApi package Microsoft.EntityFrameworkCore.InMemory"
pei ""

pe "# Let's start a Postgres instance"
pe "docker run --detach --rm --name animaldb --publish 5432:5432 --env POSTGRES_PASSWORD=secret postgres:13.1-alpine"
pe "# Assert it is running"
pe "docker run --rm -it --network host --env PGPASSWORD=secret --env PGUSER=postgres --env PGHOST=127.0.0.1 postgres:13.1-alpine psql --command '\l'"
pei ""

pe "# We need a connection to the database server"
pe "dotnet add AnimalApi package Npgsql.EntityFrame workCore.PostgreSQL"
pei ""

############
# The end. #
############

# Done.
pe "# We're done"
pei "# Thank you 🙇"

