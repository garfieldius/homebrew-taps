#!/usr/bin/env bash

set -eu -o pipefail

DIR=$(cd "$(dirname ${0})" && pwd)
PROJECT=${1:-}

if [[ "${PROJECT}" = "" ]]; then
    echo "no project given" 1>&2
    exit1
fi

SRC_FILE="${DIR}/tmpl/${PROJECT}/formula.rb"

if [[ ! -f ${SRC_FILE} ]]; then
    echo "no formula file template found for ${PROJECT}" 1>&2
    exit 1
fi

VARS_FILE="${DIR}/tmpl/${PROJECT}/vars.sh"

if [[ ! -f ${VARS_FILE} ]]; then
    echo "no vars file found for ${PROJECT}" 1>&2
    exit 1
fi

. ${VARS_FILE}
TARGET_FILE="${DIR}/Formula/${PROJECT}.rb"

VERSION="$(git ls-remote --tags "git@github.com:garfieldius/${PROJECT}.git" | awk '{print $2}' | cut -b11- | sed 's,[^\.0-9],,g' | sort | tail -n 1)"
SHASUM_MACOS_X64=$(curl -fsSL "https://github.com/garfieldius/${PROJECT}/releases/download/v${VERSION}/${PROJECT}-${VERSION}.${MACOS_X64}.bottle.tar.gz.sha256.txt")
SHASUM_MACOS_ARM64=$(curl -fsSL "https://github.com/garfieldius/${PROJECT}/releases/download/v${VERSION}/${PROJECT}-${VERSION}.${MACOS_ARM64}.bottle.tar.gz.sha256.txt")
SHASUM_LINUX=$(curl -fsSL "https://github.com/garfieldius/${PROJECT}/releases/download/v${VERSION}/${PROJECT}-${VERSION}.x86_64_linux.bottle.tar.gz.sha256.txt")
SHASUM_SOURCE=$(curl -fsSL "https://github.com/garfieldius/${PROJECT}/archive/v${VERSION}.tar.gz" | sha256sum | cut -b-64)
DATE=$(date +"%Y.%m.%d %H:%M:%S")

cat "${SRC_FILE}" \
  | sed "s,__VERSION__,${VERSION}," \
  | sed "s,__MACOS_X64__,${MACOS_X64}," \
  | sed "s,__MACOS_ARM64__,${MACOS_ARM64}," \
  | sed "s,__SHASUM_MACOS_X64__,${SHASUM_MACOS_X64}," \
  | sed "s,__SHASUM_MACOS_ARM64__,${SHASUM_MACOS_ARM64}," \
  | sed "s,__SHASUM_LINUX__,${SHASUM_LINUX}," \
  | sed "s,__SHASUM_SOURCE__,${SHASUM_SOURCE}," \
  | sed "s,__DATE__,${DATE}," \
  > "${TARGET_FILE}"
