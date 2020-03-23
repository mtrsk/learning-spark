#!/usr/bin/env bash

urls=(
    "http://files.grouplens.org/datasets/movielens/ml-100k.zip"
)

[[ -d "$(pwd)/data" ]] || mkdir "$(pwd)/data"; touch "$(pwd)/data/.gitkeep";

for url in "${urls[@]}"; do
    filename="$(echo "${url}" | awk -F/ '{print $NF}')"
    path="$(pwd)/data/${filename}"
    echo "Downloding dataset: ${url}"
    [[ -f "${path}" ]] || curl "${url}" -o "${path}"
    echo "Saved on: ${path}"
done
