#!/usr/bin/env bash
set -Eeuo pipefail
command -v apt-get >/dev/null || { echo "Run inside Ubuntu/Debian."; exit 1; }
if [ "$(id -u)" -eq 0 ]; then SUDO=""; else SUDO="sudo"; fi
$SUDO apt-get update
$SUDO apt-get install -y ca-certificates curl git python3 build-essential
curl -fsSL https://deb.nodesource.com/setup_lts.x | $SUDO -E bash -
$SUDO apt-get install -y nodejs
curl -fsSL https://claude.ai/install.sh | bash
curl -fsSL https://code-server.dev/install.sh | sh
CONFIG_DIR="${XDG_CONFIG_HOME:-$HOME/.config}/code-server"
mkdir -p "$CONFIG_DIR"
CONFIG_FILE="$CONFIG_DIR/config.yaml"
if [ ! -f "$CONFIG_FILE" ]; then
  umask 077
  printf 'bind-addr: 127.0.0.1:8080\nauth: password\npassword: CHANGE-THIS-PASSWORD\ncert: false\n' > "$CONFIG_FILE"
  echo "Edit $CONFIG_FILE and replace CHANGE-THIS-PASSWORD before starting."
fi
chmod 600 "$CONFIG_FILE"
ENV_DIR="${XDG_CONFIG_HOME:-$HOME/.config}/openrouter"
ENV_FILE="$ENV_DIR/claude-code.env"
mkdir -p "$ENV_DIR"; chmod 700 "$ENV_DIR"
if [ ! -f "$ENV_FILE" ]; then
  read -r -s -p "OpenRouter API key (blank to skip): " KEY; echo
  if [ -n "$KEY" ]; then
    umask 077
    printf 'export OPENROUTER_API_KEY=%q\nexport ANTHROPIC_BASE_URL="https://openrouter.ai/api"\nexport ANTHROPIC_AUTH_TOKEN="$OPENROUTER_API_KEY"\nexport ANTHROPIC_API_KEY=""\n' "$KEY" > "$ENV_FILE"
    chmod 600 "$ENV_FILE"
  fi
fi
cat <<'EOF'
Next:
  source ~/.config/openrouter/claude-code.env
  claude --version
  claude
  code-server
Open http://127.0.0.1:8080 on this device.
Keep code-server local; do not expose port 8080 publicly.
EOF