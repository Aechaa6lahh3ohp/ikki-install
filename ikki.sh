#!/usr/bin/env bash

###############################
# COLORS
###############################

green='\e[32m'
red='\e[31m'
yellow='\e[33m'
blue='\e[34m'
lgreen='\e[92m'
lyellow='\e[93m'
lblue='\e[94m'
lmagenta='\e[95m'
lcyan='\e[96m'
blink_red='\033[05;31m'
restore='\033[0m'
reset='\e[0m'


set -o pipefail

###############################
# STATUS FUNCTION
###############################
info()    { printf "${blue}[i] INFO %s${reset} $*${reset}\n"; }
success() { printf "${green}[*] SUCCESS %s${reset} $*${reset}\n"; }
warning() { printf "${yellow}[!] WARNING %s${reset} $*${reset}\n"; }
error()   { printf "${red}[X] ERROR %s${reset} $*${reset}\n"; }

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

###############################
# NEOVIM CONFIG INSTALL
###############################

nvim-install()
{
  info "start install to neovim config"

  local repo_dir=/tmp/nvim-config

  git clone https://github.com/Aechaa6lahh3ohp/blackarch-config-nvim "$repo_dir" || return 1
  cd "$repo_dir" || return 1

  mkdir -p "$HOME/.config/nvim" || return 1
  cp -vr ./nvim "$HOME/.config/" || return 1
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
