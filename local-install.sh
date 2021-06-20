#!/bin/bash
set -euo pipefail

module=$1
target=$2

# Generate types
echo "Generating new $module types..."
java -jar java-ts-bind-all.jar --packageJson $module/package.json

# Copy over existing types under node_modules/@craftjs-types
echo "Copying types over existing files at $target..."
cp $module/*.d.ts $target/node_modules/@craftjs-types/$module