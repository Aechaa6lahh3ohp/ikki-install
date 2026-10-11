#!/usr/bin/env bash

###############################
# CONFIG
###############################
IMAGE="${IMAGE:-testarchlinux}"
TARGET="${TARGET:-ikki.sh}"

set -o pipefail

###############################
# main()
###############################
main()
{
  docker build -t testarchlinux .
  docker run -it --rm -v "$(pwd):/root/c" "$IMAGE" "bash -c /root/c/$TARGET"
  docker rmi testarchlinux
}

main "$@"
