#!/bin/bash
set -eu -o pipefail

echo "Install tar utils..."
sudo yum install -y tar which xz bzip2

VERSION=0.11.2

echo "Download sdk..."
curl -L -s https://github.com/zephyrproject-rtos/sdk-ng/releases/download/v${VERSION}/zephyr-sdk-${VERSION}-setup.run -o zephyr-sdk-${VERSION}-setup.run

echo "install sdk..."
chmod +x zephyr-sdk-${VERSION}-setup.run
sudo ./zephyr-sdk-${VERSION}-setup.run --quiet -- -d /opt/sdk/zephyr-sdk-${VERSION}

echo "cleanup sdk pkg..."
rm zephyr-sdk-${VERSION}-setup.run
