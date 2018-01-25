#!/bin/bash
# `before_deploy` phase: here we package the build artifacts

set -ex

mktempd() {
    mktemp -d 2>/dev/null || mktemp -d -t tmp
}

main() {
    local td=$(mktempd)
    local out_dir=$(pwd)/build

    mkdir -p "$out_dir"

    # build a release version
    mkdir -p "$td/release"
    stack build --local-bin-path="$td/release" --ghc-options="-O2" --copy-bins

    pushd "$td/release"
    tar czf "$out_dir/${PROJECT_NAME}-${TRAVIS_TAG}-${TARGET}-release.tar.gz" ./*
    popd

    rm -r "$td"
}

main
