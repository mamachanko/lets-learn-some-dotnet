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

pe "# So .NET ❓"
pei "# 🤷"
pei "dotnet --help"
pe ""


############
# The idea #
############

pe "# Let's build something"
pe "# How about an 'animal compendium' that can identify animals by feature?"
pe "# echo barks | animal-compendium"
pei "# 🐶"
pe "# echo walks | animal-compendium"
pei "# 🐶"
pei "# 🐱"

# the idea:
# identify animals by feature
# read a feature from stdin
# write matching animals to stdout

#############
# The build #
#############

pe "# Let's build the cli part with C#"
pei "# and the identification bit with F#."
pe ""

clear
p "mkdir animal-compendium"
p "cd animal-compendium"
cd "$DEMO_DIR"

pe "# We need a 'solution'."
pe "dotnet new solution --name AnimalCompendium"
rm -rf -- **/bin **/obj
pe "tree"

pe "dotnet new console --name animal-compendium"
pe "dotnet sln AnimalCompendium.sln add animal-compendium"
rm -rf -- **/bin **/obj
pe "tree"
pe ""

clear
pe "dotnet run --project animal-compendium"
pe ""

pe "rider AnimalCompendium.sln"

cat <<EOF | pbcopy
using System;
using static animal-compendium.AnimalCompendium;

namespace AnimalCompendium.animal-compendium
{
    class Program
    {
        static void Main(string[] args)
        {
            var feature = Console.ReadLine();

            foreach (var animal in Identify(feature))
            {
                Console.WriteLine(animal);
            }
        }
    }
}
EOF

pe "dotnet new classlib --name animal-lib --language 'F#'"
pe "dotnet sln AnimalCompendium.sln add animal-lib"
pe "dotnet add animal-compendium reference animal-lib"
rm -rf -- **/bin **/obj
pe "tree"

cat <<EOF | pbcopy
namespace lib

module AnimalCompendium =

    let dog = "🐶"
    let cat = "🐱"
    let octopus = "🐙"

    let Identify feature =
        match feature with
        | "barks" -> [ dog ]
        | "meows" -> [ cat ]
        | "walks" -> [ cat; dog ]
        | "swims" -> [ octopus ]
        | _ -> []

EOF

p "# Back to the IDE 🚁"

clear
pe "echo barks | dotnet run --project animal-compendium"
pe "echo walks | dotnet run --project animal-compendium"
pe ""

clear
pe "# Let's publish a binary."
pe "dotnet publish --self-contained --runtime osx-x64 --output ./build"
p 'export PATH="$(pwd)/build:$PATH"'
export PATH="$(pwd)/build:$PATH"
pe ""

pe "echo walks | animal-compendium"
pe "echo barks | animal-compendium"
pe "echo swims | animal-compendium"
pe ""

############
# The end. #
############

clear
p "# We're done"
pei "# Thank you 🙇"

