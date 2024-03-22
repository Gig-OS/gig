# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit git-r3 meson

DESCRIPTION="This is a library implementing DRI2 on top of DRI3 for running Mali
blob X11 drivers under Xwayland"
HOMEPAGE="https://gitlab.com/panfork/dri2to3"
EGIT_REPO_URI="https://github.com/YangMame/libmali-dri2to3"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~arm64"

DEPEND="
	x11-libs/libxcb
	x11-libs/libdrm
	x11-libs/libX11
	dev-libs/wayland
"
RDEPEND="${DEPEND}"
BDEPEND=""

src_install(){
	meson_src_install
	if use arm64;then
		exeinto /usr/lib/libmali-x11
		doexe mali-g610-arm64/libmali-valhall-g610-g13p0-x11-wayland-gbm.so
		
		insinto etc/OpenCL/vendors/
		doins mali-arm64.icd
	elif use arm;then
		exeinto /usr/lib/libmali-x11
		doexe mali-g610-armhf/libmali-valhall-g610-g13p0-x11-wayland-gbm.so

		insinto etc/OpenCL/vendors/
		doins mali-armhf.icd
	fi
		dosym libmali-valhall-g610-g13p0-x11-wayland-gbm.so /usr/lib/libmali-x11/libEGL.so
		dosym libmali-valhall-g610-g13p0-x11-wayland-gbm.so /usr/lib/libmali-x11/libEGL.so.1
		dosym libmali-valhall-g610-g13p0-x11-wayland-gbm.so /usr/lib/libmali-x11/libgbm.so.1
		dosym libmali-valhall-g610-g13p0-x11-wayland-gbm.so /usr/lib/libmali-x11/libGLESv2.so
		dosym libmali-valhall-g610-g13p0-x11-wayland-gbm.so /usr/lib/libmali-x11/libGLESv2.so.2
		dosym libmali-valhall-g610-g13p0-x11-wayland-gbm.so /usr/lib/libmali-x11/libOpenCL.so.1
	dosbin malirun
}
