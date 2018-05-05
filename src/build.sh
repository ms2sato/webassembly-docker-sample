#!/usr/bin/env bash

file="$1"
source_dir="/src"
temp_dir="/tmp"
filename=$(basename "$1")
extension="${filename##*.}"
filename="${filename%.*}"


echo "Start compiling ${file}  ...."

cd "${source_dir}"

# @see https://github.com/WebAssembly/binaryen/issues/1447
clang -emit-llvm --target=wasm32-unknown-unknown-elf -nostdlib -S "$filename".c

llc "$filename".ll -march=wasm32 -filetype=asm -o "$filename".s
s2wasm "$filename".s > "$filename".wast
wat2wasm -o "$filename".wasm "$filename".wast
# rm -f "$filename".ll
# rm -f "$filename".s
# rm -f "$filename".wast
chmod 777  -R "$filename".wasm
cp "$filename".wasm "/var/www/html/${filename}.wasm"

echo "Finished compiling $1 to "${filename}.wasm"!"