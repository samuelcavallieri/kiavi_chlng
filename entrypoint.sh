#!/bin/bash

bundle install
rails generate spina:install
rails db:migrate

rails s -b 0.0.0.0