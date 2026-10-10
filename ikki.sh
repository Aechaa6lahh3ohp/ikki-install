#!/usr/bin/env bash

###############################
# COLORS
###############################

green='\e[32m'
reset='\e[0m'

set -o pipefail

###############################
# STATUS FUNCTION
###############################
info()    { printf "[   INFO   ] %s\n" "$*"; }
success() { printf "[ SUCCESS  ] %s\n" "$*"; }
warning() { printf "[ WARNING  ] %s\n" "$*"; }
error()   { printf "[  ERROR   ] %s\n" "$*"; }

banner()
{
  printf "${green}"
  printf "  =============================\n"
  printf "       \e[3mIKKI INSTALL SCRIPT\e[23m\n"
  printf "  =============================\n"
  printf "${reset}"

}

###############################
# AI AGENT INSTALL
###############################

ai-agent()
{
  curl -fsSL https://opencode.ai/v2/install | bash
  curl -fsSL https://raw.githubusercontent.com/s0ld13rr/pentestcode/main/install.sh | bash
}


###############################
# main()
###############################
main()
{
  banner
  info "start install to AI AGENTS"
  if ai-agent; then
    success "Installation completed"
  else
    error "Installation failed"
  fi
}

main "$@"
