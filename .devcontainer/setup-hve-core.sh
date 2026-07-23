#!/usr/bin/env bash
# Install the GitHub Copilot CLI and hve-core-all plugin.
# Best-effort and non-fatal — the sandbox starts even if this fails.
set -euo pipefail

echo "==> Setting up hve-core-all Copilot CLI plugin..."

command -v copilot >/dev/null 2>&1 \
  || npm install -g @github/copilot \
  || echo "::warning::copilot CLI install failed"

copilot plugin marketplace add microsoft/hve-core \
  || echo "::warning::marketplace add failed"

copilot plugin install hve-core-all@hve-core \
  || echo "::warning::hve-core-all install failed"

copilot plugin list || true

echo "==> hve-core-all setup complete (errors above are non-fatal)."