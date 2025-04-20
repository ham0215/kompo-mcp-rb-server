#!/bin/zsh
# Script to run the Ruby server

# Navigate to the directory containing the script
cd "$(dirname "$0")"

# Install dependencies using bundler
echo "Installing dependencies..."
bundle install

# Run the Ruby server
echo "Starting Ruby server..."
ruby server.rb
