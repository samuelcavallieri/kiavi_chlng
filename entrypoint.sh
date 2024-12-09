#!/bin/bash

rails generate spina:install
rails db:create
rails db:migrate

# Start the Rails server
rails s -b 0.0.0.0