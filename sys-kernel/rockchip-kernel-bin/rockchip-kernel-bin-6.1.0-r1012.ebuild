# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit unpacker kernel-install

BVER=${PVR#*-r}
SVER=${BVER: -2}
MVER="${PV}-${BVER}-rockchip_${PV}-${BVER}.${SVER}"
KV_LOCALVERSION='-rockchip'

DESCRIPTION="Rockchip BSP Kernel"
HOMEPAGE="https://github.com/Joshua-Riek/linux-rockchip"
SRC_URI="
	https://ppa.launchpadcontent.net/jjriek/rockchip/ubuntu/pool/main/l/linux-rockchip/linux-rockchip-headers-"${PV}-${BVER}_${PV}-${BVER}.${SVER}"_arm64.deb
	https://ppa.launchpadcontent.net/jjriek/rockchip/ubuntu/pool/main/l/linux-rockchip/linux-headers-"${MVER}"_arm64.deb
	https://ppa.launchpadcontent.net/jjriek/rockchip/ubuntu/pool/main/l/linux-rockchip/linux-image-"${MVER}"_arm64.deb
	https://ppa.launchpadcontent.net/jjriek/rockchip/ubuntu/pool/main/l/linux-rockchip/linux-modules-"${MVER}"_arm64.deb
"
S=${WORKDIR}

LICENSE="GPL-2.0"
SLOT="0"
KEYWORDS="~arm64"

PDEPEND="
	>=virtual/dist-kernel-${PV}
"
BDEPEND="
	virtual/libelf
"

QA_PREBUILT='*'

src_install() {
	rm -r usr/share

	mv usr/src/linux-headers-${PV}-${BVER}-rockchip usr/src/linux-${PV}-rockchip
	touch lib/modules/${PV}-${BVER}-rockchip/source
	mv boot/vmlinuz-${PV}-${BVER}-rockchip usr/src/linux-${PV}-rockchip/arch/arm64/boot/Image.gz
	mkdir -p boot/dtbs
	mv lib/firmware/${PV}-${BVER}-rockchip/device-tree/ boot/dtbs/${PV}-${BVER}-rockchip

	mv {boot,lib,usr} "${ED}"/ || die

	find "${ED}/lib" -name '*.ko' -exec touch {} + || die

	dostrip -x /lib/modules
}

pkg_postinst() {
	kernel-install_pkg_postinst

	sed "s/kver .*/kver \"${PV}-${BVER}-rockchip\"/g" -i /boot/boot.cmd
	mkimage -A arm64 -O linux -T script -C none -n "Boot Script" -d /boot/boot.cmd /boot/boot.scr
}
