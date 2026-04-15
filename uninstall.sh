#!/bin/sh

/opt/etc/init.d/S99trickleai stop 2>/dev/null
killall ai-core.sh 2>/dev/null

rm -rf /opt/trickle-ai
rm -f /opt/bin/trickle*
rm -f /opt/etc/init.d/S99trickleai
rm -f /tmp/trickle_ai.pid

echo "[AI CORE REMOVED]"
