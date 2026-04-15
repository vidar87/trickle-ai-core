#!/bin/sh

cd /opt && rm -rf /opt/trickle-ai
wget -O install.sh https://raw.githubusercontent.com/vidar87/trickle-ai-core/main/install.sh
sh install.sh
