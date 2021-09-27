


# Build image
docker build -t openwrtsalt .

# Run image
docker run -i -t openwrtsalt /bin/sh


# Example after running openwrt

## Run minion and master as daemon
/ # salt-master -d
/ # salt-minion  -d

## Accept minion key
/ # salt-key -L
Accepted Keys:
Denied Keys:
Unaccepted Keys:
bfac6619173c
Rejected Keys:
/ # salt-key -a bfac6619173c

## Test if minion is working
/ # salt "*" test.ping
bfac6619173c:
    True
/ # salt "*" cmd.run "ls /tmp"
bfac6619173c:
    cache
    lock
    log
    opkg-lists
    run
    usr
/ # 

