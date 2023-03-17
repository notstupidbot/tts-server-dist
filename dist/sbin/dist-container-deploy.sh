#!/usr/bin/env bash
CWD=`pwd`
cd /container/dist
echo "Creating /container/dist-tts-server.7z"
7z a -r -mx=0 -mmt=off ../dist-tts-server.7z .
echo "Copyng /container/dist-tts-server.7z to /content/gdrive/"
cp ../dist-tts-server.7z /content/gdrive/
echo "Backup saved to /content/gdrive/dist-tts-server.7z"
cd $CWD
