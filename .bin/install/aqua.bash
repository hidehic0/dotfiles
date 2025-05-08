#!/bin/bash

curl -sSfL -O https://raw.githubusercontent.com/aquaproj/aqua-installer/v3.1.2/aqua-installer
echo "9a5afb16da7191fbbc0c0240a67e79eecb0f765697ace74c70421377c99f0423  aqua-installer" | sha256sum -c -
chmod +x aqua-installer
./aqua-installer
