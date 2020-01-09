#!/bin/bash

goal_lint() {
  bundle exec rubocop -c .rubocop.yml
}

goal_test() {
  bundle exec rspec
}

goal_precommit() {
  ./go lint && ./go test
}

goal_help() {
  echo "usage: $0 <goal>

"
  exit 1
}

main() {
  TARGET=${1:-}
  if [ -n "${TARGET}" ] && type -t "goal_$TARGET" &>/dev/null; then
    "goal_$TARGET" "${@:2}"
  else
    goal_help
  fi
}

main "$@"