#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Check if Ruby dependencies are installed; if not, install them
bundle check || bundle install

# Ensure the database is prepared (migrated and seeded if necessary)
echo "Preparing the database..."
bundle exec rails db:prepare

# Install Spina if not already configured
echo "Setting up Spina..."
bundle exec rails spina:install || echo "Spina is already configured."

# Start the Rails server
echo "Starting Rails server..."
exec "$@"
