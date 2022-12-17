#!/bin/bash -e

install -m 644 files/microlab.service "${ROOTFS_DIR}/lib/systemd/system/"
install -m 644 files/microlabcelery.service "${ROOTFS_DIR}/lib/systemd/system/"

on_chroot << EOF
	sudo systemctl enable microlab.service
	sudo systemctl enable microlabcelery.service
EOF
