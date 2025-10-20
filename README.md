# FyshOS

## Building

On a debian system (bullseye or later):

```
$ sudo apt-get install live-build
$ sudo lb clean
$ ./prep.sh
$ sudo lb build
```

The resulting live-image-amd64.hybrid.iso file is your FyshOS live system
and installer.

## Boot

Note that the default `user` has password `live`.

![](img/boot.png)
![](img/fastfetch.png)

