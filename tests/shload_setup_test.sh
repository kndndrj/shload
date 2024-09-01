#!/bin/bash

set -euo pipefail

function set_up_before_script() {
  _ROOT_DIR="$(dirname "${BASH_SOURCE[0]}")/.."

  source "$_ROOT_DIR/shload.sh"
}

function test_small_screen() {
  mock tput echo 20

  assert_equals "Progress:[s [[0C] 0%"\
    "$(shload_setup 10 '+')"
}

function test_medium_screen() {
  mock tput echo 21

  assert_equals "Progress:[s [[1C] 0%"\
    "$(shload_setup 10 '+')"
}


function test_big_screen() {
  mock tput echo 40

  assert_equals "Progress:[s [[12C] 0%"\
    "$(shload_setup 10 '+')"
}
