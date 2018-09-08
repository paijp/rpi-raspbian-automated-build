FROM paijp/qemu-user-static-execmyself

RUN set -x &&\
	cd /root &&\
	wget 'https://archive.raspbian.org/raspbian/pool/main/r/raspbian-archive-keyring/raspbian-archive-keyring_20120528.2_all.deb' &&\
	dpkg -i raspbian-archive-keyring_20120528.2_all.deb

RUN set -x &&\
	cd /armroot &&\
	debootstrap --include=apt --arch=armhf --keyring=/usr/share/keyrings/raspbian-archive-keyring.gpg --foreign jessie . http://archive.raspbian.org/raspbian

RUN set -x &&\
	cd /armroot/debootstrap &&\
	patch functions debootstrap_nomount.patch

FROM scratch

COPY --from=0 /armroot /
SHELL ["/usr/local/bin/qemu-user-static-execmyself", "/bin/sh", "-c"]

RUN set -x &&\
	debootstrap/debootstrap --second-stage

RUN set -x &&\
	echo 'deb http://archive.raspbian.org/raspbian jessie main firmware' > /etc/apt/sources.list &&\
	echo 'deb-src http://archive.raspbian.org/raspbian jessie main firmware' >> /etc/apt/sources.list &&\
	apt-get update

RUN set -x &&\
	apt-get -y install libraspberrypi-bin
