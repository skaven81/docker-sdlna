SimpleDLNA Image Server
=======================

This is a super-simple way to get a DLNA image (photo) server
up and running on your network.  It uses the fantastic
[SimpleDLNA](https://nmaier.github.io/simpleDLNA/) server at
its core.

Usage
-----

First build the container:

```
docker build -t sdlna .
```

Run it using a command similar to this:

```
docker run -d --name=mysdlna --rm \
    --net=host \
    -p 39200:39200/tcp -p 1900:1900/udp \
    -v /path/to/your/photos:/images \
    -v /var/cache:/cache \
    sdlna
```

Note the `--net=host` parameter: this is required to allow devices on
your network (such as Plex, Roku) to auto-detect the DLNA server.
If you plan to connect to the DLNA server directly, you may be able
to configure the network differently.

The TCP 39200 host port number is irrelevant; DLNA works on any high
numbered port, so you may map that port to a different number on your
host if you like.  UDP port 1900 is the UPnP port; it must be mapped
to port 1900 on the host for UPnP to work.

