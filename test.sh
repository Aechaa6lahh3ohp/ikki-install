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
  docker build -t $IMAGE .
  docker run -it --rm -v "$(pwd):/root/c" "$IMAGE" "bash -c /root/c/$TARGET"
  docker rmi $IMAGE
}

main "$@"
