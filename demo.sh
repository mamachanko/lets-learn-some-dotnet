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

pe "# TODO"
pei ""


############
# The end. #
############

# Done.
pe "# We're done"
pei "# Thank you 🙇"

