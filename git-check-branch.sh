#!/usr/bin/env bash

# Check that the input is not empty
# If it is, print an error message and exit
if [ -z "$1" ]; then
  echo "Error: No branch name provided"
  exit 1
fi
