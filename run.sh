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

build_reporter() {
    docker build -f Dockerfile.reporter -t reporter-image .
}

run_reporter() {
    MSYS_NO_PATHCONV=1 docker run --rm -v "$(pwd)/data:/data" reporter-image
}

case "$1" in
    build_generator) build_generator ;;
    run_generator) run_generator ;;
    create_local_data) create_local_data ;;
    build_reporter) build_reporter ;;
    run_reporter) run_reporter ;;
esac