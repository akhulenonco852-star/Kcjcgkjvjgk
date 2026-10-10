# Claude Code + OpenRouter on Android

Starter setup for Termux + Ubuntu (proot-distro), Claude Code, and browser-based VS Code using code-server.

## Setup

1. Install Termux from a trusted source.
2. Run `bash scripts/setup-termux.sh` inside Termux.
3. Enter Ubuntu: `proot-distro login ubuntu`.
4. Clone this repository inside Ubuntu, then run `bash scripts/setup-ubuntu.sh`.
5. Configure an OpenRouter API key when prompted. Never commit credentials.
6. Start `code-server` and open `http://127.0.0.1:8080` on the same device.

See [security notes](docs/security.md) and [OpenRouter Claude Code integration](https://openrouter.ai/docs/guides/coding-agents/claude-code-integration).

Note: API usage may cost money. Set account spending limits first. These scripts do not run automatically on your device.