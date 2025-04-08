#!/bin/bash

# Install Wasp
curl -sSL https://get.wasp-lang.dev/installer.sh | sh

# Add Wasp to PATH
export PATH=$PATH:/root/.local/bin

# Install dependencies
npm install

# Build the application
npx wasp build 