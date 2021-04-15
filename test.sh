#!/bin/bash

set -euo pipefail

expect_run() {
  local im="$1"
  local expected="$2"
  local actual="$(docker run "$im")"

  if [ "$actual" = "$expected" ]; then
    echo >&2 "PASS: $im"
  else
    echo >&2 "FAIL: $im actual $actual != expected $expected"
    exit 1
  fi
}

docker build -t docker-build-repro-v1 --target v1 .
expect_run docker-build-repro-v1 v1

docker build -t docker-build-repro-v2 --target v2 .
expect_run docker-build-repro-v2 v2

docker buildx bake --load
expect_run docker-buildx-bake-repro-v1 v1
expect_run docker-buildx-bake-repro-v2 v2
