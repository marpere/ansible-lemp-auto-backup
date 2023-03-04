#!/bin/sh
sudo -u nginx bash << EOF
git checkout .
git pull
EOF
