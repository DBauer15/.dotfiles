# Enable colors
autoload -U colors && colors

# Soft spring color palette
SPRING_GREEN="%F{78}"    # soft green
SPRING_YELLOW="%F{222}"  # pastel yellow
SPRING_BLUE="%F{117}"    # light blue
SPRING_PINK="%F{211}"    # soft pink
SPRING_GRAY="%F{245}"    # subtle gray
RESET="%f"

# Git prompt (same as robbyrussell style)
parse_git_branch() {
  git rev-parse --abbrev-ref HEAD 2>/dev/null
}

git_branch() {
  local branch=$(parse_git_branch)
  if [[ -n $branch ]]; then
    echo "${SPRING_PINK}($branch)${RESET}"
  fi
}

# Prompt (spring version of robbyrussell)
PROMPT='${SPRING_YELLOW}➜${RESET} ${SPRING_BLUE}%1~${RESET} '
