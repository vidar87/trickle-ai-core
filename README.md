# 🚀 TRICKLE AI CORE

Autonomous network watchdog + AI-style routing controller for routers

---

## ⚙️ INSTALL (ONE COMMAND)

```sh
cd /opt && wget https://raw.githubusercontent.com/vidar87/trickle-ai-core/main/install.sh && sh install.sh
```

---

## 🎛 CONTROL PANEL

```sh
tricklectl
```

---

## 🌐 WEB PANEL

```
http://<router-ip>:8787
```

---

## 📊 STATUS

- LAT = latency ms
- SCORE = network health (0–100)
- STATE = RUNNING / STOPPED

---

## 🤖 MODES

- AUTO → system decides recovery
- MANUAL → user control

---

## 🔔 TELEGRAM ALERTS

Configured via control panel

---

## 🧹 REMOVE (ONE COMMAND)

```sh
sh /opt/trickle-ai/uninstall.sh
```

---

## 🔄 UPDATE (ONE COMMAND)

```sh
sh /opt/trickle-ai/update.sh
```

---

## ⚡ FEATURES

✔ AI-style health scoring  
✔ latency monitoring  
✔ auto recovery FSM  
✔ manual override mode  
✔ web dashboard  
✔ Telegram alerts  

---

## ⚠️ DESIGN GOAL

Ultra-light router AI system (BusyBox compatible)
