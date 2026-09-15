#!/usr/bin/env bash
set -euxo pipefail

FLUTTER_VERSION="3.29.3"

if [ ! -d "flutter" ]; then
  echo ">>> Cloning Flutter SDK $FLUTTER_VERSION (shallow)"
  git clone --depth 1 -b "$FLUTTER_VERSION" https://github.com/flutter/flutter.git
else
  echo ">>> Ensuring Flutter SDK is on $FLUTTER_VERSION"
  (cd flutter && git fetch --depth 1 origin "$FLUTTER_VERSION" && git checkout "$FLUTTER_VERSION")
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
