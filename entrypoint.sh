#!/usr/bin/env bash
set -e

#Run command 
/usr/sbin/bareos-sd -c /etc/bareos/bareos-sd.conf



#keep container alive
tail -f /dev/null
