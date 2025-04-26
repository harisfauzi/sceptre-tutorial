#!/usr/bin/env bash

function hello() {
  local name="$1"
  echo "Hello, $name!"
}

hello "$@"