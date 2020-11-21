#!/usr/bin/env bash

set -euo pipefail

: ${DEMO_DIR:="$(mktemp -d "$(pwd)"/animal-api-demo-XXXX)"}

DEMO_NAME="$(basename $DEMO_DIR)"

DEMO_CMD="DEMO_DIR=\"$DEMO_DIR\" ./demo.sh"
SPEAKERNOTES_CMD="cd $DEMO_DIR && watch -t cat speakernotes"

tmux new-session \
  -s "$DEMO_NAME" \
  -n "$DEMO_NAME" \; \
  send-keys "$DEMO_CMD" C-m \; \
  split-window -h \; \
  send-keys "$SPEAKERNOTES_CMD" C-m \;

