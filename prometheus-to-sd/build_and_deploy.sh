#!/usr/bin/env bash

set -euo pipefail

TAG=${1:-}
if [[ -z $TAG ]]; then
  echo "Missing image tag paramter."
  exit 1
fi

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )/"
cd $SCRIPT_DIR
docker build . -t docker.artifactory.cloudkitchens.internal/prometheus-to-sd-internal:${TAG}
docker push docker.artifactory.cloudkitchens.internal/prometheus-to-sd-internal:${TAG}
