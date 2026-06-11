#!/bin/bash

build_generator() {
    docker build -f Dockerfile.generator -t generator-image .
}

run_generator() {
    mkdir -p data
    MSYS_NO_PATHCONV=1 docker run --rm -v "$(pwd)/data:/data" generator-image
}

create_local_data() {
    mkdir -p local_data
    python generate.py local_data
}

case "$1" in
    build_generator) build_generator ;;
    run_generator) run_generator ;;
    create_local_data) create_local_data ;;
esac