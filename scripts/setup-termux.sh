#!/data/data/com.termux/files/usr/bin/bash
set -Eeuo pipefail
if ! command -v pkg >/dev/null 2>&1; then echo "Run inside Termux."; exit 1; fi
pkg update -y
pkg upgrade -y
pkg install -y git curl wget proot-distro termux-api openssh nano
if ! proot-distro list | grep -qE '^  ubuntu([[:space:]]|$)'; then proot-distro install ubuntu; fi
cat <<'EOF'
Next: proot-distro login ubuntu
Inside Ubuntu, clone this repository and run:
  bash scripts/setup-ubuntu.sh
Termux:API also requires its companion Android app.
EOF