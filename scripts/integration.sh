#!/usr/bin/env bash
# Runs the integration tests
set -euo pipefail

cd "$( dirname "${BASH_SOURCE[0]}" )/.."
source .envrc
./scripts/install_tools.sh

GINKGO_NODES=${GINKGO_NODES:-3}
GINKGO_ATTEMPTS=${GINKGO_ATTEMPTS:-2}
export CF_STACK=${CF_STACK:-windows2016}

UNCACHED_BUILDPACK_FILE=${UNCACHED_BUILDPACK_FILE:-""}
CACHED_BUILDPACK_FILE=${CACHED_BUILDPACK_FILE:-""}

cd src/*/integration

echo "Run Uncached Buildpack"
BUILDPACK_FILE="$UNCACHED_BUILDPACK_FILE" \
  ginkgo -r --flakeAttempts=$GINKGO_ATTEMPTS -nodes $GINKGO_NODES --slowSpecThreshold=60 -- --cached=false

echo "Run Cached Buildpack"
BUILDPACK_FILE="$CACHED_BUILDPACK_FILE" \
  ginkgo -r --flakeAttempts=$GINKGO_ATTEMPTS -nodes $GINKGO_NODES --slowSpecThreshold=60 -- --cached
