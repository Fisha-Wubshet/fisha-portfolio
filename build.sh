#!/usr/bin/env bash
set -euxo pipefail

if [ ! -d "flutter" ]; then
  echo ">>> Cloning Flutter SDK (stable, shallow)"
  git clone --depth 1 -b stable https://github.com/flutter/flutter.git
else
  echo ">>> Updating Flutter SDK"
  (cd flutter && git pull --ff-only)
fi

export PATH="$PWD/flutter/bin:$PATH"

echo ">>> Flutter version"
flutter --version

echo ">>> Enabling web"
flutter config --enable-web

echo ">>> Pub get"
flutter pub get

echo ">>> Building web"
flutter build web --release

echo ">>> Build complete. Contents of build/web:"
ls -la build/web
