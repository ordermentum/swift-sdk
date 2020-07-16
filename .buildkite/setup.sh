#!/usr/bin/env bash
set -eu
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

brew list swiftlint || brew install swiftlint
brew list getsentry/tools/sentry-cli || brew install getsentry/tools/sentry-cli

rbenv rehash
gem install bundler
bundle install --path vendor/bundle