#!/bin/bash

set -eu

out_dir=./out

if [ ! -d "${out_dir}" ]; then
  mkdir "${out_dir}"
fi

# -S :Only run preprocess and compilation steps
gcc -S "${out_dir}"/hi.i -o "${out_dir}"/hi.s
gcc -S "${out_dir}"/main.i -o "${out_dir}"/main.s
