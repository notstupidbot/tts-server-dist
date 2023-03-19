#!/usr/bin/env bash

export PATH=/container/dist/sbin:/container/dist/bin:$PATH
export LD_LIBRARY_PATH=/container/dist/lib/x86_64-linux-gnu
cd /container/dist/tts-indonesia
waitress-serve --port=5002 app:app > /dev/null &