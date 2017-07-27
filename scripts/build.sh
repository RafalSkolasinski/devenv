#!/bin/bash

set -e

cd /src
python3 setup.py build
pip3 install -e .
chown -R developer:users /src/
