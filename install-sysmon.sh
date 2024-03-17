#!/usr/bin/bash
curl -O https://raw.githubusercontent.com/juren53/sysmon/main/sysmon.py
chmod 755 sysmon.py
cp sysmon.py ~/.local/bin/sysmon
echo "sysmon now installed in .local/bin"
