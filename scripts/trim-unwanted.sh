#!/bin/bash

script_dir=$(dirname $0)

find ~/ -type f -path '*.unwanted/*' -exec ${script_dir}/trim.sh {} \;
