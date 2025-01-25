#!/bin/bash

set -eu

out_dir=./out

if [ ! -d "${out_dir}" ]; then
  mkdir "${out_dir}"
fi

# -c :Write output to <file>
gcc -o "${out_dir}"/hi "${out_dir}"/hi.o "${out_dir}"/main.o
