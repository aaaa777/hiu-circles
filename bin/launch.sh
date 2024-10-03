#!/usr/bin/env bash

# This script is used to launch the application.
eval "$(rbenv init -)"
bundle exec rails server -b 127.0.0.1 -p 3000