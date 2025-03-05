#!/bin/zsh
for name in "atcoder-cli" "markdownlint-cli2" "pyright" "typescript-language-server" "@devcontainers/cli" "eslint"; do
  npm i -g $name
done
