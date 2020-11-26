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

pe "# What is it ❓"
pe "# What you can do ❗"
pe "# How you do it ❓❗"
pe ""
pe "# 🤷"
pei "dotnet --help"

# the idea:
# identify animals by feature
# read a feature from stdin
# write matching animals to stdout

# the cli part in C#
# the identification part in F#

dotnet new solution --name AnimalCompendium
tree

dotnet new console --name Cli
dotnet sln AnimalCompendium.sln add Cli
tree

dotnet run --project Cli

dotnet new classlib --name Lib --language "F#"
dotnet sln AnimalCompendium.sln add Lib
dotnet add Cli reference Lib
tree


rider AnimalCompendium.sln

# using System;
# using System.Linq;
# using static AnimalCompendiumLib.AnimalCompendium;
# 
# namespace AnimalCompendiumCli
# {
#     class Program
#     {
#         static void Main(string[] args)
#         {
#             var feature = Console.ReadLine();
#             var animals = Identify(feature);
# 
#             if (animals.Any())
#             {
#                 foreach (var animal in animals)
#                 {
#                     Console.WriteLine(animal);
#                 }
#             }
#             else
#             {
#                 Console.Error.WriteLine("Could not identify any animals.");
#             }
#         }
#     }
# }

# namespace AnimalCompendiumLib
# 
# module AnimalCompendium =
# 
#     let dog = "🐶"
#     let cat = "🐱"
#     let octopus = "🐙"
# 
#     let Identify (feature: string): List<string> =
#         match feature with
#         | "walks" -> [ cat; dog ]
#         | "barks" -> [ dog ]
#         | "meows" -> [ cat ]
#         | "swims" -> [ octopus ]
#         | _ -> []
# 


echo walks | dotnet run --project Cli

dotnet publish --self-contained --runtime osx-x64 --output ./out

echo walks | ./out/Cli
echo barks | ./out/Cli
echo swims | ./out/Cli

# Demo
# * dotnet cli
# * create an c# console app
# * IDEs
# * create an f# library
# * run it
# * publish it

############
# The end. #
############

pe "# We're done"
pei "# Thank you 🙇"

