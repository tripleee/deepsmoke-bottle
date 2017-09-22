#!/bin/sh

su - deepsmoke <<'EOF'
    cd deepsmoke-bottle
    . ./venv/bin/activate
    ./app.py
EOF
