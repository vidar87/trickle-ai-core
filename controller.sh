#!/bin/sh

BASE="/opt/trickle-ai"

echo ""
echo "======================"
echo " TRICKLE AI CORE"
echo "======================"
echo "1) Status"
echo "2) Telegram setup"
echo "3) Mode AUTO/MANUAL"
echo "4) Restart"
echo "5) Stop"
echo "6) Start"
echo "7) Uninstall"
echo "8) Open Web UI"
echo ""

printf "Choice: "
read C </dev/tty

if [ "$C" = "1" ]; then
    cat "$BASE/state.db"
    pidof ai-core.sh >/dev/null && echo "RUNNING" || echo "STOPPED"
    exit 0
fi

if [ "$C" = "2" ]; then
    printf "TOKEN: "
    read TG_TOKEN </dev/tty
    printf "CHAT: "
    read TG_CHAT </dev/tty

    echo "TG_TOKEN=$TG_TOKEN" > "$BASE/config.env"
    echo "TG_CHAT=$TG_CHAT" >> "$BASE/config.env"
    exit 0
fi

if [ "$C" = "3" ]; then
    echo "AUTO or MANUAL:"
    read MODE </dev/tty
    echo "MODE=$MODE" >> "$BASE/config.env"
    exit 0
fi

[ "$C" = "4" ] && /opt/etc/init.d/S99trickleai restart
[ "$C" = "5" ] && /opt/etc/init.d/S99trickleai stop
[ "$C" = "6" ] && /opt/etc/init.d/S99trickleai start

[ "$C" = "7" ] && sh /opt/trickle-ai/uninstall.sh

[ "$C" = "8" ] && sh /opt/trickle-ai/web.sh
