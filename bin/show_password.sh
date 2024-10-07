#!/bin/bash

rails credentials:show | ruby -e "require 'yaml'; puts YAML.load(STDIN.read).dig('mailer', 'password')"
