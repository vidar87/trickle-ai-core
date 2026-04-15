#!/bin/sh

PORT=8787

while true; do
    echo -e "HTTP/1.1 200 OK\n\nTRICKLE AI CORE\n\n$(cat /opt/trickle-ai/state.db 2>/dev/null)" | nc -l -p $PORT
done
