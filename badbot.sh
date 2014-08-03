#!/bin/bash
#####################################################
##   NerdTools.co.uk BadBot iptables script v1.0   ##
#####################################################
##  Ran periodically via crontab this script will  ##
## download the latest badbot list adding the IP's ##
## to iptables whilst silently preserving existing ##
## rules and removing any duplicates.              ##
#####################################################
##     CURL, CRONTAB and IPTABLES is required!     ##
#####################################################
##   Example cron command running every 15 mins:   ##
##   "0,15,30,45 * * * * sh /path/to/badbot.sh"    ##
#####################################################

## download the latest rule set ##
BADBOTS=$(/usr/bin/curl -sL http://core.nerdtools.co.uk/badbot/latest.txt)
## save existing rules ##
iptables-save > /dev/null

## apply latest rules ##
for i in $BADBOTS
do
   /sbin/iptables -I INPUT -s $i -j DROP
   echo "badbots-iptables: $i set to DROP"
done

## restore existing rules whilst removing duplicates ##
iptables-save | uniq | iptables-restore > /dev/null

## echo complete ##
echo "BadBot iptable update complete $(date)!"
