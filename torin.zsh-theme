# Torin Zsh Theme

RESET="%f"
BOLD="%B"
DIM="%F{gray}"
BLUE="%F{blue}"
CYAN="%F{cyan}"
GREEN="%F{green}"
RED="%F{red}"
YELLOW="%F{yellow}"
WHITE="%F{white}"
MAGENTA="%F{magenta}"

PROMPT_DIR="%F{blue}%1~%f"

USER_PROMPT='$(if [[ $EUID -eq 0 ]]; then echo "${RED}⚡ root"; else echo "${GREEN}➤ $USER"; fi)'

PROMPT="
${USER_PROMPT} ${WHITE}${PROMPT_DIR}
${BOLD}${CYAN}❯ ${RESET}"
RPROMPT='%B%(?..${RED}[ERR $?]%b)'

alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias cls='clear'
alias reload='source ~/.zshrc'

alias gs='git status'
alias ga='git add .'
alias gc='git commit -m'
alias gp='git push'
alias gpl='git pull'
alias gco='git checkout'
alias gl='git log --oneline --graph --decorate --all'

alias mkd='mkdir -p'
alias rmf='rm -rf'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

detect_package_manager() {
  if command -v pacman &>/dev/null; then
    echo "pacman"
  elif command -v apt &>/dev/null; then
    echo "apt"
  elif command -v dnf &>/dev/null; then
    echo "dnf"
  elif command -v zypper &>/dev/null; then
    echo "zypper"
  elif command -v brew &>/dev/null; then
    echo "brew"
  else
    echo ""
  fi
}

PACKAGE_MANAGER=$(detect_package_manager)

case "$PACKAGE_MANAGER" in
  pacman)
    alias update='sudo pacman -Syu'
    alias install='sudo pacman -S'
    alias remove='sudo pacman -Rns'
    alias search='pacman -Ss'
    alias clean='sudo pacman -Sc'
    ;;
  apt)
    alias update='sudo apt update && sudo apt upgrade'
    alias install='sudo apt install'
    alias remove='sudo apt remove'
    alias search='apt search'
    alias clean='sudo apt autoremove && sudo apt clean'
    ;;
  dnf)
    alias update='sudo dnf update'
    alias install='sudo dnf install'
    alias remove='sudo dnf remove'
    alias search='dnf search'
    alias clean='sudo dnf clean all'
    ;;
  zypper)
    alias update='sudo zypper refresh && sudo zypper update'
    alias install='sudo zypper install'
    alias remove='sudo zypper remove'
    alias search='zypper search'
    alias clean='sudo zypper clean'
    ;;
  brew)
    alias update='brew update && brew upgrade'
    alias install='brew install'
    alias remove='brew uninstall'
    alias search='brew search'
    alias clean='brew cleanup'
    ;;
  *)
    echo "⚠️  Unsupported package manager."
    ;;
esac

alias dockerps='docker ps -a'
alias dockerrm='docker rm $(docker ps -aq)'
alias dockerclean='docker system prune -f'

alias du='du -h --max-depth=1'
alias df='df -h'
alias free='free -h'

mkcd() {
  mkdir -p "$1" && cd "$1" || return
}

setup_dev_env() {
  echo "🔧 Setting up development environment with $PACKAGE_MANAGER..."
  case "$PACKAGE_MANAGER" in
    pacman)
      sudo pacman -Syu --noconfirm
      sudo pacman -S --needed --noconfirm git curl zsh python-pip docker docker-compose
      ;;
    apt)
      sudo apt update && sudo apt upgrade -y
      sudo apt install -y git curl zsh python3-pip docker.io docker-compose
      ;;
    dnf)
      sudo dnf update -y
      sudo dnf install -y git curl zsh python3-pip docker docker-compose
      ;;
    *)
      echo "⚠️ Unsupported package manager for setup_dev_env."
      return 1
      ;;
  esac
  echo "✅ Development environment setup complete!"
}

init_project() {
  local name=$1
  if [[ -z $name ]]; then
    echo "⚠️  Please provide a project name: init_project <project_name>"
    return 1
  fi

  mkcd "$name"
  echo "Initializing Git repository..."
  git init
  echo "Creating README.md..."
  echo "# $name" > README.md
  echo "✅ Project '$name' initialized!"
}

setup_zsh() {
  echo "Installing Zsh and Oh-My-Zsh..."
  case "$PACKAGE_MANAGER" in
    pacman)
      sudo pacman -S --needed --noconfirm zsh
      ;;
    apt)
      sudo apt install -y zsh
      ;;
    dnf)
      sudo dnf install -y zsh
      ;;
    *)
      echo "⚠️ Unsupported package manager for setup_zsh."
      return 1
      ;;
  esac
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
  echo "✅ Zsh setup complete!"
}
