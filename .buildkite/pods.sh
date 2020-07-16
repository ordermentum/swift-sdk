#!/usr/bin/env bash
set -eu

bundle exec pod update && pod install --repo-update
