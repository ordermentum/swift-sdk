#!/usr/bin/env bash
set -eu
bundle exec fastlane test
bash <(curl -s https://codecov.io/bash) -X xcodellvm
