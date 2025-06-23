#!/bin/bash

if [ ! -f /etc/os-release ]; then
  echo "$(tput setaf 1)Error: Unable to determine OS. /etc/os-release file not found."
  echo "Installation stopped."
  exit 1
fi

. /etc/os-release

# Check if running on Debian trixie
if [ "$ID" != "debian" ] || [ "$VERSION_CODENAME" != "trixie" ]; then
  echo "$(tput setaf 1)Error: OS requirement not met"
  echo "You are currently running: $ID $VERSION_CODENAME"
  echo "OS required: Debian trixie"
  echo "Installation stopped."
  exit 1
fi

# Check if running on x86
ARCH=$(uname -m)
if [ "$ARCH" != "x86_64" ] && [ "$ARCH" != "i686" ]; then
  echo "$(tput setaf 1)Error: Unsupported architecture detected"
  echo "Current architecture: $ARCH"
  echo "This installation is only supported on x86 architectures (x86_64 or i686)."
  echo "Installation stopped."
  exit 1
fi
