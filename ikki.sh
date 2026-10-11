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
info()    { printf "[i] INFO %s\n" "$*"; }
success() { printf "[*] SUCCESS %s\n" "$*"; }
warning() { printf "[!] WARNING %s\n" "$*"; }
error()   { printf "[X] ERROR %s\n" "$*"; }

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

ai-agent-install()
{
  info "start install to AI AGENTS"
  curl -fsSL https://opencode.ai/v2/install | bash || return 1
  curl -fsSL https://raw.githubusercontent.com/s0ld13rr/pentestcode/main/install.sh | bash || return 1
}

nvim-install()
{
  info "start install to neovim config"

  local repo_dir=/tmp/nvim-config

  git clone https://github.com/SakuraSystemz/blackarch-config-nvim "$repo_dir" || return 1
  cd "$repo_dir" || return 1

  mkdir -p "$HOME/.config/nvim" || return 1
  cp -vr ./nvim/. "$HOME/.config/nvim/" || return 1
}

###############################
# main()
###############################
main()
{
  banner
  if ai-agent-install && nvim-install; then
    success "Installation completed"
  else
    error "Installation failed"
  fi
}

main "$@"
