#!/bin/bash

set -eu

src_dir=./src
out_dir=./out

if [ ! -d "${out_dir}" ]; then
  mkdir "${out_dir}"
fi

# -I <dir> :Add directory to the end of the list of include search paths
# -E       :Only run the preprocessor
gcc -I "${src_dir}"/include -E "${src_dir}"/hi.c -o "${out_dir}"/hi.i
gcc -I "${src_dir}"/include -E "${src_dir}"/main.c -o "${out_dir}"/main.i
