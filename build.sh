#!/bin/bash

cd /kwant
start.sh python3 setup.py build
python3 setup.py develop
