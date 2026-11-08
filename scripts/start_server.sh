#!/bin/bash

cd /workspaces/MC-BLABANKO-1 || exit 1

# Start Playit
if ! pgrep -x playitd > /dev/null; then
    sudo mkdir -p /run/playit
    sudo tmux new-session -d -s playit 'playitd'
fi

# Start Minecraft
if ! pgrep -f '[j]ava.*paper.jar' > /dev/null; then
    tmux new-session -d -s minecraft \
    'java -Xms6G -Xmx12G -XX:+UseG1GC -jar paper.jar --nogui'
fi