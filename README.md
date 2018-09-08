# rpi-raspbian-automated-build
'Docker automated build raspberry-pi image sample' using qemu-user-static-execmyself.

- You can use `raspivid` and `raspistill` in the privileged container.

## important.
- `/bin/dash`(symbolic-linked from /bin/sh) is an ARM-binary.
- `/bin/dash-x86` and `/usr/local/bin/qemu-user-static-execmyself` are x86-binary.
- `RUN` command in the Dockerfile uses the fixed path `/bin/sh`.
- But you can use a `SHELL` command in the Dockerfile, and you can change it to `/bin/dash-x86`.
