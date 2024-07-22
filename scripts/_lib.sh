#!/usr/bin/env bash

set -euo pipefail
test "${DEBUG:-}" && set -x

# Override any user-supplied umask that could cause problems, see #1222
umask 002

# Thanks to https://unix.stackexchange.com/a/145654/108960
log_file=log-$(date +'%Y-%m-%d_%H-%M-%S').txt
exec &> >(tee -a "$log_file")

# Allow `.env` overrides using the `.env.custom` file.
# We pass this to docker compose in a couple places.
if [[ -f .env.custom ]]; then
  _ENV=.env.custom
else
  _ENV=.env
fi

# Read .env for default values with a tip o' the hat to https://stackoverflow.com/a/59831605/90297
t=$(mktemp) && export -p >"$t" && set -a && . $_ENV && set +a && . "$t" && rm "$t" && unset t

if [ "${GITHUB_ACTIONS:-}" = "true" ]; then
  _group="::group::"
  _endgroup="::endgroup::"
else
  _group="▶ "
  _endgroup=""
fi

# Env exec environment
PWD=$(pwd)

# Solicita ao usuário que insira a senha do vault
read -sp "Por favor, digite sua senha vault: " PASS_VAULT && echo
