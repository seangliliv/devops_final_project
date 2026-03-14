#!/bin/bash

set -e

echo "=== GCloud Application Default Credentials Setup ==="

# Step 1: Create the missing directory
echo "[1/3] Creating ~/.config/gcloud directory..."
mkdir -p ~/.config/gcloud
echo "✓ Directory created"

# Step 2: Authenticate - detect headless or interactive
echo "[2/3] Authenticating with gcloud..."

if [ -t 0 ] && [ -n "$DISPLAY" ] || [ -n "$WAYLAND_DISPLAY" ]; then
  echo "→ Browser detected, launching interactive login..."
  gcloud auth application-default login
else
  echo "→ Headless environment detected, using no-launch-browser..."
  gcloud auth application-default login --no-launch-browser
fi

# Step 3: Verify credentials file
echo "[3/3] Verifying credentials file..."
CREDS_FILE="$HOME/.config/gcloud/application_default_credentials.json"

if [ -f "$CREDS_FILE" ]; then
  echo "✓ Credentials file found at: $CREDS_FILE"
else
  echo "✗ Credentials file NOT found. Authentication may have failed."
  exit 1
fi

echo ""
echo "=== Setup Complete ==="