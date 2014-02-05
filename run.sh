#!/bin/bash

cd /home/gyazo
source import/env

bundle exec rackup --port 80 -E production


