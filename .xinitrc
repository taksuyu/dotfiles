#! /usr/bin/env bash

[ -f /etc/xprofile ] && source /etc/xprofile
[ -f ~/.xprofile ] && source ~/.xprofile

exec xmonad
