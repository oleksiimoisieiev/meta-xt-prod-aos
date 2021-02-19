# !/bin/sh

#TBD Dirty hack. Should be removed
ssh -o "ServerAliveInterval=1" -o "StrictHostKeyChecking=no" -o "UserKnownHostsFile=/dev/null" root@192.168.0.3 'mkdir -p /var/aos/crypt; sync'
scp -r -o "ServerAliveInterval=1" -o "StrictHostKeyChecking=no" -o "UserKnownHostsFile=/dev/null" /var/aos/crypt/*  root@192.168.0.3:/var/aos/crypt/
ssh -o "ServerAliveInterval=1" -o "StrictHostKeyChecking=no" -o "UserKnownHostsFile=/dev/null" root@192.168.0.3 'sync'

sync

sleep 20

# reboot domf
xenstore-write control/user-reboot 2

sleep 3

systemctl restart aos.target
