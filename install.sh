#!/bin/sh

BASE="/opt/trickle-ai"
HOST="https://raw.githubusercontent.com/vidar87/trickle-ai-core/main"

echo "[TRICKLE AI CORE INSTALL]"

mkdir -p "$BASE"
mkdir -p /opt/bin

FILES="
ai-core.sh
controller.sh
netai.sh
web.sh
uninstall.sh
update.sh
config.env
state.db
"

for f in $FILES; do
    curl -fsSL "$HOST/$f" -o "$BASE/$f"
done

chmod +x "$BASE/"*.sh

ln -sf "$BASE/controller.sh" /opt/bin/tricklectl
ln -sf "$BASE/netai.sh" /opt/bin/trickle-ai
ln -sf "$BASE/web.sh" /opt/bin/trickle-web

cat > /opt/etc/init.d/S99trickleai << 'EOF'
#!/bin/sh

start() {
    pidof ai-core.sh >/dev/null && exit 0
    nohup /opt/trickle-ai/ai-core.sh >/dev/null 2>&1 &
}

stop() {
    killall ai-core.sh 2>/dev/null
}

restart() {
    stop
    start
}

case "$1" in
start) start ;;
stop) stop ;;
restart) restart ;;
esac
EOF

chmod +x /opt/etc/init.d/S99trickleai

/opt/etc/init.d/S99trickleai start

echo "[OK] AI CORE READY"
echo "UI: tricklectl"
echo "WEB: http://<router-ip>:8787"
