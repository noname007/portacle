#!/bin/bash

readonly TAG=
readonly REPOSITORY=
readonly SSL_CA=https://curl.haxx.se/ca/cacert-2016-04-20.pem

###

readonly PROGRAM=global
source common.sh

function install() {
    mkdir -p "$SHARED_DIR/lib"
    case "$PLATFORM" in
        lin) cp -fuv "/lib64/ld-linux-x86-64.so.2" "$SHARED_DIR/lib/ld-linux.so" ;;
    esac

    mkdir -p "$SHARED_DIR/ssl"
    curl -o "$SHARED_DIR/ssl/ca-bundle.crt" "$SSL_CA"
}

main
