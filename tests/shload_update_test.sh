#!/bin/bash

set -euo pipefail

function set_up_before_script() {
  _ROOT_DIR="$(dirname "${BASH_SOURCE[0]}")/.."

  source "$_ROOT_DIR/shload.sh"
}

function test_small_screen() {
  mock tput echo 20

  count=4
  symbol="+"

  assert_equals "Progress:[s [[0C] 0%[u [++[u [1C] 100%"\
    "$(shload_setup $count $symbol && shload_update $count)"
}

function test_medium_screen() {
  mock tput echo 21

  count=4
  symbol="+"

  assert_equals "Progress:[s [[1C] 0%[u [+[u [2C] 100%"\
    "$(shload_setup $count $symbol && shload_update $count)"
}

function test_big_screen() {
  mock tput echo 40

  count=4
  symbol="+"

  assert_equals "Progress:[s [[12C] 0%[u [++++++++++++[u [13C] 100%"\
    "$(shload_setup $count $symbol && shload_update $count)"
}