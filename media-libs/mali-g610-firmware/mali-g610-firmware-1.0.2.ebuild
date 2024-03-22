# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit git-r3 systemd

DESCRIPTION="mali g610 firmware"
HOMEPAGE="https://github.com/JeffyCN/rockchip_mirrors/blob/libmali/firmware/g610/mali_csffw.bin"
EGIT_REPO_URI="https://github.com/YangMame/mali-g610-firmware"

LICENSE="non-free"
SLOT="0"
KEYWORDS="~arm64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_install(){
	dobin set-mali-firmware.sh

	insinto /lib/firmware/mali_csffw_g15p0
	doins g15p0/mali_csffw.bin
	insinto /lib/firmware/mali_csffw_g17p0
	doins g17p0/mali_csffw.bin
	insinto /lib/firmware/mali_csffw_g18p0
	doins g18p0/mali_csffw.bin

	systemd_dounit set-mali-firmware.service
}

pkg_postinst() {
	mali_ddk_version=$(dmesg |grep "mali fb000000.gpu: Kernel DDK version"|awk '{print $NF}')
	case "$mali_ddk_version" in
		g17p0-01eac0)
			rm -f /lib/firmware/mali_csffw.bin
			ln -s /lib/firmware/mali_csffw_g17p0/mali_csffw.bin /lib/firmware/mali_csffw.bin
			;;
		*)
			rm -f /lib/firmware/mali_csffw.bin
			ln -s /lib/firmware/mali_csffw_g15p0/mali_csffw.bin /lib/firmware/mali_csffw.bin
			;;
	esac
	if [ -f /lib/systemd/system/set-mali-firmware.service ]; then
	        systemctl enable set-mali-firmware.service
	fi
}
