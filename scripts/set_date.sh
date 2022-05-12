#!/usr/bin/env bash
timezone="$(timedatectl | grep "Time zone:" | xargs | cut -d' ' -f3)"
echo $timezone
sudo timedatectl set-timezone Universal
sudo date -s "$(wget --method=HEAD -qSO- --max-redirect=0 google.com 2>&1 | grep Date: | cut -d' ' -f4-8)" > /dev/null
sudo timedatectl set-timezone $timezone
date
