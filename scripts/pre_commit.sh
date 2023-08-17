#!/bin/bash

printf "\e[33;1m%s\e[0m\n" 'Pre-Commit'

# Generate Assets and Freezed
printf "\e[33;1m%s\e[0m\n" '=== Generate Assets and Freezed ==='
scripts/generate_assets_and_freezed.sh
if [ $? -ne 0 ]; then
  printf "\e[31;1m%s\e[0m\n" '=== Generate Assets and Freezed error ==='
  exit 1
fi
printf "\e[33;1m%s\e[0m\n" 'Finished running Generate Assets and Freezed'
printf '%s\n' "${avar}"

# Generate Locales
printf "\e[33;1m%s\e[0m\n" '=== Generate Locales ==='
scripts/generate_locales.sh
if [ $? -ne 0 ]; then
  printf "\e[31;1m%s\e[0m\n" '=== Generate locales error ==='
  exit 1
fi
printf "\e[33;1m%s\e[0m\n" 'Finished running Generate Locales'
printf '%s\n' "${avar}"

# Flutter Analyzer
printf "\e[33;1m%s\e[0m\n" '=== Running Flutter analyzer ==='
scripts/analyze.sh
if [ $? -ne 0 ]; then
  printf "\e[31;1m%s\e[0m\n" '=== Flutter analyzer error ==='
  exit 1
fi
printf "\e[33;1m%s\e[0m\n" 'Finished running Flutter analyzer'
printf '%s\n' "${avar}"

# If we made it this far, the commit is allowed
exit 0