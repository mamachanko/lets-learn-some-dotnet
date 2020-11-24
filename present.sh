#!/usr/bin/env bash

set -euo pipefail

: "${THEME:="snazzy"}"

kitty_theme try "$THEME" tmux

