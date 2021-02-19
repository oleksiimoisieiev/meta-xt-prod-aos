# !/bin/sh

#TBD Dirty hack. Should be removed
scp -r -o "ServerAliveInterval=1" -o "StrictHostKeyChecking=no" -o "UserKnownHostsFile=/dev/null" /var/aos/crypt/*  root@192.168.0.3:/var/aos/crypt/

systemctl restart aos.target

# reboot domf
xenstore-write control/user-reboot 2
