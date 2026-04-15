#!/bin/sh

BASE="/opt/trickle-ai"
CFG="$BASE/config.env"
STATE="$BASE/state.db"

echo $$ > /tmp/trickle_ai.pid

[ -f "$CFG" ] && . "$CFG"

tg() {
    [ -z "$TG_TOKEN" ] && return
    curl -s "https://api.telegram.org/bot$TG_TOKEN/sendMessage" \
        -d chat_id="$TG_CHAT" \
        -d text="$1" >/dev/null 2>&1
}

MODE="AUTO"   # AUTO / MANUAL
BEST_NODE=""

score_net() {
    LAT=$(ping -c1 -W1 1.1.1.1 | awk -F'time=' '{print $2}' | cut -d'.' -f1)
    [ -z "$LAT" ] && LAT=999
    echo "$LAT"
}

while true; do
    sleep 10

    LAT=$(score_net)

    # AI DECISION ENGINE (heuristic)
    if [ "$LAT" -lt 80 ]; then
        SCORE=100
    elif [ "$LAT" -lt 150 ]; then
        SCORE=70
    else
        SCORE=40
    fi

    echo "LAT=$LAT SCORE=$SCORE" > "$STATE"

    # AUTO RECOVERY
    if ! pidof sing-box >/dev/null 2>&1; then
        tg "❌ CORE DOWN → restart"
        /opt/etc/init.d/S99trickleai restart
    fi

    # SMART ALERTS
    if [ "$SCORE" -lt 50 ]; then
        tg "⚠️ LOW NETWORK SCORE=$SCORE LAT=${LAT}ms"
    fi

    # ESCALATION
    if [ "$SCORE" -lt 30 ]; then
        tg "🔥 AI PROTECTION MODE"
        /opt/etc/init.d/S99trickleai restart
    fi

done
