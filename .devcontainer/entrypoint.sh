#!/bin/bash

[ "${DEBUG:-false}" = "true" ] && set -x

if [ ! -f "Gemfile" ]; then
  DEFAULT_GEMFILE="${JEKYLL_VAR_DIR}/Gemfile"
  echo "No Gemfile found. Using default: ${DEFAULT_GEMFILE}" 1>&2
  export BUNDLE_GEMFILE="$DEFAULT_GEMFILE"
fi

if [ ! -f "_config.yml" ]; then
  export DEFAULT_CONFIG="${JEKYLL_VAR_DIR}/_config.yml"
  echo "No _config.yml found. Using default: ${DEFAULT_CONFIG}" 1>&2
fi

bundle check || bundle install

if [[ "$1" == "deploy" ]]; then
  echo "Deploying..."

  if [ -n "$DEFAULT_CONFIG" ]; then
    JEKYLL_ENV=production bundle exec jekyll build --config "$DEFAULT_CONFIG" --verbose
  else
    JEKYLL_ENV=production bundle exec jekyll build --verbose
  fi
  exec /usr/jekyll/bin/deploy.sh --verbose
elif [[ "$1" == "jekyll" ]]; then
  echo "Running Jekyll command '${*:2}'..."

  # If the DEFAULT_CONFIG is assigned and the jekyll command supports '--config',
  # apply the default config by performing some positional argument magic.
  if [ -n "$DEFAULT_CONFIG" ] && bundle exec jekyll "$2" --help | grep '\-\-config' > /dev/null; then
    exec bundle exec jekyll "$2" --config "$DEFAULT_CONFIG" "${@:3}"
  else
    exec bundle exec jekyll "${@:2}"
  fi
elif [[ -z "$*" ]]; then
  echo "Running default command 'jekyll serve'..."

  if [ -n "$DEFAULT_CONFIG" ]; then
    exec bundle exec jekyll serve --config "$DEFAULT_CONFIG" --livereload --incremental --force_polling --watch --host 0.0.0.0
  else
    exec bundle exec jekyll serve --livereload --incremental --force_polling --watch --host 0.0.0.0
  fi
else
  echo "Running '$*'..."
  exec "$@"
fi