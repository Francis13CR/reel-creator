#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
FORCE=0
TARGETS=()

usage() {
  cat <<'EOF'
Usage: ./install.sh [opencode|claude|agents|all] [--force]

  opencode   Copy skills to ~/.config/opencode/skills
  claude     Copy skills to ~/.claude/skills
  agents     Copy skills to ~/.agents/skills
  all        Copy to all three global folders
  --force    Overwrite existing skill directories

Environment overrides:
  OPENCODE_SKILLS_DIR, CLAUDE_SKILLS_DIR, AGENTS_SKILLS_DIR
EOF
}

for arg in "$@"; do
  case "$arg" in
    --help|-h) usage; exit 0 ;;
    --force) FORCE=1 ;;
    opencode|claude|agents|all) TARGETS+=("$arg") ;;
    *) echo "Unknown option: $arg" >&2; usage; exit 1 ;;
  esac
done

if [ ${#TARGETS[@]} -eq 0 ]; then
  usage
  exit 1
fi

copy_to() {
  local dest="$1"
  local label="$2"
  mkdir -p "$dest"
  echo "→ $label: $dest"

  for skill in "$ROOT"/skills/*/; do
    [ -d "$skill" ] || continue
    local name
    name="$(basename "$skill")"
    if [ -e "$dest/$name" ] && [ "$FORCE" -ne 1 ]; then
      echo "  skip $name (exists; use --force to overwrite)"
      continue
    fi
    rm -rf "$dest/$name"
    cp -R "$skill" "$dest/$name"
    echo "  install $name"
  done
}

for target in "${TARGETS[@]}"; do
  case "$target" in
    opencode)
      copy_to "${OPENCODE_SKILLS_DIR:-$HOME/.config/opencode/skills}" "OpenCode"
      ;;
    claude)
      copy_to "${CLAUDE_SKILLS_DIR:-$HOME/.claude/skills}" "Claude Code"
      ;;
    agents)
      copy_to "${AGENTS_SKILLS_DIR:-$HOME/.agents/skills}" "Codex / generic agents"
      ;;
    all)
      copy_to "${OPENCODE_SKILLS_DIR:-$HOME/.config/opencode/skills}" "OpenCode"
      copy_to "${CLAUDE_SKILLS_DIR:-$HOME/.claude/skills}" "Claude Code"
      copy_to "${AGENTS_SKILLS_DIR:-$HOME/.agents/skills}" "Codex / generic agents"
      ;;
  esac
done

echo "Done. Restart or reload your agent if it does not hot-reload skills."
