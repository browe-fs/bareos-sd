# Bareos storage daemon

- Bareos is a set of computer programs that permits the system administrator to manage backup, recovery, and verification of computer data across a network of computers of different kinds. 

- The Bareos Storage Daemon is responsible, at the Bareos Director request, for accepting data from a Bareos File Daemon and storing the ﬁle attributes and data to the physical backup media or volumes. In the case of a restore request, it is responsible to ﬁnd the data and send it to the Bareos File Daemon.

- Bareos storage daemon version 17.2 built from a centos:7 image.

### Git clone
```
git clone https://github.com/browe-fs/bareos-sd.git
``` 
### Sample run statement

- bareos-sd.conf needs to be in the /etc/bareos folder prior to run time.
- Add additional volume mount to /var/lib/bareos/storage/ to store files on host machiene 

Docker build statement:
```
docker build -t bareos-sd .
```
Docker run statement:
```
docker run --name bareos-sd \
-h bareos-sd \
-v /etc/bareos:/etc/bareos:z \
-p 9103:9103 \
--network=bareos \
-d bareos-sd
```

Get terminal interface inside container
```
docker exec -ti bareos-sd bash
```
