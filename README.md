
# OpenWrt saltstack

This repo contains proof of concept Docker image with build saltstack package. There are still few problems. salt package has to be installed with src version, because of some strange error in pyc file and python-zmq package is still missing in openwrt packages repo.

## Repos with packages
* salt https://github.com/ja-pa/packages/tree/salt
* python-zmq https://github.com/openwrt/packages/pull/15647

## Build image
```
docker build -t openwrtsalt .
```

## Run image
```
docker run -i -t openwrtsalt /bin/sh
```

## Example after running openwrt

### Run minion and master as daemon
```
/ # salt-master -d
/ # salt-minion  -d
```
### Accept minion key
```
/ # salt-key -L
Accepted Keys:
Denied Keys:
Unaccepted Keys:
bfac6619173c
Rejected Keys:
/ # salt-key -a bfac6619173c
```

### Test if minion is working
```
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
```
