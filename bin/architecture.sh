#!/bin/sh

ARCH=
dpkgArch="$(dpkg --print-architecture)"
case "${dpkgArch##*-}" in
  amd64) ARCH='x64';;
  ppc64el) ARCH='ppc64le';;
  s390x) ARCH='s390x';;
  arm64) ARCH='arm64';;
  armhf) ARCH='armv7l';;
  i386) ARCH='x86';;
  *) echo "unsupported architecture"; exit 1 ;;
esac

echo $ARCH
