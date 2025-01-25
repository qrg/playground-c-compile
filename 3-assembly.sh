#!/bin/bash

set -eu

out_dir=./out

if [ ! -d "${out_dir}" ]; then
  mkdir "${out_dir}"
fi

# -c :Only run preprocess, compile, and assemble steps
gcc -c "${out_dir}"/hi.s -o "${out_dir}"/hi.o
gcc -c "${out_dir}"/main.s -o "${out_dir}"/main.o
