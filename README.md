# rpi-raspbian-automated-build
'Docker automated build raspberry-pi image sample' using qemu-user-static-execmyself.

- You can use `raspivid` and `raspistill` in the privileged container.

## important.
- `/bin/dash`(symbolic-linked from /bin/sh) is an ARM-binary.
- `/bin/dash-x86` and `/usr/local/bin/qemu-user-static-execmyself` are x86-binaries.
- `RUN` command in the Dockerfile uses the fixed path `/bin/sh`.
- But you can use a `SHELL` command in the Dockerfile, and you can change it to `/bin/dash-x86`.

## links

- qemu(base)
-- https://github.com/paijp/qemu-user-static-execmyself
-- https://hub.docker.com/r/paijp/qemu-user-static-execmyself/

- debian for RaspberryPi
-- https://github.com/paijp/rpi-debian-automated-build
-- https://hub.docker.com/r/paijp/rpi-debian-automated-build/

- raspbian for RaspberryPi
-- https://github.com/paijp/rpi-raspbian-automated-build
-- https://hub.docker.com/r/paijp/rpi-raspbian-automated-build/

- same idea: https://resin.io/blog/building-arm-containers-on-any-x86-machine-even-dockerhub/
- using RaspberryPi CSI camera in Docker container(Japanese): https://qiita.com/yuyakato/items/f5c2c86754a5b1c9504d
