#!/usr/bin/env bash
set -euo pipefail

DIR="/tmp/SbarLua"

git clone https://github.com/FelixKratz/SbarLua.git "$DIR"

pushd "$DIR"
make install
popd

rm -rf "$DIR"

brew services restart sketchybar
