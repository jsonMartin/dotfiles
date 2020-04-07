#!/bin/bash
# Post install config solution found at: https://askubuntu.com/questions/979359/how-do-i-install-caps2esc

echo "Make sure you run this script as root!"

# Configure udevmon.yaml
echo "- JOB: \"intercept -g \$DEVNODE | caps2esc | uinput -d \$DEVNODE\"
  DEVICE:
    EVENTS:
      EV_KEY: [KEY_CAPSLOCK, KEY_ESC]
" >> /etc/udevmon.yaml

# Configure udevmon.service
echo "[Unit]
Description=udevmon
Wants=systemd-udev-settle.service
After=systemd-udev-settle.service

[Service]
ExecStart=/usr/bin/nice -n -20 /usr/bin/udevmon -c /etc/udevmon.yaml

[Install]
WantedBy=multi-user.target
" >> /etc/systemd/system/udevmon.service
