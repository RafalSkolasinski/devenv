#!/bin/bash
jupyter notebook \
    --NotebookApp.token="" \
    --ip='*' \
    --port=8888 \
    --no-browser \
    --allow-root
