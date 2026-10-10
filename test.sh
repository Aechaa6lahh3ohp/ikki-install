#!/usr/bin/env bash

###############################
# CONFIG
###############################
IMAGE="${IMAGE:-archlinux}"
TARGET="${TARGET:-ikki.sh}"

set -o pipefail

###############################
# main()
###############################
main()
{
  docker run -it --rm -v "$(pwd):/root/c" "$IMAGE" bash -c "/root/c/$TARGET"
}

main "$@"
