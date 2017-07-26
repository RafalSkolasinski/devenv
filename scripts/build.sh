#!/bin/bash

set -e

cd /src
start.sh python3 setup.py build
pip3 install -e .
