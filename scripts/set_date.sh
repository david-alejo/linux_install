#!/usr/bin/env bash
sudo date -s "$(wget --method=HEAD -qS0- --max-redirect=0 google.com 2>&1 | grep Date: | cut -d' ' -f4-8)"
