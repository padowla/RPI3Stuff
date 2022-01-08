#!/bin/sh
#Execute with crontab
PATH_LOG='/home/pi/mylogs/autoupdate'
#All'inizio pulisco il file di log
echo "" >$PATH_LOG
echo "---------------------------------------------------------------------------------------------------"
echo "*** AGGIORNAMENTO DI SISTEMA `date +_%A_%d_%B_%Y_%R_%S` ***\n\n"
PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
DEBIAN_FRONTEND=noninteractive apt-get update && DEBIAN_FRONTED=noninteractive apt-get upgrade -y
#DEBIAN_FRONTEND=noninteractive rpi-update
DEBIAN_FRONTEND=noninteractive apt-get autoremove
DEBIAN_FRONTEND=noninteractive apt-get autoclean

echo "*** SISTEMA AGGIORNATO `date +_%A_%d_%B_%Y_%R_%S` ***"
echo "---------------------------------------------------------------------------------------------------"
echo "*** AGGIORNAMENTO DI youtube-dl `date +_%A_%d_%B_%Y_%R_%S` ***\n\n"
pip3 install --upgrade youtube-dl
echo "*** youtube-dl AGGIORNATO `date +_%A_%d_%B_%Y_%R_%S` ***"
echo "---------------------------------------------------------------------------------------------------"
echo "*** AGGIORNAMENTO DI youtube-dlc `date +_%A_%d_%B_%Y_%R_%S` ***\n\n"
python3 -m pip install --upgrade youtube-dlc
echo "*** youtube-dlc AGGIORNATO `date +_%A_%d_%B_%Y_%R_%S` ***"
echo "---------------------------------------------------------------------------------------------------"
reboot
